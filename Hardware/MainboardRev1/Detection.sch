EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:SWITCH_3PDT
LIBS:switch_dpdt
LIBS:ltc3605
LIBS:ltc4358
LIBS:ltc2992
LIBS:lt6703-3
LIBS:lsm9ds1
LIBS:bme280
LIBS:lis331hh
LIBS:ccs811
LIBS:abpmann030pg2a3
LIBS:ublox_max-m8q
LIBS:rfm69hcw
LIBS:teensy3_6-OuterHeadersOnly
LIBS:switches
LIBS:MainboardRev1-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_01X02 J9
U 1 1 5AFB6175
P 2150 2100
F 0 "J9" H 2150 2250 50  0000 C CNN
F 1 "Switch_1" V 2250 2100 50  0000 C CNN
F 2 "" H 2150 2100 50  0000 C CNN
F 3 "" H 2150 2100 50  0000 C CNN
	1    2150 2100
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR070
U 1 1 5AFB61FA
P 2400 2200
F 0 "#PWR070" H 2400 1950 50  0001 C CNN
F 1 "GND" H 2400 2050 50  0000 C CNN
F 2 "" H 2400 2200 50  0000 C CNN
F 3 "" H 2400 2200 50  0000 C CNN
	1    2400 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 2200 2400 2150
Wire Wire Line
	2400 2150 2350 2150
$Comp
L R R78
U 1 1 5AFB6399
P 2400 1850
F 0 "R78" V 2480 1850 50  0000 C CNN
F 1 "10k" V 2400 1850 50  0000 C CNN
F 2 "" V 2330 1850 50  0000 C CNN
F 3 "" H 2400 1850 50  0000 C CNN
	1    2400 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 2000 2400 2050
Text GLabel 2350 1650 0    39   Input ~ 0
+3.3V
Wire Wire Line
	2350 1650 2400 1650
Wire Wire Line
	2400 1650 2400 1700
Connection ~ 2400 2050
$Comp
L C C32
U 1 1 5AFB656E
P 2650 2200
F 0 "C32" H 2750 2100 50  0000 L CNN
F 1 "10nF" H 2750 2000 50  0000 L CNN
F 2 "" H 2688 2050 50  0000 C CNN
F 3 "" H 2650 2200 50  0000 C CNN
	1    2650 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2050 2750 2050
$Comp
L GND #PWR071
U 1 1 5AFB65B1
P 2650 2350
F 0 "#PWR071" H 2650 2100 50  0001 C CNN
F 1 "GND" H 2650 2200 50  0000 C CNN
F 2 "" H 2650 2350 50  0000 C CNN
F 3 "" H 2650 2350 50  0000 C CNN
	1    2650 2350
	1    0    0    -1  
$EndComp
$Comp
L R R80
U 1 1 5AFB65E3
P 2900 2050
F 0 "R80" V 2800 2050 50  0000 C CNN
F 1 "1k" V 2900 2050 50  0000 C CNN
F 2 "" V 2830 2050 50  0000 C CNN
F 3 "" H 2900 2050 50  0000 C CNN
	1    2900 2050
	0    1    1    0   
$EndComp
Connection ~ 2650 2050
Text GLabel 3100 2050 2    39   Input ~ 0
SWITCH_1
Wire Wire Line
	3100 2050 3050 2050
$Comp
L CONN_01X02 J10
U 1 1 5AFB6ADB
P 2150 3150
F 0 "J10" H 2150 3300 50  0000 C CNN
F 1 "Switch_3" V 2250 3150 50  0000 C CNN
F 2 "" H 2150 3150 50  0000 C CNN
F 3 "" H 2150 3150 50  0000 C CNN
	1    2150 3150
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR072
U 1 1 5AFB6AE1
P 2400 3250
F 0 "#PWR072" H 2400 3000 50  0001 C CNN
F 1 "GND" H 2400 3100 50  0000 C CNN
F 2 "" H 2400 3250 50  0000 C CNN
F 3 "" H 2400 3250 50  0000 C CNN
	1    2400 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 3250 2400 3200
