#include "um_data.h"
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>
#include "assert.h"
#include "seq.h"

#define T Data

struct T {
        // Seq_T memory;
        // Segment *memory;
        uint32_t **memory;
        uint32_t *registers;
        bool *mapped;
        int memory_index;
        int size;
        int capacity;
};

static void read_um_file(T data, FILE *fp)
{
        assert(fp != NULL);

        // Segment seg = malloc(sizeof(struct Segment));
        
        int size = 0;
        int capacity = 100;
        uint32_t *seg = malloc(capacity * sizeof(uint32_t));
        // seg->sequence = malloc(capacity * sizeof(uint32_t));
        // assert(seg->sequence);
        assert(seg);
        
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

                // if (size >= capacity) {
                //         capacity *= 2;
                //         uint32_t *new_sequence = (uint32_t *)realloc(seg->sequence, capacity * sizeof(uint32_t)); 
                //         assert(new_sequence != NULL);
                //         seg->sequence = new_sequence;
                // }

                if (size >= capacity) {
                        capacity *= 2;
                        // seg->sequence = (uint32_t *)realloc(seg->sequence, capacity * sizeof(uint32_t)); 
                        seg = realloc(seg, capacity * sizeof(uint32_t));
                        // assert(seg->sequence != NULL);
                        assert(seg);
                }

                // seg->sequence[size] = val;
                seg[size] = val;
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

        // Seq_addhi(data->memory, seg);  

        data->memory[0] = seg;
}

T initialize_data(FILE *fp) 
{
        assert(fp != NULL);
        T data = malloc(sizeof(struct T));
        // Seq_T memory = Seq_new(0);
        // Segment *memory = malloc(sizeof(Segment));
        uint32_t **memory = malloc(10 * sizeof(uint32_t*));

        uint32_t *registers = malloc(8 * sizeof(uint32_t));

        for (int i = 0; i < 8; i++) {
                registers[i] = 0;
        }

        bool *mapped = malloc(sizeof(bool));
        mapped[0] = true;

        data->memory = memory;
        data->registers = registers;
        data->mapped = mapped;
        data->memory_index = 0;
        data->size = 1;
        data->capacity = 10;

        read_um_file(data, fp);

        return data;
}

uint32_t extract_word(T data)
{
        assert(data != NULL);
        
        // Segment seg = Seq_get(data->memory, 0);
        // Segment seg = data->memory[0];
        uint32_t *seg = data->memory[0];
        // uint32_t val = Seq_get(seg->ssequence, data->memory_index);
        // uint32_t val = seg->sequence[data->memory_index];
        uint32_t val = seg[data->memory_index];
        data->memory_index++;

        // return *val;
        return val;
}

uint32_t get_word(T data, int segment_index, int word_index) {
        assert(data != NULL);

        //fprintf(stderr, "\n\nsize: %d, seg_index: %d", data->size, segment_index);

        // Segment seg = Seq_get(data->memory, segment_index);

        // Segment seg = data->memory[segment_index];

        uint32_t *seg = data->memory[segment_index];
        // uint32_t *ptr = Seq_get(seg->sequence, word_index); 
        // uint32_t val = seg->sequence[word_index];
        uint32_t val = seg[word_index];

        return val;
}

void set_word(T data, int segment_index, int word_index, uint32_t word)
{
        // Segment seg = Seq_get(data->memory, segment_index);        
        
        // Segment seg = data->memory[segment_index];
        uint32_t *seg = data->memory[segment_index];
        // uint32_t *ptr = Seq_get(seg->sequence, word_index);

        // seg->sequence[word_index] = word;
        seg[word_index] = word;
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
        assert(segment_index >= 0 && segment_index < data->size);

        // Segment seg = Seq_get(data->memory, segment_index);

        // Segment seg = data->memory[segment_index];
        // seg->mapped = false;
        data->mapped[segment_index] = false;
}

uint32_t *get_segment(T data, int segment_index)
{
        assert(data != NULL);
        assert(segment_index >= 0 && segment_index < data->size);
        //return Seq_get(data->memory, segment_index);
        return data->memory[segment_index];
}

