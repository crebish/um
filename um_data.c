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

        Segment seg = malloc(sizeof(struct Segment));
        seg->mapped = true;
        int size = 0;
        int capacity = 100;
        seg->sequence = malloc(capacity * sizeof(uint32_t));
        assert(seg->sequence);
        
        int byte = 0;
        uint32_t val = 0;
        while ((byte = fgetc(fp)) != EOF) {
                for (int i = 0; i < 3; i++) {
                        if(byte == EOF) {
                                break;
                        }
                        val = (val << 8) | (uint32_t) byte;
                        byte = fgetc(fp);
                }
                val = (val << 8) | (uint32_t) byte;

                if (size >= capacity) {
                        capacity *= 2;
                        uint32_t *new_sequence = (uint32_t *)realloc(seg->sequence, capacity * sizeof(uint32_t)); 
                        assert(new_sequence != NULL);
                        seg->sequence = new_sequence;
                }

                seg->sequence[size] = val;
                size++;

                // if (size % 99 == 0) {
                //         //fprintf(stderr, "here");
                //         seg->sequence = realloc(seg->sequence, (size + 100) * sizeof(uint32_t));
                //         assert(seg->sequence);
                // }

                // size++;

                // uint32_t *ptr = malloc(sizeof(uint32_t));
                // *ptr = val;
                // Seq_addhi(seg->sequence, ptr);
        }
        //fprintf(stderr, "HERE");
        // seg->sequence = realloc(seg->sequence, size + 1 * sizeof(uint32_t));
        // assert(seg->sequence);

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
        // uint32_t val = Seq_get(seg->ssequence, data->memory_index);
        uint32_t val = seg->sequence[data->memory_index];
        data->memory_index++;

        // return *val;
        return val;
}

uint32_t get_word(T data, int segment_index, int word_index) {
        assert(data != NULL);

        Segment seg = Seq_get(data->memory, segment_index);
        // uint32_t *ptr = Seq_get(seg->sequence, word_index); 
        uint32_t val = seg->sequence[word_index];
        return val;
}

void set_word(T data, int segment_index, int word_index, uint32_t word)
{
        Segment seg = Seq_get(data->memory, segment_index);        
        
        // uint32_t *ptr = Seq_get(seg->sequence, word_index);

        seg->sequence[word_index] = word;
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

void set_segment_false(T data, int segment_index) {
        assert(data != NULL);
        assert(segment_index >= 0 && segment_index < Seq_length(data->memory));

        Segment seq = Seq_get(data->memory, segment_index);

        seq->mapped = false;
}

Segment get_segment(T data, int segment_index)
{
        assert(data != NULL);
        assert(segment_index >= 0 && segment_index < Seq_length(data->memory));
        return Seq_get(data->memory, segment_index);
}

void replace_segment_0(T data, int segment_index) 
{
        assert(data != NULL);
        assert(segment_index >= 0 && segment_index < Seq_length(data->memory));

        if (segment_index == 0) {
                return;
        }

        Segment seg_new = Seq_get(data->memory, segment_index);
        
        Segment seg_0 = Seq_put(data->memory, 0, seg_new);

        seg_0->mapped = false;

        Seq_put(data->memory, segment_index, seg_0);
}

static int push_segment(T data, int size) 
{

        Segment seg = malloc(sizeof(struct Segment));
        // seg->sequence = Seq_new(0);
        seg->sequence = malloc(size * sizeof(uint32_t));
        seg->mapped = true;

        for (int i = 0; i < size; i++) {
                seg->sequence[i] = 0;
        }

        //seg->size = size;

        // for (int i; i < size; i++) {
        //         uint32_t *ptr = malloc(sizeof(uint32_t));
        //         *ptr = 0;
        //         Seq_addhi(seg->sequence, ptr);
        // }

        Seq_addhi(data->memory, seg);
        return Seq_length(data->memory) - 1;
}

int insert_segment(T data, int size)
{
        int length = Seq_length(data->memory);
        int index = 0;
        Segment seg = Seq_get(data->memory, index);

        while (seg->mapped != false) {
                index++;
                if (index == length) {
                        return push_segment(data, size);
                }
                seg = Seq_get(data->memory, index);
        }

        free(seg->sequence);
        //seg->size = size;
        

        // for (int i = 0; i < Seq_length(seg->sequence); i++) {
        //         uint32_t *ptr = Seq_get(seg->sequence, i);
        //         free(ptr);
        // }
        // Seq_free(&(seg->sequence));

        // seg->sequence = Seq_new(0);
        seg->mapped = true;

        seg->sequence = malloc(size * sizeof(uint32_t));

        for (int i = 0; i < size; i++) {
                seg->sequence[i] = 0;
        }

        // for (int i = 0; i < size; i++) {
        //         uint32_t *ptr = malloc(sizeof(uint32_t));
        //         *ptr = 0;
        //         Seq_addhi(seg->sequence, ptr);
        // }
        return index;
}

void set_memory_index(T data, int index)
{
        data->memory_index = index;
}

void data_free(T *data) 
{
        assert(data != NULL);
        assert(*data != NULL);

        for (int i = 0; i < Seq_length((*data)->memory); i++) {

                Segment curr = get_segment(*data, i);

                free(curr->sequence);
                // for (int i = 0; i < Seq_length(curr->sequence); i++) {
                //         uint32_t *ptr = Seq_get(curr->sequence, i);
                //         free(ptr);
                // }
                // Seq_free(&(curr->sequence));
                free(curr);
        }

        Seq_free(&((*data)->memory));
        free((*data)->registers);
        free(*data);
}


#undef T