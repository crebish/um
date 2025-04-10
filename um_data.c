/* * * * * * * * * * * * * * * * * um_data.c * * * * * * * * * * * * * * * * * *
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

#include "um_data.h"
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>
#include "assert.h"
#include "seq.h"

#define T Data

/* struct Data
*
* a struct containing all relevant information pertaining to the Universal 
* Machine data 
*/
struct T {
        uint32_t **memory; /* Array that holds all data segments */
        uint32_t *registers; /* Array that holds all 8 registers */
        int *seg_sizes;
        bool *mapped; /* Array holding the boolean info for mapped and 
                        unmapped segments*/
        int memory_index; /* Tracks the current word in segment 0 */
        int size; /* Tracks the number of segments in the memory array */
        int capacity; /* The capacity used to allocate the memory array */
};

/* * * * * * * * * * * * * * * * * read_um_file * * * * * * * * * * * * * *
 *
 * Reads a UM binary file into segment 0.
 *
 * Parameters:
 *      T data:         initialized Data structure
*       FILE *fp:       open file pointer to UM binary
 *
 * Return: nothing
 * 
 * Expects:
 *      T data is not null and fp is not null
 * 
 * Notes:
 *      Seg allocation is freed later in data_free
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
static void read_um_file(T data, FILE *fp)
{
        // fprintf(stderr, "read_um_file\n");
        assert(data != NULL);
        assert(fp != NULL);
        
        int size = 0;
        int capacity = 100;

        /* Allocates the memory segment array */
        uint32_t *seg = malloc(capacity * sizeof(uint32_t));
        assert(seg != NULL);
        
        /* 
         * Grabs each 32 bit word places them into 
         * the corresponding position in the seg array 
        */
        int byte = 0;
        uint32_t val = 0;
        while ((byte = fgetc(fp)) != EOF) {
                for (int i = 0; i < 3; i++) {
                        /* If .um file is incomplete, EXIT_FAILURE */
                        if(byte == EOF) {
                                fprintf(stderr, "Invalid .um file");
                                exit(EXIT_FAILURE);
                        }

                        /* bit shift val to input big endian order */
                        val = (val << 8) | (uint32_t) byte;
                        byte = fgetc(fp);
                }
                val = (val << 8) | (uint32_t) byte;

                /* Resize if the input is really large */
                if (size >= capacity) {
                        capacity *= 2;
                        seg = realloc(seg, capacity * sizeof(uint32_t));
                        assert(seg != NULL);
                }

                /* Assign word to corresponding position in the segment */
                seg[size] = val;
                size++;        
        }

        /* Place complete segment in segment 0 */
        data->memory[0] = seg;
        data->seg_sizes[0] = size;
}

/* * * * * * * * * * * * * * * * * initialize_data * * * * * * * * * * * * * *
 *
 * Initializes and returns a new Data structure.
 *
 * Parameters:
 *      FILE *fp:       file pointer to the binary input file
 *
 * Return: newly allocated and initialized Data object
 *
 * Expects:
 *      Expects fp to not be NULL
 * 
 * Notes:
 *      All array members of the Data struct are malloc'd here and freed
 *      later in data_free 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
T initialize_data(FILE *fp) 
{
        // fprintf(stderr, "initialize_data\n");
        assert(fp != NULL);

        /* Malloc components of the Data struct */
        T data = malloc(sizeof(struct T));
        assert(data != NULL);

        uint32_t **memory = malloc(10 * sizeof(uint32_t*));
        uint32_t *registers = malloc(8 * sizeof(uint32_t));
        int *seg_sizes = malloc(10 * sizeof(int));
        assert(memory != NULL);
        assert(registers != NULL);
        assert(seg_sizes != NULL);

        /* Initialize the registers to 0 */
        for (int i = 0; i < 8; i++) {
                registers[i] = 0;
        }

        bool *mapped = malloc(10 * sizeof(bool));
        assert(mapped != NULL);
        mapped[0] = true; /* Segment 0 always starts mapped */

        /* Set struct members */
        data->memory = memory;
        data->registers = registers;
        data->seg_sizes = seg_sizes;
        data->mapped = mapped;
        data->memory_index = 0;
        data->size = 1;
        data->capacity = 10;

        /* Place input file contents in segment 0 */
        read_um_file(data, fp);

        return data;
}

/* * * * * * * * * * * * * * * * * extract_word * * * * * * * * * * * * * * * *
 *
 * Returns the word at memory_index in the current segment 0 and increment
 * memory_index
 *
 * Parameters:
 *      T data:               UM data structure
 *
 * Return: the word at the specified location
 *
 * Expects:
 *      Expects T data to not be null
 * 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
uint32_t extract_word(T data)
{
        // fprintf(stderr, "extract_word\n");
        assert(data != NULL);

        /* Grab the word at (segment 0, memory_index) */
        uint32_t val = data->memory[0][data->memory_index];

        data->memory_index++;

        return val;
}