void replace_segment_0(T data, int segment_index) 
{
        assert(data != NULL);
        assert(segment_index >= 0 && segment_index < data->size);

        if (segment_index == 0) {
                return;
        }

        // Segment seg_new = Seq_get(data->memory, segment_index);

        // Segment seg_new = data->memory[segment_index];

        uint32_t *seg_new = data->memory[segment_index];

        
        // Segment seg_0 = Seq_put(data->memory, 0, seg_new);

        // Segment seg_0 = data->memory[0];
        uint32_t *seg_0 = data->memory[0];
        data->memory[0] = seg_new;

        // seg_0->mapped = false;

        data->mapped[segment_index] = false;

        // Seq_put(data->memory, segment_index, seg_0);

        data->memory[segment_index] = seg_0;
}

static int push_segment(T data, int size) 
{

        // Segment seg = malloc(sizeof(struct Segment));
        uint32_t *seg = malloc(size * sizeof(uint32_t));
        // seg->sequence = Seq_new(0);
        // seg->sequence = malloc(size * sizeof(uint32_t));
        // seg->mapped = true;

        for (int i = 0; i < size; i++) {
                //seg->sequence[i] = 0;
                seg[i] = 0;
        }

        //seg->size = size;

        // for (int i; i < size; i++) {
        //         uint32_t *ptr = malloc(sizeof(uint32_t));
        //         *ptr = 0;
        //         Seq_addhi(seg->sequence, ptr);
        // }

        
        // Seq_addhi(data->memory, seg);

        data->size++;
        if (data->size >= data->capacity) {
                data->capacity *= 2;
                data->memory = realloc(data->memory, data->capacity * sizeof(uint32_t*));
                data->mapped = realloc(data->mapped, data->capacity * sizeof(bool));
        }
        
        data->memory[data->size - 1] = seg;
        data->mapped[data->size - 1] = true;

        // return Seq_length(data->memory) - 1;
        return data->size - 1;
}

int insert_segment(T data, int size)
{
        // int length = Seq_length(data->memory);
        
        int length = data->size;
        int index = 0;
        // Segment seg = Seq_get(data->memory, index);

        // Segment seg = data->memory[index];

        //while (seg->mapped != false) {
        for (int i = 0; i < length; i++) {
                
                if (data->mapped[i] == false) {
                        break;
                }

                index++;
                if (index == length) {
                        return push_segment(data, size);
                }

                // seg = Seq_get(data->memory, index);
                // seg = data->memory[index];
        }

        // Segment seg = data->memory[index];

        uint32_t *seg = data->memory[index]; 
        free(seg);

        //free(seg->sequence);

        //seg->size = size;
        

        // for (int i = 0; i < Seq_length(seg->sequence); i++) {
        //         uint32_t *ptr = Seq_get(seg->sequence, i);
        //         free(ptr);
        // }
        // Seq_free(&(seg->sequence));

        // seg->sequence = Seq_new(0);
        // seg->mapped = true;
        data->mapped[index] = true;

        // seg->sequence = malloc(size * sizeof(uint32_t));
        uint32_t *seg_new = malloc(size * sizeof(uint32_t));

        for (int i = 0; i < size; i++) {
                // data->memory[index];
                // seg->sequence[i] = 0;
                seg_new[i] = 0;
        }

        data->memory[index] = seg_new;

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


        // for (int i = 0; i < (Seq_length((*data)->memory)); i++) {
        int size = (*data)->size;
        for (int i = 0; i < size; i++) {
                // Segment curr = get_segment(*data, i);

                uint32_t *curr = (*data)->memory[i];

                // free(curr->sequence);
                // for (int i = 0; i < Seq_length(curr->sequence); i++) {
                //         uint32_t *ptr = Seq_get(curr->sequence, i);
                //         free(ptr);
                // }
                // Seq_free(&(curr->sequence));
                free(curr);
        }

        // Seq_free(&((*data)->memory));
        free((*data)->memory);
        free((*data)->registers);
        free((*data)->mapped);
        free(*data);
}


#undef T