/*
 * File: Mission_Utils.cpp
 * Organization: RIT Space Exploration
 * Description:
 *     Utilities functions mission events
 */

#include "IRECHYPERION.h"
#include "../Routines_Hyperion.h"
#include "../sensorUtils/StratoLogger_Hyperion.h"
#include "Routine_Helpers_Hyperion.h"
#include "Mission_Utils_Hyperion.h"
#include "../Data_Buffer_Hyperion.h"
#include "../sensorUtils/LIS331_Hyperion.h"
#include "Pins.h"

#define ACCEL_AUTO_ARM_THRES 2 // In gees
#define ROC_AUTO_ARM_THRES 30 // m/s

uint32_t deployment_time = 0;

float height_sample = get_Altitude(); //Stratologger
uint32_t time_sample = millis();

float ROC_var = 0; // Rate of climb

bool parachute_deploy = false;
bool imp_damper_deploy = false;

/**
 * Init function for deployment routines
 */
int init_deploy_pins(){

	pinMode(DEPLOY_SWITCH_01, INPUT);
	pinMode(DEPLOY_SWITCH_02, INPUT);
	pinMode(DEPLOY_SWITCH_03, INPUT);
	pinMode(DEPLOY_SWITCH_04, INPUT);

	return 0; // Success
}

int init_para_pins(){

	pinMode(EMATCH_1_ARM_P, OUTPUT);
	digitalWriteFast(EMATCH_1_ARM_P, LOW);
	pinMode(EMATCH_1_FIRE_P, OUTPUT);
	digitalWriteFast(EMATCH_1_FIRE_P, LOW);

	return 0;
}

/**
 * Set parachute deployment, logs event into buffer
 */
void set_parachute_deploy(){
	char * data_str = form_NoData_str(PARACHUTE_DEPLOY);

	if (data_str != NULL){
		// Insert data into the data buffer
		add_to_buffer(data_str);
	}

	parachute_deploy = true;
}

/**
 * Set impact damper deployment, logs event into buffer
 */
void set_imp_damper_deploy(){
	char * data_str = form_NoData_str(DAMPER_DEPLOY);

	if (data_str != NULL){
		// Insert data into the data buffer
		add_to_buffer(data_str);
	}

	imp_damper_deploy = true;
}

bool get_parachute_deploy(){
	return parachute_deploy;
}

bool get_imp_damper_deploy(){
	return imp_damper_deploy;
}

/**
 * function to return the time from deployment in millis
 * Return
 *  time from deployment in millis
 */
uint32_t deployed_delta(){

	return millis() - deployment_time;
}

/**
 * Arms Parachute on payload deployment
 */
void arm_parachute(){

	digitalWriteFast(EMATCH_1_ARM_P, HIGH);
}

/**
 * Set deployment_time and arm subsystems.
 */
void set_deployment(){

	char * data_str = form_NoData_str(DEPLOYMENT);

	if (data_str != NULL){
		// Insert data into the data buffer
		add_to_buffer(data_str);
	}

	arm_parachute();
	// arm impact dampers TODO

	deployment_time = millis();
}

/**
 * Calculate the rate of clib in m/s
 * Return
 *    Positive for increase in altitude
 *    Negative for decrease in altitude
 */
void rate_of_climb(){

	float delta_time = millis() - time_sample;
	delta_time = delta_time / 1000; // Convert milliseconds to seconds

	float alt_temp = get_Altitude();
	float delta_alt = alt_temp - height_sample;

	time_sample = millis();
	height_sample = alt_temp;

	ROC_var = delta_alt / delta_time; // result in m/s
}

/**
 * Getter function for rate of rate_of_climb
 */
float get_rate_of_climb(){
	return ROC_var;
}

//TODO
bool correct_orientation_para(){
	return true;
}

/**
 * Function used to detect if launch has occurred 
 * Returns
 * 		True: If sensor readings are above thresholds
 * 		False: otherwise
 */
bool detect_launch(){

	bool check_RateOfClimb = false;
	bool check_x = false;
	bool check_y = false; 
	bool check_z = false;

	// acceleration greater than the set threshold
	if(get_lis331_accel_x() > ACCEL_AUTO_ARM_THRES) check_x = true;
	if(get_lis331_accel_y() > ACCEL_AUTO_ARM_THRES) check_y = true;
	if(get_lis331_accel_z() > ACCEL_AUTO_ARM_THRES) check_z = true;

	// If accelerometer is upside down
	if(get_lis331_accel_x() < ACCEL_AUTO_ARM_THRES * -1) check_x = true;
	if(get_lis331_accel_y() < ACCEL_AUTO_ARM_THRES * -1) check_y = true;
	if(get_lis331_accel_z() < ACCEL_AUTO_ARM_THRES * -1) check_z = true;

	if(get_rate_of_climb() > ROC_AUTO_ARM_THRES) check_RateOfClimb = true;

	return (check_RateOfClimb && (check_x || check_y || check_z));
}
