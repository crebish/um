#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "bitpack.h"
#include "assert.h"
#include "seq.h"
#include "um_data.h"

void read_um_file(struct Data data, FILE *fp);

int main(int argc, char *argv[])
{
        assert(argc == 2);

        FILE *input = fopen(argv[1], "rb");
        assert(input != NULL);

        struct Data data = initialize_data();

        read_um_file(data, input);

        fclose(input); 

        return EXIT_SUCCESS; 
}

void read_um_file(struct Data data, FILE *fp) 
{
        uint32_t val = 0;

        val = fgetc(fp);
        
        for (int i = 0; i < 3; i++) {
                val <<= 8;
                val |= fgetc(fp);
        }

        struct Segment seg;
        
        seg.mapped = true;
        seg.sequence = Seq_new(0);
        Seq_addlo(seg.sequence, &val);

        Seq_addlo(data.memory, &seg);
        
        
        for (int i = 0; i < Seq_length(seg.sequence); i++) {
                uint32_t *newVal = Seq_get(seg.sequence, i);
                fprintf(stderr, "after get");

                for (int i = 0; i < 32; i++) {
                        uint32_t newnewVal = *newVal >> (31 - i);
                        newnewVal &= 1;
                        printf("%u", newnewVal);
                }
        }
}


