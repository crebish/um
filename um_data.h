#ifndef UM_DATA_INCLUDED
#define UM_DATA_INCLUDED

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>
#include "assert.h"
#include "seq.h"

typedef struct Segment {
        Seq_T sequence;
        bool mapped;
} *Segment;

typedef struct Data {
        Seq_T memory;
        uint32_t *registers;
} *Data;

extern struct Data initialize_data();

extern uint32_t get_register(int register_num, Data data);
extern void set_register(int register_num, uint32_t value, Data data);

extern Segment* get_segment(int segment_index, Data data);
extern void set_segment(int segment_index, Segment seg, Data data); 

#endif