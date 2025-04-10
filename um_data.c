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
        Seq_T memory; /* Sequence that holds all data segments */
        Seq_T unmaps; /* Sequence that holds all unmapped indexes */
        Seq_T segment;  /* Sequence that holds all of the segments */
        uint32_t registers[8]; /* Array that holds all 8 registers */
        int memory_index; /* Tracks the current word index in segment 0 */
};

/* * * * * * * * * * * * * * * * * read_um_file * * * * * * * * * * * * * *
*
* Reads a UM binary file into segment 0.
*
* Parameters:
*       T data:         initialized Data structure
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
        /* Create a sequence of segmented memory */
        Seq_T seg = Seq_new(0);
        assert(seg);
        
        /*
         * Grabs each 32 bit word places them into
         * the corresponding position in the seg sequence
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
                        val = (val << 8) | (uint32_t) byte;
                        byte = fgetc(fp);
                }
                /* bit shift val to input big endian order */
                val = (val << 8) | (uint32_t) byte;

                Seq_addhi(seg, (void *)(uintptr_t) val);
        }

        /* Add segment 0 to Data struct */
        Seq_addhi(data->memory, seg);  
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
*       The data struct is malloced as well as the sequence for memory 
*       both are freed later in data_free()
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
T initialize_data(FILE *fp) 
{
        assert(fp != NULL);

        /* Malloc and initialize components of the Data struct */
        T data = malloc(sizeof(struct T));
        data->memory = Seq_new(0);

        data->unmaps = Seq_new(0);

        for (int i = 0; i < 8; i++) {
                data->registers[i] = 0;
        }

        data->memory_index = 0;

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
        assert(data != NULL);
        
        /* Grab the word at (segment 0, memory_index) */
        Seq_T seg = Seq_get(data->memory, 0);
        uint32_t val =  (uint32_t)(uintptr_t) Seq_get(seg, data->memory_index);

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
uint32_t get_word(T data, int segment_index, int word_index) {
        assert(data != NULL);

        /* Grab the word at (segment_index, word_index) */
        Seq_T seg = Seq_get(data->memory, segment_index);
        uint32_t val = (uint32_t)(uintptr_t) Seq_get(seg, word_index); 

        return val;
}

void set_word(T data, int segment_index, int word_index, uint32_t word)
{
        /* Set word at (segment_index, word_index) */
        Seq_T seg = Seq_get(data->memory, segment_index);        
        
        Seq_put(seg, word_index, (void *)(uintptr_t) word);
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
* Return: Nothing
*
* Expects:
*      Expects T data to not be null amd for segment index to be greater than
*      0 and less than data->size,
*
* Notes:
*      Failure to meet these expectations results in a CRE
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
void set_segment_false(T data, int segment_index) {
        assert(data != NULL);
        assert(segment_index >= 0 && segment_index < Seq_length(data->memory));

        /* Unmap segment by adding segment_index to unmaps sequence */
        Seq_addhi(data->unmaps, (void *)(uintptr_t) segment_index);
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
        assert(data != NULL);
        assert(segment_index >= 0 && segment_index < Seq_length(data->memory));

        data->memory_index = memory_index;

        /* If it is replacing segment 0 with segment 0, do nothing */
        if (segment_index == 0) {
                return;
        }

        /* Discard the old segment 0 */
        Seq_T seg_0 = Seq_get(data->memory, 0);
        Seq_free(&seg_0);

        /* Grab the segment that will be loaded into segment 0 */
        Seq_T seg = Seq_get(data->memory, segment_index);
        
        int size = Seq_length(seg);
        
        /* Create a deep copy of the segment and place in segment 0 */
        Seq_T seg_new = Seq_new(0);
        for (int i = 0; i < size; i++) {
                uint32_t val = (uint32_t)(uintptr_t) Seq_get(seg, i);

                Seq_addhi(seg_new, (void *)(uintptr_t) val);
        }

        Seq_put(data->memory, 0, seg_new);
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
        /* Initialize a new sequence to the specified size */
        Seq_T seg = Seq_new(0);
        for (int i; i < size; i++) {
                uint32_t val = 0;
                Seq_addhi(seg, (void *)(uintptr_t) val);
        }

        /* Add it to the Data struct and return its index */
        Seq_addhi(data->memory, seg);
        return Seq_length(data->memory) - 1;
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
        /* If there are no unmapped segments, push the segment */
        int length = Seq_length(data->unmaps);
        if (length == 0) {
                return push_segment(data, size);
        }

        uint32_t index = (uint32_t)(uintptr_t) Seq_remlo(data->unmaps);

        /* Discard the existing contents in the unmapped segment  */
        Seq_T seg = Seq_get(data->memory, index);
        Seq_free(&seg);

        /* Initialize a new segment to the specified size */
        seg = Seq_new(0);
        for (int i = 0; i < size; i++) {
                uint32_t val = 0;
                Seq_addhi(seg, (void *)(uintptr_t) val);
        }

        /* Place the segment in the Data struct and return its index */
        Seq_put(data->memory, index, seg);
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
        assert(data != NULL);
        assert(*data != NULL);

        /* Free each sequence in data->memory sequence */
        int size = Seq_length((*data)->memory);
        for (int i = 0; i < size; i++) {
                Seq_T curr = Seq_get((*data)->memory, i);
                Seq_free(&curr);
        }

        Seq_free(&((*data)->memory));
        Seq_free(&(*data)->unmaps);
        free(*data);
}

#undef T