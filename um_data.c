#include "um_data.h"
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>
#include "assert.h"
#include "seq.h"

struct Data initialize_data() 
{
        Seq_T memory = Seq_new(0);

        uint32_t *registers = malloc(8 * sizeof(uint32_t));

        for (int i = 0; i < 8; i++) {
                registers[i] = 0;
        }

        struct Data data = {memory, registers};

        return data;
}

uint32_t get_register(int register_num, Data data) 
{
        assert(register_num >= 0 && register_num < 8);
        return data->registers[register_num];
}

void set_register(int register_num, uint32_t value, Data data) 
{
        assert(register_num >= 0 && register_num < 8);
        data->registers[register_num] = value;
}

Segment* get_segment(int segment_index, Data data)
{
        return (Segment*)Seq_get(data->memory, segment_index);
}

void set_segment(int segment_index, Segment seg, Data data) 
{
        Seq_put(data->memory, segment_index, seg);
}
