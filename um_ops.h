/* * * * * * * * * * * * * * * * * um_ops.h * * * * * * * * * * * * * * * * * *
*
*     Assignment: CS40 Universal Machine
*     Authors:  Andrea Cabochan, Chance Rebish
*     Date:     April 04, 2025
*
*     Summary: 
*      Declares operations for Universal Machine that are degines in um_ops.c
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

#ifndef UM_OPS_INCLUDED
#define UM_OPS_INCLUDED

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>
#include "assert.h"
#include "um_data.h"

extern void conditional_move(Data data, int A, int B, int C);
extern void segment_load(Data data, int A, int B, int C);
extern void segment_store(Data data, int A, int B, int C);
extern void add(Data data, int A, int B, int C);
extern void multiplication(Data data, int A, int B, int C);
extern void division(Data data, int A, int B, int C);
extern void bitwiseNAND(Data data, int A, int B, int C);
extern void map_segment(Data data, int B, int C);
extern void unmap_segment(Data data, int C);
extern void output(Data data, int C);
extern void input(Data data, int C);
extern void load_program(Data data, int B, int C);
extern void load_val(Data data, uint32_t word);

#endif