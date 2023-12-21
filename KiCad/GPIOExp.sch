EESchema Schematic File Version 4
LIBS:GR_Loop_Switcher-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
Title "Loop Switcher Main Board"
Date "2023-11-29"
Rev ""
Comp ""
Comment1 ""
Comment2 "https://github.com/GadgetReboot/Loop_Switcher"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Interface_Expansion:MCP23017_SP U?
U 1 1 625E28B0
P 5400 3475
AR Path="/625E28B0" Ref="U?"  Part="1" 
AR Path="/620F645F/625E28B0" Ref="U?"  Part="1" 
AR Path="/6258F4DD/625E28B0" Ref="U7"  Part="1" 
AR Path="/62660C03/625E28B0" Ref="U?"  Part="1" 
AR Path="/6266783E/625E28B0" Ref="U?"  Part="1" 
AR Path="/6266789E/625E28B0" Ref="U?"  Part="1" 
F 0 "U7" H 4950 4450 50  0000 C CNN
F 1 "MCP23017_SP" H 5750 4450 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W7.62mm" H 5600 2475 50  0001 L CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20001952C.pdf" H 5600 2375 50  0001 L CNN
	1    5400 3475
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 625E28B6
P 5400 2300
AR Path="/620F645F/625E28B6" Ref="#PWR?"  Part="1" 
AR Path="/625E28B6" Ref="#PWR?"  Part="1" 
AR Path="/6258F4DD/625E28B6" Ref="#PWR084"  Part="1" 
AR Path="/62660C03/625E28B6" Ref="#PWR?"  Part="1" 
AR Path="/6266783E/625E28B6" Ref="#PWR?"  Part="1" 
AR Path="/6266789E/625E28B6" Ref="#PWR?"  Part="1" 
F 0 "#PWR084" H 5400 2150 50  0001 C CNN
F 1 "VCC" H 5417 2473 50  0000 C CNN
F 2 "" H 5400 2300 50  0001 C CNN
F 3 "" H 5400 2300 50  0001 C CNN
	1    5400 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 2375 5400 2350
$Comp
L power:GNDREF #PWR?
U 1 1 625E28BD
P 5400 4675
AR Path="/625E28BD" Ref="#PWR?"  Part="1" 
AR Path="/62037087/625E28BD" Ref="#PWR?"  Part="1" 
AR Path="/620C1FB7/625E28BD" Ref="#PWR?"  Part="1" 
AR Path="/620CB6A8/625E28BD" Ref="#PWR?"  Part="1" 
AR Path="/620CF00E/625E28BD" Ref="#PWR?"  Part="1" 
AR Path="/620F645F/625E28BD" Ref="#PWR?"  Part="1" 
AR Path="/6258F4DD/625E28BD" Ref="#PWR089"  Part="1" 
AR Path="/62660C03/625E28BD" Ref="#PWR?"  Part="1" 
AR Path="/6266783E/625E28BD" Ref="#PWR?"  Part="1" 
AR Path="/6266789E/625E28BD" Ref="#PWR?"  Part="1" 
F 0 "#PWR089" H 5400 4425 50  0001 C CNN
F 1 "GNDREF" H 5405 4502 50  0001 C CNN
F 2 "" H 5400 4675 50  0001 C CNN
F 3 "" H 5400 4675 50  0001 C CNN
	1    5400 4675
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5400 4675 5400 4575
$Comp
L Device:C_Small C?
U 1 1 625E28C4
P 4975 2350
AR Path="/620F645F/625E28C4" Ref="C?"  Part="1" 
AR Path="/625E28C4" Ref="C?"  Part="1" 
AR Path="/6258F4DD/625E28C4" Ref="C13"  Part="1" 
AR Path="/62660C03/625E28C4" Ref="C?"  Part="1" 
AR Path="/6266783E/625E28C4" Ref="C?"  Part="1" 
AR Path="/6266789E/625E28C4" Ref="C?"  Part="1" 
F 0 "C13" V 4746 2350 50  0000 C CNN
F 1 "100nF" V 4837 2350 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 4975 2350 50  0001 C CNN
F 3 "~" H 4975 2350 50  0001 C CNN
	1    4975 2350
	0    1    1    0   
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 625E28CA
P 4775 2400
AR Path="/625E28CA" Ref="#PWR?"  Part="1" 
AR Path="/62037087/625E28CA" Ref="#PWR?"  Part="1" 
AR Path="/620C1FB7/625E28CA" Ref="#PWR?"  Part="1" 
AR Path="/620CB6A8/625E28CA" Ref="#PWR?"  Part="1" 
AR Path="/620CF00E/625E28CA" Ref="#PWR?"  Part="1" 
AR Path="/620F645F/625E28CA" Ref="#PWR?"  Part="1" 
AR Path="/6258F4DD/625E28CA" Ref="#PWR085"  Part="1" 
AR Path="/62660C03/625E28CA" Ref="#PWR?"  Part="1" 
AR Path="/6266783E/625E28CA" Ref="#PWR?"  Part="1" 
AR Path="/6266789E/625E28CA" Ref="#PWR?"  Part="1" 
F 0 "#PWR085" H 4775 2150 50  0001 C CNN
F 1 "GNDREF" H 4780 2227 50  0001 C CNN
F 2 "" H 4775 2400 50  0001 C CNN
F 3 "" H 4775 2400 50  0001 C CNN
	1    4775 2400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4875 2350 4775 2350
