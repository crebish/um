/* * * * * * * * * * * * * * * * * um.c * * * * * * * * * * * * * * * * * *
 *
 *     Assignment: CS40 Universal Machine
 *     Authors:  Andrea Cabochan, Chance Rebish
 *     Date:     April 04, 2025
 *
 *     Summary: 
 *     Implementation of memory and register management for the Universal
 *     Machine from um_data.c. Provides functions to read input, manage 
 *     segments, and interact with registers that will be called in um_ops.c
 * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "bitpack.h"
#include "assert.h"
#include "seq.h"
#include "um_data.h"
#include "um_ops.h"

void run_um(Data data);

/* * * * * * * * * * * * * * * * main * * * * * * * * * * * * * * *
 *
 * Reads a binary file representing a UM program and initializes
 * the UM data structure, then runs the UM program.
 *
 * Parameters:
 *      int argc: number of command-line arguments (must be 2)
 *      char *argv[]: array of arguments, where argv[1] is the path to the UM binary file
 *
 * Return: 
 *      EXIT_SUCCESS upon successful execution
 *
 * Expects:
 *      argc must be 2
 *      argv[1] must be a valid file path to a binary UM program
 *      The file must exist and be readable
 * 
 * Notes:
 *      Frees all allocated memory before returning.
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 int main(int argc, char *argv[])
{
        assert(argc == 2);

        FILE *fp = fopen(argv[1], "rb");
        assert(fp != NULL);

        Data data = initialize_data(fp);
        fclose(fp);

        run_um(data);

        data_free(&data);

        return EXIT_SUCCESS;
}

/* * * * * * * * * * * * * * * * run_um * * * * * * * * * * * * * * *
 *
 * Executes the loaded UM program by repeatedly decoding and executing
 * instructions from memory until the halt instruction (opcode 7) is reached.
 *
 * Parameters:
 *      Data data: the UM data structure containing registers, memory,
 *                 and the program counter
 *
 * Return:
 *      void
 *
 * Expects:
 *      data is a valid, initialized UM Data structure
 *
 * Notes:
 *      The function does not return until the halt instruction is executed.
 *      Each instruction is decoded and dispatched to the appropriate handler.
 *      Modifies the internal state of `data` as it executes instructions.
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
void run_um(Data data) 
{
        /* Grab the word and opcode from the word */
        uint32_t word = extract_word(data);
        uint32_t opcode = Bitpack_getu(word, 4, 28);
        
        /* While the halt instruction has not been called */
        while (opcode != 7) {

                /* Grab the register to be used */
                uint32_t ra = Bitpack_getu(word, 3, 6);
                uint32_t rb = Bitpack_getu(word, 3, 3);
                uint32_t rc = Bitpack_getu(word, 3, 0);

                /* Switch case for each instruction */
                switch(opcode) {
                        case 0:
                                conditional_move(data, ra, rb, rc);
                                break;
                        case 1:
                                segment_load(data, ra, rb, rc);
                                break;
                        case 2: 
                                segment_store(data, ra, rb, rc);
                                break;
                        case 3:
                                add(data, ra, rb, rc);
                                break;
                        case 4:
                                multiplication(data, ra, rb, rc);
                                break;
                        case 5:
                                division(data, ra, rb, rc);
                                break;
                        case 6:
                                bitwiseNAND(data, ra, rb, rc);
                                break;
                        case 7:
                                break;
                        case 8:
                                map_segment(data, rb, rc);
                                break;
                        case 9:
                                unmap_segment(data, rc);
                                break;
                        case 10:
                                output(data, rc);
                                break;
                        case 11:
                                input(data, rc);
                                break;
                        case 12:
                                load_program(data, rb, rc);
                                break;
                        case 13: 
                                /* Send in the whole word since its different */
                                load_val(data, word);
                                break;
                }
                
                /* Grab the next word and repeat */
                word = extract_word(data);
                opcode = Bitpack_getu(word, 4, 28);
        }
}

