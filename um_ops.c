/* * * * * * * * * * * * * * * * * um_ops.c * * * * * * * * * * * * * * * * * *
 *
 *     Assignment: CS40 Universal Machine
 *     Authors:  Andrea Cabochan, Chance Rebish
 *     Date:     April 04, 2025
 *
 *     Summary: 
 *     Implementation of Universal machine operations that are defined in 
 *     um_ops.h that uses data manipulation from um_data.c these operations 
 *     are called by um.c 
 * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

#include "um_ops.h"
#include "um_data.h"
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>
#include "assert.h"
#include "bitpack.h"

/* * * * * * * * * * * * * * * * conditional_move * * * * * * * * * * * * * * *
 *
 * Takes in a struct to data to set register A to the information from register
 * B if register C is not 0
 *
 * Parameters:
 *      Data data: Initialized data struct
 *      int A, B, C: Register indices
 *
 * Return: Nothing
 *
 * Expects:
 *      Expects T data to not be null
 *      A B and C represent a valid segment ID and offset respectively
 * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
void conditional_move(Data data, int A, int B, int C) 
{
        if (get_register(data, C) != 0) {
                set_register(data, A, get_register(data, B)); 
        }
}

/* * * * * * * * * * * * * * * * segment_load * * * * * * * * * * * * * * *
 *
 * Takes in a struct to data to set register A to the information from register
 * B if register C is not 0
 *
 * Parameters:
 *      Data data: Initialized data struct
 *      int A, B, C: Register indices
 *
 * Return: Nothing
 *
 * Expects:
 *      Expects T data to not be null
 *      A B and C represent a valid segment ID and offset respectively
 * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

void segment_load(Data data, int A, int B, int C)
{
        uint32_t word = get_word(data, get_register(data, B), 
                                get_register(data, C));
        set_register(data, A, word);
}

/* * * * * * * * * * * * * * * * segment_store * * * * * * * * * * * * * * * * *
 *
 * Stores a value from register C into a specific segment and offset determined 
 * by registers A and B.
 *
 * Parameters:
 *      Data data: Initialized data struct
 *      int A, B, C: Register indices
 *
 * Return: Nothing
 *
 * Expects:
 *      Data is non-null
 *      A and B represent a valid segment ID and offset respectively
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
void segment_store(Data data, int A, int B, int C)
{
        uint32_t word = get_register(data, C);

        set_word(data, get_register(data, A), get_register(data, B), word);
}

/* * * * * * * * * * * * * * * * add * * * * * * * * * * * * * * * * *
 *
 * Adds the values in registers B and C and stores the result in A.
 *
 * Parameters:
 *      Data data: Initialized data struct
 *      int A, B, C: Register indices
 *
 * Return: Nothing
 *
 * Expects:
 *      Data is non-null
 *      B and C contain valid 32-bit unsigned values
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
void add(Data data, int A, int B, int C) 
{
        uint32_t sum = get_register(data, B) + get_register(data, C);
        set_register(data, A, sum);
}

/* * * * * * * * * * * * * * * * multiplication * * * * * * * * * * * * * * * *
 *
 * Multiplies the values in registers B and C and stores the result in A.
 *
 * Parameters:
 *      Data data: Initialized data struct
 *      int A, B, C: Register indices
 *
 * Return: Nothing
 *
 * Expects:
 *      Data is non-null
 *      B and C contain valid 32-bit unsigned values
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
void multiplication(Data data, int A, int B, int C) 
{
        uint32_t product = get_register(data, B) * get_register(data, C);
        set_register(data, A, product);
}

/* * * * * * * * * * * * * * * * division * * * * * * * * * * * * * * * * *
 *
 * Divides the value in register B by the value in register C and stores 
 * the result in A.
 *
 * Parameters:
 *      Data data: Initialized data struct
 *      int A, B, C: Register indices
 *
 * Return: Nothing
 *
 * Expects:
 *      Data is non-null
 *      Value in register C is not zero
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
void division(Data data, int A, int B, int C) 
{
        uint32_t quotient = get_register(data, B) / get_register(data, C);
        set_register(data, A, quotient);

}

/* * * * * * * * * * * * * * * * bitwiseNAND * * * * * * * * * * * * * * * * *
 *
 * Performs a bitwise NAND on registers B and C and stores the result in A.
 *
 * Parameters:
 *      Data data: Initialized data struct
 *      int A, B, C: Register indices
 *
 * Return: Nothing
 *
 * Expects:
 *      Data is non-null
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
void bitwiseNAND(Data data, int A, int B, int C) 
{
        uint32_t NAND = ~(get_register(data, B) & get_register(data, C));
        set_register(data, A, NAND);
}

/* * * * * * * * * * * * * * * * map_segment * * * * * * * * * * * * * * * * *
 *
 * Allocates a new memory segment of size stored in register C. Stores the
 * new segment ID in register B.
 *
 * Parameters:
 *      Data data: Initialized data struct
 *      int B, C: Register indices
 *
 * Return: Nothing
 *
 * Expects:
 *      Data is non-null
 *      Value in register C is a valid segment size
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
void map_segment(Data data, int B, int C)
{
        uint32_t size = get_register(data, C);
        uint32_t index = insert_segment(data, size);

        set_register(data, B, index);
}

/* * * * * * * * * * * * * * * * unmap_segment * * * * * * * * * * * * * * * *
 *
 * Deallocates a memory segment identified by the value in register C.
 *
 * Parameters:
 *      Data data: Initialized data struct
 *      int C: Register index
 *
 * Return: Nothing
 *
 * Expects:
 *      Data is non-null
 *      Value in register C refers to a valid mapped segment
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
void unmap_segment(Data data, int C)
{
        set_segment_false(data, get_register(data, C));
}

/* * * * * * * * * * * * * * * * output * * * * * * * * * * * * * * * * *
 *
 * Outputs the character in register C to standard output.
 *
 * Parameters:
 *      Data data: Initialized data struct
 *      int C: Register index
 *
 * Return: Nothing
 *
 * Expects:
 *      Data is non-null
 *      Value in register C is between 0 and 255
 *
 * Notes: 
 *      Failure to adhere to the expectations results in a CRE
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 void output(Data data, int C)
{
        uint32_t output = get_register(data, C);

        assert(output <= 255);

        putchar((char)output);
}

/* * * * * * * * * * * * * * * * input * * * * * * * * * * * * * * * *
 *
 * Takes a character of input and stores it in register C.
 * If EOF is reached, stores 0xFFFFFFFF instead.
 *
 * Parameters:
 *      Data data: Initialized data struct
 *      int C: Register index
 *
 * Return: Nothing
 *
 * Expects:
 *      Data is non-null
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
void input(Data data, int C)
{
        int input = getchar();


        if (input == EOF) {
                set_register(data, C, 0xFFFFFFFF);
        } else {
                if (input >= 0 && input <= 255) {
                        set_register(data, C, input);         
                }
        }
}

/* * * * * * * * * * * * * * * * load_program * * * * * * * * * * * * * * * *
 *
 * Loads a program from the segment in register B and sets the program counter
 * to the offset in register C.
 *
 * Parameters:
 *      Data data: Initialized data struct
 *      int B, C: Register indices
 *
 * Return: Nothing
 *
 * Expects:
 *      Data is non-null
 *      Value in register B is a valid segment ID or 0
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
void load_program(Data data, int B, int C)
{
        replace_segment_0(data, get_register(data, B), get_register(data, C));
}

/* * * * * * * * * * * * * * * * load_val * * * * * * * * * * * * * * * *
 *
 * Loads a value into register A, extracted from the special-format word.
 *
 * Parameters:
 *      Data data: Initialized data struct
 *      uint32_t word: 32-bit word containing register index and value
 *
 * Return: Nothing
 *
 * Expects:
 *      Data is non-null
 *      Word is properly formatted as per UM specification
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
void load_val(Data data, uint32_t word)
{
        // int A = Bitpack_getu(word, 3, 25);
        set_register(data, (word & 0xE000000) >> 25, (word & 0x1FFFFFF));
}



