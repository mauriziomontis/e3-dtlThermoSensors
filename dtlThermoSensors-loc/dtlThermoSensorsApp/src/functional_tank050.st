/* DTL Thermosensors State Machine
# State Machine devoted to control the status and the health of DTL thermosensors sub-system :
#
# Principal States:
# - Initialization:
# 	* Initialize State Machine when EPICS application starts
# - Self-Check:
#       * Verify HW status (connections, devices\'' health, etc.)
# - Start-Up:
#       * Prepare the sub-system to perform operations
# - Idle:
#       * Machine is in attendance of external ok
# - Ready-for-operation:
#       * Machine prepared for operation
# - Failure:
#       * Machine goes in safe mode because of HW/SW problems
# - Maintenance:
#       * Status where the machine is under maintenance. Useful to indicate possible operation and works on the apparatus
#
#
# developed by Maurizio Montis | INFN-LNL
# mail: maurizio.montis@lnl.infn.it
*/

program functional_tank050

/*
# Libraries
*/

%%#include <stdio.h>
%%#include <string.h>
%%#include <unistd.h>

/*
# Variables and Constants
*/


/*
# Variables and Constants
*/

int TempIlk_001;
assign TempIlk_001  to "{SECTION_NAME}:EMR-TT-001:TempIlk";
monitor TempIlk_001;
int TempIlk_002;
assign TempIlk_002 to "{SECTION_NAME}:EMR-TT-002:TempIlk";
monitor TempIlk_002;
int TempIlk_003;
assign TempIlk_003 to "{SECTION_NAME}:EMR-TT-003:TempIlk";
monitor TempIlk_003;
int TempIlk_004;
assign TempIlk_004 to "{SECTION_NAME}:EMR-TT-004:TempIlk";
monitor TempIlk_004;
int TempIlk_005;
assign TempIlk_005 to "{SECTION_NAME}:EMR-TT-005:TempIlk";
monitor TempIlk_005;
int TempIlk_006;
assign TempIlk_006 to "{SECTION_NAME}:EMR-TT-006:TempIlk";
monitor TempIlk_006;
int TempIlk_007;
assign TempIlk_007 to "{SECTION_NAME}:EMR-TT-007:TempIlk";
monitor TempIlk_007;
int TempIlk_008;
assign TempIlk_008 to "{SECTION_NAME}:EMR-TT-008:TempIlk";
monitor TempIlk_008;
int TempIlk_009;
assign TempIlk_009 to "{SECTION_NAME}:EMR-TT-009:TempIlk";
monitor TempIlk_009;
int TempIlk_010;
assign TempIlk_010 to "{SECTION_NAME}:EMR-TT-010:TempIlk";
monitor TempIlk_010;
int TempIlk_011;
assign TempIlk_011 to "{SECTION_NAME}:EMR-TT-011:TempIlk";
monitor TempIlk_011;
int TempIlk_012;
assign TempIlk_012 to "{SECTION_NAME}:EMR-TT-012:TempIlk";
monitor TempIlk_012;
int TempIlk_013;
assign TempIlk_013 to "{SECTION_NAME}:EMR-TT-013:TempIlk";
monitor TempIlk_013;
int TempIlk_014;
assign TempIlk_014 to "{SECTION_NAME}:EMR-TT-014:TempIlk";
monitor TempIlk_014;
int TempIlk_015;
assign TempIlk_015  to "{SECTION_NAME}:EMR-TT-015:TempIlk";
monitor TempIlk_015;
int TempIlk_016;
assign TempIlk_016 to "{SECTION_NAME}:EMR-TT-016:TempIlk";
monitor TempIlk_016;
int TempIlk_017;
assign TempIlk_017 to "{SECTION_NAME}:EMR-TT-017:TempIlk";
monitor TempIlk_017;
int TempIlk_018;
assign TempIlk_018 to "{SECTION_NAME}:EMR-TT-018:TempIlk";
monitor TempIlk_018;
int TempIlk_019;
assign TempIlk_019 to "{SECTION_NAME}:EMR-TT-019:TempIlk";
monitor TempIlk_019;
int TempIlk_020;
assign TempIlk_020 to "{SECTION_NAME}:EMR-TT-020:TempIlk";
monitor TempIlk_020;
int TempIlk_021;
assign TempIlk_021 to "{SECTION_NAME}:EMR-TT-021:TempIlk";
monitor TempIlk_021;
int TempIlk_022;
assign TempIlk_022 to "{SECTION_NAME}:EMR-TT-022:TempIlk";
monitor TempIlk_022;
int TempIlk_100;
assign TempIlk_100 to "{SECTION_NAME}:EMR-TT-100:TempIlk";
monitor TempIlk_100;
int TempIlk_200;
assign TempIlk_200 to "{SECTION_NAME}:EMR-TT-200:TempIlk";
monitor TempIlk_200;


int TempDisable_001;
assign TempDisable_001  to "{SECTION_NAME}:EMR-TT-001:TempDis";
monitor TempDisable_001;
int TempDisable_002;
assign TempDisable_002 to "{SECTION_NAME}:EMR-TT-002:TempDis";
monitor TempDisable_002;
int TempDisable_003;
assign TempDisable_003 to "{SECTION_NAME}:EMR-TT-003:TempDis";
monitor TempDisable_003;
int TempDisable_004;
assign TempDisable_004 to "{SECTION_NAME}:EMR-TT-004:TempDis";
monitor TempDisable_004;
int TempDisable_005;
assign TempDisable_005 to "{SECTION_NAME}:EMR-TT-005:TempDis";
monitor TempDisable_005;
int TempDisable_006;
assign TempDisable_006 to "{SECTION_NAME}:EMR-TT-006:TempDis";
monitor TempDisable_006;
int TempDisable_007;
assign TempDisable_007 to "{SECTION_NAME}:EMR-TT-007:TempDis";
monitor TempDisable_007;
int TempDisable_008;
assign TempDisable_008 to "{SECTION_NAME}:EMR-TT-008:TempDis";
monitor TempDisable_008;
int TempDisable_009;
assign TempDisable_009 to "{SECTION_NAME}:EMR-TT-009:TempDis";
monitor TempDisable_009;
int TempDisable_010;
assign TempDisable_010 to "{SECTION_NAME}:EMR-TT-010:TempDis";
monitor TempDisable_010;
int TempDisable_011;
assign TempDisable_011 to "{SECTION_NAME}:EMR-TT-011:TempDis";
monitor TempDisable_011;
int TempDisable_012;
assign TempDisable_012 to "{SECTION_NAME}:EMR-TT-012:TempDis";
monitor TempDisable_012;
int TempDisable_013;
assign TempDisable_013 to "{SECTION_NAME}:EMR-TT-013:TempDis";
monitor TempDisable_013;
int TempDisable_014;
assign TempDisable_014 to "{SECTION_NAME}:EMR-TT-014:TempDis";
monitor TempDisable_014;
int TempDisable_015;
assign TempDisable_015  to "{SECTION_NAME}:EMR-TT-015:TempDis";
monitor TempDisable_015;
int TempDisable_016;
assign TempDisable_016 to "{SECTION_NAME}:EMR-TT-016:TempDis";
monitor TempDisable_016;
int TempDisable_017;
assign TempDisable_017 to "{SECTION_NAME}:EMR-TT-017:TempDis";
monitor TempDisable_017;
int TempDisable_018;
assign TempDisable_018 to "{SECTION_NAME}:EMR-TT-018:TempDis";
monitor TempDisable_018;
int TempDisable_019;
assign TempDisable_019 to "{SECTION_NAME}:EMR-TT-019:TempDis";
monitor TempDisable_019;
int TempDisable_020;
assign TempDisable_020 to "{SECTION_NAME}:EMR-TT-020:TempDis";
monitor TempDisable_020;
int TempDisable_021;
assign TempDisable_021 to "{SECTION_NAME}:EMR-TT-021:TempDis";
monitor TempDisable_021;
int TempDisable_022;
assign TempDisable_022 to "{SECTION_NAME}:EMR-TT-022:TempDis";
monitor TempDisable_022;
int TempDisable_100;
assign TempDisable_100 to "{SECTION_NAME}:EMR-TT-100:TempDis";
monitor TempDisable_100;
int TempDisable_200;
assign TempDisable_200 to "{SECTION_NAME}:EMR-TT-100:TempDis";
monitor TempDisable_200;

