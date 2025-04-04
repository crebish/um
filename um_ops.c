#include "um_ops.h"
#include "um_data.h"
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>
#include "assert.h"
#include "bitpack.h"

void conditional_move(Data data, int A, int B, int C) 
{
        if (get_register(data, C) != 0) {
                set_register(data, A, get_register(data, B));
        }
}

void segment_load(Data data, int A, int B, int C)
{
        uint32_t seg = get_word(data, get_register(data, B), get_register(data, C));
        set_register(data, A, seg);
}

void segment_store(Data data, int A, int B, int C)
{
        uint32_t word = get_register(data, C);

        set_word(data, get_register(data, A), get_register(data, B), word);
}

void add(Data data, int A, int B, int C) 
{
        uint32_t sum = (get_register(data, B) + get_register(data, C)) % (~0);
        set_register(data, A, sum);
}

void multiplication(Data data, int A, int B, int C) 
{
        uint32_t product = (get_register(data, B) * get_register(data, C)) % (~0);
        set_register(data, A, product);
}

void division(Data data, int A, int B, int C) 
{
        uint32_t quotient = get_register(data, B) / get_register(data, C);
        set_register(data, A, quotient);

}

void bitwiseNAND(Data data, int A, int B, int C) 
{
        uint32_t NAND = ~(get_register(data, B) & get_register(data, C));
        set_register(data, A, NAND);
}

void map_segment(Data data, int B, int C)
{
        (void) data;
        (void) B;
        (void) C;
}

void unmap_segment(Data data, int C)
{
    (void) data;
    (void) C;
}

void output(Data data, int C)
{
        (void) data;
        (void) C;
}

void input(Data data, int C)
{
        (void) data;
        (void) C;
}

void load_program(Data data, int B, int C)
{
    (void) data;
    (void) B;
    (void) C;
}

void load_val(Data data, uint32_t word)
{
        int A = Bitpack_getu(word, 3, 25);
        set_register(data, A, Bitpack_getu(word, 25, 0));
}