Wire Wire Line
	2400 3200 2350 3200
$Comp
L R R79
U 1 1 5AFB6AE9
P 2400 2900
F 0 "R79" V 2480 2900 50  0000 C CNN
F 1 "10k" V 2400 2900 50  0000 C CNN
F 2 "" V 2330 2900 50  0000 C CNN
F 3 "" H 2400 2900 50  0000 C CNN
	1    2400 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 3050 2400 3100
Text GLabel 2350 2700 0    39   Input ~ 0
+3.3V
Wire Wire Line
	2350 2700 2400 2700
Wire Wire Line
	2400 2700 2400 2750
Connection ~ 2400 3100
$Comp
L C C33
U 1 1 5AFB6AF4
P 2650 3250
F 0 "C33" H 2750 3150 50  0000 L CNN
F 1 "10nF" H 2750 3050 50  0000 L CNN
F 2 "" H 2688 3100 50  0000 C CNN
F 3 "" H 2650 3250 50  0000 C CNN
	1    2650 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 3100 2750 3100
$Comp
L GND #PWR073
U 1 1 5AFB6AFB
P 2650 3400
F 0 "#PWR073" H 2650 3150 50  0001 C CNN
F 1 "GND" H 2650 3250 50  0000 C CNN
F 2 "" H 2650 3400 50  0000 C CNN
F 3 "" H 2650 3400 50  0000 C CNN
	1    2650 3400
	1    0    0    -1  
$EndComp
$Comp
L R R81
U 1 1 5AFB6B01
P 2900 3100
F 0 "R81" V 2800 3100 50  0000 C CNN
F 1 "1k" V 2900 3100 50  0000 C CNN
F 2 "" V 2830 3100 50  0000 C CNN
F 3 "" H 2900 3100 50  0000 C CNN
	1    2900 3100
	0    1    1    0   
$EndComp
Connection ~ 2650 3100
Text GLabel 3100 3100 2    39   Input ~ 0
SWITCH_3
Wire Wire Line
	3100 3100 3050 3100
$Comp
L CONN_01X02 J11
U 1 1 5AFB6C62
P 4350 2100
F 0 "J11" H 4350 2250 50  0000 C CNN
F 1 "Switch_2" V 4450 2100 50  0000 C CNN
F 2 "" H 4350 2100 50  0000 C CNN
F 3 "" H 4350 2100 50  0000 C CNN
	1    4350 2100
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR074
U 1 1 5AFB6C68
P 4600 2200
F 0 "#PWR074" H 4600 1950 50  0001 C CNN
F 1 "GND" H 4600 2050 50  0000 C CNN
F 2 "" H 4600 2200 50  0000 C CNN
F 3 "" H 4600 2200 50  0000 C CNN
	1    4600 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 2200 4600 2150
Wire Wire Line
	4600 2150 4550 2150
$Comp
L R R82
U 1 1 5AFB6C70
P 4600 1850
F 0 "R82" V 4680 1850 50  0000 C CNN
F 1 "10k" V 4600 1850 50  0000 C CNN
F 2 "" V 4530 1850 50  0000 C CNN
F 3 "" H 4600 1850 50  0000 C CNN
	1    4600 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 2000 4600 2050
Text GLabel 4550 1650 0    39   Input ~ 0
+3.3V
Wire Wire Line
	4550 1650 4600 1650
Wire Wire Line
	4600 1650 4600 1700
Connection ~ 4600 2050
$Comp
L C C34
U 1 1 5AFB6C7B
P 4850 2200
F 0 "C34" H 4950 2100 50  0000 L CNN
F 1 "10nF" H 4950 2000 50  0000 L CNN
F 2 "" H 4888 2050 50  0000 C CNN
F 3 "" H 4850 2200 50  0000 C CNN
	1    4850 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 2050 4950 2050
