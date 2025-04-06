#ifndef UM_DATA_INCLUDED
#define UM_DATA_INCLUDED

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>
#include "assert.h"
#include "seq.h"

#define T Data
typedef struct T *T;

typedef struct Segment {
        Seq_T sequence;
        bool mapped;
} *Segment;

extern T initialize_data(FILE *fp);

extern uint32_t extract_word(T data);
extern uint32_t get_word(T data, int segment_index, int word_index);
extern void set_word(T data, int segment_index, int word_index, uint32_t word);

extern uint32_t get_register(T data, int register_num);
extern void set_register(T data, int register_num, uint32_t value);

extern Segment get_segment(T data, int segment_index);
extern void replace_segment_0(T data, int segment_index); 
extern void set_segment_false(T data, int segment_index);
extern int push_segment(T data, Segment seg);
extern int insert_segment(T data, int size);

extern void set_memory_index(T data, int index);

extern void data_free(T *data);

#undef T
#endif