/*
# Position Code:
# 	0 -> empty location
# 	1 -> steerer position
# 	2 -> BPM position
# 	3 -> PMQ position
*/
int TempPos_001;
assign TempPos_001  to "{SECTION_NAME}:EMR-TT-001:Temp-Pos";
monitor TempPos_001;
int TempPos_002;
assign TempPos_002 to "{SECTION_NAME}:EMR-TT-002:Temp-Pos";
monitor TempPos_002;
int TempPos_003;
assign TempPos_003 to "{SECTION_NAME}:EMR-TT-003:Temp-Pos";
monitor TempPos_003;
int TempPos_004;
assign TempPos_004 to "{SECTION_NAME}:EMR-TT-004:Temp-Pos";
monitor TempPos_004;
int TempPos_005;
assign TempPos_005 to "{SECTION_NAME}:EMR-TT-005:Temp-Pos";
monitor TempPos_005;
int TempPos_006;
assign TempPos_006 to "{SECTION_NAME}:EMR-TT-006:Temp-Pos";
monitor TempPos_006;
int TempPos_007;
assign TempPos_007 to "{SECTION_NAME}:EMR-TT-007:Temp-Pos";
monitor TempPos_007;
int TempPos_008;
assign TempPos_008 to "{SECTION_NAME}:EMR-TT-008:Temp-Pos";
monitor TempPos_008;
int TempPos_009;
assign TempPos_009 to "{SECTION_NAME}:EMR-TT-009:Temp-Pos";
monitor TempPos_009;
int TempPos_010;
assign TempPos_010 to "{SECTION_NAME}:EMR-TT-010:Temp-Pos";
monitor TempPos_010;
int TempPos_011;
assign TempPos_011 to "{SECTION_NAME}:EMR-TT-011:Temp-Pos";
monitor TempPos_011;
int TempPos_012;
assign TempPos_012 to "{SECTION_NAME}:EMR-TT-012:Temp-Pos";
monitor TempPos_012;
int TempPos_013;
assign TempPos_013 to "{SECTION_NAME}:EMR-TT-013:Temp-Pos";
monitor TempPos_013;
int TempPos_014;
assign TempPos_014 to "{SECTION_NAME}:EMR-TT-014:Temp-Pos";
monitor TempPos_014;
int TempPos_015;
assign TempPos_015  to "{SECTION_NAME}:EMR-TT-015:Temp-Pos";
monitor TempPos_015;
int TempPos_016;
assign TempPos_016 to "{SECTION_NAME}:EMR-TT-016:Temp-Pos";
monitor TempPos_016;
int TempPos_017;
assign TempPos_017 to "{SECTION_NAME}:EMR-TT-017:Temp-Pos";
monitor TempPos_017;
int TempPos_018;
assign TempPos_018 to "{SECTION_NAME}:EMR-TT-018:Temp-Pos";
monitor TempPos_018;
int TempPos_019;
assign TempPos_019 to "{SECTION_NAME}:EMR-TT-019:Temp-Pos";
monitor TempPos_019;
int TempPos_020;
assign TempPos_020 to "{SECTION_NAME}:EMR-TT-020:Temp-Pos";
monitor TempPos_020;
int TempPos_021;
assign TempPos_021 to "{SECTION_NAME}:EMR-TT-021:Temp-Pos";
monitor TempPos_021;
int TempPos_022;
assign TempPos_022 to "{SECTION_NAME}:EMR-TT-022:Temp-Pos";
monitor TempPos_022;
int TempPos_100;
assign TempPos_100 to "{SECTION_NAME}:EMR-TT-100:Temp-Pos";
monitor TempPos_100;
int TempPos_200;
assign TempPos_200 to "{SECTION_NAME}:EMR-TT-200:Temp-Pos";
monitor TempPos_200;


int HwErrAlrm_001;
assign HwErrAlrm_001  to "{SECTION_NAME}:EMR-TT-001:HwErrAlrm";
monitor HwErrAlrm_001;
int HwErrAlrm_002;
assign HwErrAlrm_002 to "{SECTION_NAME}:EMR-TT-002:HwErrAlrm";
monitor HwErrAlrm_002;
int HwErrAlrm_003;
assign HwErrAlrm_003 to "{SECTION_NAME}:EMR-TT-003:HwErrAlrm";
monitor HwErrAlrm_003;
int HwErrAlrm_004;
assign HwErrAlrm_004 to "{SECTION_NAME}:EMR-TT-004:HwErrAlrm";
monitor HwErrAlrm_004;
int HwErrAlrm_005;
assign HwErrAlrm_005 to "{SECTION_NAME}:EMR-TT-005:HwErrAlrm";
monitor HwErrAlrm_005;
int HwErrAlrm_006;
assign HwErrAlrm_006 to "{SECTION_NAME}:EMR-TT-006:HwErrAlrm";
monitor HwErrAlrm_006;
int HwErrAlrm_007;
assign HwErrAlrm_007 to "{SECTION_NAME}:EMR-TT-007:HwErrAlrm";
monitor HwErrAlrm_007;
int HwErrAlrm_008;
assign HwErrAlrm_008 to "{SECTION_NAME}:EMR-TT-008:HwErrAlrm";
monitor HwErrAlrm_008;
int HwErrAlrm_009;
assign HwErrAlrm_009 to "{SECTION_NAME}:EMR-TT-009:HwErrAlrm";
monitor HwErrAlrm_009;
int HwErrAlrm_010;
assign HwErrAlrm_010 to "{SECTION_NAME}:EMR-TT-010:HwErrAlrm";
monitor HwErrAlrm_010;
int HwErrAlrm_011;
assign HwErrAlrm_011 to "{SECTION_NAME}:EMR-TT-011:HwErrAlrm";
monitor HwErrAlrm_011;
int HwErrAlrm_012;
assign HwErrAlrm_012 to "{SECTION_NAME}:EMR-TT-012:HwErrAlrm";
monitor HwErrAlrm_012;
int HwErrAlrm_013;
assign HwErrAlrm_013 to "{SECTION_NAME}:EMR-TT-013:HwErrAlrm";
monitor HwErrAlrm_013;
int HwErrAlrm_014;
assign HwErrAlrm_014 to "{SECTION_NAME}:EMR-TT-014:HwErrAlrm";
monitor HwErrAlrm_014;
int HwErrAlrm_015;
assign HwErrAlrm_015  to "{SECTION_NAME}:EMR-TT-015:HwErrAlrm";
monitor HwErrAlrm_015;
int HwErrAlrm_016;
assign HwErrAlrm_016 to "{SECTION_NAME}:EMR-TT-016:HwErrAlrm";
monitor HwErrAlrm_016;
int HwErrAlrm_017;
assign HwErrAlrm_017 to "{SECTION_NAME}:EMR-TT-017:HwErrAlrm";
monitor HwErrAlrm_017;
int HwErrAlrm_018;
assign HwErrAlrm_018 to "{SECTION_NAME}:EMR-TT-018:HwErrAlrm";
monitor HwErrAlrm_018;
int HwErrAlrm_019;
assign HwErrAlrm_019 to "{SECTION_NAME}:EMR-TT-019:HwErrAlrm";
monitor HwErrAlrm_019;
int HwErrAlrm_020;
assign HwErrAlrm_020 to "{SECTION_NAME}:EMR-TT-020:HwErrAlrm";
monitor HwErrAlrm_020;
int HwErrAlrm_021;
assign HwErrAlrm_021 to "{SECTION_NAME}:EMR-TT-021:HwErrAlrm";
monitor HwErrAlrm_021;
int HwErrAlrm_022;
assign HwErrAlrm_022 to "{SECTION_NAME}:EMR-TT-022:HwErrAlrm";
monitor HwErrAlrm_022;
int HwErrAlrm_100;
assign HwErrAlrm_100 to "{SECTION_NAME}:EMR-TT-100:HwErrAlrm";
monitor HwErrAlrm_100;
int HwErrAlrm_200;
assign HwErrAlrm_200 to "{SECTION_NAME}:EMR-TT-200:HwErrAlrm";
monitor HwErrAlrm_200;


int HwOverLimAlrm_001;
assign HwOverLimAlrm_001  to "{SECTION_NAME}:EMR-TT-001:HwOverLimAlrm";
monitor HwOverLimAlrm_001;
int HwOverLimAlrm_002;
assign HwOverLimAlrm_002 to "{SECTION_NAME}:EMR-TT-002:HwOverLimAlrm";
monitor HwOverLimAlrm_002;
int HwOverLimAlrm_003;
assign HwOverLimAlrm_003 to "{SECTION_NAME}:EMR-TT-003:HwOverLimAlrm";
monitor HwOverLimAlrm_003;
int HwOverLimAlrm_004;
assign HwOverLimAlrm_004 to "{SECTION_NAME}:EMR-TT-004:HwOverLimAlrm";
monitor HwOverLimAlrm_004;
int HwOverLimAlrm_005;
assign HwOverLimAlrm_005 to "{SECTION_NAME}:EMR-TT-005:HwOverLimAlrm";
monitor HwOverLimAlrm_005;
int HwOverLimAlrm_006;
assign HwOverLimAlrm_006 to "{SECTION_NAME}:EMR-TT-006:HwOverLimAlrm";
monitor HwOverLimAlrm_006;
int HwOverLimAlrm_007;
assign HwOverLimAlrm_007 to "{SECTION_NAME}:EMR-TT-007:HwOverLimAlrm";
monitor HwOverLimAlrm_007;
int HwOverLimAlrm_008;
assign HwOverLimAlrm_008 to "{SECTION_NAME}:EMR-TT-008:HwOverLimAlrm";
monitor HwOverLimAlrm_008;
int HwOverLimAlrm_009;
assign HwOverLimAlrm_009 to "{SECTION_NAME}:EMR-TT-009:HwOverLimAlrm";
monitor HwOverLimAlrm_009;
int HwOverLimAlrm_010;
assign HwOverLimAlrm_010 to "{SECTION_NAME}:EMR-TT-010:HwOverLimAlrm";
monitor HwOverLimAlrm_010;
int HwOverLimAlrm_011;
assign HwOverLimAlrm_011 to "{SECTION_NAME}:EMR-TT-011:HwOverLimAlrm";
monitor HwOverLimAlrm_011;
int HwOverLimAlrm_012;
assign HwOverLimAlrm_012 to "{SECTION_NAME}:EMR-TT-012:HwOverLimAlrm";
monitor HwOverLimAlrm_012;
int HwOverLimAlrm_013;
assign HwOverLimAlrm_013 to "{SECTION_NAME}:EMR-TT-013:HwOverLimAlrm";
monitor HwOverLimAlrm_013;
int HwOverLimAlrm_014;
assign HwOverLimAlrm_014 to "{SECTION_NAME}:EMR-TT-014:HwOverLimAlrm";
monitor HwOverLimAlrm_014;
int HwOverLimAlrm_015;
assign HwOverLimAlrm_015  to "{SECTION_NAME}:EMR-TT-015:HwOverLimAlrm";
monitor HwOverLimAlrm_015;
int HwOverLimAlrm_016;
assign HwOverLimAlrm_016 to "{SECTION_NAME}:EMR-TT-016:HwOverLimAlrm";
monitor HwOverLimAlrm_016;
int HwOverLimAlrm_017;
assign HwOverLimAlrm_017 to "{SECTION_NAME}:EMR-TT-017:HwOverLimAlrm";
monitor HwOverLimAlrm_017;
int HwOverLimAlrm_018;
assign HwOverLimAlrm_018 to "{SECTION_NAME}:EMR-TT-018:HwOverLimAlrm";
monitor HwOverLimAlrm_018;
int HwOverLimAlrm_019;
assign HwOverLimAlrm_019 to "{SECTION_NAME}:EMR-TT-019:HwOverLimAlrm";
monitor HwOverLimAlrm_019;
int HwOverLimAlrm_020;
assign HwOverLimAlrm_020 to "{SECTION_NAME}:EMR-TT-020:HwOverLimAlrm";
monitor HwOverLimAlrm_020;
int HwOverLimAlrm_021;
assign HwOverLimAlrm_021 to "{SECTION_NAME}:EMR-TT-021:HwOverLimAlrm";
monitor HwOverLimAlrm_021;
int HwOverLimAlrm_022;
assign HwOverLimAlrm_022 to "{SECTION_NAME}:EMR-TT-022:HwOverLimAlrm";
monitor HwOverLimAlrm_022;
int HwOverLimAlrm_100;
assign HwOverLimAlrm_100 to "{SECTION_NAME}:EMR-TT-100:HwOverLimAlrm";
monitor HwOverLimAlrm_100;
int HwOverLimAlrm_200;
assign HwOverLimAlrm_200 to "{SECTION_NAME}:EMR-TT-200:HwOverLimAlrm";
monitor HwOverLimAlrm_200;