Wire Wire Line
	4775 2350 4775 2400
Wire Wire Line
	5075 2350 5400 2350
Connection ~ 5400 2350
Wire Wire Line
	5400 2350 5400 2300
$Comp
L Connector:TestPoint_Alt TP?
U 1 1 625E28D5
P 4625 3275
AR Path="/620F645F/625E28D5" Ref="TP?"  Part="1" 
AR Path="/625E28D5" Ref="TP?"  Part="1" 
AR Path="/6258F4DD/625E28D5" Ref="TP8"  Part="1" 
AR Path="/62660C03/625E28D5" Ref="TP?"  Part="1" 
AR Path="/6266783E/625E28D5" Ref="TP?"  Part="1" 
AR Path="/6266789E/625E28D5" Ref="TP?"  Part="1" 
F 0 "TP8" V 4650 3300 50  0000 C CNN
F 1 "TestPoint_Alt" V 4729 3347 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 4825 3275 50  0001 C CNN
F 3 "~" H 4825 3275 50  0001 C CNN
	1    4625 3275
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4625 3275 4700 3275
$Comp
L Connector:TestPoint_Alt TP?
U 1 1 625E28DC
P 4625 3375
AR Path="/620F645F/625E28DC" Ref="TP?"  Part="1" 
AR Path="/625E28DC" Ref="TP?"  Part="1" 
AR Path="/6258F4DD/625E28DC" Ref="TP9"  Part="1" 
AR Path="/62660C03/625E28DC" Ref="TP?"  Part="1" 
AR Path="/6266783E/625E28DC" Ref="TP?"  Part="1" 
AR Path="/6266789E/625E28DC" Ref="TP?"  Part="1" 
F 0 "TP9" V 4650 3400 50  0000 C CNN
F 1 "TestPoint_Alt" V 4729 3447 50  0001 C CNN
F 2 "TestPoint:TestPoint_THTPad_D2.0mm_Drill1.0mm" H 4825 3375 50  0001 C CNN
F 3 "~" H 4825 3375 50  0001 C CNN
	1    4625 3375
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4625 3375 4700 3375
$Comp
L Device:C_Small C?
U 1 1 625E28E3
P 3000 3650
AR Path="/620F645F/625E28E3" Ref="C?"  Part="1" 
AR Path="/625E28E3" Ref="C?"  Part="1" 
AR Path="/6258F4DD/625E28E3" Ref="C14"  Part="1" 
AR Path="/62660C03/625E28E3" Ref="C?"  Part="1" 
AR Path="/6266783E/625E28E3" Ref="C?"  Part="1" 
AR Path="/6266789E/625E28E3" Ref="C?"  Part="1" 
F 0 "C14" H 2908 3604 50  0000 R CNN
F 1 "100nF" H 2908 3695 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 3000 3650 50  0001 C CNN
F 3 "~" H 3000 3650 50  0001 C CNN
	1    3000 3650
	-1   0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 625E28E9