$Comp
L GND #PWR075
U 1 1 5AFB6C82
P 4850 2350
F 0 "#PWR075" H 4850 2100 50  0001 C CNN
F 1 "GND" H 4850 2200 50  0000 C CNN
F 2 "" H 4850 2350 50  0000 C CNN
F 3 "" H 4850 2350 50  0000 C CNN
	1    4850 2350
	1    0    0    -1  
$EndComp
$Comp
L R R84
U 1 1 5AFB6C88
P 5100 2050
F 0 "R84" V 5000 2050 50  0000 C CNN
F 1 "1k" V 5100 2050 50  0000 C CNN
F 2 "" V 5030 2050 50  0000 C CNN
F 3 "" H 5100 2050 50  0000 C CNN
	1    5100 2050
	0    1    1    0   
$EndComp
Connection ~ 4850 2050
Text GLabel 5300 2050 2    39   Input ~ 0
SWITCH_2
Wire Wire Line
	5300 2050 5250 2050
$Comp
L CONN_01X02 J12
U 1 1 5AFB6C91
P 4350 3150
F 0 "J12" H 4350 3300 50  0000 C CNN
F 1 "Switch_4" V 4450 3150 50  0000 C CNN
F 2 "" H 4350 3150 50  0000 C CNN
F 3 "" H 4350 3150 50  0000 C CNN
	1    4350 3150
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR076
U 1 1 5AFB6C97
P 4600 3250
F 0 "#PWR076" H 4600 3000 50  0001 C CNN
F 1 "GND" H 4600 3100 50  0000 C CNN
F 2 "" H 4600 3250 50  0000 C CNN
F 3 "" H 4600 3250 50  0000 C CNN
	1    4600 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 3250 4600 3200
Wire Wire Line
	4600 3200 4550 3200
$Comp
L R R83
U 1 1 5AFB6C9F
P 4600 2900
F 0 "R83" V 4680 2900 50  0000 C CNN
F 1 "10k" V 4600 2900 50  0000 C CNN
F 2 "" V 4530 2900 50  0000 C CNN
F 3 "" H 4600 2900 50  0000 C CNN
	1    4600 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 3050 4600 3100
Text GLabel 4550 2700 0    39   Input ~ 0
+3.3V
Wire Wire Line
	4550 2700 4600 2700
Wire Wire Line
	4600 2700 4600 2750
Connection ~ 4600 3100
$Comp
L C C35
U 1 1 5AFB6CAA
P 4850 3250
F 0 "C35" H 4950 3150 50  0000 L CNN
F 1 "10nF" H 4950 3050 50  0000 L CNN
F 2 "" H 4888 3100 50  0000 C CNN
F 3 "" H 4850 3250 50  0000 C CNN
	1    4850 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 3100 4950 3100
$Comp
L GND #PWR077
U 1 1 5AFB6CB1
P 4850 3400
F 0 "#PWR077" H 4850 3150 50  0001 C CNN
F 1 "GND" H 4850 3250 50  0000 C CNN
F 2 "" H 4850 3400 50  0000 C CNN
F 3 "" H 4850 3400 50  0000 C CNN
	1    4850 3400
	1    0    0    -1  
$EndComp
$Comp
L R R85
U 1 1 5AFB6CB7
P 5100 3100
F 0 "R85" V 5000 3100 50  0000 C CNN
F 1 "1k" V 5100 3100 50  0000 C CNN
F 2 "" V 5030 3100 50  0000 C CNN
F 3 "" H 5100 3100 50  0000 C CNN
	1    5100 3100
	0    1    1    0   
$EndComp
Connection ~ 4850 3100
Text GLabel 5300 3100 2    39   Input ~ 0
SWITCH_4
Wire Wire Line
	5300 3100 5250 3100
Text Notes 1850 1400 0    118  ~ 0
Mechanical Deployment Detection Switches
Wire Notes Line
	1800 1100 5750 1100
Wire Notes Line
	5750 1100 5750 3700
Wire Notes Line
	5750 3700 1800 3700
Wire Notes Line
	1800 3700 1800 1100
$EndSCHEMATC