int HwUnderLimAlrm_001;
assign HwUnderLimAlrm_001  to "{SECTION_NAME}:EMR-TT-001:HwUnderLimAlrm";
monitor HwUnderLimAlrm_001;
int HwUnderLimAlrm_002;
assign HwUnderLimAlrm_002 to "{SECTION_NAME}:EMR-TT-002:HwUnderLimAlrm";
monitor HwUnderLimAlrm_002;
int HwUnderLimAlrm_003;
assign HwUnderLimAlrm_003 to "{SECTION_NAME}:EMR-TT-003:HwUnderLimAlrm";
monitor HwUnderLimAlrm_003;
int HwUnderLimAlrm_004;
assign HwUnderLimAlrm_004 to "{SECTION_NAME}:EMR-TT-004:HwUnderLimAlrm";
monitor HwUnderLimAlrm_004;
int HwUnderLimAlrm_005;
assign HwUnderLimAlrm_005 to "{SECTION_NAME}:EMR-TT-005:HwUnderLimAlrm";
monitor HwUnderLimAlrm_005;
int HwUnderLimAlrm_006;
assign HwUnderLimAlrm_006 to "{SECTION_NAME}:EMR-TT-006:HwUnderLimAlrm";
monitor HwUnderLimAlrm_006;
int HwUnderLimAlrm_007;
assign HwUnderLimAlrm_007 to "{SECTION_NAME}:EMR-TT-007:HwUnderLimAlrm";
monitor HwUnderLimAlrm_007;
int HwUnderLimAlrm_008;
assign HwUnderLimAlrm_008 to "{SECTION_NAME}:EMR-TT-008:HwUnderLimAlrm";
monitor HwUnderLimAlrm_008;
int HwUnderLimAlrm_009;
assign HwUnderLimAlrm_009 to "{SECTION_NAME}:EMR-TT-009:HwUnderLimAlrm";
monitor HwUnderLimAlrm_009;
int HwUnderLimAlrm_010;
assign HwUnderLimAlrm_010 to "{SECTION_NAME}:EMR-TT-010:HwUnderLimAlrm";
monitor HwUnderLimAlrm_010;
int HwUnderLimAlrm_011;
assign HwUnderLimAlrm_011 to "{SECTION_NAME}:EMR-TT-011:HwUnderLimAlrm";
monitor HwUnderLimAlrm_011;
int HwUnderLimAlrm_012;
assign HwUnderLimAlrm_012 to "{SECTION_NAME}:EMR-TT-012:HwUnderLimAlrm";
monitor HwUnderLimAlrm_012;
int HwUnderLimAlrm_013;
assign HwUnderLimAlrm_013 to "{SECTION_NAME}:EMR-TT-013:HwUnderLimAlrm";
monitor HwUnderLimAlrm_013;
int HwUnderLimAlrm_014;
assign HwUnderLimAlrm_014 to "{SECTION_NAME}:EMR-TT-014:HwUnderLimAlrm";
monitor HwUnderLimAlrm_014;
int HwUnderLimAlrm_015;
assign HwUnderLimAlrm_015  to "{SECTION_NAME}:EMR-TT-015:HwUnderLimAlrm";
monitor HwUnderLimAlrm_015;
int HwUnderLimAlrm_016;
assign HwUnderLimAlrm_016 to "{SECTION_NAME}:EMR-TT-016:HwUnderLimAlrm";
monitor HwUnderLimAlrm_016;
int HwUnderLimAlrm_017;
assign HwUnderLimAlrm_017 to "{SECTION_NAME}:EMR-TT-017:HwUnderLimAlrm";
monitor HwUnderLimAlrm_017;
int HwUnderLimAlrm_018;
assign HwUnderLimAlrm_018 to "{SECTION_NAME}:EMR-TT-018:HwUnderLimAlrm";
monitor HwUnderLimAlrm_018;
int HwUnderLimAlrm_019;
assign HwUnderLimAlrm_019 to "{SECTION_NAME}:EMR-TT-019:HwUnderLimAlrm";
monitor HwUnderLimAlrm_019;
int HwUnderLimAlrm_020;
assign HwUnderLimAlrm_020 to "{SECTION_NAME}:EMR-TT-020:HwUnderLimAlrm";
monitor HwUnderLimAlrm_020;
int HwUnderLimAlrm_021;
assign HwUnderLimAlrm_021 to "{SECTION_NAME}:EMR-TT-021:HwUnderLimAlrm";
monitor HwUnderLimAlrm_021;
int HwUnderLimAlrm_022;
assign HwUnderLimAlrm_022 to "{SECTION_NAME}:EMR-TT-022:HwUnderLimAlrm";
monitor HwUnderLimAlrm_022;
int HwUnderLimAlrm_100;
assign HwUnderLimAlrm_100 to "{SECTION_NAME}:EMR-TT-100:HwUnderLimAlrm";
monitor HwUnderLimAlrm_100;
int HwUnderLimAlrm_200;
assign HwUnderLimAlrm_200 to "{SECTION_NAME}:EMR-TT-200:HwUnderLimAlrm";
monitor HwUnderLimAlrm_200;

int MaintenanceReset;
assign MaintenanceReset to "DTL:EMR-TT:MaintenanceRst";
monitor MaintenanceReset;

int FaultReset;
assign FaultReset to "DTL:EMR-TT:FaultRst";
monitor FaultReset;

/*
# Stages Code:
# 	0  -> INIT
# 	10 -> SELF-CHECK
# 	20 -> IDLE
# 	30 -> START-UP
# 	40 -> READY FOR OPERATION
# 	50 -> FAILURE
# 	60 -> MAINTENANCE
*/
int StateMachineCode;
assign StateMachineCode to "{SECTION_NAME}:EMR-TT:StateMachine";


int RfSlow_okstatus;
assign RfSlow_okstatus to "{SECTION_NAME}:EMR-Cav-001:WrtC_OkStatS";
monitor RfSlow_okstatus;

/* Debug Mode: */
double DEBUG=1;



/*
# State Machine Definition
*/