P 3000 3750
AR Path="/625E28E9" Ref="#PWR?"  Part="1" 
AR Path="/62037087/625E28E9" Ref="#PWR?"  Part="1" 
AR Path="/620C1FB7/625E28E9" Ref="#PWR?"  Part="1" 
AR Path="/620CB6A8/625E28E9" Ref="#PWR?"  Part="1" 
AR Path="/620CF00E/625E28E9" Ref="#PWR?"  Part="1" 
AR Path="/620F645F/625E28E9" Ref="#PWR?"  Part="1" 
AR Path="/6258F4DD/625E28E9" Ref="#PWR087"  Part="1" 
AR Path="/62660C03/625E28E9" Ref="#PWR?"  Part="1" 
AR Path="/6266783E/625E28E9" Ref="#PWR?"  Part="1" 
AR Path="/6266789E/625E28E9" Ref="#PWR?"  Part="1" 
F 0 "#PWR087" H 3000 3500 50  0001 C CNN
F 1 "GNDREF" H 3005 3577 50  0001 C CNN
F 2 "" H 3000 3750 50  0001 C CNN
F 3 "" H 3000 3750 50  0001 C CNN
	1    3000 3750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4275 3575 4700 3575
$Comp
L Device:R_Small_US R?
U 1 1 625E28F0
P 3000 3300
AR Path="/620F645F/625E28F0" Ref="R?"  Part="1" 
AR Path="/625E28F0" Ref="R?"  Part="1" 
AR Path="/6258F4DD/625E28F0" Ref="R9"  Part="1" 
AR Path="/62660C03/625E28F0" Ref="R?"  Part="1" 
AR Path="/6266783E/625E28F0" Ref="R?"  Part="1" 
AR Path="/6266789E/625E28F0" Ref="R?"  Part="1" 
F 0 "R9" H 3068 3346 50  0000 L CNN
F 1 "10K" H 3068 3255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 3000 3300 50  0001 C CNN
F 3 "~" H 3000 3300 50  0001 C CNN
	1    3000 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 3200 3000 3125
$Comp
L power:VCC #PWR?
U 1 1 625E2912
P 3000 3125
AR Path="/620F645F/625E2912" Ref="#PWR?"  Part="1" 
AR Path="/625E2912" Ref="#PWR?"  Part="1" 
AR Path="/6258F4DD/625E2912" Ref="#PWR086"  Part="1" 
AR Path="/62660C03/625E2912" Ref="#PWR?"  Part="1" 
AR Path="/6266783E/625E2912" Ref="#PWR?"  Part="1" 
AR Path="/6266789E/625E2912" Ref="#PWR?"  Part="1" 
F 0 "#PWR086" H 3000 2975 50  0001 C CNN
F 1 "VCC" H 3017 3298 50  0000 C CNN
F 2 "" H 3000 3125 50  0001 C CNN
F 3 "" H 3000 3125 50  0001 C CNN
	1    3000 3125
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 3400 3000 3475
Wire Wire Line
	4275 3575 4275 3475
Wire Wire Line
	4275 3475 3000 3475
Connection ~ 3000 3475
Wire Wire Line
	3000 3475 3000 3550
$Comp
L power:GNDREF #PWR?
U 1 1 625E294A
P 4575 4525
AR Path="/625E294A" Ref="#PWR?"  Part="1" 
AR Path="/620F645F/625E294A" Ref="#PWR?"  Part="1" 
AR Path="/6258F4DD/625E294A" Ref="#PWR088"  Part="1" 
AR Path="/62660C03/625E294A" Ref="#PWR?"  Part="1" 
AR Path="/6266783E/625E294A" Ref="#PWR?"  Part="1" 
AR Path="/6266789E/625E294A" Ref="#PWR?"  Part="1" 
F 0 "#PWR088" H 4575 4275 50  0001 C CNN
F 1 "GNDREF" H 4580 4352 50  0001 C CNN
F 2 "" H 4575 4525 50  0001 C CNN
F 3 "" H 4575 4525 50  0001 C CNN
	1    4575 4525
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4700 2775 4425 2775
Wire Wire Line
	6100 2675 6375 2675
