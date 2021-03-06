/*
 * File: Data_Buffer.cpp
 * Organization: RIT Space Exploration
 * Description:
 *     Main data buffer for the hyperion system.
 * Details
 *     Strings are stored into the buffer in the following format:
 *     [Data_Type],[Time_from_Startup_Millis],[Data],[Data]...'\n'
 */

#include "IRECHYPERION.h"
#include "Data_Buffer_Hyperion.h"
#include <SD.h>
#include "Pins.h"

#define FILE_WRITE_LIMIT 2000
// Maximum buffer capacity
#define BUFFER_CAP 100

size_t buff_size = 0;

unsigned int num_files = 0;
unsigned int write_cnt = 0;

File data_file;

// Main data buffer
char *data_buffer[BUFFER_CAP] = {0};

bool init_SD(){

    if (!SD.begin(BUILTIN_SDCARD)) {
      return false;
    }
	set_new_file();

	return true;
}

void close_file(){

	data_file.close();
}

/**
 * Close old file and create a new one
 */
void new_file(){

	data_file.close(); // Close existing file first
	set_new_file();
}

/**
 * Create a new file and set the file to current file
 */
bool set_new_file(){
	char buff[40] = {'\0'};

	strcat(buff, FILE_NAME);

	char temp[20] = {'\0'};
	itoa(num_files, temp, 10);

	strcat(buff, temp);
	strcat(buff, ".log");

	data_file = SD.open(buff, O_CREAT | O_APPEND | O_WRITE);

	if(!data_file) return false;

	num_files += 1;

	return true;
}

/**
 * Resets the buffer size, previous values in the buffer will be overwritten
 */
void flush_buffer(){

	data_file.flush(); // Force write to file

	for(size_t i = 0; i < buff_size; i++){
		free(data_buffer[i]);
	}

	buff_size = 0;
}

/**
 * Allocate dynamic space for a string and fill the first value with a null terminator.
 * Arg
 *    str_size: the size of the string to be allocated.
 */
char * create_string(int str_size){
	char *result_str = (char*) malloc(str_size + 1);

	if (result_str == NULL) return NULL;

	result_str[0] = '\0';

	return result_str;
}

/**
 * Add null terminated data string to the buffer, if the buffer is full. Data is not added.
 * Arg
 *    data: null terminated data string
 * Returns
 *    0 on success
 *    1 if buffer is full
 */
int add_to_buffer(char * data_str){

	if(buff_size >= BUFFER_CAP) write_buffer();

	data_buffer[buff_size] = data_str;
	buff_size += 1;

	return 0; // Success
}

/**
 * Getter for buff_size
 */
int get_size() {
	return buff_size;
}

/**
 * Write the buffer to the SD card, then flush the buffer
 */
int write_buffer() {

	if(write_cnt >= FILE_WRITE_LIMIT){
		new_file();
	}

	digitalWriteFast(LED_GREEN, HIGH);

	if (data_file){
		for (size_t i = 0; i < buff_size; i++){
			data_file.write(data_buffer[i]);
		}
	}

	write_cnt += 1;
	flush_buffer();

	digitalWriteFast(LED_GREEN, LOW);

	return 0;
}