ss temperature050_interlock {

/* state INITIALIZATION	*/
	state initialization {
      entry {
        printf("\n\nPreliminary controls executed due to Application Startup - Intialization\n\n");
        StateMachineCode=0;
        pvPut(StateMachineCode);
      }

      when (pvConnectCount()==pvAssignCount()) {
        printf("[SEQ TEMPERATURE  - TANK5] All PVs connected\n");
        printf("[SEQ TEMPERATURE  - TANK5] Starting Self Check Process\n");
        //RfSlow_okstatus=1;
        //pvPut(RfSlow_okstatus);
      } state self_check
	}


/* state SELF_CHECK	*/
	state self_check {
    entry {
        printf("\n[SEQ TEMPERATURE  - TANK5] Enter in SELF CHECK status\n");
        StateMachineCode=10;
        pvPut(StateMachineCode);
    }

    /* Interlock status at self-check (with sensor enabled) */
    when ( ( ((TempIlk_001 == 1) && (TempDisable_001 == 0)) || (TempDisable_001 == 1) ) || ( ((TempIlk_002 == 1) && (TempDisable_002 == 0)) || (TempDisable_002 == 1) ) || ( ((TempIlk_003 == 1) && (TempDisable_003 == 0)) || (TempDisable_003 == 1) ) || ( ((TempIlk_004 == 1) && (TempDisable_004 == 0)) || (TempDisable_004 == 1) ) || ( ((TempIlk_005 == 1) && (TempDisable_005 == 0)) || (TempDisable_005 == 1) ) || ( ((TempIlk_006 == 1) && (TempDisable_006 == 0)) || (TempDisable_006 == 1) ) || ( ((TempIlk_007 == 1) && (TempDisable_007 == 0)) || (TempDisable_007 == 1) ) || ( ((TempIlk_008 == 1) && (TempDisable_008 == 0)) || (TempDisable_008 == 1) ) || ( ((TempIlk_009 == 1) && (TempDisable_009 == 0)) || (TempDisable_009 == 1) ) || ( ((TempIlk_010 == 1) && (TempDisable_010 == 0)) || (TempDisable_010 == 1) ) || ( ((TempIlk_011 == 1) && (TempDisable_011 == 0)) || (TempDisable_011 == 1) ) || ( ((TempIlk_012 == 1) && (TempDisable_012 == 0)) || (TempDisable_012 == 1) ) || ( ((TempIlk_013 == 1) && (TempDisable_013 == 0)) || (TempDisable_013 == 1) ) || ( ((TempIlk_014 == 1) && (TempDisable_014 == 0)) || (TempDisable_014 == 1) ) || ( ((TempIlk_015 == 1) && (TempDisable_015 == 0)) || (TempDisable_015 == 1) ) || ( ((TempIlk_016 == 1) && (TempDisable_016 == 0)) || (TempDisable_016 == 1) ) || ( ((TempIlk_017 == 1) && (TempDisable_017 == 0)) || (TempDisable_017 == 1) ) || ( ((TempIlk_018 == 1) && (TempDisable_018 == 0)) || (TempDisable_018 == 1) ) || ( ((TempIlk_019 == 1) && (TempDisable_019 == 0)) || (TempDisable_019 == 1) ) || ( ((TempIlk_020 == 1) && (TempDisable_020 == 0)) || (TempDisable_020 == 1) ) || ( ((TempIlk_021 == 1) && (TempDisable_021 == 0)) || (TempDisable_021 == 1) ) || ( ((TempIlk_022 == 1) && (TempDisable_022 == 0)) || (TempDisable_022 == 1) ) || ( ((TempIlk_100 == 1) && (TempDisable_100 == 0)) || (TempDisable_100 == 1) ) || ( ((TempIlk_200 == 1) && (TempDisable_200 == 0)) || (TempDisable_200 == 1) ) ) {

 		   RfSlow_okstatus=0;
	     pvPut(RfSlow_okstatus);
       printf("[SEQ TEMPERATURE  - TANK5] Error in software interlock variable\n");
		   printf("[SEQ TEMPERATURE  - TANK5] Set TANK 5 Temperature OK STATUS to 0: INTERLOCK \n");
		} state failure

    /* Sensor error if sensor is in PMQ [code 3] or BPM [code 2] position */
		when ( ( (HwErrAlrm_001 == 1) && (TempPos_001 == 2) ) || ( (HwErrAlrm_001 == 1) && (TempPos_001 == 3) ) || ( (HwErrAlrm_002 == 1) && (TempPos_002 == 2) ) || ( (HwErrAlrm_002 == 1) && (TempPos_002 == 3) ) || ( (HwErrAlrm_003 == 1) && (TempPos_003 == 2) ) || ( (HwErrAlrm_003 == 1) && (TempPos_003 == 3) ) ||( (HwErrAlrm_004 == 1) && (TempPos_004 == 2) ) || ( (HwErrAlrm_004 == 1) && (TempPos_004 == 3) ) ||( (HwErrAlrm_005 == 1) && (TempPos_005 == 2) ) || ( (HwErrAlrm_005 == 1) && (TempPos_005 == 3) ) || ( (HwErrAlrm_006 == 1) && (TempPos_006 == 2) ) || ( (HwErrAlrm_006 == 1) && (TempPos_006 == 3) ) || ( (HwErrAlrm_007 == 1) && (TempPos_007 == 2) ) || ( (HwErrAlrm_007 == 1) && (TempPos_007 == 3) ) || ( (HwErrAlrm_008 == 1) && (TempPos_008 == 2) ) || ( (HwErrAlrm_008 == 1) && (TempPos_008 == 3) ) || ( (HwErrAlrm_009 == 1) && (TempPos_009 == 2) ) || ( (HwErrAlrm_009 == 1) && (TempPos_009 == 3) ) || ( (HwErrAlrm_010 == 1) && (TempPos_010 == 2) ) || ( (HwErrAlrm_010 == 1) && (TempPos_010 == 3) ) || ( (HwErrAlrm_011 == 1) && (TempPos_011 == 2) ) || ( (HwErrAlrm_011 == 1) && (TempPos_011 == 3) ) || ( (HwErrAlrm_012 == 1) && (TempPos_012 == 2) ) || ( (HwErrAlrm_012 == 1) && (TempPos_012 == 3) ) || ( (HwErrAlrm_013 == 1) && (TempPos_013 == 2) ) || ( (HwErrAlrm_013 == 1) && (TempPos_013 == 3) ) ||( (HwErrAlrm_014 == 1) && (TempPos_014 == 2) ) || ( (HwErrAlrm_014 == 1) && (TempPos_014 == 3) ) ||( (HwErrAlrm_015 == 1) && (TempPos_015 == 2) ) || ( (HwErrAlrm_015 == 1) && (TempPos_015 == 3) ) || ( (HwErrAlrm_016 == 1) && (TempPos_016 == 2) ) || ( (HwErrAlrm_016 == 1) && (TempPos_016 == 3) ) || ( (HwErrAlrm_017 == 1) && (TempPos_017 == 2) ) || ( (HwErrAlrm_017 == 1) && (TempPos_017 == 3) ) || ( (HwErrAlrm_018 == 1) && (TempPos_018 == 2) ) || ( (HwErrAlrm_018 == 1) && (TempPos_018 == 3) ) || ( (HwErrAlrm_019 == 1) && (TempPos_019 == 2) ) || ( (HwErrAlrm_019 == 1) && (TempPos_019 == 3) ) || ( (HwErrAlrm_020 == 1) && (TempPos_020 == 2) ) || ( (HwErrAlrm_020 == 1) && (TempPos_020 == 3) ) || ( (HwErrAlrm_021 == 1) && (TempPos_021 == 2) ) || ( (HwErrAlrm_021 == 1) && (TempPos_021 == 3) ) || ( (HwErrAlrm_022 == 1) && (TempPos_022 == 2) ) || ( (HwErrAlrm_022 == 1) && (TempPos_022 == 3) ) || ( (HwErrAlrm_100 == 1) && (TempPos_100 == 2) ) || ( (HwErrAlrm_100 == 1) && (TempPos_100 == 3) ) || ( (HwErrAlrm_200 == 1) && (TempPos_200 == 2) ) || ( (HwErrAlrm_200 == 1) && (TempPos_200 == 3) ) ) {

      RfSlow_okstatus=0;
      pvPut(RfSlow_okstatus);
      printf("[SEQ TEMPERATURE  - TANK5] MAJOR Error in hardware connection: possible broken sensor\n");
      printf("[SEQ TEMPERATURE  - TANK5] Set TANK 5 Temperature OK STATUS to 0: INTERLOCK \n");
		} state failure

    /* Sensor error if sensor is in steerer [code 1] or empty [code 0] position */
		when ( (( (HwErrAlrm_001 == 1) && (TempPos_001 == 0) && (TempDisable_001 == 0)) || (TempDisable_001 == 1) ) || (( (HwErrAlrm_001 == 1) && (TempPos_001 == 1) && (TempDisable_001 == 0)) || (TempDisable_001 == 1) ) || (( (HwErrAlrm_002 == 1) && (TempPos_002 == 0) && (TempDisable_002 == 0)) || (TempDisable_002 == 1) ) || (( (HwErrAlrm_002 == 1) && (TempPos_002 == 1) && (TempDisable_002 == 0)) || (TempDisable_002 == 1) ) || (( (HwErrAlrm_003 == 1) && (TempPos_003 == 0) && (TempDisable_003 == 0)) || (TempDisable_003 == 1) ) || (( (HwErrAlrm_003 == 1) && (TempPos_003 == 1) && (TempDisable_003 == 0)) || (TempDisable_003 == 1) ) || (( (HwErrAlrm_004 == 1) && (TempPos_004 == 0) && (TempDisable_004 == 0)) || (TempDisable_004 == 1) ) || (( (HwErrAlrm_004 == 1) && (TempPos_004 == 1) && (TempDisable_004 == 0)) || (TempDisable_004 == 1) ) || (( (HwErrAlrm_005 == 1) && (TempPos_005 == 0) && (TempDisable_005 == 0)) || (TempDisable_005 == 1) ) || (( (HwErrAlrm_005 == 1) && (TempPos_005 == 1) && (TempDisable_005 == 0)) || (TempDisable_005 == 1) ) || (( (HwErrAlrm_006 == 1) && (TempPos_006 == 0) && (TempDisable_006 == 0)) || (TempDisable_006 == 1) ) || (( (HwErrAlrm_006 == 1) && (TempPos_006 == 1) && (TempDisable_006 == 0)) || (TempDisable_006 == 1) ) || (( (HwErrAlrm_007 == 1) && (TempPos_007 == 0) && (TempDisable_007 == 0)) || (TempDisable_007 == 1) ) || (( (HwErrAlrm_007 == 1) && (TempPos_007 == 1) && (TempDisable_007 == 0)) || (TempDisable_007 == 1) ) || (( (HwErrAlrm_008 == 1) && (TempPos_008 == 0) && (TempDisable_008 == 0)) || (TempDisable_008 == 1) ) || (( (HwErrAlrm_008 == 1) && (TempPos_008 == 1) && (TempDisable_008 == 0)) || (TempDisable_008 == 1) ) || (( (HwErrAlrm_009 == 1) && (TempPos_009 == 0) && (TempDisable_009 == 0)) || (TempDisable_009 == 1) ) || (( (HwErrAlrm_009 == 1) && (TempPos_009 == 1) && (TempDisable_009 == 0)) || (TempDisable_009 == 1) ) || (( (HwErrAlrm_010 == 1) && (TempPos_010 == 0) && (TempDisable_010 == 0)) || (TempDisable_010 == 1) ) || (( (HwErrAlrm_010 == 1) && (TempPos_010 == 1) && (TempDisable_010 == 0)) || (TempDisable_010 == 1) ) || (( (HwErrAlrm_011 == 1) && (TempPos_011 == 0) && (TempDisable_011 == 0)) || (TempDisable_011 == 1) ) || (( (HwErrAlrm_011 == 1) && (TempPos_011 == 1) && (TempDisable_011 == 0)) || (TempDisable_011 == 1) ) || (( (HwErrAlrm_012 == 1) && (TempPos_012 == 0) && (TempDisable_012 == 0)) || (TempDisable_012 == 1) ) || (( (HwErrAlrm_012 == 1) && (TempPos_012 == 1) && (TempDisable_012 == 0)) || (TempDisable_012 == 1) ) || (( (HwErrAlrm_013 == 1) && (TempPos_013 == 0) && (TempDisable_013 == 0)) || (TempDisable_013 == 1) ) || (( (HwErrAlrm_013 == 1) && (TempPos_013 == 1) && (TempDisable_013 == 0)) || (TempDisable_013 == 1) ) || (( (HwErrAlrm_014 == 1) && (TempPos_014 == 0) && (TempDisable_014 == 0)) || (TempDisable_014 == 1) ) || (( (HwErrAlrm_014 == 1) && (TempPos_014 == 1) && (TempDisable_014 == 0)) || (TempDisable_014 == 1) ) || (( (HwErrAlrm_015 == 1) && (TempPos_015 == 0) && (TempDisable_015 == 0)) || (TempDisable_015 == 1) ) || (( (HwErrAlrm_015 == 1) && (TempPos_015 == 1) && (TempDisable_015 == 0)) || (TempDisable_015 == 1) ) || (( (HwErrAlrm_016 == 1) && (TempPos_016 == 0) && (TempDisable_016 == 0)) || (TempDisable_016 == 1) ) || (( (HwErrAlrm_016 == 1) && (TempPos_016 == 1) && (TempDisable_016 == 0)) || (TempDisable_016 == 1) ) || (( (HwErrAlrm_017 == 1) && (TempPos_017 == 0) && (TempDisable_017 == 0)) || (TempDisable_017 == 1) ) || (( (HwErrAlrm_017 == 1) && (TempPos_017 == 1) && (TempDisable_017 == 0)) || (TempDisable_017 == 1) ) || (( (HwErrAlrm_018 == 1) && (TempPos_018 == 0) && (TempDisable_018 == 0)) || (TempDisable_018 == 1) ) || (( (HwErrAlrm_018 == 1) && (TempPos_018 == 1) && (TempDisable_018 == 0)) || (TempDisable_018 == 1) ) || (( (HwErrAlrm_019 == 1) && (TempPos_019 == 0) && (TempDisable_019 == 0)) || (TempDisable_019 == 1) ) || (( (HwErrAlrm_019 == 1) && (TempPos_019 == 1) && (TempDisable_019 == 0)) || (TempDisable_019 == 1) ) || (( (HwErrAlrm_020 == 1) && (TempPos_020 == 0) && (TempDisable_020 == 0)) || (TempDisable_020 == 1) ) || (( (HwErrAlrm_020 == 1) && (TempPos_020 == 1) && (TempDisable_020 == 0)) || (TempDisable_020 == 1) ) || (( (HwErrAlrm_021 == 1) && (TempPos_021 == 1) && (TempDisable_021 == 0)) || (TempDisable_021 == 1) ) || (( (HwErrAlrm_021 == 1) && (TempPos_021 == 0) && (TempDisable_021 == 0)) || (TempDisable_021 == 1) ) || (( (HwErrAlrm_022 == 1) && (TempPos_022 == 0) && (TempDisable_022 == 0)) || (TempDisable_022 == 1) ) || (( (HwErrAlrm_022 == 1) && (TempPos_022 == 1) && (TempDisable_022 == 0)) || (TempDisable_022 == 1) ) || (( (HwErrAlrm_100 == 1) && (TempPos_100 == 0) && (TempDisable_100 == 0)) || (TempDisable_100 == 1) ) || (( (HwErrAlrm_100 == 1) && (TempPos_100 == 1) && (TempDisable_100 == 0)) || (TempDisable_100 == 1) ) || (( (HwErrAlrm_200 == 1) && (TempPos_200 == 0) && (TempDisable_200 == 0)) || (TempDisable_200 == 1) ) || (( (HwErrAlrm_200 == 1) && (TempPos_200 == 1) && (TempDisable_200 == 0)) || (TempDisable_200 == 1) ) ) {

      RfSlow_okstatus=0;
      pvPut(RfSlow_okstatus);
      printf("[SEQ TEMPERATURE  - TANK5] MINOR Error in hardware connection: possible broken sensor\n");
      printf("[SEQ TEMPERATURE  - TANK5] Set TANK 5 Temperature OK STATUS to 0: INTERLOCK \n");
		} state maintenance

    /* Sensor broken  */
		when ( (( (HwErrAlrm_001 == 1) && (HwUnderLimAlrm_001 == 1) && (HwOverLimAlrm_001 == 1)) || (TempDisable_001 == 1) ) || (( (HwErrAlrm_002 == 1) && (HwUnderLimAlrm_002 == 1) && (HwOverLimAlrm_002 == 1)) || (TempDisable_002 == 1) ) || (( (HwErrAlrm_003 == 1) && (HwUnderLimAlrm_003 == 1) && (HwOverLimAlrm_003 == 1)) || (TempDisable_003 == 1) ) || (( (HwErrAlrm_004 == 1) && (HwUnderLimAlrm_004 == 1) && (HwOverLimAlrm_004 == 1)) || (TempDisable_004 == 1) ) || (( (HwErrAlrm_005 == 1) && (HwUnderLimAlrm_005 == 1) && (HwOverLimAlrm_005 == 1)) || (TempDisable_005 == 1) ) || (( (HwErrAlrm_006 == 1) && (HwUnderLimAlrm_006 == 1) && (HwOverLimAlrm_006 == 1)) || (TempDisable_006 == 1) ) || (( (HwErrAlrm_007 == 1) && (HwUnderLimAlrm_007 == 1) && (HwOverLimAlrm_007 == 1)) || (TempDisable_007 == 1) ) || (( (HwErrAlrm_008 == 1) && (HwUnderLimAlrm_008 == 1) && (HwOverLimAlrm_008 == 1)) || (TempDisable_008 == 1) ) || (( (HwErrAlrm_009 == 1) && (HwUnderLimAlrm_009 == 1) && (HwOverLimAlrm_009 == 1)) || (TempDisable_009 == 1) ) || (( (HwErrAlrm_010 == 1) && (HwUnderLimAlrm_010 == 1) && (HwOverLimAlrm_010 == 1)) || (TempDisable_010 == 1) ) || (( (HwErrAlrm_011 == 1) && (HwUnderLimAlrm_011 == 1) && (HwOverLimAlrm_011 == 1)) || (TempDisable_011 == 1) ) || (( (HwErrAlrm_012 == 1) && (HwUnderLimAlrm_012 == 1) && (HwOverLimAlrm_012 == 1)) || (TempDisable_012 == 1) ) || (( (HwErrAlrm_013 == 1) && (HwUnderLimAlrm_013 == 1) && (HwOverLimAlrm_013 == 1)) || (TempDisable_013 == 1) ) || (( (HwErrAlrm_014 == 1) && (HwUnderLimAlrm_014 == 1) && (HwOverLimAlrm_014 == 1)) || (TempDisable_014 == 1) ) || (( (HwErrAlrm_015 == 1) && (HwUnderLimAlrm_015 == 1) && (HwOverLimAlrm_015 == 1)) || (TempDisable_015 == 1) ) || (( (HwErrAlrm_016 == 1) && (HwUnderLimAlrm_016 == 1) && (HwOverLimAlrm_016 == 1)) || (TempDisable_016 == 1) ) || (( (HwErrAlrm_017 == 1) && (HwUnderLimAlrm_017 == 1) && (HwOverLimAlrm_017 == 1)) || (TempDisable_017 == 1) ) || (( (HwErrAlrm_018 == 1) && (HwUnderLimAlrm_018 == 1) && (HwOverLimAlrm_018 == 1)) || (TempDisable_018 == 1) ) || (( (HwErrAlrm_019 == 1) && (HwUnderLimAlrm_019 == 1) && (HwOverLimAlrm_019 == 1)) || (TempDisable_019 == 1) ) || (( (HwErrAlrm_020 == 1) && (HwUnderLimAlrm_020 == 1) && (HwOverLimAlrm_020 == 1)) || (TempDisable_020 == 1) ) || (( (HwErrAlrm_021 == 1) && (HwUnderLimAlrm_021 == 1) && (HwOverLimAlrm_021 == 1)) || (TempDisable_021 == 1) ) || (( (HwErrAlrm_022 == 1) && (HwUnderLimAlrm_022 == 1) && (HwOverLimAlrm_022 == 1)) || (TempDisable_022 == 1) ) || (( (HwErrAlrm_100 == 1) && (HwUnderLimAlrm_100 == 1) && (HwOverLimAlrm_100 == 1)) || (TempDisable_100 == 1) ) || (( (HwErrAlrm_200 == 1) && (HwUnderLimAlrm_200 == 1) && (HwOverLimAlrm_200 == 1)) || (TempDisable_200 == 1) ) ) {

      RfSlow_okstatus=0;
      pvPut(RfSlow_okstatus);
      printf("[SEQ TEMPERATURE  - TANK5] MINOR Error in hardware connection: possible broken sensor\n");
      printf("[SEQ TEMPERATURE  - TANK5] Set TANK 5 Temperature OK STATUS to 0: INTERLOCK \n");
		} state failure

    /* No error in any temperature sensor enabled */
    when ( ( ((HwErrAlrm_001 == 0) && (TempIlk_001 == 0) && (TempDisable_001 == 0)) || (TempDisable_001 == 1) ) && (( (HwErrAlrm_002 == 0) && (TempIlk_002 == 0) && (TempDisable_002 == 0)) || (TempDisable_002 == 1) ) && (( (HwErrAlrm_003 == 0) && (TempIlk_003 == 0) && (TempDisable_003 == 0)) || (TempDisable_003 == 1) ) && (( (HwErrAlrm_004 == 0) && (TempIlk_004 == 0) && (TempDisable_004 == 0)) || (TempDisable_004 == 1) ) && (( (HwErrAlrm_005 == 0) && (TempIlk_005 == 0) && (TempDisable_005 == 0)) || (TempDisable_005 == 1) ) && (( (HwErrAlrm_006 == 0) && (TempIlk_006 == 0) && (TempDisable_006 == 0)) || (TempDisable_006 == 1) ) && (( (HwErrAlrm_007 == 0) && (TempIlk_007 == 0) && (TempDisable_007 == 0)) || (TempDisable_007 == 1) ) && (( (HwErrAlrm_008 == 0) && (TempIlk_008 == 0) && (TempDisable_008 == 0)) || (TempDisable_008 == 1) ) && (( (HwErrAlrm_009 == 0) && (TempIlk_009 == 0) && (TempDisable_009 == 0)) || (TempDisable_009 == 1) ) && (( (HwErrAlrm_010 == 0) && (TempIlk_010 == 0) && (TempDisable_010 == 0)) || (TempDisable_010 == 1) ) && (( (HwErrAlrm_011 == 0) && (TempIlk_011 == 0) && (TempDisable_011 == 0)) || (TempDisable_011 == 1) ) && (( (HwErrAlrm_012 == 0) && (TempIlk_012 == 0) && (TempDisable_012 == 0)) || (TempDisable_012 == 1) ) && (( (HwErrAlrm_013 == 0) && (TempIlk_013 == 0) && (TempDisable_013 == 0)) || (TempDisable_013 == 1) ) && (( (HwErrAlrm_014 == 0) && (TempIlk_014 == 0) && (TempDisable_014 == 0)) || (TempDisable_014 == 1) ) && (( (HwErrAlrm_015 == 0) && (TempIlk_015 == 0) && (TempDisable_015 == 0)) || (TempDisable_015 == 1) ) && (( (HwErrAlrm_016 == 0) && (TempIlk_016 == 0) && (TempDisable_016 == 0)) || (TempDisable_016 == 1) ) && (( (HwErrAlrm_017 == 0) && (TempIlk_017 == 0) && (TempDisable_017 == 0)) || (TempDisable_017 == 1) ) && (( (HwErrAlrm_018 == 0) && (TempIlk_018 == 0) && (TempDisable_018 == 0)) || (TempDisable_018 == 1) ) && (( (HwErrAlrm_019 == 0) && (TempIlk_019 == 0) && (TempDisable_019 == 0)) || (TempDisable_019 == 1) ) && (( (HwErrAlrm_020 == 0) && (TempIlk_020 == 0) && (TempDisable_020 == 0)) || (TempDisable_020 == 1) ) && (( (HwErrAlrm_021 == 0) && (TempIlk_021 == 0) && (TempDisable_021 == 0)) || (TempDisable_021 == 1) ) && (( (HwErrAlrm_022 == 0) && (TempIlk_022 == 0) && (TempDisable_022 == 0)) || (TempDisable_022 == 1) ) && (( (HwErrAlrm_100 == 0) && (TempIlk_100 == 0) && (TempDisable_100 == 0)) || (TempDisable_100 == 1) ) && (( (HwErrAlrm_200 == 0) && (TempIlk_200 == 0) && (TempDisable_200 == 0)) || (TempDisable_200 == 1) ) ) {

      printf("[SEQ TEMPERATURE  - TANK5] Sensors Check Passed\n");
		} state ready_for_operation

  }


/* state STARTUP	*/
/* state IDLE   	*/
/* state READY_FOR_OPERATION 	*/
state ready_for_operation {
  entry {
      printf("\n[SEQ TEMPERATURE  - TANK5] Enter in READY FOR OPERATION status\n");
      RfSlow_okstatus=1;
      pvPut(RfSlow_okstatus);
      printf("[SEQ TEMPERATURE  - TANK5] Set TANK 5 Temperature OK STATUS to 1: OK \n");
      StateMachineCode=40;
      pvPut(StateMachineCode);
  }

  /* Interlock status at self-check (with sensor enabled) */
  when ( ( (TempIlk_001 == 1) && (TempDisable_001 == 0) ) || ( (TempIlk_002 == 1) && (TempDisable_002 == 0) ) || ( (TempIlk_003 == 1) && (TempDisable_003 == 0) ) || ( (TempIlk_004 == 1) && (TempDisable_004 == 0) ) || ( (TempIlk_005 == 1) && (TempDisable_005 == 0) ) || ( (TempIlk_006 == 1) && (TempDisable_006 == 0) ) || ( (TempIlk_007 == 1) && (TempDisable_007 == 0) ) || ( (TempIlk_008 == 1) && (TempDisable_008 == 0) ) || ( (TempIlk_009 == 1) && (TempDisable_009 == 0) ) || ( (TempIlk_010 == 1) && (TempDisable_010 == 0) ) || ( (TempIlk_011 == 1) && (TempDisable_011 == 0) ) || ( (TempIlk_012 == 1) && (TempDisable_012 == 0) ) || ( (TempIlk_013 == 1) && (TempDisable_013 == 0) ) || ( (TempIlk_014 == 1) && (TempDisable_014 == 0) ) || ( (TempIlk_015 == 1) && (TempDisable_015 == 0) ) || ( (TempIlk_016 == 1) && (TempDisable_016 == 0) ) || ( (TempIlk_017 == 1) && (TempDisable_017 == 0) ) || ( (TempIlk_018 == 1) && (TempDisable_018 == 0) ) || ( (TempIlk_019 == 1) && (TempDisable_019 == 0) ) || ( (TempIlk_020 == 1) && (TempDisable_020 == 0) ) || ( (TempIlk_021 == 1) && (TempDisable_021 == 0) ) || ( (TempIlk_022 == 1) && (TempDisable_022 == 0) ) || ( (TempIlk_100 == 1) && (TempDisable_100 == 0) ) || ( (TempIlk_200 == 1) && (TempDisable_200 == 0) ) ) {

     RfSlow_okstatus=0;
     pvPut(RfSlow_okstatus);
     printf("[SEQ TEMPERATURE  - TANK5] Error in software interlock variable\n");
     printf("[SEQ TEMPERATURE  - TANK5] Set TANK 5 Temperature OK STATUS to 0: INTERLOCK \n");
  } state failure

  /* Sensor error if sensor is in PMQ [code 3] or BPM [code 2] position */
  when ( ( (HwErrAlrm_001 == 1) && (TempPos_001 == 2) ) || ( (HwErrAlrm_001 == 1) && (TempPos_001 == 3) ) || ( (HwErrAlrm_002 == 1) && (TempPos_002 == 2) ) || ( (HwErrAlrm_002 == 1) && (TempPos_002 == 3) ) || ( (HwErrAlrm_003 == 1) && (TempPos_003 == 2) ) || ( (HwErrAlrm_003 == 1) && (TempPos_003 == 3) ) ||( (HwErrAlrm_004 == 1) && (TempPos_004 == 2) ) || ( (HwErrAlrm_004 == 1) && (TempPos_004 == 3) ) ||( (HwErrAlrm_005 == 1) && (TempPos_005 == 2) ) || ( (HwErrAlrm_005 == 1) && (TempPos_005 == 3) ) || ( (HwErrAlrm_006 == 1) && (TempPos_006 == 2) ) || ( (HwErrAlrm_006 == 1) && (TempPos_006 == 3) ) || ( (HwErrAlrm_007 == 1) && (TempPos_007 == 2) ) || ( (HwErrAlrm_007 == 1) && (TempPos_007 == 3) ) || ( (HwErrAlrm_008 == 1) && (TempPos_008 == 2) ) || ( (HwErrAlrm_008 == 1) && (TempPos_008 == 3) ) || ( (HwErrAlrm_009 == 1) && (TempPos_009 == 2) ) || ( (HwErrAlrm_009 == 1) && (TempPos_009 == 3) ) || ( (HwErrAlrm_010 == 1) && (TempPos_010 == 2) ) || ( (HwErrAlrm_010 == 1) && (TempPos_010 == 3) ) || ( (HwErrAlrm_011 == 1) && (TempPos_011 == 2) ) || ( (HwErrAlrm_011 == 1) && (TempPos_011 == 3) ) || ( (HwErrAlrm_012 == 1) && (TempPos_012 == 2) ) || ( (HwErrAlrm_012 == 1) && (TempPos_012 == 3) ) || ( (HwErrAlrm_013 == 1) && (TempPos_013 == 2) ) || ( (HwErrAlrm_013 == 1) && (TempPos_013 == 3) ) ||( (HwErrAlrm_014 == 1) && (TempPos_014 == 2) ) || ( (HwErrAlrm_014 == 1) && (TempPos_014 == 3) ) ||( (HwErrAlrm_015 == 1) && (TempPos_015 == 2) ) || ( (HwErrAlrm_015 == 1) && (TempPos_015 == 3) ) || ( (HwErrAlrm_016 == 1) && (TempPos_016 == 2) ) || ( (HwErrAlrm_016 == 1) && (TempPos_016 == 3) ) || ( (HwErrAlrm_017 == 1) && (TempPos_017 == 2) ) || ( (HwErrAlrm_017 == 1) && (TempPos_017 == 3) ) || ( (HwErrAlrm_018 == 1) && (TempPos_018 == 2) ) || ( (HwErrAlrm_018 == 1) && (TempPos_018 == 3) ) || ( (HwErrAlrm_019 == 1) && (TempPos_019 == 2) ) || ( (HwErrAlrm_019 == 1) && (TempPos_019 == 3) ) || ( (HwErrAlrm_020 == 1) && (TempPos_020 == 2) ) || ( (HwErrAlrm_020 == 1) && (TempPos_020 == 3) ) || ( (HwErrAlrm_021 == 1) && (TempPos_021 == 2) ) || ( (HwErrAlrm_021 == 1) && (TempPos_021 == 3) ) || ( (HwErrAlrm_022 == 1) && (TempPos_022 == 2) ) || ( (HwErrAlrm_022 == 1) && (TempPos_022 == 3) ) || ( (HwErrAlrm_100 == 1) && (TempPos_100 == 2) ) || ( (HwErrAlrm_100 == 1) && (TempPos_100 == 3) ) || ( (HwErrAlrm_200 == 1) && (TempPos_200 == 2) ) || ( (HwErrAlrm_200 == 1) && (TempPos_200 == 3) ) ) {

    RfSlow_okstatus=0;
    pvPut(RfSlow_okstatus);
    printf("[SEQ TEMPERATURE  - TANK5] MAJOR Error in hardware connection: possible broken sensor\n");
    printf("[SEQ TEMPERATURE  - TANK5] Set TANK 5 Temperature OK STATUS to 0: INTERLOCK \n");
  } state failure

  /* Sensor error if sensor is in steerer [code 1] or empty [code 0] position */
  when ( ( (HwErrAlrm_001 == 1) && (TempPos_001 == 0) && (TempDisable_001 == 0) ) || ( (HwErrAlrm_001 == 1) && (TempPos_001 == 1) && (TempDisable_001 == 0) ) || ( (HwErrAlrm_002 == 1) && (TempPos_002 == 0) && (TempDisable_002 == 0) ) || ( (HwErrAlrm_002 == 1) && (TempPos_002 == 1) && (TempDisable_002 == 0) ) || ( (HwErrAlrm_003 == 1) && (TempPos_003 == 0) && (TempDisable_003 == 0) ) || ( (HwErrAlrm_003 == 1) && (TempPos_003 == 1) && (TempDisable_003 == 0) ) ||( (HwErrAlrm_004 == 1) && (TempPos_004 == 0) && (TempDisable_004 == 0) ) || ( (HwErrAlrm_004 == 1) && (TempPos_004 == 1) && (TempDisable_004 == 0) ) ||( (HwErrAlrm_005 == 1) && (TempPos_005 == 0) && (TempDisable_005 == 0) ) || ( (HwErrAlrm_005 == 1) && (TempPos_005 == 1) && (TempDisable_005 == 0) ) || ( (HwErrAlrm_006 == 1) && (TempPos_006 == 0) && (TempDisable_006 == 0) ) || ( (HwErrAlrm_006 == 1) && (TempPos_006 == 1) && (TempDisable_006 == 0) ) || ( (HwErrAlrm_007 == 1) && (TempPos_007 == 0) && (TempDisable_007 == 0) ) || ( (HwErrAlrm_007 == 1) && (TempPos_007 == 1) && (TempDisable_007 == 0) ) || ( (HwErrAlrm_008 == 1) && (TempPos_008 == 0) && (TempDisable_008 == 0) ) || ( (HwErrAlrm_008 == 1) && (TempPos_008 == 1) && (TempDisable_008 == 0) ) || ( (HwErrAlrm_009 == 1) && (TempPos_009 == 0) && (TempDisable_009 == 0) ) || ( (HwErrAlrm_009 == 1) && (TempPos_009 == 1) && (TempDisable_009 == 0) ) || ( (HwErrAlrm_010 == 1) && (TempPos_010 == 0) && (TempDisable_010 == 0) ) || ( (HwErrAlrm_010 == 1) && (TempPos_010 == 1) && (TempDisable_010 == 0) ) || ( (HwErrAlrm_011 == 1) && (TempPos_011 == 0) && (TempDisable_011 == 0) ) || ( (HwErrAlrm_011 == 1) && (TempPos_011 == 1) && (TempDisable_011 == 0) ) || ( (HwErrAlrm_012 == 1) && (TempPos_012 == 0) && (TempDisable_012 == 0) ) || ( (HwErrAlrm_012 == 1) && (TempPos_012 == 1) && (TempDisable_012 == 0) ) || ( (HwErrAlrm_013 == 1) && (TempPos_013 == 0) && (TempDisable_013 == 0) ) || ( (HwErrAlrm_013 == 1) && (TempPos_013 == 1) && (TempDisable_013 == 0) ) ||( (HwErrAlrm_014 == 1) && (TempPos_014 == 0) && (TempDisable_014 == 0) ) || ( (HwErrAlrm_014 == 1) && (TempPos_014 == 1) && (TempDisable_014 == 0) ) ||( (HwErrAlrm_015 == 1) && (TempPos_015 == 0) && (TempDisable_015 == 0) ) || ( (HwErrAlrm_015 == 1) && (TempPos_015 == 1) && (TempDisable_015 == 0) ) || ( (HwErrAlrm_016 == 1) && (TempPos_016 == 0) && (TempDisable_016 == 0) ) || ( (HwErrAlrm_016 == 1) && (TempPos_016 == 1) && (TempDisable_016 == 0) ) || ( (HwErrAlrm_017 == 1) && (TempPos_017 == 0) && (TempDisable_017 == 0) ) || ( (HwErrAlrm_017 == 1) && (TempPos_017 == 1) && (TempDisable_017 == 0) ) || ( (HwErrAlrm_018 == 1) && (TempPos_018 == 0) && (TempDisable_018 == 0) ) || ( (HwErrAlrm_018 == 1) && (TempPos_018 == 1) && (TempDisable_018 == 0) ) || ( (HwErrAlrm_019 == 1) && (TempPos_019 == 0) && (TempDisable_019 == 0) ) || ( (HwErrAlrm_019 == 1) && (TempPos_019 == 1) && (TempDisable_019 == 0) ) || ( (HwErrAlrm_020 == 1) && (TempPos_020 == 0) && (TempDisable_020 == 0) ) || ( (HwErrAlrm_020 == 1) && (TempPos_020 == 1) && (TempDisable_020 == 0) ) || ( (HwErrAlrm_021 == 1) && (TempPos_021 == 0) && (TempDisable_021 == 0) ) || ( (HwErrAlrm_021 == 1) && (TempPos_021 == 1) && (TempDisable_021 == 0) ) || ( (HwErrAlrm_022 == 1) && (TempPos_022 == 0) && (TempDisable_022 == 0) ) || ( (HwErrAlrm_022 == 1) && (TempPos_022 == 1) && (TempDisable_022 == 0) ) || ( (HwErrAlrm_100 == 1) && (TempPos_100 == 0) && (TempDisable_100 == 0) ) || ( (HwErrAlrm_100 == 1) && (TempPos_100 == 1) && (TempDisable_100 == 0) ) || ( (HwErrAlrm_200 == 1) && (TempPos_200 == 0) && (TempDisable_200 == 0) ) || ( (HwErrAlrm_200 == 1) && (TempPos_200 == 1) && (TempDisable_200 == 0) ) ) {

    RfSlow_okstatus=0;
    pvPut(RfSlow_okstatus);
    printf("[SEQ TEMPERATURE  - TANK5] MINOR Error in hardware connection: possible broken sensor\n");
    printf("[SEQ TEMPERATURE  - TANK5] Set TANK 5 Temperature OK STATUS to 0: INTERLOCK \n");
  } state maintenance

  /* Sensor broken  */
  when ( ( (HwErrAlrm_001 == 1) && (HwUnderLimAlrm_001 == 1) && (HwOverLimAlrm_001 == 1) ) || ( (HwErrAlrm_002 == 1) && (HwUnderLimAlrm_002 == 1) && (HwOverLimAlrm_002 == 1) ) || ( (HwErrAlrm_003 == 1) && (HwUnderLimAlrm_003 == 1) && (HwOverLimAlrm_003 == 1) ) || ( (HwErrAlrm_004 == 1) && (HwUnderLimAlrm_004 == 1) && (HwOverLimAlrm_004 == 1) ) || ( (HwErrAlrm_005 == 1) && (HwUnderLimAlrm_005 == 1) && (HwOverLimAlrm_005 == 1) ) || ( (HwErrAlrm_006 == 1) && (HwUnderLimAlrm_006 == 1) &&  (HwOverLimAlrm_006 == 1) ) || ( (HwErrAlrm_007 == 1) && (HwUnderLimAlrm_007 == 1) && (HwOverLimAlrm_007 == 1) ) || ( (HwErrAlrm_008 == 1) && (HwUnderLimAlrm_008 == 1) && (HwOverLimAlrm_008 == 1) ) || ( (HwErrAlrm_009 == 1) && (HwUnderLimAlrm_009 == 1) && (HwOverLimAlrm_009 == 1) ) || ( (HwErrAlrm_010 == 1) && (HwUnderLimAlrm_010 == 1) && (HwOverLimAlrm_010 == 1) ) || ( (HwErrAlrm_011 == 1) && (HwUnderLimAlrm_011 == 1) && (HwOverLimAlrm_011 == 1) ) || ( (HwErrAlrm_012 == 1) && (HwUnderLimAlrm_012 == 1) && (HwOverLimAlrm_012 == 1) ) || ( (HwErrAlrm_013 == 1) && (HwUnderLimAlrm_013 == 1) && (HwOverLimAlrm_013 == 1) ) || ( (HwErrAlrm_014 == 1) && (HwUnderLimAlrm_014 == 1) && (HwOverLimAlrm_014 == 1) ) || ( (HwErrAlrm_015 == 1) && (HwUnderLimAlrm_015 == 1) && (HwOverLimAlrm_015 == 1) ) || ( (HwErrAlrm_016 == 1) && (HwUnderLimAlrm_016 == 1) && (HwOverLimAlrm_016 == 1) ) || ( (HwErrAlrm_017 == 1) && (HwUnderLimAlrm_017 == 1) && (HwOverLimAlrm_017 == 1) ) || ( (HwErrAlrm_018 == 1) && (HwUnderLimAlrm_018 == 1) && (HwOverLimAlrm_018 == 1) ) || ( (HwErrAlrm_019 == 1) && (HwUnderLimAlrm_019 == 1) && (HwOverLimAlrm_019 == 1) ) || ( (HwErrAlrm_020 == 1) && (HwUnderLimAlrm_020 == 1) && (HwOverLimAlrm_020 == 1) ) || ( (HwErrAlrm_021 == 1) && (HwUnderLimAlrm_021 == 1) && (HwOverLimAlrm_021 == 1) ) || ( (HwErrAlrm_022 == 1) && (HwUnderLimAlrm_022 == 1) && (HwOverLimAlrm_022 == 1) ) || ( (HwErrAlrm_100 == 1) && (HwUnderLimAlrm_100 == 1) && (HwOverLimAlrm_100 == 1) ) || ( (HwErrAlrm_200 == 1) && (HwUnderLimAlrm_200 == 1) && (HwOverLimAlrm_200 == 1) ) ) {

    RfSlow_okstatus=0;
    pvPut(RfSlow_okstatus);
    printf("[SEQ TEMPERATURE  - TANK5] MINOR Error in hardware connection: possible broken sensor\n");
    printf("[SEQ TEMPERATURE  - TANK5] Set TANK 5 Temperature OK STATUS to 0: INTERLOCK \n");
  } state failure

}


/* state FAILURE	*/
  state failure {

    entry {
        printf("\n[SEQ TEMPERATURE  - TANK5] Enter in FAILURE status\n");
        StateMachineCode=50;
        pvPut(StateMachineCode);
    }

    /* No error in any temperature sensor enabled */
    when ( ( FaultReset == 1 ) && ( ((HwErrAlrm_001 == 0) && (TempIlk_001 == 0) && (TempDisable_001 == 0)) || (TempDisable_001 == 1) ) && ( ((HwErrAlrm_002 == 0) && (TempIlk_002 == 0) && (TempDisable_002 == 0)) || (TempDisable_002 == 1) ) && ( ((HwErrAlrm_003 == 0) && (TempIlk_003 == 0) && (TempDisable_003 == 0)) || (TempDisable_003 == 1) ) && ( ((HwErrAlrm_004 == 0) && (TempIlk_004 == 0) && (TempDisable_004 == 0)) || (TempDisable_004 == 1) ) && ( ((HwErrAlrm_005 == 0) && (TempIlk_005 == 0) && (TempDisable_005 == 0)) || (TempDisable_005 == 1) ) && ( ((HwErrAlrm_006 == 0) && (TempIlk_006 == 0) && (TempDisable_006 == 0)) || (TempDisable_006 == 1) ) && ( ((HwErrAlrm_007 == 0) && (TempIlk_007 == 0) && (TempDisable_007 == 0)) || (TempDisable_007 == 1) ) && ( ((HwErrAlrm_008 == 0) && (TempIlk_008 == 0) && (TempDisable_008 == 0)) || (TempDisable_008 == 1) ) && ( ((HwErrAlrm_009 == 0) && (TempIlk_009 == 0) && (TempDisable_009 == 0)) || (TempDisable_009 == 1) ) && ( ((HwErrAlrm_010 == 0) && (TempIlk_010 == 0) && (TempDisable_010 == 0)) || (TempDisable_010 == 1) ) && ( ((HwErrAlrm_011 == 0) && (TempIlk_011 == 0) && (TempDisable_011 == 0)) || (TempDisable_011 == 1) ) && ( ((HwErrAlrm_012 == 0) && (TempIlk_012 == 0) && (TempDisable_012 == 0)) || (TempDisable_012 == 1) ) && ( ((HwErrAlrm_013 == 0) && (TempIlk_013 == 0) && (TempDisable_013 == 0)) || (TempDisable_013 == 1) ) && ( ((HwErrAlrm_014 == 0) && (TempIlk_014 == 0) && (TempDisable_014 == 0)) || (TempDisable_014 == 1) ) && ( ((HwErrAlrm_015 == 0) && (TempIlk_015 == 0) && (TempDisable_015 == 0)) || (TempDisable_015 == 1) ) && ( ((HwErrAlrm_016 == 0) && (TempIlk_016 == 0) && (TempDisable_016 == 0)) || (TempDisable_016 == 1) ) && ( ((HwErrAlrm_017 == 0) && (TempIlk_017 == 0) && (TempDisable_017 == 0)) || (TempDisable_017 == 1) ) && ( ((HwErrAlrm_018 == 0) && (TempIlk_018 == 0) && (TempDisable_018 == 0)) || (TempDisable_018 == 1) ) && ( ((HwErrAlrm_019 == 0) && (TempIlk_019 == 0) && (TempDisable_019 == 0)) || (TempDisable_019 == 1) ) && ( ((HwErrAlrm_020 == 0) && (TempIlk_020 == 0) && (TempDisable_020 == 0)) || (TempDisable_020 == 1) ) && ( ((HwErrAlrm_021 == 0) && (TempIlk_021 == 0) && (TempDisable_021 == 0)) || (TempDisable_021 == 1) ) && ( ((HwErrAlrm_022 == 0) && (TempIlk_022 == 0) && (TempDisable_022 == 0)) || (TempDisable_022 == 1) ) && ( ((HwErrAlrm_100 == 0) && (TempIlk_100 == 0) && (TempDisable_100 == 0)) || (TempDisable_100 == 1) ) && ( ((HwErrAlrm_200 == 0) && (TempIlk_200 == 0) && (TempDisable_200 == 0)) || (TempDisable_200 == 1) ) ) {

        printf("[SEQ TEMPERATURE  - TANK5] Failure Stage reset by Operator. \n");
        printf("[SEQ TEMPERATURE  - TANK5] Reset conditions satisfied.\n");

				/* Reset FaultReset command */
        FaultReset=0;
        pvPut(FaultReset);

    } state maintenance

  }


/* state MAINTENANCE	*/
  state maintenance {

    entry {
        printf("\n[SEQ TEMPERATURE  - TANK5] Enter in MAINTENANCE status\n");
        StateMachineCode=60;
        pvPut(StateMachineCode);
    }

    /* No error in any temperature sensor enabled */
    when ( ( MaintenanceReset == 1 ) && ( ((HwErrAlrm_001 == 0) && (TempIlk_001 == 0) && (TempDisable_001 == 0)) || (TempDisable_001 == 1) ) && ( ((HwErrAlrm_002 == 0) && (TempIlk_002 == 0) && (TempDisable_002 == 0)) || (TempDisable_002 == 1) ) && ( ((HwErrAlrm_003 == 0) && (TempIlk_003 == 0) && (TempDisable_003 == 0)) || (TempDisable_003 == 1) ) && ( ((HwErrAlrm_004 == 0) && (TempIlk_004 == 0) && (TempDisable_004 == 0)) || (TempDisable_004 == 1) ) && ( ((HwErrAlrm_005 == 0) && (TempIlk_005 == 0) && (TempDisable_005 == 0)) || (TempDisable_005 == 1) ) && ( ((HwErrAlrm_006 == 0) && (TempIlk_006 == 0) && (TempDisable_006 == 0)) || (TempDisable_006 == 1) ) && ( ((HwErrAlrm_007 == 0) && (TempIlk_007 == 0) && (TempDisable_007 == 0)) || (TempDisable_007 == 1) ) && ( ((HwErrAlrm_008 == 0) && (TempIlk_008 == 0) && (TempDisable_008 == 0)) || (TempDisable_008 == 1) ) && ( ((HwErrAlrm_009 == 0) && (TempIlk_009 == 0) && (TempDisable_009 == 0)) || (TempDisable_009 == 1) ) && ( ((HwErrAlrm_010 == 0) && (TempIlk_010 == 0) && (TempDisable_010 == 0)) || (TempDisable_010 == 1) ) && ( ((HwErrAlrm_011 == 0) && (TempIlk_011 == 0) && (TempDisable_011 == 0)) || (TempDisable_011 == 1) ) && ( ((HwErrAlrm_012 == 0) && (TempIlk_012 == 0) && (TempDisable_012 == 0)) || (TempDisable_012 == 1) ) && ( ((HwErrAlrm_013 == 0) && (TempIlk_013 == 0) && (TempDisable_013 == 0)) || (TempDisable_013 == 1) ) && ( ((HwErrAlrm_014 == 0) && (TempIlk_014 == 0) && (TempDisable_014 == 0)) || (TempDisable_014 == 1) ) && ( ((HwErrAlrm_015 == 0) && (TempIlk_015 == 0) && (TempDisable_015 == 0)) || (TempDisable_015 == 1) ) && ( ((HwErrAlrm_016 == 0) && (TempIlk_016 == 0) && (TempDisable_016 == 0)) || (TempDisable_016 == 1) ) && ( ((HwErrAlrm_017 == 0) && (TempIlk_017 == 0) && (TempDisable_017 == 0)) || (TempDisable_017 == 1) ) && ( ((HwErrAlrm_018 == 0) && (TempIlk_018 == 0) && (TempDisable_018 == 0)) || (TempDisable_018 == 1) ) && ( ((HwErrAlrm_019 == 0) && (TempIlk_019 == 0) && (TempDisable_019 == 0)) || (TempDisable_019 == 1) ) && ( ((HwErrAlrm_020 == 0) && (TempIlk_020 == 0) && (TempDisable_020 == 0)) || (TempDisable_020 == 1) ) && ( ((HwErrAlrm_021 == 0) && (TempIlk_021 == 0) && (TempDisable_021 == 0)) || (TempDisable_021 == 1) ) && ( ((HwErrAlrm_022 == 0) && (TempIlk_022 == 0) && (TempDisable_022 == 0)) || (TempDisable_022 == 1) ) && ( ((HwErrAlrm_100 == 0) && (TempIlk_100 == 0) && (TempDisable_100 == 0)) || (TempDisable_100 == 1) ) && ( ((HwErrAlrm_200 == 0) && (TempIlk_200 == 0) && (TempDisable_200 == 0)) || (TempDisable_200 == 1) ) ) {

        printf("[SEQ TEMPERATURE  - TANK5] Maintenance Stage reset by Operator\n");
        printf("[SEQ TEMPERATURE  - TANK5] Starting TANK 5 State Machine re-initialization\n");

				/* Reset MaintenanceReset command */
        MaintenanceReset=0;
        pvPut(MaintenanceReset);

    } state initialization


  }


/* end statemachine */
}
