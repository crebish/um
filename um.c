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
// #include "um_ops.h"

void run_um(Data data);

uint32_t registers[8];

/* * * * * * * * * * * * * * * * main * * * * * * * * * * * * * * *
 *
 * Reads a binary file representing a UM program and initializes
 * the UM data structure, then runs the UM program.
 *
 * Parameters:
 *      int argc: number of command-line arguments (must be 2)
 *      char *argv[]: array of arguments, where argv[1] is the path to the UM 
 *      binary file
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
        if (argc != 2) {
                fprintf(stderr, "Invalid argument amount");
                return EXIT_FAILURE;
        }

        FILE *fp = fopen(argv[1], "rb");
        assert(fp != NULL);

        Data data = initialize_data(fp);
        fclose(fp);

        for (int i = 0; i < 8; i++) {
                registers[i] = 0;
        }

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
        // uint32_t opcode = Bitpack_getu(word, 4, 28); 
        // uint32_t opcode = (0xF0000000 & word) >> 28;
        
        int input;

        /* While the halt instruction has not been called */
        while ((word >> 28) != 7) {

                // /* Grab the register to be used */
                // uint32_t ra = Bitpack_getu(word, 3, 6);
                // uint32_t rb = Bitpack_getu(word, 3, 3);
                // uint32_t rc = Bitpack_getu(word, 3, 0);

                /* Switch case for each instruction */
                switch(word >> 28) {
                        case 0:
                                // conditional_move(data, (word & 0x1C0) >> 6, (word & 0x38) >> 3, (word & 0x7));
                                if (registers[(word & 0x7)] != 0) {
                                        registers[(word & 0x1C0) >> 6] = registers[(word & 0x38) >> 3]; 
                                }
                                break;
                        case 1:
                                // segment_load(data, (word & 0x1C0) >> 6, (word & 0x38) >> 3, (word & 0x7));
                                registers[(word & 0x1C0) >> 6] = get_word(data, registers[(word & 0x38) >> 3], registers[(word & 0x7)]); 

                                // set_register(data, (word & 0x1C0) >> 6, );
                                break;
                        case 2: 
                                // segment_store(data, (word & 0x1C0) >> 6, (word & 0x38) >> 3, (word & 0x7));

                                set_word(data, registers[(word & 0x1C0) >> 6], registers[(word & 0x38) >> 3], registers[(word & 0x7)]);
                        
                                break;
                        case 3:
                                // add(data, (word & 0x1C0) >> 6, (word & 0x38) >> 3, (word & 0x7));

                                registers[(word & 0x1C0) >> 6] = registers[(word & 0x38) >> 3] + registers[(word & 0x7)]; 

                                // set_register(data, (word & 0x1C0) >> 6, get_register(data, (word & 0x38) >> 3) + get_register(data, (word & 0x7)));
                        
                                break;
                        case 4:
                                // multiplication(data, (word & 0x1C0) >> 6, (word & 0x38) >> 3, (word & 0x7));

                                registers[(word & 0x1C0) >> 6] = registers[(word & 0x38) >> 3] * registers[(word & 0x7)]; 

                                // set_register(data, (word & 0x1C0) >> 6, get_register(data, (word & 0x38) >> 3) * get_register(data, (word & 0x7)));
                        
                                break;
                        case 5:
                                // division(data, (word & 0x1C0) >> 6, (word & 0x38) >> 3, (word & 0x7));

                                registers[(word & 0x1C0) >> 6] = registers[(word & 0x38) >> 3] / registers[(word & 0x7)]; 

                                // set_register(data, (word & 0x1C0) >> 6, get_register(data, (word & 0x38) >> 3) / get_register(data, (word & 0x7)));
                        
                                break;
                        case 6:
                                // bitwiseNAND(data, (word & 0x1C0) >> 6, (word & 0x38) >> 3, (word & 0x7));
                                // uint32_t NAND = ~(get_register(data, B) & get_register(data, C));
                                registers[(word & 0x1C0) >> 6] = ~(registers[(word & 0x38) >> 3] & registers[(word & 0x7)]);                        
                                break;
                        case 7:
                                break;
                        case 8:
                                // map_segment(data, (word & 0x38) >> 3, (word & 0x7));

                                registers[(word & 0x38) >> 3] = insert_segment(data, registers[(word & 0x7)]);
                                
                                break;
                        case 9:
                                // unmap_segment(data, (word & 0x7));

                                set_segment_false(data, registers[(word & 0x7)]);

                                break;
                        case 10:
                                // output(data, (word & 0x7));

                                putchar((char) registers[(word & 0x7)]);

                                break;
                        case 11:
                                //input(data, (word & 0x7));

                                input = getchar();

                                if (input == EOF) {
                                        registers[(word & 0x7)] = 0xFFFFFFFF;
                                } else {
                                        if (input >= 0 && input <= 255) {
                                                registers[(word & 0x7)] = input;         
                                        }
                                }
                        
                                break;
                        case 12:
                                // load_program(data, (word & 0x38) >> 3, (word & 0x7));

                                replace_segment_0(data, registers[(word & 0x38) >> 3], registers[(word & 0x7)]);

                                break;
                        case 13: 
                                // load_val(data, word);
                                
                                // set_register(data, (word & 0xE000000) >> 25, (word & 0x1FFFFFF));

                                registers[(word & 0xE000000) >> 25] = (word & 0x1FFFFFF);

                                break;
                }
                
                /* Grab the next word and repeat */
                word = extract_word(data);
                // opcode = Bitpack_getu(word, 4, 28);
                // opcode = (0xF0000000 & word) >> 28;
        }
}