Text Label 6100 2675 0    50   ~ 0
Out1
Text Label 6100 2775 0    50   ~ 0
Out2
Text Label 6100 2875 0    50   ~ 0
Out3
Text Label 6100 2975 0    50   ~ 0
Out4
Text Label 6100 3075 0    50   ~ 0
Out5
Text Label 6100 3175 0    50   ~ 0
Out6
Text Label 6100 3275 0    50   ~ 0
Out7
Text Label 6100 3375 0    50   ~ 0
Out8
Text Label 6125 3575 0    50   ~ 0
Out9
Text Label 6125 3675 0    50   ~ 0
Out10
Text Label 6125 3775 0    50   ~ 0
Out11
Text Label 6125 3875 0    50   ~ 0
Out12
Text Label 6125 3975 0    50   ~ 0
Out13
Text Label 6125 4075 0    50   ~ 0
Out14
Text Label 6125 4175 0    50   ~ 0
Out15
Text Label 6125 4275 0    50   ~ 0
Out16
Wire Wire Line
	6100 3375 6375 3375
Wire Wire Line
	6100 3275 6375 3275
Wire Wire Line
	6100 3175 6375 3175
Wire Wire Line
	6100 3075 6375 3075
Wire Wire Line
	6100 2975 6375 2975
Wire Wire Line
	6100 2875 6375 2875
Wire Wire Line
	6100 2775 6375 2775
Wire Wire Line
	6100 3975 6375 3975
Wire Wire Line
	6100 4075 6375 4075
Wire Wire Line
	6100 4175 6375 4175
Wire Wire Line
	6100 4275 6375 4275
Text HLabel 1475 2675 0    50   Input ~ 0
SDA
Text HLabel 1475 2775 0    50   Input ~ 0
SCL
Text HLabel 1475 2100 0    50   Input ~ 0
VCC
$Comp
L power:VCC #PWR?
U 1 1 625E6BED
P 1675 1875
AR Path="/620F645F/625E6BED" Ref="#PWR?"  Part="1" 
AR Path="/625E6BED" Ref="#PWR?"  Part="1" 
AR Path="/6258F4DD/625E6BED" Ref="#PWR081"  Part="1" 
AR Path="/62660C03/625E6BED" Ref="#PWR?"  Part="1" 
AR Path="/6266783E/625E6BED" Ref="#PWR?"  Part="1" 
AR Path="/6266789E/625E6BED" Ref="#PWR?"  Part="1" 
F 0 "#PWR081" H 1675 1725 50  0001 C CNN
F 1 "VCC" H 1692 2048 50  0000 C CNN
F 2 "" H 1675 1875 50  0001 C CNN
F 3 "" H 1675 1875 50  0001 C CNN
	1    1675 1875
	1    0    0    -1  
$EndComp
Wire Wire Line
	1675 1875 1675 2100
Wire Wire Line
	1675 2100 1475 2100
Text HLabel 1475 2200 0    50   Input ~ 0
Gnd
Wire Wire Line
	1475 2200 1675 2200
$Comp
L power:GNDREF #PWR?
U 1 1 6260CF4A
P 1675 2250
AR Path="/6260CF4A" Ref="#PWR?"  Part="1" 
AR Path="/62037087/6260CF4A" Ref="#PWR?"  Part="1" 
AR Path="/620C1FB7/6260CF4A" Ref="#PWR?"  Part="1" 
AR Path="/620CB6A8/6260CF4A" Ref="#PWR?"  Part="1" 
AR Path="/620CF00E/6260CF4A" Ref="#PWR?"  Part="1" 
AR Path="/620F645F/6260CF4A" Ref="#PWR?"  Part="1" 
AR Path="/6258F4DD/6260CF4A" Ref="#PWR083"  Part="1" 
AR Path="/62660C03/6260CF4A" Ref="#PWR?"  Part="1" 
AR Path="/6266783E/6260CF4A" Ref="#PWR?"  Part="1" 
AR Path="/6266789E/6260CF4A" Ref="#PWR?"  Part="1" 
F 0 "#PWR083" H 1675 2000 50  0001 C CNN
F 1 "GNDREF" H 1680 2077 50  0001 C CNN
F 2 "" H 1675 2250 50  0001 C CNN
F 3 "" H 1675 2250 50  0001 C CNN
	1    1675 2250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1675 2250 1675 2200