/* * * * * * * * * * * * * * * * * get_word * * * * * * * * * * * * * * * *
 *
 * Retrieves a word from the specified segment and index.
 *
 * Parameters:
 *      T data:               UM data structure
 *      int segment_index:    index in the data->memory array
 *      int word_index:       index in the segment array
 *
 * Return: the word at the specified location
 *
 * Expects:
 *      Expects T data to not be null, segment_index between 0 and data->size,
 *      and word_index between 0 and the segment's size
 * 
 * Notes:
 *      Failure to meet expectations for word_index will result in a unchecked
 *      runtime error for the other expectations it will CRE 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
uint32_t get_word(T data, int segment_index, int word_index) 
{
        // fprintf(stderr, "get_word\n");
        assert(data != NULL);
        assert(segment_index >= 0 && segment_index < data->size);

        /* Grab the word at (segment_index, word_index) */
        uint32_t val = data->memory[segment_index][word_index];

        return val;
}


/* * * * * * * * * * * * * * * * * set_word * * * * * * * * * * * * * * * *
 *
 * Sets a word in the specified segment and index.
 *
 * Parameters:
 *      T data: UM data structure
 *      int segment_index: index of the segment
 *      int word_index: index of the word within the segment
 *      uint32_t word: value to be stored
 *
 * Return: nothing
 *
 * Expects:
 *      Expects T data to not be null and segment_index to be greater than 0
 *      and less than data->size
 * 
 * Notes:
 *      Failure to meet expectations for word_index will result in a unchecked
 *      runtime error for the other expectations it will CRE 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
void set_word(T data, int segment_index, int word_index, uint32_t word)
{
        // fprintf(stderr, "set_word\n");
        assert(data != NULL);
        assert(segment_index >= 0 && segment_index < data->size);

        /* Set word at (segment_index, word_index) */
        data->memory[segment_index][word_index] = word;
}

/* * * * * * * * * * * * * * * * * get_register * * * * * * * * * * * * * * * *
 *
 * Returns the value held in the given register index
 *
 * Parameters:
 *      T data:               UM data structure
 *      int register_num:     register number to be used
 *
 * Return: the value in the given register index
 *
 * Expects:
 *      Expects T data to not be null and a register_num between 0 and 7
 * 
 * Notes: 
 *      Failure to meet these expectations results in a CRE
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
uint32_t get_register(T data, int register_num) 
{
        // fprintf(stderr, "get_register\n");
        assert(data != NULL);
        assert(register_num >= 0 && register_num < 8);
        
        return data->registers[register_num];
}

/* * * * * * * * * * * * * * * * * set_register * * * * * * * * * * * * * * * *
 *
 * Sets the register at the given index to the given value
 *
 * Parameters:
 *      T data:               UM data structure
 *      int register_num:     register number to be changed
 *      uint32_t value:       value to be place in the register
 *
 * Return: nothing
 *
 * Expects:
 *      Expects T data to not be null and a register_num between 0 and 7
 * 
 * Notes: 
 *      Failure to meet these expectations results in a CRE
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
void set_register(T data, int register_num, uint32_t value) 
{
        // fprintf(stderr, "set_register\n");

        assert(data != NULL);
        assert(register_num >= 0 && register_num < 8);
        
        data->registers[register_num] = value;
}

/* * * * * * * * * * * * * * * set_segment_false * * * * * * * * * * * * * * *
 *
 * Marks a segment as unmapped.
 *
 * Parameters:
 *      T data: UM data structure
 *      int segment_index: index of the segment to unmap
 *
 * Return: the index the segment is mapped to in data->memory
 *
 * Expects:
 *      Expects T data to not be null amd for segment index to be greater than
 *      0 and less than data->size,
 *
 * Notes: 
 *      Failure to meet these expectations results in a CRE
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
void set_segment_false(T data, int segment_index) 
{
        // fprintf(stderr, "set_segment_false\n");

        assert(data != NULL);
        assert(segment_index >= 0 && segment_index < data->size);

        /* Unmap segment by setting mapped array position to false */
        data->mapped[segment_index] = false;
}

/* * * * * * * * * * * * * * * * replace_segment_0 * * * * * * * * * * * * * * *
 *
 * Replaces segment 0 with a duplicate of a specified segment in a given memory 
 * index
 *
 * Parameters:
 *      T data: UM data structure
 *      int segment_index: index of segment to duplicate
 *      int memory_index: index of the memory where the new segment will be set 
 *
 * Return: Nothing
 *
 * Expects:
 *      Expects T data to not be null, for segment index to be greater than
 *      0 and less than data->size, and memory_index to be greater than 0 
 *      and less than the size of the segment array
 * 
 * Notes: 
 *      Failure to meet expectations for memory_index will result in a unchecked
 *      runtime error for the other expectations it will CRE 
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
void replace_segment_0(T data, int segment_index, int memory_index) 
{
        // fprintf(stderr, "replace_segment_0\n");

        assert(data != NULL);
        assert(segment_index >= 0 && segment_index < data->size);

        data->memory_index = memory_index;

        /* If it is replacing segment 0 with segment 0, do nothing */
        if (segment_index == 0) {
                return;
        }
        
        /* Swap segment places in the memory array and unmap old segment 0 */
        uint32_t *seg = data->memory[segment_index];
        
        uint32_t *seg_0 = data->memory[0];
        free(seg_0);

        // data->memory[0] = seg;

        // data->mapped[segment_index] = false;

        // data->memory[segment_index] = seg_0;

        int size = data->seg_sizes[segment_index];

        uint32_t *seg_new = malloc(size * sizeof(uint32_t));

        for (int i = 0; i < size; i++) {
                seg_new[i] = seg[i];
        }

        data->seg_sizes[0] = size;
}

