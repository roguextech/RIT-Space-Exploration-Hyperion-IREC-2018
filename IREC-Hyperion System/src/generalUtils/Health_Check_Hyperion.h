/*
 * File: Health_Check_Hyperion.h
 * Organization: RIT Space Exploration
 * Description:
 *     Used to preform health check on the payload in various stages.
 */

#ifndef HEALTH_CHECK_H
#define HEALTH_CHECK_H

unsigned int    deployment_pins_open(); // Returns how many deployment pins are open.
void            send_report(char msg[]); // Sends health report to ground station
void            health_report_deploy(unsigned int pin_cnt);
unsigned int    check_switch_open(int switch_pin); // Used to debounce the pins
bool            arm_check_send();
bool            check_para_pin();

#endif