Text HLabel 6375 2675 2    50   Output ~ 0
Out1
Text HLabel 6375 2775 2    50   Output ~ 0
Out2
Text HLabel 6375 2875 2    50   Output ~ 0
Out3
Text HLabel 6375 2975 2    50   Output ~ 0
Out4
Text HLabel 6375 3075 2    50   Output ~ 0
Out5
Text HLabel 6375 3175 2    50   Output ~ 0
Out6
Text HLabel 6375 3275 2    50   Output ~ 0
Out7
Text HLabel 6375 3375 2    50   Output ~ 0
Out8
Text HLabel 6375 3975 2    50   Output ~ 0
Out13
Text HLabel 6375 4075 2    50   Output ~ 0
Out14
Text HLabel 6375 4175 2    50   Output ~ 0
Out15
Text HLabel 6375 4275 2    50   Output ~ 0
Out16
$Comp
L Device:R_Small_US R?
U 1 1 64BF4AA1
P 4175 2450
AR Path="/620F645F/64BF4AA1" Ref="R?"  Part="1" 
AR Path="/64BF4AA1" Ref="R?"  Part="1" 
AR Path="/6258F4DD/64BF4AA1" Ref="R7"  Part="1" 
F 0 "R7" H 4243 2496 50  0000 L CNN
F 1 "10K" H 4243 2405 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 4175 2450 50  0001 C CNN
F 3 "~" H 4175 2450 50  0001 C CNN
	1    4175 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4175 2350 4175 2275
$Comp
L Device:R_Small_US R?
U 1 1 64BF4AAC
P 4425 2450
AR Path="/620F645F/64BF4AAC" Ref="R?"  Part="1" 
AR Path="/64BF4AAC" Ref="R?"  Part="1" 
AR Path="/6258F4DD/64BF4AAC" Ref="R8"  Part="1" 
F 0 "R8" H 4493 2496 50  0000 L CNN
F 1 "10K" H 4493 2405 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 4425 2450 50  0001 C CNN
F 3 "~" H 4425 2450 50  0001 C CNN
	1    4425 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4425 2350 4425 2275
$Comp
L power:VCC #PWR?
U 1 1 64BF4AB3
P 4425 2175
AR Path="/620F645F/64BF4AB3" Ref="#PWR?"  Part="1" 
AR Path="/64BF4AB3" Ref="#PWR?"  Part="1" 
AR Path="/6258F4DD/64BF4AB3" Ref="#PWR082"  Part="1" 
F 0 "#PWR082" H 4425 2025 50  0001 C CNN
F 1 "VCC" H 4442 2348 50  0000 C CNN
F 2 "" H 4425 2175 50  0001 C CNN
F 3 "" H 4425 2175 50  0001 C CNN
	1    4425 2175
	1    0    0    -1  
$EndComp
Wire Wire Line
	4175 2275 4425 2275
Wire Wire Line
	4425 2275 4425 2175
Connection ~ 4425 2275
Connection ~ 4425 2775
Text HLabel 6375 3875 2    50   Output ~ 0
Out12
Text HLabel 6375 3775 2    50   Output ~ 0
Out11
Text HLabel 6375 3675 2    50   Output ~ 0
Out10
Text HLabel 6375 3575 2    50   Output ~ 0
Out9
Wire Wire Line
	6100 3875 6375 3875
Wire Wire Line
	6100 3775 6375 3775
Wire Wire Line
	6100 3675 6375 3675
Wire Wire Line
	6100 3575 6375 3575
Wire Wire Line
	1475 2775 4425 2775
Wire Wire Line
	1475 2675 4175 2675
Wire Wire Line
	4425 2550 4425 2775
Wire Wire Line
	4175 2550 4175 2675
Connection ~ 4175 2675
Wire Wire Line
	4175 2675 4700 2675
Wire Wire Line
	4700 4275 4575 4275
Wire Wire Line
	4575 4275 4575 4525
Wire Wire Line
	4700 4175 4575 4175
Wire Wire Line
	4575 4175 4575 4275
Connection ~ 4575 4275
Wire Wire Line
	4700 4075 4575 4075
Wire Wire Line
	4575 4075 4575 4175
Connection ~ 4575 4175
$EndSCHEMATC