/* * * * * * * * * * * * * * * * * push_segment * * * * * * * * * * * * * * * *
 *
 * Adds a new mapped segment to the end of the memory array with specified size.
 *
 * Parameters:
 *      T data:               UM data structure
 *      int size:             specified size of the new mapped segment
 *
 * Return: the index the segment is mapped to in data->memory
 *
 * Expects:
 *      Expects T data to not be null
 * 
 * Notes:
 *      Reallocs the memory and mapped arrays which will be freed in data_free
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
static int push_segment(T data, int size) 
{
        // fprintf(stderr, "push_segment\n");

        /* Allocate a new segment */
        uint32_t *seg = malloc(size * sizeof(uint32_t));
        assert(seg != NULL);

        /* Initialize segment contents to 0 */
        for (int i = 0; i < size; i++) {
                seg[i] = 0;
        }

        data->size++;

        /* Resize memory array if necessary */
        if (data->size >= data->capacity) {
                data->capacity *= 2;
                data->memory = realloc(data->memory, data->capacity * 
                                        sizeof(uint32_t*));
                data->mapped = realloc(data->mapped, data->capacity * 
                                        sizeof(bool));
                data->seg_sizes = realloc(data->seg_sizes, data->capacity * 
                                        sizeof(int));
                assert(data->memory != NULL);
                assert(data->mapped != NULL);
                assert(data->seg_sizes != NULL);
        }

        /* Place segment into the memory array and return its index */  
        int index = data->size - 1;      
        data->memory[index] = seg;
        data->mapped[index] = true;
        data->seg_sizes[index] = size;
        
        // data->mapped[data->size - 1] = true;

        return index;
}

/* * * * * * * * * * * * * * * * insert_segment * * * * * * * * * * * * * * *
 *
 * Takes in a data struct and the size to map a new segment, reusing an 
 * unmapped index if available.
 *
 * Parameters:
 *      T data: UM data structure
 *      int size: number of words in the segment
 *
 * Return: the index of the segment mapped in memory
 *
 * Expects:
 *      Expects T data to not be null
 * 
 * Notes:
 *      May malloc a new segment that will be freed in data_free() or 
 *      within a seperate call of this function
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
int insert_segment(T data, int size)
{
        // fprintf(stderr, "insert_segment\n");

        int length = data->size;
        int index = 0;

        /* Check if there is an unmapped segment in the memory array */
        for (int i = 0; i < length; i++) {
                
                /* If there is an unmapped segment, break at that index */
                if (data->mapped[i] == false) {
                        break;
                }

                index++;

                /* If no unmapped segment, push the segment to back of array */
                if (index == length) {
                        return push_segment(data, size);
                }
        }

        /* Free the old unmapped segment */
        uint32_t *seg = data->memory[index]; 
        free(seg);

        /* Create a new segment initialized to 0 */
        data->mapped[index] = true;
        data->seg_sizes[index] = size;

        uint32_t *seg_new = malloc(size * sizeof(uint32_t));
        assert(seg_new != NULL);

        for (int i = 0; i < size; i++) {
                seg_new[i] = 0;
        }

        /* Place new segment in memory array and return its index */
        data->memory[index] = seg_new;

        return index;
}

/* * * * * * * * * * * * * * * * * data_free * * * * * * * * * * * * * * * *
 *
 * Takes in a pointer to the data struct and frees all memory associated with 
 * the UM struct.
 *
 * Parameters:
 *      T *data: pointer to the UM data structure to free
 *
 * Return: Nothing
 *
 * Expects:
 *      Expects T data and the pointer to T data to not be null
 * 
 * Notes: 
 *      Failure to meet these expectations results in a CRE
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
void data_free(T *data) 
{
        // fprintf(stderr, "data free\n");

        assert(data != NULL);
        assert(*data != NULL);

        /* Free all segments, Data struct members, and the Data struct */
        int size = (*data)->size;
        for (int i = 0; i < size; i++) {
                uint32_t *curr = (*data)->memory[i];
                free(curr);
        }

        free((*data)->memory);
        free((*data)->registers);
        free((*data)->seg_sizes);
        free((*data)->mapped);
        free(*data);
}

#undef T