#include "um_data.h"
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>
#include "assert.h"
#include "seq.h"
#define T Data

struct T {
        Seq_T memory;
        uint32_t *registers;
        int memory_index;
};

static void read_um_file(T data, FILE *fp)
{
        assert(fp != NULL);
        uint32_t val = 0;

        Segment seg = malloc(sizeof(struct Segment));
        seg->mapped = true;
        seg->sequence = Seq_new(0);
        
        int byte = 0;
        while ((byte = fgetc(fp)) != EOF) {
                for (int i = 0; i < 3; i++) {
                        if(byte == EOF) {
                                break;
                        }
                        val = (val << 8) | (uint32_t) byte;
                        byte = fgetc(fp);
                }
                val = (val << 8) | (uint32_t) byte;
                uint32_t *ptr = malloc(sizeof(uint32_t));
                *ptr = val;
                Seq_addhi(seg->sequence, ptr);
        }

        Seq_addhi(data->memory, seg);  
}

T initialize_data(FILE *fp) 
{
        assert(fp != NULL);
        T data = malloc(sizeof(struct T));
        Seq_T memory = Seq_new(0);

        uint32_t *registers = malloc(8 * sizeof(uint32_t));

        for (int i = 0; i < 8; i++) {
                registers[i] = 0;
        }

        data->memory = memory;
        data->registers = registers;
        data->memory_index = 0;

        read_um_file(data, fp);

        return data;
}

uint32_t extract_word(T data)
{
        assert(data != NULL);
        
        Segment seg = Seq_get(data->memory, 0);
        uint32_t *val = Seq_get(seg->sequence, data->memory_index);

        data->memory_index++;

        return *val;
}

uint32_t get_word(T data, int segment_index, int word_index) {
        Segment seg = Seq_get(data->memory, segment_index);
        uint32_t *ptr = Seq_get(seg->sequence, word_index); 
        return *ptr;
}


void set_word(T data, int segment_index, int word_index, uint32_t word)
{
        Segment seg = Seq_get(data->memory, segment_index);

        uint32_t *ptr = Seq_get(seg->sequence, word_index);

        *ptr = word;
}

uint32_t get_register(T data, int register_num) 
{
        assert(data != NULL);
        assert(register_num >= 0 && register_num < 8);
        return data->registers[register_num];
}

void set_register(T data, int register_num, uint32_t value) 
{
        assert(data != NULL);
        assert(register_num >= 0 && register_num < 8);
        data->registers[register_num] = value;
}

Segment get_segment(T data, int segment_index)
{
        assert(data != NULL);
        assert(segment_index >= 0 && segment_index < Seq_length(data->memory));
        return Seq_get(data->memory, segment_index);
}

void set_segment(T data, Segment seg, int segment_index) 
{
        assert(data != NULL);
        assert(seg != NULL);
        assert(segment_index >= 0 && segment_index < Seq_length(data->memory));

        Seq_put(data->memory, segment_index, seg);
}

int push_segment(T data, Segment seg) 
{
        assert(data != NULL);
        assert(seg != NULL);
        
        Seq_addhi(data->memory, seg);
        return Seq_length(data->memory) - 1;
}

void data_free(T *data) 
{
        assert(data != NULL);
        assert(*data != NULL);

        for (int i = 0; i < Seq_length((*data)->memory); i++) {

                Segment curr = get_segment(*data, i);

                for (int i = 0; i < Seq_length(curr->sequence); i++) {
                        uint32_t *ptr = Seq_get(curr->sequence, i);
                        free(ptr);
                }
                Seq_free(&(curr->sequence));
                free(curr);
        }

        Seq_free(&((*data)->memory));
        free((*data)->registers);
        free(*data);
}


#undef T