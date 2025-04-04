#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "bitpack.h"
#include "assert.h"
#include "seq.h"
#include "um_data.h"
#include "um_ops.h"

int main(int argc, char *argv[])
{
        assert(argc == 2);

        FILE *fp = fopen(argv[1], "rb");
        assert(fp != NULL);

        Data data = initialize_data(fp);
        
        uint32_t word = extract_word(data);
        uint32_t opcode = Bitpack_getu(word, 4, 28);
        while (opcode != 7){

                uint32_t ra = Bitpack_getu(word, 3, 6);
                uint32_t rb = Bitpack_getu(word, 3, 3);
                uint32_t rc = Bitpack_getu(word, 3, 0);

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
                                load_val(data, word);
                                break;
                }
                
                word = extract_word(data);
                opcode = Bitpack_getu(word, 4, 28);
        }

        // Segment seg = get_segment(data, 0);
        // for (int i = 0; i < Seq_length(seg->sequence); i++) {
        //         uint32_t *newVal = Seq_get(seg->sequence, i);

        //         for (int i = 0; i < 32; i++) {
        //                 uint32_t newnewVal = *newVal >> (31 - i);
        //                 newnewVal &= 1;
        //                 printf("%u", newnewVal);
        //         }
        //         printf("\n");
        // }

        fclose(fp); 
        data_free(&data);

        return EXIT_SUCCESS;
}

