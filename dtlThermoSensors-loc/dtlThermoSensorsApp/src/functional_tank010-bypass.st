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

program functional_tank010

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
int TempIlk_023;
assign TempIlk_023 to "{SECTION_NAME}:EMR-TT-023:TempIlk";
monitor TempIlk_023;
int TempIlk_024;
assign TempIlk_024 to "{SECTION_NAME}:EMR-TT-024:TempIlk";
monitor TempIlk_024;
int TempIlk_025;
assign TempIlk_025 to "{SECTION_NAME}:EMR-TT-025:TempIlk";
monitor TempIlk_025;
int TempIlk_026;
assign TempIlk_026 to "{SECTION_NAME}:EMR-TT-026:TempIlk";
monitor TempIlk_026;
int TempIlk_027;
assign TempIlk_027 to "{SECTION_NAME}:EMR-TT-027:TempIlk";
monitor TempIlk_027;
int TempIlk_028;
assign TempIlk_028 to "{SECTION_NAME}:EMR-TT-028:TempIlk";
monitor TempIlk_028;
int TempIlk_029;
assign TempIlk_029 to "{SECTION_NAME}:EMR-TT-029:TempIlk";
monitor TempIlk_029;
int TempIlk_030;
assign TempIlk_030 to "{SECTION_NAME}:EMR-TT-030:TempIlk";
monitor TempIlk_030;
int TempIlk_031;
assign TempIlk_031 to "{SECTION_NAME}:EMR-TT-031:TempIlk";
monitor TempIlk_031;
int TempIlk_032;
assign TempIlk_032 to "{SECTION_NAME}:EMR-TT-032:TempIlk";
monitor TempIlk_032;
int TempIlk_033;
assign TempIlk_033 to "{SECTION_NAME}:EMR-TT-033:TempIlk";
monitor TempIlk_033;
int TempIlk_034;
assign TempIlk_034 to "{SECTION_NAME}:EMR-TT-034:TempIlk";
monitor TempIlk_034;
int TempIlk_035;
assign TempIlk_035 to "{SECTION_NAME}:EMR-TT-035:TempIlk";
monitor TempIlk_035;
int TempIlk_036;
assign TempIlk_036 to "{SECTION_NAME}:EMR-TT-036:TempIlk";
monitor TempIlk_036;
int TempIlk_037;
assign TempIlk_037 to "{SECTION_NAME}:EMR-TT-037:TempIlk";
monitor TempIlk_037;
int TempIlk_038;
assign TempIlk_038 to "{SECTION_NAME}:EMR-TT-038:TempIlk";
monitor TempIlk_038;
int TempIlk_039;
assign TempIlk_039 to "{SECTION_NAME}:EMR-TT-039:TempIlk";
monitor TempIlk_039;
int TempIlk_040;
assign TempIlk_040 to "{SECTION_NAME}:EMR-TT-040:TempIlk";
monitor TempIlk_040;
int TempIlk_041;
assign TempIlk_041 to "{SECTION_NAME}:EMR-TT-041:TempIlk";
monitor TempIlk_041;
int TempIlk_042;
assign TempIlk_042 to "{SECTION_NAME}:EMR-TT-042:TempIlk";
monitor TempIlk_042;
int TempIlk_043;
assign TempIlk_043 to "{SECTION_NAME}:EMR-TT-043:TempIlk";
monitor TempIlk_043;
int TempIlk_044;
assign TempIlk_044 to "{SECTION_NAME}:EMR-TT-044:TempIlk";
monitor TempIlk_044;
int TempIlk_045;
assign TempIlk_045  to "{SECTION_NAME}:EMR-TT-045:TempIlk";
monitor TempIlk_045;
int TempIlk_046;
assign TempIlk_046  to "{SECTION_NAME}:EMR-TT-046:TempIlk";
monitor TempIlk_046;
int TempIlk_047;
assign TempIlk_047 to "{SECTION_NAME}:EMR-TT-047:TempIlk";
monitor TempIlk_047;
int TempIlk_048;
assign TempIlk_048 to "{SECTION_NAME}:EMR-TT-048:TempIlk";
monitor TempIlk_048;
int TempIlk_049;
assign TempIlk_049 to "{SECTION_NAME}:EMR-TT-049:TempIlk";
monitor TempIlk_049;
int TempIlk_050;
assign TempIlk_050 to "{SECTION_NAME}:EMR-TT-050:TempIlk";
monitor TempIlk_050;
int TempIlk_051;
assign TempIlk_051 to "{SECTION_NAME}:EMR-TT-051:TempIlk";
monitor TempIlk_051;
int TempIlk_052;
assign TempIlk_052 to "{SECTION_NAME}:EMR-TT-052:TempIlk";
monitor TempIlk_052;
int TempIlk_053;
assign TempIlk_053 to "{SECTION_NAME}:EMR-TT-053:TempIlk";
monitor TempIlk_053;
int TempIlk_054;
assign TempIlk_054 to "{SECTION_NAME}:EMR-TT-054:TempIlk";
monitor TempIlk_054;
int TempIlk_055;
assign TempIlk_055 to "{SECTION_NAME}:EMR-TT-055:TempIlk";
monitor TempIlk_055;
int TempIlk_056;
assign TempIlk_056 to "{SECTION_NAME}:EMR-TT-056:TempIlk";
monitor TempIlk_056;
int TempIlk_057;
assign TempIlk_057 to "{SECTION_NAME}:EMR-TT-057:TempIlk";
monitor TempIlk_057;
int TempIlk_058;
assign TempIlk_058 to "{SECTION_NAME}:EMR-TT-058:TempIlk";
monitor TempIlk_058;
int TempIlk_059;
assign TempIlk_059 to "{SECTION_NAME}:EMR-TT-059:TempIlk";
monitor TempIlk_059;
int TempIlk_060;
assign TempIlk_060 to "{SECTION_NAME}:EMR-TT-060:TempIlk";
monitor TempIlk_060;
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
int TempDisable_023;
assign TempDisable_023 to "{SECTION_NAME}:EMR-TT-023:TempDis";
monitor TempDisable_023;
int TempDisable_024;
assign TempDisable_024 to "{SECTION_NAME}:EMR-TT-024:TempDis";
monitor TempDisable_024;
int TempDisable_025;
assign TempDisable_025 to "{SECTION_NAME}:EMR-TT-025:TempDis";
monitor TempDisable_025;
int TempDisable_026;
assign TempDisable_026 to "{SECTION_NAME}:EMR-TT-026:TempDis";
monitor TempDisable_026;
int TempDisable_027;
assign TempDisable_027 to "{SECTION_NAME}:EMR-TT-027:TempDis";
monitor TempDisable_027;
int TempDisable_028;
assign TempDisable_028 to "{SECTION_NAME}:EMR-TT-028:TempDis";
monitor TempDisable_028;
int TempDisable_029;
assign TempDisable_029 to "{SECTION_NAME}:EMR-TT-029:TempDis";
monitor TempDisable_029;
int TempDisable_030;
assign TempDisable_030 to "{SECTION_NAME}:EMR-TT-030:TempDis";
monitor TempDisable_030;
int TempDisable_031;
assign TempDisable_031 to "{SECTION_NAME}:EMR-TT-031:TempDis";
monitor TempDisable_031;
int TempDisable_032;
assign TempDisable_032 to "{SECTION_NAME}:EMR-TT-032:TempDis";
monitor TempDisable_032;
int TempDisable_033;
assign TempDisable_033 to "{SECTION_NAME}:EMR-TT-033:TempDis";
monitor TempDisable_033;
int TempDisable_034;
assign TempDisable_034 to "{SECTION_NAME}:EMR-TT-034:TempDis";
monitor TempDisable_034;
int TempDisable_035;
assign TempDisable_035 to "{SECTION_NAME}:EMR-TT-035:TempDis";
monitor TempDisable_035;
int TempDisable_036;
assign TempDisable_036 to "{SECTION_NAME}:EMR-TT-036:TempDis";
monitor TempDisable_036;
int TempDisable_037;
assign TempDisable_037 to "{SECTION_NAME}:EMR-TT-037:TempDis";
monitor TempDisable_037;
int TempDisable_038;
assign TempDisable_038 to "{SECTION_NAME}:EMR-TT-038:TempDis";
monitor TempDisable_038;
int TempDisable_039;
assign TempDisable_039 to "{SECTION_NAME}:EMR-TT-039:TempDis";
monitor TempDisable_039;
int TempDisable_040;
assign TempDisable_040 to "{SECTION_NAME}:EMR-TT-040:TempDis";
monitor TempDisable_040;
int TempDisable_041;
assign TempDisable_041 to "{SECTION_NAME}:EMR-TT-041:TempDis";
monitor TempDisable_041;
int TempDisable_042;
assign TempDisable_042 to "{SECTION_NAME}:EMR-TT-042:TempDis";
monitor TempDisable_042;
int TempDisable_043;
assign TempDisable_043 to "{SECTION_NAME}:EMR-TT-043:TempDis";
monitor TempDisable_043;
int TempDisable_044;
assign TempDisable_044 to "{SECTION_NAME}:EMR-TT-044:TempDis";
monitor TempDisable_044;
int TempDisable_045;
assign TempDisable_045  to "{SECTION_NAME}:EMR-TT-045:TempDis";
monitor TempDisable_045;
int TempDisable_046;
assign TempDisable_046  to "{SECTION_NAME}:EMR-TT-046:TempDis";
monitor TempDisable_046;
int TempDisable_047;
assign TempDisable_047 to "{SECTION_NAME}:EMR-TT-047:TempDis";
monitor TempDisable_047;
int TempDisable_048;
assign TempDisable_048 to "{SECTION_NAME}:EMR-TT-048:TempDis";
monitor TempDisable_048;
int TempDisable_049;
assign TempDisable_049 to "{SECTION_NAME}:EMR-TT-049:TempDis";
monitor TempDisable_049;
int TempDisable_050;
assign TempDisable_050 to "{SECTION_NAME}:EMR-TT-050:TempDis";
monitor TempDisable_050;
int TempDisable_051;
assign TempDisable_051 to "{SECTION_NAME}:EMR-TT-051:TempDis";
monitor TempDisable_051;
int TempDisable_052;
assign TempDisable_052 to "{SECTION_NAME}:EMR-TT-052:TempDis";
monitor TempDisable_052;
int TempDisable_053;
assign TempDisable_053 to "{SECTION_NAME}:EMR-TT-053:TempDis";
monitor TempDisable_053;
int TempDisable_054;
assign TempDisable_054 to "{SECTION_NAME}:EMR-TT-054:TempDis";
monitor TempDisable_054;
int TempDisable_055;
assign TempDisable_055 to "{SECTION_NAME}:EMR-TT-055:TempDis";
monitor TempDisable_055;
int TempDisable_056;
assign TempDisable_056 to "{SECTION_NAME}:EMR-TT-056:TempDis";
monitor TempDisable_056;
int TempDisable_057;
assign TempDisable_057 to "{SECTION_NAME}:EMR-TT-057:TempDis";
monitor TempDisable_057;
int TempDisable_058;
assign TempDisable_058 to "{SECTION_NAME}:EMR-TT-058:TempDis";
monitor TempDisable_058;
int TempDisable_059;
assign TempDisable_059 to "{SECTION_NAME}:EMR-TT-059:TempDis";
monitor TempDisable_059;
int TempDisable_060;
assign TempDisable_060 to "{SECTION_NAME}:EMR-TT-060:TempDis";
monitor TempDisable_060;
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
int TempPos_023;
assign TempPos_023 to "{SECTION_NAME}:EMR-TT-023:Temp-Pos";
monitor TempPos_023;
int TempPos_024;
assign TempPos_024 to "{SECTION_NAME}:EMR-TT-024:Temp-Pos";
monitor TempPos_024;
int TempPos_025;
assign TempPos_025 to "{SECTION_NAME}:EMR-TT-025:Temp-Pos";
monitor TempPos_025;
int TempPos_026;
assign TempPos_026 to "{SECTION_NAME}:EMR-TT-026:Temp-Pos";
monitor TempPos_026;
int TempPos_027;
assign TempPos_027 to "{SECTION_NAME}:EMR-TT-027:Temp-Pos";
monitor TempPos_027;
int TempPos_028;
assign TempPos_028 to "{SECTION_NAME}:EMR-TT-028:Temp-Pos";
monitor TempPos_028;
int TempPos_029;
assign TempPos_029 to "{SECTION_NAME}:EMR-TT-029:Temp-Pos";
monitor TempPos_029;
int TempPos_030;
assign TempPos_030 to "{SECTION_NAME}:EMR-TT-030:Temp-Pos";
monitor TempPos_030;
int TempPos_031;
assign TempPos_031 to "{SECTION_NAME}:EMR-TT-031:Temp-Pos";
monitor TempPos_031;
int TempPos_032;
assign TempPos_032 to "{SECTION_NAME}:EMR-TT-032:Temp-Pos";
monitor TempPos_032;
int TempPos_033;
assign TempPos_033 to "{SECTION_NAME}:EMR-TT-033:Temp-Pos";
monitor TempPos_033;
int TempPos_034;
assign TempPos_034 to "{SECTION_NAME}:EMR-TT-034:Temp-Pos";
monitor TempPos_034;
int TempPos_035;
assign TempPos_035 to "{SECTION_NAME}:EMR-TT-035:Temp-Pos";
monitor TempPos_035;
int TempPos_036;
assign TempPos_036 to "{SECTION_NAME}:EMR-TT-036:Temp-Pos";
monitor TempPos_036;
int TempPos_037;
assign TempPos_037 to "{SECTION_NAME}:EMR-TT-037:Temp-Pos";
monitor TempPos_037;
int TempPos_038;
assign TempPos_038 to "{SECTION_NAME}:EMR-TT-038:Temp-Pos";
monitor TempPos_038;
int TempPos_039;
assign TempPos_039 to "{SECTION_NAME}:EMR-TT-039:Temp-Pos";
monitor TempPos_039;
int TempPos_040;
assign TempPos_040 to "{SECTION_NAME}:EMR-TT-040:Temp-Pos";
monitor TempPos_040;
int TempPos_041;
assign TempPos_041 to "{SECTION_NAME}:EMR-TT-041:Temp-Pos";
monitor TempPos_041;
int TempPos_042;
assign TempPos_042 to "{SECTION_NAME}:EMR-TT-042:Temp-Pos";
monitor TempPos_042;
int TempPos_043;
assign TempPos_043 to "{SECTION_NAME}:EMR-TT-043:Temp-Pos";
monitor TempPos_043;
int TempPos_044;
assign TempPos_044 to "{SECTION_NAME}:EMR-TT-044:Temp-Pos";
monitor TempPos_044;
int TempPos_045;
assign TempPos_045  to "{SECTION_NAME}:EMR-TT-045:Temp-Pos";
monitor TempPos_045;
int TempPos_046;
assign TempPos_046  to "{SECTION_NAME}:EMR-TT-046:Temp-Pos";
monitor TempPos_046;
int TempPos_047;
assign TempPos_047 to "{SECTION_NAME}:EMR-TT-047:Temp-Pos";
monitor TempPos_047;
int TempPos_048;
assign TempPos_048 to "{SECTION_NAME}:EMR-TT-048:Temp-Pos";
monitor TempPos_048;
int TempPos_049;
assign TempPos_049 to "{SECTION_NAME}:EMR-TT-049:Temp-Pos";
monitor TempPos_049;
int TempPos_050;
assign TempPos_050 to "{SECTION_NAME}:EMR-TT-050:Temp-Pos";
monitor TempPos_050;
int TempPos_051;
assign TempPos_051 to "{SECTION_NAME}:EMR-TT-051:Temp-Pos";
monitor TempPos_051;
int TempPos_052;
assign TempPos_052 to "{SECTION_NAME}:EMR-TT-052:Temp-Pos";
monitor TempPos_052;
int TempPos_053;
assign TempPos_053 to "{SECTION_NAME}:EMR-TT-053:Temp-Pos";
monitor TempPos_053;
int TempPos_054;
assign TempPos_054 to "{SECTION_NAME}:EMR-TT-054:Temp-Pos";
monitor TempPos_054;
int TempPos_055;
assign TempPos_055 to "{SECTION_NAME}:EMR-TT-055:Temp-Pos";
monitor TempPos_055;
int TempPos_056;
assign TempPos_056 to "{SECTION_NAME}:EMR-TT-056:Temp-Pos";
monitor TempPos_056;
int TempPos_057;
assign TempPos_057 to "{SECTION_NAME}:EMR-TT-057:Temp-Pos";
monitor TempPos_057;
int TempPos_058;
assign TempPos_058 to "{SECTION_NAME}:EMR-TT-058:Temp-Pos";
monitor TempPos_058;
int TempPos_059;
assign TempPos_059 to "{SECTION_NAME}:EMR-TT-059:Temp-Pos";
monitor TempPos_059;
int TempPos_060;
assign TempPos_060 to "{SECTION_NAME}:EMR-TT-060:Temp-Pos";
monitor TempPos_060;
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
int HwErrAlrm_023;
assign HwErrAlrm_023 to "{SECTION_NAME}:EMR-TT-023:HwErrAlrm";
monitor HwErrAlrm_023;
int HwErrAlrm_024;
assign HwErrAlrm_024 to "{SECTION_NAME}:EMR-TT-024:HwErrAlrm";
monitor HwErrAlrm_024;
int HwErrAlrm_025;
assign HwErrAlrm_025 to "{SECTION_NAME}:EMR-TT-025:HwErrAlrm";
monitor HwErrAlrm_025;
int HwErrAlrm_026;
assign HwErrAlrm_026 to "{SECTION_NAME}:EMR-TT-026:HwErrAlrm";
monitor HwErrAlrm_026;
int HwErrAlrm_027;
assign HwErrAlrm_027 to "{SECTION_NAME}:EMR-TT-027:HwErrAlrm";
monitor HwErrAlrm_027;
int HwErrAlrm_028;
assign HwErrAlrm_028 to "{SECTION_NAME}:EMR-TT-028:HwErrAlrm";
monitor HwErrAlrm_028;
int HwErrAlrm_029;
assign HwErrAlrm_029 to "{SECTION_NAME}:EMR-TT-029:HwErrAlrm";
monitor HwErrAlrm_029;
int HwErrAlrm_030;
assign HwErrAlrm_030 to "{SECTION_NAME}:EMR-TT-030:HwErrAlrm";
monitor HwErrAlrm_030;
int HwErrAlrm_031;
assign HwErrAlrm_031 to "{SECTION_NAME}:EMR-TT-031:HwErrAlrm";
monitor HwErrAlrm_031;
int HwErrAlrm_032;
assign HwErrAlrm_032 to "{SECTION_NAME}:EMR-TT-032:HwErrAlrm";
monitor HwErrAlrm_032;
int HwErrAlrm_033;
assign HwErrAlrm_033 to "{SECTION_NAME}:EMR-TT-033:HwErrAlrm";
monitor HwErrAlrm_033;
int HwErrAlrm_034;
assign HwErrAlrm_034 to "{SECTION_NAME}:EMR-TT-034:HwErrAlrm";
monitor HwErrAlrm_034;
int HwErrAlrm_035;
assign HwErrAlrm_035 to "{SECTION_NAME}:EMR-TT-035:HwErrAlrm";
monitor HwErrAlrm_035;
int HwErrAlrm_036;
assign HwErrAlrm_036 to "{SECTION_NAME}:EMR-TT-036:HwErrAlrm";
monitor HwErrAlrm_036;
int HwErrAlrm_037;
assign HwErrAlrm_037 to "{SECTION_NAME}:EMR-TT-037:HwErrAlrm";
monitor HwErrAlrm_037;
int HwErrAlrm_038;
assign HwErrAlrm_038 to "{SECTION_NAME}:EMR-TT-038:HwErrAlrm";
monitor HwErrAlrm_038;
int HwErrAlrm_039;
assign HwErrAlrm_039 to "{SECTION_NAME}:EMR-TT-039:HwErrAlrm";
monitor HwErrAlrm_039;
int HwErrAlrm_040;
assign HwErrAlrm_040 to "{SECTION_NAME}:EMR-TT-040:HwErrAlrm";
monitor HwErrAlrm_040;
int HwErrAlrm_041;
assign HwErrAlrm_041 to "{SECTION_NAME}:EMR-TT-041:HwErrAlrm";
monitor HwErrAlrm_041;
int HwErrAlrm_042;
assign HwErrAlrm_042 to "{SECTION_NAME}:EMR-TT-042:HwErrAlrm";
monitor HwErrAlrm_042;
int HwErrAlrm_043;
assign HwErrAlrm_043 to "{SECTION_NAME}:EMR-TT-043:HwErrAlrm";
monitor HwErrAlrm_043;
int HwErrAlrm_044;
assign HwErrAlrm_044 to "{SECTION_NAME}:EMR-TT-044:HwErrAlrm";
monitor HwErrAlrm_044;
int HwErrAlrm_045;
assign HwErrAlrm_045  to "{SECTION_NAME}:EMR-TT-045:HwErrAlrm";
monitor HwErrAlrm_045;
int HwErrAlrm_046;
assign HwErrAlrm_046  to "{SECTION_NAME}:EMR-TT-046:HwErrAlrm";
monitor HwErrAlrm_046;
int HwErrAlrm_047;
assign HwErrAlrm_047 to "{SECTION_NAME}:EMR-TT-047:HwErrAlrm";
monitor HwErrAlrm_047;
int HwErrAlrm_048;
assign HwErrAlrm_048 to "{SECTION_NAME}:EMR-TT-048:HwErrAlrm";
monitor HwErrAlrm_048;
int HwErrAlrm_049;
assign HwErrAlrm_049 to "{SECTION_NAME}:EMR-TT-049:HwErrAlrm";
monitor HwErrAlrm_049;
int HwErrAlrm_050;
assign HwErrAlrm_050 to "{SECTION_NAME}:EMR-TT-050:HwErrAlrm";
monitor HwErrAlrm_050;
int HwErrAlrm_051;
assign HwErrAlrm_051 to "{SECTION_NAME}:EMR-TT-051:HwErrAlrm";
monitor HwErrAlrm_051;
int HwErrAlrm_052;
assign HwErrAlrm_052 to "{SECTION_NAME}:EMR-TT-052:HwErrAlrm";
monitor HwErrAlrm_052;
int HwErrAlrm_053;
assign HwErrAlrm_053 to "{SECTION_NAME}:EMR-TT-053:HwErrAlrm";
monitor HwErrAlrm_053;
int HwErrAlrm_054;
assign HwErrAlrm_054 to "{SECTION_NAME}:EMR-TT-054:HwErrAlrm";
monitor HwErrAlrm_054;
int HwErrAlrm_055;
assign HwErrAlrm_055 to "{SECTION_NAME}:EMR-TT-055:HwErrAlrm";
monitor HwErrAlrm_055;
int HwErrAlrm_056;
assign HwErrAlrm_056 to "{SECTION_NAME}:EMR-TT-056:HwErrAlrm";
monitor HwErrAlrm_056;
int HwErrAlrm_057;
assign HwErrAlrm_057 to "{SECTION_NAME}:EMR-TT-057:HwErrAlrm";
monitor HwErrAlrm_057;
int HwErrAlrm_058;
assign HwErrAlrm_058 to "{SECTION_NAME}:EMR-TT-058:HwErrAlrm";
monitor HwErrAlrm_058;
int HwErrAlrm_059;
assign HwErrAlrm_059 to "{SECTION_NAME}:EMR-TT-059:HwErrAlrm";
monitor HwErrAlrm_059;
int HwErrAlrm_060;
assign HwErrAlrm_060 to "{SECTION_NAME}:EMR-TT-060:HwErrAlrm";
monitor HwErrAlrm_060;
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
int HwOverLimAlrm_023;
assign HwOverLimAlrm_023 to "{SECTION_NAME}:EMR-TT-023:HwOverLimAlrm";
monitor HwOverLimAlrm_023;
int HwOverLimAlrm_024;
assign HwOverLimAlrm_024 to "{SECTION_NAME}:EMR-TT-024:HwOverLimAlrm";
monitor HwOverLimAlrm_024;
int HwOverLimAlrm_025;
assign HwOverLimAlrm_025 to "{SECTION_NAME}:EMR-TT-025:HwOverLimAlrm";
monitor HwOverLimAlrm_025;
int HwOverLimAlrm_026;
assign HwOverLimAlrm_026 to "{SECTION_NAME}:EMR-TT-026:HwOverLimAlrm";
monitor HwOverLimAlrm_026;
int HwOverLimAlrm_027;
assign HwOverLimAlrm_027 to "{SECTION_NAME}:EMR-TT-027:HwOverLimAlrm";
monitor HwOverLimAlrm_027;
int HwOverLimAlrm_028;
assign HwOverLimAlrm_028 to "{SECTION_NAME}:EMR-TT-028:HwOverLimAlrm";
monitor HwOverLimAlrm_028;
int HwOverLimAlrm_029;
assign HwOverLimAlrm_029 to "{SECTION_NAME}:EMR-TT-029:HwOverLimAlrm";
monitor HwOverLimAlrm_029;
int HwOverLimAlrm_030;
assign HwOverLimAlrm_030 to "{SECTION_NAME}:EMR-TT-030:HwOverLimAlrm";
monitor HwOverLimAlrm_030;
int HwOverLimAlrm_031;
assign HwOverLimAlrm_031 to "{SECTION_NAME}:EMR-TT-031:HwOverLimAlrm";
monitor HwOverLimAlrm_031;
int HwOverLimAlrm_032;
assign HwOverLimAlrm_032 to "{SECTION_NAME}:EMR-TT-032:HwOverLimAlrm";
monitor HwOverLimAlrm_032;
int HwOverLimAlrm_033;
assign HwOverLimAlrm_033 to "{SECTION_NAME}:EMR-TT-033:HwOverLimAlrm";
monitor HwOverLimAlrm_033;
int HwOverLimAlrm_034;
assign HwOverLimAlrm_034 to "{SECTION_NAME}:EMR-TT-034:HwOverLimAlrm";
monitor HwOverLimAlrm_034;
int HwOverLimAlrm_035;
assign HwOverLimAlrm_035 to "{SECTION_NAME}:EMR-TT-035:HwOverLimAlrm";
monitor HwOverLimAlrm_035;
int HwOverLimAlrm_036;
assign HwOverLimAlrm_036 to "{SECTION_NAME}:EMR-TT-036:HwOverLimAlrm";
monitor HwOverLimAlrm_036;
int HwOverLimAlrm_037;
assign HwOverLimAlrm_037 to "{SECTION_NAME}:EMR-TT-037:HwOverLimAlrm";
monitor HwOverLimAlrm_037;
int HwOverLimAlrm_038;
assign HwOverLimAlrm_038 to "{SECTION_NAME}:EMR-TT-038:HwOverLimAlrm";
monitor HwOverLimAlrm_038;
int HwOverLimAlrm_039;
assign HwOverLimAlrm_039 to "{SECTION_NAME}:EMR-TT-039:HwOverLimAlrm";
monitor HwOverLimAlrm_039;
int HwOverLimAlrm_040;
assign HwOverLimAlrm_040 to "{SECTION_NAME}:EMR-TT-040:HwOverLimAlrm";
monitor HwOverLimAlrm_040;
int HwOverLimAlrm_041;
assign HwOverLimAlrm_041 to "{SECTION_NAME}:EMR-TT-041:HwOverLimAlrm";
monitor HwOverLimAlrm_041;
int HwOverLimAlrm_042;
assign HwOverLimAlrm_042 to "{SECTION_NAME}:EMR-TT-042:HwOverLimAlrm";
monitor HwOverLimAlrm_042;
int HwOverLimAlrm_043;
assign HwOverLimAlrm_043 to "{SECTION_NAME}:EMR-TT-043:HwOverLimAlrm";
monitor HwOverLimAlrm_043;
int HwOverLimAlrm_044;
assign HwOverLimAlrm_044 to "{SECTION_NAME}:EMR-TT-044:HwOverLimAlrm";
monitor HwOverLimAlrm_044;
int HwOverLimAlrm_045;
assign HwOverLimAlrm_045  to "{SECTION_NAME}:EMR-TT-045:HwOverLimAlrm";
monitor HwOverLimAlrm_045;
int HwOverLimAlrm_046;
assign HwOverLimAlrm_046  to "{SECTION_NAME}:EMR-TT-046:HwOverLimAlrm";
monitor HwOverLimAlrm_046;
int HwOverLimAlrm_047;
assign HwOverLimAlrm_047 to "{SECTION_NAME}:EMR-TT-047:HwOverLimAlrm";
monitor HwOverLimAlrm_047;
int HwOverLimAlrm_048;
assign HwOverLimAlrm_048 to "{SECTION_NAME}:EMR-TT-048:HwOverLimAlrm";
monitor HwOverLimAlrm_048;
int HwOverLimAlrm_049;
assign HwOverLimAlrm_049 to "{SECTION_NAME}:EMR-TT-049:HwOverLimAlrm";
monitor HwOverLimAlrm_049;
int HwOverLimAlrm_050;
assign HwOverLimAlrm_050 to "{SECTION_NAME}:EMR-TT-050:HwOverLimAlrm";
monitor HwOverLimAlrm_050;
int HwOverLimAlrm_051;
assign HwOverLimAlrm_051 to "{SECTION_NAME}:EMR-TT-051:HwOverLimAlrm";
monitor HwOverLimAlrm_051;
int HwOverLimAlrm_052;
assign HwOverLimAlrm_052 to "{SECTION_NAME}:EMR-TT-052:HwOverLimAlrm";
monitor HwOverLimAlrm_052;
int HwOverLimAlrm_053;
assign HwOverLimAlrm_053 to "{SECTION_NAME}:EMR-TT-053:HwOverLimAlrm";
monitor HwOverLimAlrm_053;
int HwOverLimAlrm_054;
assign HwOverLimAlrm_054 to "{SECTION_NAME}:EMR-TT-054:HwOverLimAlrm";
monitor HwOverLimAlrm_054;
int HwOverLimAlrm_055;
assign HwOverLimAlrm_055 to "{SECTION_NAME}:EMR-TT-055:HwOverLimAlrm";
monitor HwOverLimAlrm_055;
int HwOverLimAlrm_056;
assign HwOverLimAlrm_056 to "{SECTION_NAME}:EMR-TT-056:HwOverLimAlrm";
monitor HwOverLimAlrm_056;
int HwOverLimAlrm_057;
assign HwOverLimAlrm_057 to "{SECTION_NAME}:EMR-TT-057:HwOverLimAlrm";
monitor HwOverLimAlrm_057;
int HwOverLimAlrm_058;
assign HwOverLimAlrm_058 to "{SECTION_NAME}:EMR-TT-058:HwOverLimAlrm";
monitor HwOverLimAlrm_058;
int HwOverLimAlrm_059;
assign HwOverLimAlrm_059 to "{SECTION_NAME}:EMR-TT-059:HwOverLimAlrm";
monitor HwOverLimAlrm_059;
int HwOverLimAlrm_060;
assign HwOverLimAlrm_060 to "{SECTION_NAME}:EMR-TT-060:HwOverLimAlrm";
monitor HwOverLimAlrm_060;
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
int HwUnderLimAlrm_023;
assign HwUnderLimAlrm_023 to "{SECTION_NAME}:EMR-TT-023:HwUnderLimAlrm";
monitor HwUnderLimAlrm_023;
int HwUnderLimAlrm_024;
assign HwUnderLimAlrm_024 to "{SECTION_NAME}:EMR-TT-024:HwUnderLimAlrm";
monitor HwUnderLimAlrm_024;
int HwUnderLimAlrm_025;
assign HwUnderLimAlrm_025 to "{SECTION_NAME}:EMR-TT-025:HwUnderLimAlrm";
monitor HwUnderLimAlrm_025;
int HwUnderLimAlrm_026;
assign HwUnderLimAlrm_026 to "{SECTION_NAME}:EMR-TT-026:HwUnderLimAlrm";
monitor HwUnderLimAlrm_026;
int HwUnderLimAlrm_027;
assign HwUnderLimAlrm_027 to "{SECTION_NAME}:EMR-TT-027:HwUnderLimAlrm";
monitor HwUnderLimAlrm_027;
int HwUnderLimAlrm_028;
assign HwUnderLimAlrm_028 to "{SECTION_NAME}:EMR-TT-028:HwUnderLimAlrm";
monitor HwUnderLimAlrm_028;
int HwUnderLimAlrm_029;
assign HwUnderLimAlrm_029 to "{SECTION_NAME}:EMR-TT-029:HwUnderLimAlrm";
monitor HwUnderLimAlrm_029;
int HwUnderLimAlrm_030;
assign HwUnderLimAlrm_030 to "{SECTION_NAME}:EMR-TT-030:HwUnderLimAlrm";
monitor HwUnderLimAlrm_030;
int HwUnderLimAlrm_031;
assign HwUnderLimAlrm_031 to "{SECTION_NAME}:EMR-TT-031:HwUnderLimAlrm";
monitor HwUnderLimAlrm_031;
int HwUnderLimAlrm_032;
assign HwUnderLimAlrm_032 to "{SECTION_NAME}:EMR-TT-032:HwUnderLimAlrm";
monitor HwUnderLimAlrm_032;
int HwUnderLimAlrm_033;
assign HwUnderLimAlrm_033 to "{SECTION_NAME}:EMR-TT-033:HwUnderLimAlrm";
monitor HwUnderLimAlrm_033;
int HwUnderLimAlrm_034;
assign HwUnderLimAlrm_034 to "{SECTION_NAME}:EMR-TT-034:HwUnderLimAlrm";
monitor HwUnderLimAlrm_034;
int HwUnderLimAlrm_035;
assign HwUnderLimAlrm_035 to "{SECTION_NAME}:EMR-TT-035:HwUnderLimAlrm";
monitor HwUnderLimAlrm_035;
int HwUnderLimAlrm_036;
assign HwUnderLimAlrm_036 to "{SECTION_NAME}:EMR-TT-036:HwUnderLimAlrm";
monitor HwUnderLimAlrm_036;
int HwUnderLimAlrm_037;
assign HwUnderLimAlrm_037 to "{SECTION_NAME}:EMR-TT-037:HwUnderLimAlrm";
monitor HwUnderLimAlrm_037;
int HwUnderLimAlrm_038;
assign HwUnderLimAlrm_038 to "{SECTION_NAME}:EMR-TT-038:HwUnderLimAlrm";
monitor HwUnderLimAlrm_038;
int HwUnderLimAlrm_039;
assign HwUnderLimAlrm_039 to "{SECTION_NAME}:EMR-TT-039:HwUnderLimAlrm";
monitor HwUnderLimAlrm_039;
int HwUnderLimAlrm_040;
assign HwUnderLimAlrm_040 to "{SECTION_NAME}:EMR-TT-040:HwUnderLimAlrm";
monitor HwUnderLimAlrm_040;
int HwUnderLimAlrm_041;
assign HwUnderLimAlrm_041 to "{SECTION_NAME}:EMR-TT-041:HwUnderLimAlrm";
monitor HwUnderLimAlrm_041;
int HwUnderLimAlrm_042;
assign HwUnderLimAlrm_042 to "{SECTION_NAME}:EMR-TT-042:HwUnderLimAlrm";
monitor HwUnderLimAlrm_042;
int HwUnderLimAlrm_043;
assign HwUnderLimAlrm_043 to "{SECTION_NAME}:EMR-TT-043:HwUnderLimAlrm";
monitor HwUnderLimAlrm_043;
int HwUnderLimAlrm_044;
assign HwUnderLimAlrm_044 to "{SECTION_NAME}:EMR-TT-044:HwUnderLimAlrm";
monitor HwUnderLimAlrm_044;
int HwUnderLimAlrm_045;
assign HwUnderLimAlrm_045  to "{SECTION_NAME}:EMR-TT-045:HwUnderLimAlrm";
monitor HwUnderLimAlrm_045;
int HwUnderLimAlrm_046;
assign HwUnderLimAlrm_046  to "{SECTION_NAME}:EMR-TT-046:HwUnderLimAlrm";
monitor HwUnderLimAlrm_046;
int HwUnderLimAlrm_047;
assign HwUnderLimAlrm_047 to "{SECTION_NAME}:EMR-TT-047:HwUnderLimAlrm";
monitor HwUnderLimAlrm_047;
int HwUnderLimAlrm_048;
assign HwUnderLimAlrm_048 to "{SECTION_NAME}:EMR-TT-048:HwUnderLimAlrm";
monitor HwUnderLimAlrm_048;
int HwUnderLimAlrm_049;
assign HwUnderLimAlrm_049 to "{SECTION_NAME}:EMR-TT-049:HwUnderLimAlrm";
monitor HwUnderLimAlrm_049;
int HwUnderLimAlrm_050;
assign HwUnderLimAlrm_050 to "{SECTION_NAME}:EMR-TT-050:HwUnderLimAlrm";
monitor HwUnderLimAlrm_050;
int HwUnderLimAlrm_051;
assign HwUnderLimAlrm_051 to "{SECTION_NAME}:EMR-TT-051:HwUnderLimAlrm";
monitor HwUnderLimAlrm_051;
int HwUnderLimAlrm_052;
assign HwUnderLimAlrm_052 to "{SECTION_NAME}:EMR-TT-052:HwUnderLimAlrm";
monitor HwUnderLimAlrm_052;
int HwUnderLimAlrm_053;
assign HwUnderLimAlrm_053 to "{SECTION_NAME}:EMR-TT-053:HwUnderLimAlrm";
monitor HwUnderLimAlrm_053;
int HwUnderLimAlrm_054;
assign HwUnderLimAlrm_054 to "{SECTION_NAME}:EMR-TT-054:HwUnderLimAlrm";
monitor HwUnderLimAlrm_054;
int HwUnderLimAlrm_055;
assign HwUnderLimAlrm_055 to "{SECTION_NAME}:EMR-TT-055:HwUnderLimAlrm";
monitor HwUnderLimAlrm_055;
int HwUnderLimAlrm_056;
assign HwUnderLimAlrm_056 to "{SECTION_NAME}:EMR-TT-056:HwUnderLimAlrm";
monitor HwUnderLimAlrm_056;
int HwUnderLimAlrm_057;
assign HwUnderLimAlrm_057 to "{SECTION_NAME}:EMR-TT-057:HwUnderLimAlrm";
monitor HwUnderLimAlrm_057;
int HwUnderLimAlrm_058;
assign HwUnderLimAlrm_058 to "{SECTION_NAME}:EMR-TT-058:HwUnderLimAlrm";
monitor HwUnderLimAlrm_058;
int HwUnderLimAlrm_059;
assign HwUnderLimAlrm_059 to "{SECTION_NAME}:EMR-TT-059:HwUnderLimAlrm";
monitor HwUnderLimAlrm_059;
int HwUnderLimAlrm_060;
assign HwUnderLimAlrm_060 to "{SECTION_NAME}:EMR-TT-060:HwUnderLimAlrm";
monitor HwUnderLimAlrm_060;
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

ss temperature010_interlock {

/* state INITIALIZATION	*/
	state initialization {
      entry {
        printf("\n\nPreliminary controls executed due to Application Startup - Intialization\n\n");
        StateMachineCode=0;
        pvPut(StateMachineCode);
      }

      when (pvConnectCount()==pvAssignCount()) {
        printf("[SEQ TEMPERATURE  - TANK1] All PVs connected\n");
        printf("[SEQ TEMPERATURE  - TANK1] Starting Self Check Process\n");
        //RfSlow_okstatus=1;
        //pvPut(RfSlow_okstatus);
      } state self_check
	}


/* state SELF_CHECK	*/
	state self_check {
    entry {
        printf("\n[SEQ TEMPERATURE  - TANK1] Enter in SELF CHECK status\n");
        StateMachineCode=10;
        pvPut(StateMachineCode);
    }

    /* Interlock status at self-check (with sensor enabled) */
    when ( ( ((TempIlk_001 == 1) && (TempDisable_001 == 0)) || (TempDisable_001 == 1) ) || ( ((TempIlk_002 == 1) && (TempDisable_002 == 0)) || (TempDisable_002 == 1) ) || ( ((TempIlk_003 == 1) && (TempDisable_003 == 0)) || (TempDisable_003 == 1) ) || ( ((TempIlk_004 == 1) && (TempDisable_004 == 0)) || (TempDisable_004 == 1) ) || ( ((TempIlk_005 == 1) && (TempDisable_005 == 0)) || (TempDisable_005 == 1) ) || ( ((TempIlk_006 == 1) && (TempDisable_006 == 0)) || (TempDisable_006 == 1) ) || ( ((TempIlk_007 == 1) && (TempDisable_007 == 0)) || (TempDisable_007 == 1) ) || ( ((TempIlk_008 == 1) && (TempDisable_008 == 0)) || (TempDisable_008 == 1) ) || ( ((TempIlk_009 == 1) && (TempDisable_009 == 0)) || (TempDisable_009 == 1) ) || ( ((TempIlk_010 == 1) && (TempDisable_010 == 0)) || (TempDisable_010 == 1) ) || ( ((TempIlk_011 == 1) && (TempDisable_011 == 0)) || (TempDisable_011 == 1) ) || ( ((TempIlk_012 == 1) && (TempDisable_012 == 0)) || (TempDisable_012 == 1) ) || ( ((TempIlk_013 == 1) && (TempDisable_013 == 0)) || (TempDisable_013 == 1) ) || ( ((TempIlk_014 == 1) && (TempDisable_014 == 0)) || (TempDisable_014 == 1) ) || ( ((TempIlk_015 == 1) && (TempDisable_015 == 0)) || (TempDisable_015 == 1) ) || ( ((TempIlk_016 == 1) && (TempDisable_016 == 0)) || (TempDisable_016 == 1) ) || ( ((TempIlk_017 == 1) && (TempDisable_017 == 0)) || (TempDisable_017 == 1) ) || ( ((TempIlk_018 == 1) && (TempDisable_018 == 0)) || (TempDisable_018 == 1) ) || ( ((TempIlk_019 == 1) && (TempDisable_019 == 0)) || (TempDisable_019 == 1) ) || ( ((TempIlk_020 == 1) && (TempDisable_020 == 0)) || (TempDisable_020 == 1) ) || ( ((TempIlk_021 == 1) && (TempDisable_021 == 0)) || (TempDisable_021 == 1) ) || ( ((TempIlk_022 == 1) && (TempDisable_022 == 0)) || (TempDisable_022 == 1) ) || ( ((TempIlk_023 == 1) && (TempDisable_023 == 0)) || (TempDisable_023 == 1) ) || ( ((TempIlk_024 == 1) && (TempDisable_024 == 0)) || (TempDisable_024 == 1) ) || ( ((TempIlk_025 == 1) && (TempDisable_025 == 0)) || (TempDisable_025 == 1) ) || ( ((TempIlk_026 == 1) && (TempDisable_026 == 0)) || (TempDisable_026 == 1) ) || ( ((TempIlk_027 == 1) && (TempDisable_027 == 0)) || (TempDisable_027 == 1) ) || ( ((TempIlk_028 == 1) && (TempDisable_028 == 0)) || (TempDisable_028 == 1) ) || ( ((TempIlk_029 == 1) && (TempDisable_029 == 0)) || (TempDisable_029 == 1) ) || ( ((TempIlk_030 == 1) && (TempDisable_030 == 0)) || (TempDisable_030 == 1) ) || ( ((TempIlk_031 == 1) && (TempDisable_031 == 0)) || (TempDisable_031 == 1) ) || ( ((TempIlk_032 == 1) && (TempDisable_032 == 0)) || (TempDisable_032 == 1) ) || ( ((TempIlk_033 == 1) && (TempDisable_033 == 0)) || (TempDisable_033 == 1) ) || ( ((TempIlk_034 == 1) && (TempDisable_034 == 0)) || (TempDisable_034 == 1) ) || ( ((TempIlk_035 == 1) && (TempDisable_035 == 0)) || (TempDisable_035 == 1) ) || ( ((TempIlk_036 == 1) && (TempDisable_036 == 0)) || (TempDisable_036 == 1) ) || ( ((TempIlk_037 == 1) && (TempDisable_037 == 0)) || (TempDisable_037 == 1) ) || ( ((TempIlk_038 == 1) && (TempDisable_038 == 0)) || (TempDisable_038 == 1) ) || ( ((TempIlk_039 == 1) && (TempDisable_039 == 0)) || (TempDisable_039 == 1) ) || ( ((TempIlk_040 == 1) && (TempDisable_040 == 0)) || (TempDisable_040 == 1) ) || ( ((TempIlk_041 == 1) && (TempDisable_041 == 0)) || (TempDisable_041 == 1) ) || ( ((TempIlk_042 == 1) && (TempDisable_042 == 0)) || (TempDisable_042 == 1) ) || ( ((TempIlk_043 == 1) && (TempDisable_043 == 0)) || (TempDisable_043 == 1) ) || ( ((TempIlk_044 == 1) && (TempDisable_044 == 0)) || (TempDisable_044 == 1) ) || ( ((TempIlk_045 == 1) && (TempDisable_045 == 0)) || (TempDisable_045 == 1) ) || ( ((TempIlk_046 == 1) && (TempDisable_046 == 0)) || (TempDisable_046 == 1) ) || ( ((TempIlk_047 == 1) && (TempDisable_047 == 0)) || (TempDisable_047 == 1) ) || ( ((TempIlk_048 == 1) && (TempDisable_048 == 0)) || (TempDisable_048 == 1) ) || ( ((TempIlk_049 == 1) && (TempDisable_049 == 0)) || (TempDisable_049 == 1) ) || ( ((TempIlk_050 == 1) && (TempDisable_050 == 0)) || (TempDisable_050 == 1) ) || ( ((TempIlk_051 == 1) && (TempDisable_051 == 0)) || (TempDisable_051 == 1) ) || ( ((TempIlk_052 == 1) && (TempDisable_052 == 0)) || (TempDisable_052 == 1) ) || ( ((TempIlk_053 == 1) && (TempDisable_053 == 0)) || (TempDisable_053 == 1) ) || ( ((TempIlk_054 == 1) && (TempDisable_054 == 0)) || (TempDisable_054 == 1) ) || ( ((TempIlk_055 == 1) && (TempDisable_055 == 0)) || (TempDisable_055 == 1) ) || ( ((TempIlk_056 == 1) && (TempDisable_056 == 0)) || (TempDisable_056 == 1) ) || ( ((TempIlk_057 == 1) && (TempDisable_057 == 0)) || (TempDisable_057 == 1) ) || ( ((TempIlk_058 == 1) && (TempDisable_058 == 0)) || (TempDisable_058 == 1) ) || ( ((TempIlk_059 == 1) && (TempDisable_059 == 0)) || (TempDisable_059 == 1) ) || ( ((TempIlk_060 == 1) && (TempDisable_060 == 0)) || (TempDisable_060 == 1) ) || ( ((TempIlk_100 == 1) && (TempDisable_100 == 0)) || (TempDisable_100 == 1) ) || ( ((TempIlk_200 == 1) && (TempDisable_200 == 0)) || (TempDisable_100 == 1) ) ) {

 		   RfSlow_okstatus=0;
	     pvPut(RfSlow_okstatus);
       printf("[SEQ TEMPERATURE  - TANK1] Error in software interlock variable\n");
		   printf("[SEQ TEMPERATURE  - TANK1] Set TANK 1 Temperature OK STATUS to 0: INTERLOCK \n");
		} state failure

    /* Sensor error if sensor is in PMQ [code 3] or BPM [code 2] position */
		when ( ( (HwErrAlrm_001 == 1) && (TempPos_001 == 2) ) || ( (HwErrAlrm_001 == 1) && (TempPos_001 == 3) ) || ( (HwErrAlrm_002 == 1) && (TempPos_002 == 2) ) || ( (HwErrAlrm_002 == 1) && (TempPos_002 == 3) ) || ( (HwErrAlrm_003 == 1) && (TempPos_003 == 2) ) || ( (HwErrAlrm_003 == 1) && (TempPos_003 == 3) ) ||( (HwErrAlrm_004 == 1) && (TempPos_004 == 2) ) || ( (HwErrAlrm_004 == 1) && (TempPos_004 == 3) ) ||( (HwErrAlrm_005 == 1) && (TempPos_005 == 2) ) || ( (HwErrAlrm_005 == 1) && (TempPos_005 == 3) ) || ( (HwErrAlrm_006 == 1) && (TempPos_006 == 2) ) || ( (HwErrAlrm_006 == 1) && (TempPos_006 == 3) ) || ( (HwErrAlrm_007 == 1) && (TempPos_007 == 2) ) || ( (HwErrAlrm_007 == 1) && (TempPos_007 == 3) ) || ( (HwErrAlrm_008 == 1) && (TempPos_008 == 2) ) || ( (HwErrAlrm_008 == 1) && (TempPos_008 == 3) ) || ( (HwErrAlrm_009 == 1) && (TempPos_009 == 2) ) || ( (HwErrAlrm_009 == 1) && (TempPos_009 == 3) ) || ( (HwErrAlrm_010 == 1) && (TempPos_010 == 2) ) || ( (HwErrAlrm_010 == 1) && (TempPos_010 == 3) ) || ( (HwErrAlrm_011 == 1) && (TempPos_011 == 2) ) || ( (HwErrAlrm_011 == 1) && (TempPos_011 == 3) ) || ( (HwErrAlrm_012 == 1) && (TempPos_012 == 2) ) || ( (HwErrAlrm_012 == 1) && (TempPos_012 == 3) ) || ( (HwErrAlrm_013 == 1) && (TempPos_013 == 2) ) || ( (HwErrAlrm_013 == 1) && (TempPos_013 == 3) ) ||( (HwErrAlrm_014 == 1) && (TempPos_014 == 2) ) || ( (HwErrAlrm_014 == 1) && (TempPos_014 == 3) ) ||( (HwErrAlrm_015 == 1) && (TempPos_015 == 2) ) || ( (HwErrAlrm_015 == 1) && (TempPos_015 == 3) ) || ( (HwErrAlrm_016 == 1) && (TempPos_016 == 2) ) || ( (HwErrAlrm_016 == 1) && (TempPos_016 == 3) ) || ( (HwErrAlrm_017 == 1) && (TempPos_017 == 2) ) || ( (HwErrAlrm_017 == 1) && (TempPos_017 == 3) ) || ( (HwErrAlrm_018 == 1) && (TempPos_018 == 2) ) || ( (HwErrAlrm_018 == 1) && (TempPos_018 == 3) ) || ( (HwErrAlrm_019 == 1) && (TempPos_019 == 2) ) || ( (HwErrAlrm_019 == 1) && (TempPos_019 == 3) ) || ( (HwErrAlrm_020 == 1) && (TempPos_020 == 2) ) || ( (HwErrAlrm_020 == 1) && (TempPos_020 == 3) ) || ( (HwErrAlrm_021 == 1) && (TempPos_021 == 2) ) || ( (HwErrAlrm_021 == 1) && (TempPos_021 == 3) ) || ( (HwErrAlrm_022 == 1) && (TempPos_022 == 2) ) || ( (HwErrAlrm_022 == 1) && (TempPos_022 == 3) ) || ( (HwErrAlrm_023 == 1) && (TempPos_023 == 2) ) || ( (HwErrAlrm_023 == 1) && (TempPos_023 == 3) ) ||( (HwErrAlrm_024 == 1) && (TempPos_024 == 2) ) || ( (HwErrAlrm_024 == 1) && (TempPos_024 == 3) ) ||( (HwErrAlrm_025 == 1) && (TempPos_025 == 2) ) || ( (HwErrAlrm_025 == 1) && (TempPos_025 == 3) ) || ( (HwErrAlrm_026 == 1) && (TempPos_026 == 2) ) || ( (HwErrAlrm_026 == 1) && (TempPos_026 == 3) ) || ( (HwErrAlrm_027 == 1) && (TempPos_027 == 2) ) || ( (HwErrAlrm_027 == 1) && (TempPos_027 == 3) ) || ( (HwErrAlrm_028 == 1) && (TempPos_028 == 2) ) || ( (HwErrAlrm_028 == 1) && (TempPos_028 == 3) ) || ( (HwErrAlrm_029 == 1) && (TempPos_029 == 2) ) || ( (HwErrAlrm_029 == 1) && (TempPos_029 == 3) ) || ( (HwErrAlrm_030 == 1) && (TempPos_030 == 2) ) || ( (HwErrAlrm_030 == 1) && (TempPos_030 == 3) ) || ( (HwErrAlrm_031 == 1) && (TempPos_031 == 2) ) || ( (HwErrAlrm_031 == 1) && (TempPos_031 == 3) ) || ( (HwErrAlrm_032 == 1) && (TempPos_032 == 2) ) || ( (HwErrAlrm_032 == 1) && (TempPos_032 == 3) ) || ( (HwErrAlrm_033 == 1) && (TempPos_033 == 2) ) || ( (HwErrAlrm_033 == 1) && (TempPos_033 == 3) ) ||( (HwErrAlrm_034 == 1) && (TempPos_034 == 2) ) || ( (HwErrAlrm_034 == 1) && (TempPos_034 == 3) ) ||( (HwErrAlrm_035 == 1) && (TempPos_035 == 2) ) || ( (HwErrAlrm_035 == 1) && (TempPos_035 == 3) ) || ( (HwErrAlrm_036 == 1) && (TempPos_036 == 2) ) || ( (HwErrAlrm_036 == 1) && (TempPos_036 == 3) ) || ( (HwErrAlrm_037 == 1) && (TempPos_037 == 2) ) || ( (HwErrAlrm_037 == 1) && (TempPos_037 == 3) ) || ( (HwErrAlrm_038 == 1) && (TempPos_038 == 2) ) || ( (HwErrAlrm_038 == 1) && (TempPos_038 == 3) ) || ( (HwErrAlrm_039 == 1) && (TempPos_039 == 2) ) || ( (HwErrAlrm_039 == 1) && (TempPos_039 == 3) ) || ( (HwErrAlrm_040 == 1) && (TempPos_040 == 2) ) || ( (HwErrAlrm_040 == 1) && (TempPos_040 == 3) ) || ( (HwErrAlrm_041 == 1) && (TempPos_041 == 2) ) || ( (HwErrAlrm_041 == 1) && (TempPos_041 == 3) ) || ( (HwErrAlrm_042 == 1) && (TempPos_042 == 2) ) || ( (HwErrAlrm_042 == 1) && (TempPos_042 == 3) ) || ( (HwErrAlrm_043 == 1) && (TempPos_043 == 2) ) || ( (HwErrAlrm_043 == 1) && (TempPos_043 == 3) ) ||( (HwErrAlrm_044 == 1) && (TempPos_044 == 2) ) || ( (HwErrAlrm_044 == 1) && (TempPos_044 == 3) ) ||( (HwErrAlrm_045 == 1) && (TempPos_045 == 2) ) || ( (HwErrAlrm_045 == 1) && (TempPos_045 == 3) ) || ( (HwErrAlrm_046 == 1) && (TempPos_046 == 2) ) || ( (HwErrAlrm_046 == 1) && (TempPos_046 == 3) ) || ( (HwErrAlrm_047 == 1) && (TempPos_047 == 2) ) || ( (HwErrAlrm_047 == 1) && (TempPos_047 == 3) ) || ( (HwErrAlrm_048 == 1) && (TempPos_048 == 2) ) || ( (HwErrAlrm_048 == 1) && (TempPos_048 == 3) ) || ( (HwErrAlrm_049 == 1) && (TempPos_049 == 2) ) || ( (HwErrAlrm_049 == 1) && (TempPos_049 == 3) ) || ( (HwErrAlrm_050 == 1) && (TempPos_050 == 2) ) || ( (HwErrAlrm_050 == 1) && (TempPos_050 == 3) ) || ( (HwErrAlrm_051 == 1) && (TempPos_051 == 2) ) || ( (HwErrAlrm_051 == 1) && (TempPos_051 == 3) ) || ( (HwErrAlrm_052 == 1) && (TempPos_052 == 2) ) || ( (HwErrAlrm_052 == 1) && (TempPos_052 == 3) ) || ( (HwErrAlrm_053 == 1) && (TempPos_053 == 2) ) || ( (HwErrAlrm_053 == 1) && (TempPos_053 == 3) ) ||( (HwErrAlrm_054 == 1) && (TempPos_054 == 2) ) || ( (HwErrAlrm_054 == 1) && (TempPos_054 == 3) ) ||( (HwErrAlrm_055 == 1) && (TempPos_055 == 2) ) || ( (HwErrAlrm_055 == 1) && (TempPos_055 == 3) ) || ( (HwErrAlrm_056 == 1) && (TempPos_056 == 2) ) || ( (HwErrAlrm_056 == 1) && (TempPos_056 == 3) ) || ( (HwErrAlrm_057 == 1) && (TempPos_057 == 2) ) || ( (HwErrAlrm_057 == 1) && (TempPos_057 == 3) ) || ( (HwErrAlrm_058 == 1) && (TempPos_058 == 2) ) || ( (HwErrAlrm_058 == 1) && (TempPos_058 == 3) ) || ( (HwErrAlrm_059 == 1) && (TempPos_059 == 2) ) || ( (HwErrAlrm_059 == 1) && (TempPos_059 == 3) ) || ( (HwErrAlrm_060 == 1) && (TempPos_060 == 2) ) || ( (HwErrAlrm_060 == 1) && (TempPos_060 == 3) ) || ( (HwErrAlrm_100 == 1) && (TempPos_100 == 2) ) || ( (HwErrAlrm_100 == 1) && (TempPos_100 == 3) ) || ( (HwErrAlrm_200 == 1) && (TempPos_200 == 2) ) || ( (HwErrAlrm_200 == 1) && (TempPos_200 == 3) ) ) {

      RfSlow_okstatus=0;
      pvPut(RfSlow_okstatus);
      printf("[SEQ TEMPERATURE  - TANK1] MAJOR Error in hardware connection: possible broken sensor\n");
      printf("[SEQ TEMPERATURE  - TANK1] Set TANK 1 Temperature OK STATUS to 0: INTERLOCK \n");
		} state failure

    /* Sensor error if sensor is in steerer [code 1] or empty [code 0] position */
		when ( (( (HwErrAlrm_001 == 1) && (TempPos_001 == 0) && (TempDisable_001 == 0)) || (TempDisable_001 == 1) ) || (( (HwErrAlrm_001 == 1) && (TempPos_001 == 1) && (TempDisable_001 == 0)) || (TempDisable_001 == 1) ) || (( (HwErrAlrm_002 == 1) && (TempPos_002 == 0) && (TempDisable_002 == 0)) || (TempDisable_002 == 1) ) || (( (HwErrAlrm_002 == 1) && (TempPos_002 == 1) && (TempDisable_002 == 0)) || (TempDisable_002 == 1) ) || (( (HwErrAlrm_003 == 1) && (TempPos_003 == 0) && (TempDisable_003 == 0)) || (TempDisable_003 == 1) ) || (( (HwErrAlrm_003 == 1) && (TempPos_003 == 1) && (TempDisable_003 == 0)) || (TempDisable_003 == 1) ) || (( (HwErrAlrm_004 == 1) && (TempPos_004 == 0) && (TempDisable_004 == 0)) || (TempDisable_004 == 1) ) || (( (HwErrAlrm_004 == 1) && (TempPos_004 == 1) && (TempDisable_004 == 0)) || (TempDisable_004 == 1) ) || (( (HwErrAlrm_005 == 1) && (TempPos_005 == 0) && (TempDisable_005 == 0)) || (TempDisable_005 == 1) ) || (( (HwErrAlrm_005 == 1) && (TempPos_005 == 1) && (TempDisable_005 == 0)) || (TempDisable_005 == 1) ) || (( (HwErrAlrm_006 == 1) && (TempPos_006 == 0) && (TempDisable_006 == 0)) || (TempDisable_006 == 1) ) || (( (HwErrAlrm_006 == 1) && (TempPos_006 == 1) && (TempDisable_006 == 0)) || (TempDisable_006 == 1) ) || (( (HwErrAlrm_007 == 1) && (TempPos_007 == 0) && (TempDisable_007 == 0)) || (TempDisable_007 == 1) ) || (( (HwErrAlrm_007 == 1) && (TempPos_007 == 1) && (TempDisable_007 == 0)) || (TempDisable_007 == 1) ) || (( (HwErrAlrm_008 == 1) && (TempPos_008 == 0) && (TempDisable_008 == 0)) || (TempDisable_008 == 1) ) || (( (HwErrAlrm_008 == 1) && (TempPos_008 == 1) && (TempDisable_008 == 0)) || (TempDisable_008 == 1) ) || (( (HwErrAlrm_009 == 1) && (TempPos_009 == 0) && (TempDisable_009 == 0)) || (TempDisable_009 == 1) ) || (( (HwErrAlrm_009 == 1) && (TempPos_009 == 1) && (TempDisable_009 == 0)) || (TempDisable_009 == 1) ) || (( (HwErrAlrm_010 == 1) && (TempPos_010 == 0) && (TempDisable_010 == 0)) || (TempDisable_010 == 1) ) || (( (HwErrAlrm_010 == 1) && (TempPos_010 == 1) && (TempDisable_010 == 0)) || (TempDisable_010 == 1) ) || (( (HwErrAlrm_011 == 1) && (TempPos_011 == 0) && (TempDisable_011 == 0)) || (TempDisable_011 == 1) ) || (( (HwErrAlrm_011 == 1) && (TempPos_011 == 1) && (TempDisable_011 == 0)) || (TempDisable_011 == 1) ) || (( (HwErrAlrm_012 == 1) && (TempPos_012 == 0) && (TempDisable_012 == 0)) || (TempDisable_012 == 1) ) || (( (HwErrAlrm_012 == 1) && (TempPos_012 == 1) && (TempDisable_012 == 0)) || (TempDisable_012 == 1) ) || (( (HwErrAlrm_013 == 1) && (TempPos_013 == 0) && (TempDisable_013 == 0)) || (TempDisable_013 == 1) ) || (( (HwErrAlrm_013 == 1) && (TempPos_013 == 1) && (TempDisable_013 == 0)) || (TempDisable_013 == 1) ) || (( (HwErrAlrm_014 == 1) && (TempPos_014 == 0) && (TempDisable_014 == 0)) || (TempDisable_014 == 1) ) || (( (HwErrAlrm_014 == 1) && (TempPos_014 == 1) && (TempDisable_014 == 0)) || (TempDisable_014 == 1) ) || (( (HwErrAlrm_015 == 1) && (TempPos_015 == 0) && (TempDisable_015 == 0)) || (TempDisable_015 == 1) ) || (( (HwErrAlrm_015 == 1) && (TempPos_015 == 1) && (TempDisable_015 == 0)) || (TempDisable_015 == 1) ) || (( (HwErrAlrm_016 == 1) && (TempPos_016 == 0) && (TempDisable_016 == 0)) || (TempDisable_016 == 1) ) || (( (HwErrAlrm_016 == 1) && (TempPos_016 == 1) && (TempDisable_016 == 0)) || (TempDisable_016 == 1) ) || (( (HwErrAlrm_017 == 1) && (TempPos_017 == 0) && (TempDisable_017 == 0)) || (TempDisable_017 == 1) ) || (( (HwErrAlrm_017 == 1) && (TempPos_017 == 1) && (TempDisable_017 == 0)) || (TempDisable_017 == 1) ) || (( (HwErrAlrm_018 == 1) && (TempPos_018 == 0) && (TempDisable_018 == 0)) || (TempDisable_018 == 1) ) || (( (HwErrAlrm_018 == 1) && (TempPos_018 == 1) && (TempDisable_018 == 0)) || (TempDisable_018 == 1) ) || (( (HwErrAlrm_019 == 1) && (TempPos_019 == 0) && (TempDisable_019 == 0)) || (TempDisable_019 == 1) ) || (( (HwErrAlrm_019 == 1) && (TempPos_019 == 1) && (TempDisable_019 == 0)) || (TempDisable_019 == 1) ) || (( (HwErrAlrm_020 == 1) && (TempPos_020 == 0) && (TempDisable_020 == 0)) || (TempDisable_020 == 1) ) || (( (HwErrAlrm_020 == 1) && (TempPos_020 == 1) && (TempDisable_020 == 0)) || (TempDisable_020 == 1) ) || (( (HwErrAlrm_021 == 1) && (TempPos_021 == 1) && (TempDisable_021 == 0)) || (TempDisable_021 == 1) ) || (( (HwErrAlrm_021 == 1) && (TempPos_021 == 0) && (TempDisable_021 == 0)) || (TempDisable_021 == 1) ) || (( (HwErrAlrm_022 == 1) && (TempPos_022 == 0) && (TempDisable_022 == 0)) || (TempDisable_022 == 1) ) || (( (HwErrAlrm_022 == 1) && (TempPos_022 == 1) && (TempDisable_022 == 0)) || (TempDisable_022 == 1) ) || ( ((HwErrAlrm_023 == 1) && (TempPos_023 == 0) && (TempDisable_023 == 0)) || (TempDisable_023 == 1) ) || ( ((HwErrAlrm_023 == 1) && (TempPos_023 == 1) && (TempDisable_023 == 0)) || (TempDisable_023 == 1) ) || ( ((HwErrAlrm_024 == 1) && (TempPos_024 == 0) && (TempDisable_024 == 0)) || (TempDisable_024 == 1) ) || ( ((HwErrAlrm_024 == 1) && (TempPos_024 == 1) && (TempDisable_024 == 0)) || (TempDisable_024 == 1) ) || ( ((HwErrAlrm_025 == 1) && (TempPos_025 == 0) && (TempDisable_025 == 0)) || (TempDisable_025 == 1) ) || ( ((HwErrAlrm_025 == 1) && (TempPos_025 == 1) && (TempDisable_025 == 0)) || (TempDisable_025 == 1) ) || ( ((HwErrAlrm_026 == 1) && (TempPos_026 == 0) && (TempDisable_026 == 0)) || (TempDisable_026 == 1) ) || ( ((HwErrAlrm_026 == 1) && (TempPos_026 == 1) && (TempDisable_026 == 0)) || (TempDisable_026 == 1) ) || ( ((HwErrAlrm_027 == 1) && (TempPos_027 == 0) && (TempDisable_027 == 0)) || (TempDisable_027 == 1) ) || ( ((HwErrAlrm_027 == 1) && (TempPos_027 == 1) && (TempDisable_027 == 0)) || (TempDisable_027 == 1) ) || ( ((HwErrAlrm_028 == 1) && (TempPos_028 == 0) && (TempDisable_028 == 0)) || (TempDisable_028 == 1) ) || ( ((HwErrAlrm_028 == 1) && (TempPos_028 == 1) && (TempDisable_028 == 0)) || (TempDisable_028 == 1) ) || ( ((HwErrAlrm_029 == 1) && (TempPos_029 == 0) && (TempDisable_029 == 0)) || (TempDisable_029 == 1) ) || ( ((HwErrAlrm_029 == 1) && (TempPos_029 == 1) && (TempDisable_029 == 0)) || (TempDisable_029 == 1) ) || ( ((HwErrAlrm_030 == 1) && (TempPos_030 == 0) && (TempDisable_030 == 0)) || (TempDisable_030 == 1) ) || ( ((HwErrAlrm_030 == 1) && (TempPos_030 == 1) && (TempDisable_030 == 0)) || (TempDisable_030 == 1) ) || ( ((HwErrAlrm_031 == 1) && (TempPos_031 == 0) && (TempDisable_031 == 0)) || (TempDisable_031 == 1) ) || ( ((HwErrAlrm_031 == 1) && (TempPos_031 == 1) && (TempDisable_031 == 0)) || (TempDisable_031 == 1) ) || ( ((HwErrAlrm_032 == 1) && (TempPos_032 == 0) && (TempDisable_032 == 0)) || (TempDisable_032 == 1) ) || ( ((HwErrAlrm_032 == 1) && (TempPos_032 == 1) && (TempDisable_032 == 0)) || (TempDisable_032 == 1) ) || ( ((HwErrAlrm_033 == 1) && (TempPos_033 == 0) && (TempDisable_033 == 0)) || (TempDisable_033 == 1) ) || ( ((HwErrAlrm_033 == 1) && (TempPos_033 == 1) && (TempDisable_033 == 0)) || (TempDisable_033 == 1) ) || ( ((HwErrAlrm_034 == 1) && (TempPos_034 == 0) && (TempDisable_034 == 0)) || (TempDisable_034 == 1) ) || ( ((HwErrAlrm_034 == 1) && (TempPos_034 == 1) && (TempDisable_034 == 0)) || (TempDisable_034 == 1) ) || ( ((HwErrAlrm_035 == 1) && (TempPos_035 == 0) && (TempDisable_035 == 0)) || (TempDisable_035 == 1) ) || ( ((HwErrAlrm_035 == 1) && (TempPos_035 == 1) && (TempDisable_035 == 0)) || (TempDisable_035 == 1) ) || ( ((HwErrAlrm_036 == 1) && (TempPos_036 == 0) && (TempDisable_036 == 0)) || (TempDisable_036 == 1) ) || ( ((HwErrAlrm_036 == 1) && (TempPos_036 == 1) && (TempDisable_036 == 0)) || (TempDisable_036 == 1) ) || ( ((HwErrAlrm_037 == 1) && (TempPos_037 == 0) && (TempDisable_037 == 0)) || (TempDisable_037 == 1) ) || ( ((HwErrAlrm_037 == 1) && (TempPos_037 == 1) && (TempDisable_037 == 0)) || (TempDisable_037 == 1) ) || ( ((HwErrAlrm_038 == 1) && (TempPos_038 == 0) && (TempDisable_038 == 0)) || (TempDisable_038 == 1) ) || ( ((HwErrAlrm_038 == 1) && (TempPos_038 == 1) && (TempDisable_038 == 0)) || (TempDisable_038 == 1) ) || ( ((HwErrAlrm_039 == 1) && (TempPos_039 == 0) && (TempDisable_039 == 0)) || (TempDisable_039 == 1) ) || ( ((HwErrAlrm_039 == 1) && (TempPos_039 == 1) && (TempDisable_039 == 0)) || (TempDisable_039 == 1) ) || ( ((HwErrAlrm_040 == 1) && (TempPos_040 == 0) && (TempDisable_040 == 0)) || (TempDisable_040 == 1) ) || ( ((HwErrAlrm_040 == 1) && (TempPos_040 == 1) && (TempDisable_040 == 0)) || (TempDisable_040 == 1) ) || ( ((HwErrAlrm_041 == 1) && (TempPos_041 == 0) && (TempDisable_041 == 0)) || (TempDisable_041 == 1) ) || ( ((HwErrAlrm_041 == 1) && (TempPos_041 == 1) && (TempDisable_041 == 0)) || (TempDisable_041 == 1) ) || ( ((HwErrAlrm_042 == 1) && (TempPos_042 == 0) && (TempDisable_042 == 0)) || (TempDisable_042 == 1) ) || ( ((HwErrAlrm_042 == 1) && (TempPos_042 == 1) && (TempDisable_042 == 0)) || (TempDisable_042 == 1) ) || ( ((HwErrAlrm_043 == 1) && (TempPos_043 == 0) && (TempDisable_043 == 0)) || (TempDisable_043 == 1) ) || ( ((HwErrAlrm_043 == 1) && (TempPos_043 == 1) && (TempDisable_043 == 0)) || (TempDisable_043 == 1) ) || ( ((HwErrAlrm_044 == 1) && (TempPos_044 == 0) && (TempDisable_044 == 0)) || (TempDisable_044 == 1) ) || ( ((HwErrAlrm_044 == 1) && (TempPos_044 == 1) && (TempDisable_044 == 0)) || (TempDisable_044 == 1) ) || ( ((HwErrAlrm_045 == 1) && (TempPos_045 == 0) && (TempDisable_045 == 0)) || (TempDisable_045 == 1) ) || ( ((HwErrAlrm_045 == 1) && (TempPos_045 == 1) && (TempDisable_045 == 0)) || (TempDisable_045 == 1) ) || ( ((HwErrAlrm_046 == 1) && (TempPos_046 == 0) && (TempDisable_046 == 0)) || (TempDisable_046 == 1) ) || ( ((HwErrAlrm_046 == 1) && (TempPos_046 == 1) && (TempDisable_046 == 0)) || (TempDisable_046 == 1) ) || ( ((HwErrAlrm_047 == 1) && (TempPos_047 == 0) && (TempDisable_047 == 0)) || (TempDisable_047 == 1) ) || ( ((HwErrAlrm_047 == 1) && (TempPos_047 == 1) && (TempDisable_047 == 0)) || (TempDisable_047 == 1) ) || ( ((HwErrAlrm_048 == 1) && (TempPos_048 == 0) && (TempDisable_048 == 0)) || (TempDisable_048 == 1) ) || ( ((HwErrAlrm_048 == 1) && (TempPos_048 == 1) && (TempDisable_048 == 0)) || (TempDisable_048 == 1) ) || ( ((HwErrAlrm_049 == 1) && (TempPos_049 == 0) && (TempDisable_049 == 0)) || (TempDisable_049 == 1) ) || ( ((HwErrAlrm_049 == 1) && (TempPos_049 == 1) && (TempDisable_049 == 0)) || (TempDisable_049 == 1) ) || ( ((HwErrAlrm_050 == 1) && (TempPos_050 == 0) && (TempDisable_050 == 0)) || (TempDisable_050 == 1) ) || ( ((HwErrAlrm_050 == 1) && (TempPos_050 == 1) && (TempDisable_050 == 0)) || (TempDisable_050 == 1) ) || ( ((HwErrAlrm_051 == 1) && (TempPos_051 == 0) && (TempDisable_051 == 0)) || (TempDisable_051 == 1) ) || ( ((HwErrAlrm_051 == 1) && (TempPos_051 == 1) && (TempDisable_051 == 0)) || (TempDisable_051 == 1) ) || ( ((HwErrAlrm_052 == 1) && (TempPos_052 == 0) && (TempDisable_052 == 0)) || (TempDisable_052 == 1) ) || ( ((HwErrAlrm_052 == 1) && (TempPos_052 == 1) && (TempDisable_052 == 0)) || (TempDisable_052 == 1) ) || ( ((HwErrAlrm_053 == 1) && (TempPos_053 == 0) && (TempDisable_053 == 0)) || (TempDisable_053 == 1) ) || ( ((HwErrAlrm_053 == 1) && (TempPos_053 == 1) && (TempDisable_053 == 0)) || (TempDisable_053 == 1) ) || ( ((HwErrAlrm_054 == 1) && (TempPos_054 == 0) && (TempDisable_054 == 0)) || (TempDisable_054 == 1) ) || ( ((HwErrAlrm_054 == 1) && (TempPos_054 == 1) && (TempDisable_054 == 0)) || (TempDisable_054 == 1) ) || ( ((HwErrAlrm_055 == 1) && (TempPos_055 == 0) && (TempDisable_055 == 0)) || (TempDisable_055 == 1) ) || ( ((HwErrAlrm_055 == 1) && (TempPos_055 == 1) && (TempDisable_055 == 0)) || (TempDisable_055 == 1) ) || ( ((HwErrAlrm_056 == 1) && (TempPos_056 == 0) && (TempDisable_056 == 0)) || (TempDisable_056 == 1) ) || ( ((HwErrAlrm_056 == 1) && (TempPos_056 == 1) && (TempDisable_056 == 0)) || (TempDisable_056 == 1) ) || ( ((HwErrAlrm_057 == 1) && (TempPos_057 == 0) && (TempDisable_057 == 0)) || (TempDisable_057 == 1) ) || ( ((HwErrAlrm_057 == 1) && (TempPos_057 == 1) && (TempDisable_057 == 0)) || (TempDisable_057 == 1) ) || ( ((HwErrAlrm_058 == 1) && (TempPos_058 == 0) && (TempDisable_058 == 0)) || (TempDisable_058 == 1) ) || ( ((HwErrAlrm_058 == 1) && (TempPos_058 == 1) && (TempDisable_058 == 0)) || (TempDisable_058 == 1) ) || ( ((HwErrAlrm_059 == 1) && (TempPos_059 == 0) && (TempDisable_059 == 0)) || (TempDisable_059 == 1) ) || ( ((HwErrAlrm_059 == 1) && (TempPos_059 == 1) && (TempDisable_059 == 0)) || (TempDisable_059 == 1) ) || ( ((HwErrAlrm_060 == 1) && (TempPos_060 == 0) && (TempDisable_060 == 0)) || (TempDisable_060 == 1) ) || ( ((HwErrAlrm_060 == 1) && (TempPos_060 == 1) && (TempDisable_060 == 0)) || (TempDisable_060 == 1) ) || ( ((HwErrAlrm_100 == 1) && (TempPos_100 == 0) && (TempDisable_100 == 0)) || (TempDisable_100 == 1) ) || ( ((HwErrAlrm_100 == 1) && (TempPos_100 == 1) && (TempDisable_100 == 0)) || (TempDisable_100 == 1) ) || ( ((HwErrAlrm_200 == 1) && (TempPos_200 == 0) && (TempDisable_200 == 0)) || (TempDisable_200 == 1) ) || ( ((HwErrAlrm_200 == 1) && (TempPos_200 == 1) && (TempDisable_200 == 0)) || (TempDisable_200 == 1) ) ) {

      RfSlow_okstatus=0;
      pvPut(RfSlow_okstatus);
      printf("[SEQ TEMPERATURE  - TANK1] MINOR Error in hardware connection: possible broken sensor\n");
      printf("[SEQ TEMPERATURE  - TANK1] Set TANK 1 Temperature OK STATUS to 0: INTERLOCK \n");
		} state maintenance

    /* Sensor broken  */
		when ( (( (HwErrAlrm_001 == 1) && (HwUnderLimAlrm_001 == 1) && (HwOverLimAlrm_001 == 1)) || (TempDisable_001 == 1) ) || (( (HwErrAlrm_002 == 1) && (HwUnderLimAlrm_002 == 1) && (HwOverLimAlrm_002 == 1)) || (TempDisable_002 == 1) ) || (( (HwErrAlrm_003 == 1) && (HwUnderLimAlrm_003 == 1) && (HwOverLimAlrm_003 == 1)) || (TempDisable_003 == 1) ) || (( (HwErrAlrm_004 == 1) && (HwUnderLimAlrm_004 == 1) && (HwOverLimAlrm_004 == 1)) || (TempDisable_004 == 1) ) || (( (HwErrAlrm_005 == 1) && (HwUnderLimAlrm_005 == 1) && (HwOverLimAlrm_005 == 1)) || (TempDisable_005 == 1) ) || (( (HwErrAlrm_006 == 1) && (HwUnderLimAlrm_006 == 1) && (HwOverLimAlrm_006 == 1)) || (TempDisable_006 == 1) ) || (( (HwErrAlrm_007 == 1) && (HwUnderLimAlrm_007 == 1) && (HwOverLimAlrm_007 == 1)) || (TempDisable_007 == 1) ) || (( (HwErrAlrm_008 == 1) && (HwUnderLimAlrm_008 == 1) && (HwOverLimAlrm_008 == 1)) || (TempDisable_008 == 1) ) || (( (HwErrAlrm_009 == 1) && (HwUnderLimAlrm_009 == 1) && (HwOverLimAlrm_009 == 1)) || (TempDisable_009 == 1) ) || (( (HwErrAlrm_010 == 1) && (HwUnderLimAlrm_010 == 1) && (HwOverLimAlrm_010 == 1)) || (TempDisable_010 == 1) ) || (( (HwErrAlrm_011 == 1) && (HwUnderLimAlrm_011 == 1) && (HwOverLimAlrm_011 == 1)) || (TempDisable_011 == 1) ) || (( (HwErrAlrm_012 == 1) && (HwUnderLimAlrm_012 == 1) && (HwOverLimAlrm_012 == 1)) || (TempDisable_012 == 1) ) || (( (HwErrAlrm_013 == 1) && (HwUnderLimAlrm_013 == 1) && (HwOverLimAlrm_013 == 1)) || (TempDisable_013 == 1) ) || (( (HwErrAlrm_014 == 1) && (HwUnderLimAlrm_014 == 1) && (HwOverLimAlrm_014 == 1)) || (TempDisable_014 == 1) ) || (( (HwErrAlrm_015 == 1) && (HwUnderLimAlrm_015 == 1) && (HwOverLimAlrm_015 == 1)) || (TempDisable_015 == 1) ) || (( (HwErrAlrm_016 == 1) && (HwUnderLimAlrm_016 == 1) && (HwOverLimAlrm_016 == 1)) || (TempDisable_016 == 1) ) || (( (HwErrAlrm_017 == 1) && (HwUnderLimAlrm_017 == 1) && (HwOverLimAlrm_017 == 1)) || (TempDisable_017 == 1) ) || (( (HwErrAlrm_018 == 1) && (HwUnderLimAlrm_018 == 1) && (HwOverLimAlrm_018 == 1)) || (TempDisable_018 == 1) ) || (( (HwErrAlrm_019 == 1) && (HwUnderLimAlrm_019 == 1) && (HwOverLimAlrm_019 == 1)) || (TempDisable_019 == 1) ) || (( (HwErrAlrm_020 == 1) && (HwUnderLimAlrm_020 == 1) && (HwOverLimAlrm_020 == 1)) || (TempDisable_020 == 1) ) || (( (HwErrAlrm_021 == 1) && (HwUnderLimAlrm_021 == 1) && (HwOverLimAlrm_021 == 1)) || (TempDisable_021 == 1) ) || (( (HwErrAlrm_022 == 1) && (HwUnderLimAlrm_022 == 1) && (HwOverLimAlrm_022 == 1)) || (TempDisable_022 == 1) ) || ( ((HwErrAlrm_023 == 1) && (HwUnderLimAlrm_023 == 1) && (HwOverLimAlrm_023 == 1)) || (TempDisable_023 == 1) ) || ( ((HwErrAlrm_024 == 1) && (HwUnderLimAlrm_024 == 1) && (HwOverLimAlrm_024 == 1)) || (TempDisable_024 == 1) ) || ( ((HwErrAlrm_025 == 1) && (HwUnderLimAlrm_025 == 1) && (HwOverLimAlrm_025 == 1)) || (TempDisable_025 == 1) ) || ( ((HwErrAlrm_026 == 1) && (HwUnderLimAlrm_026 == 1) && (HwOverLimAlrm_026 == 1)) || (TempDisable_026 == 1) ) || ( ((HwErrAlrm_027 == 1) && (HwUnderLimAlrm_027 == 1) && (HwOverLimAlrm_027 == 1)) || (TempDisable_027 == 1) ) || ( ((HwErrAlrm_028 == 1) && (HwUnderLimAlrm_028 == 1) && (HwOverLimAlrm_028 == 1)) || (TempDisable_028 == 1) ) || ( ((HwErrAlrm_029 == 1) && (HwUnderLimAlrm_029 == 1) && (HwOverLimAlrm_029 == 1)) || (TempDisable_029 == 1) ) || ( ((HwErrAlrm_030 == 1) && (HwUnderLimAlrm_030 == 1) && (HwOverLimAlrm_030 == 1)) || (TempDisable_030 == 1) ) || ( ((HwErrAlrm_031 == 1) && (HwUnderLimAlrm_031 == 1) && (HwOverLimAlrm_031 == 1)) || (TempDisable_031 == 1) ) || ( ((HwErrAlrm_032 == 1) && (HwUnderLimAlrm_032 == 1) && (HwOverLimAlrm_032 == 1)) || (TempDisable_032 == 1) ) || ( ((HwErrAlrm_033 == 1) && (HwUnderLimAlrm_033 == 1) && (HwOverLimAlrm_033 == 1)) || (TempDisable_033 == 1) ) || ( ((HwErrAlrm_034 == 1) && (HwUnderLimAlrm_034 == 1) && (HwOverLimAlrm_034 == 1)) || (TempDisable_034 == 1) ) || ( ((HwErrAlrm_035 == 1) && (HwUnderLimAlrm_035 == 1) && (HwOverLimAlrm_035 == 1)) || (TempDisable_035 == 1) ) || ( ((HwErrAlrm_036 == 1) && (HwUnderLimAlrm_036 == 1) && (HwOverLimAlrm_036 == 1)) || (TempDisable_036 == 1) ) || ( ((HwErrAlrm_037 == 1) && (HwUnderLimAlrm_037 == 1) && (HwOverLimAlrm_037 == 1)) || (TempDisable_037 == 1) ) || ( ((HwErrAlrm_038 == 1) && (HwUnderLimAlrm_038 == 1) && (HwOverLimAlrm_038 == 1)) || (TempDisable_038 == 1) ) || ( ((HwErrAlrm_039 == 1) && (HwUnderLimAlrm_039 == 1) && (HwOverLimAlrm_039 == 1)) || (TempDisable_039 == 1) ) || ( ((HwErrAlrm_040 == 1) && (HwUnderLimAlrm_040 == 1) && (HwOverLimAlrm_040 == 1)) || (TempDisable_040 == 1) ) || ( ((HwErrAlrm_041 == 1) && (HwUnderLimAlrm_041 == 1) && (HwOverLimAlrm_041 == 1)) || (TempDisable_041 == 1) ) || ( ((HwErrAlrm_042 == 1) && (HwUnderLimAlrm_042 == 1) && (HwOverLimAlrm_042 == 1)) || (TempDisable_042 == 1) ) || ( ((HwErrAlrm_043 == 1) && (HwUnderLimAlrm_043 == 1) && (HwOverLimAlrm_043 == 1)) || (TempDisable_043 == 1) ) || ( ((HwErrAlrm_044 == 1) && (HwUnderLimAlrm_044 == 1) && (HwOverLimAlrm_044 == 1)) || (TempDisable_044 == 1) ) || ( ((HwErrAlrm_045 == 1) && (HwUnderLimAlrm_045 == 1) && (HwOverLimAlrm_045 == 1)) || (TempDisable_045 == 1) ) || ( ((HwErrAlrm_046 == 1) && (HwUnderLimAlrm_046 == 1) && (HwOverLimAlrm_046 == 1)) || (TempDisable_046 == 1) ) || ( ((HwErrAlrm_047 == 1) && (HwUnderLimAlrm_047 == 1) && (HwOverLimAlrm_047 == 1)) || (TempDisable_047 == 1) ) || ( ((HwErrAlrm_048 == 1) && (HwUnderLimAlrm_048 == 1) && (HwOverLimAlrm_048 == 1)) || (TempDisable_048 == 1) ) || ( ((HwErrAlrm_049 == 1) && (HwUnderLimAlrm_049 == 1) && (HwOverLimAlrm_049 == 1)) || (TempDisable_049 == 1) ) || ( ((HwErrAlrm_050 == 1) && (HwUnderLimAlrm_050 == 1) && (HwOverLimAlrm_050 == 1)) || (TempDisable_050 == 1) ) || ( ((HwErrAlrm_051 == 1) && (HwUnderLimAlrm_051 == 1) && (HwOverLimAlrm_051 == 1)) || (TempDisable_051 == 1) ) || ( ((HwErrAlrm_052 == 1) && (HwUnderLimAlrm_052 == 1) && (HwOverLimAlrm_052 == 1)) || (TempDisable_052 == 1) ) || ( ((HwErrAlrm_053 == 1) && (HwUnderLimAlrm_053 == 1) && (HwOverLimAlrm_053 == 1)) || (TempDisable_053 == 1) ) || ( ((HwErrAlrm_054 == 1) && (HwUnderLimAlrm_054 == 1) && (HwOverLimAlrm_054 == 1)) || (TempDisable_054 == 1) ) || ( ((HwErrAlrm_055 == 1) && (HwUnderLimAlrm_055 == 1) && (HwOverLimAlrm_055 == 1)) || (TempDisable_055 == 1) ) || ( ((HwErrAlrm_056 == 1) && (HwUnderLimAlrm_056 == 1) && (HwOverLimAlrm_056 == 1)) || (TempDisable_056 == 1) ) || ( ((HwErrAlrm_057 == 1) && (HwUnderLimAlrm_057 == 1) && (HwOverLimAlrm_057 == 1)) || (TempDisable_057 == 1) ) || ( ((HwErrAlrm_058 == 1) && (HwUnderLimAlrm_058 == 1) && (HwOverLimAlrm_058 == 1)) || (TempDisable_058 == 1) ) || ( ((HwErrAlrm_059 == 1) && (HwUnderLimAlrm_059 == 1) && (HwOverLimAlrm_059 == 1)) || (TempDisable_059 == 1) ) || ( ((HwErrAlrm_060 == 1) && (HwUnderLimAlrm_060 == 1) && (HwOverLimAlrm_060 == 1)) || (TempDisable_060 == 1) ) || ( ((HwErrAlrm_100 == 1) && (HwUnderLimAlrm_100 == 1) && (HwOverLimAlrm_100 == 1)) || (TempDisable_100 == 1) ) || ( ((HwErrAlrm_200 == 1) && (HwUnderLimAlrm_200 == 1) && (HwOverLimAlrm_200 == 1)) || (TempDisable_200 == 1) ) ) {

      RfSlow_okstatus=0;
      pvPut(RfSlow_okstatus);
      printf("[SEQ TEMPERATURE  - TANK1] MINOR Error in hardware connection: possible broken sensor\n");
      printf("[SEQ TEMPERATURE  - TANK1] Set TANK 1 Temperature OK STATUS to 0: INTERLOCK \n");
		} state failure

    /* No error in any temperature sensor enabled */
    when ( ( ((HwErrAlrm_001 == 0) && (TempIlk_001 == 0) && (TempDisable_001 == 0)) || (TempDisable_001 == 1) ) && (( (HwErrAlrm_002 == 0) && (TempIlk_002 == 0) && (TempDisable_002 == 0)) || (TempDisable_002 == 1) ) && (( (HwErrAlrm_003 == 0) && (TempIlk_003 == 0) && (TempDisable_003 == 0)) || (TempDisable_003 == 1) ) && (( (HwErrAlrm_004 == 0) && (TempIlk_004 == 0) && (TempDisable_004 == 0)) || (TempDisable_004 == 1) ) && (( (HwErrAlrm_005 == 0) && (TempIlk_005 == 0) && (TempDisable_005 == 0)) || (TempDisable_005 == 1) ) && (( (HwErrAlrm_006 == 0) && (TempIlk_006 == 0) && (TempDisable_006 == 0)) || (TempDisable_006 == 1) ) && (( (HwErrAlrm_007 == 0) && (TempIlk_007 == 0) && (TempDisable_007 == 0)) || (TempDisable_007 == 1) ) && (( (HwErrAlrm_008 == 0) && (TempIlk_008 == 0) && (TempDisable_008 == 0)) || (TempDisable_008 == 1) ) && (( (HwErrAlrm_009 == 0) && (TempIlk_009 == 0) && (TempDisable_009 == 0)) || (TempDisable_009 == 1) ) && (( (HwErrAlrm_010 == 0) && (TempIlk_010 == 0) && (TempDisable_010 == 0)) || (TempDisable_010 == 1) ) && (( (HwErrAlrm_011 == 0) && (TempIlk_011 == 0) && (TempDisable_011 == 0)) || (TempDisable_011 == 1) ) && (( (HwErrAlrm_012 == 0) && (TempIlk_012 == 0) && (TempDisable_012 == 0)) || (TempDisable_012 == 1) ) && (( (HwErrAlrm_013 == 0) && (TempIlk_013 == 0) && (TempDisable_013 == 0)) || (TempDisable_013 == 1) ) && (( (HwErrAlrm_014 == 0) && (TempIlk_014 == 0) && (TempDisable_014 == 0)) || (TempDisable_014 == 1) ) && (( (HwErrAlrm_015 == 0) && (TempIlk_015 == 0) && (TempDisable_015 == 0)) || (TempDisable_015 == 1) ) && (( (HwErrAlrm_016 == 0) && (TempIlk_016 == 0) && (TempDisable_016 == 0)) || (TempDisable_016 == 1) ) && (( (HwErrAlrm_017 == 0) && (TempIlk_017 == 0) && (TempDisable_017 == 0)) || (TempDisable_017 == 1) ) && (( (HwErrAlrm_018 == 0) && (TempIlk_018 == 0) && (TempDisable_018 == 0)) || (TempDisable_018 == 1) ) && (( (HwErrAlrm_019 == 0) && (TempIlk_019 == 0) && (TempDisable_019 == 0)) || (TempDisable_019 == 1) ) && (( (HwErrAlrm_020 == 0) && (TempIlk_020 == 0) && (TempDisable_020 == 0)) || (TempDisable_020 == 1) ) && (( (HwErrAlrm_021 == 0) && (TempIlk_021 == 0) && (TempDisable_021 == 0)) || (TempDisable_021 == 1) ) && (( (HwErrAlrm_022 == 0) && (TempIlk_022 == 0) && (TempDisable_022 == 0)) || (TempDisable_022 == 1) ) && ( ((HwErrAlrm_023 == 0) && (TempIlk_023 == 0) && (TempDisable_023 == 0)) || (TempDisable_023 == 1) ) && ( ((HwErrAlrm_024 == 0) && (TempIlk_024 == 0) && (TempDisable_024 == 0)) || (TempDisable_024 == 1) ) && ( ((HwErrAlrm_025 == 0) && (TempIlk_025 == 0) && (TempDisable_025 == 0)) || (TempDisable_025 == 1) ) && ( ((HwErrAlrm_026 == 0) && (TempIlk_026 == 0) && (TempDisable_026 == 0)) || (TempDisable_026 == 1) ) && ( ((HwErrAlrm_027 == 0) && (TempIlk_027 == 0) && (TempDisable_027 == 0)) || (TempDisable_027 == 1) ) && ( ((HwErrAlrm_028 == 0) && (TempIlk_028 == 0) && (TempDisable_028 == 0)) || (TempDisable_028 == 1) ) && ( ((HwErrAlrm_029 == 0) && (TempIlk_029 == 0) && (TempDisable_029 == 0)) || (TempDisable_029 == 1) ) && ( ((HwErrAlrm_030 == 0) && (TempIlk_030 == 0) && (TempDisable_030 == 0)) || (TempDisable_030 == 1) ) && ( ((HwErrAlrm_031 == 0) && (TempIlk_031 == 0) && (TempDisable_031 == 0)) || (TempDisable_031 == 1) ) && ( ((HwErrAlrm_032 == 0) && (TempIlk_032 == 0) && (TempDisable_032 == 0)) || (TempDisable_032 == 1) ) && ( ((HwErrAlrm_033 == 0) && (TempIlk_033 == 0) && (TempDisable_033 == 0)) || (TempDisable_033 == 1) ) && ( ((HwErrAlrm_034 == 0) && (TempIlk_034 == 0) && (TempDisable_034 == 0)) || (TempDisable_034 == 1) ) && ( ((HwErrAlrm_035 == 0) && (TempIlk_035 == 0) && (TempDisable_035 == 0)) || (TempDisable_035 == 1) ) && ( ((HwErrAlrm_036 == 0) && (TempIlk_036 == 0) && (TempDisable_036 == 0)) || (TempDisable_036 == 1) ) && ( ((HwErrAlrm_037 == 0) && (TempIlk_037 == 0) && (TempDisable_037 == 0)) || (TempDisable_037 == 1) ) && ( ((HwErrAlrm_038 == 0) && (TempIlk_038 == 0) && (TempDisable_038 == 0)) || (TempDisable_038 == 1) ) && ( ((HwErrAlrm_039 == 0) && (TempIlk_039 == 0) && (TempDisable_039 == 0)) || (TempDisable_039 == 1) ) && ( ((HwErrAlrm_040 == 0) && (TempIlk_040 == 0) && (TempDisable_040 == 0)) || (TempDisable_040 == 1) ) && ( ((HwErrAlrm_041 == 0) && (TempIlk_041 == 0) && (TempDisable_041 == 0)) || (TempDisable_041 == 1) ) && ( ((HwErrAlrm_042 == 0) && (TempIlk_042 == 0) && (TempDisable_042 == 0)) || (TempDisable_042 == 1) ) && ( ((HwErrAlrm_043 == 0) && (TempIlk_043 == 0) && (TempDisable_043 == 0)) || (TempDisable_043 == 1) ) && ( ((HwErrAlrm_044 == 0) && (TempIlk_044 == 0) && (TempDisable_044 == 0)) || (TempDisable_044 == 1) ) && ( ((HwErrAlrm_045 == 0) && (TempIlk_045 == 0) && (TempDisable_045 == 0)) || (TempDisable_045 == 1) ) && ( ((HwErrAlrm_046 == 0) && (TempIlk_046 == 0) && (TempDisable_046 == 0)) || (TempDisable_046 == 1) ) && ( ((HwErrAlrm_047 == 0) && (TempIlk_047 == 0) && (TempDisable_047 == 0)) || (TempDisable_047 == 1) ) && ( ((HwErrAlrm_048 == 0) && (TempIlk_048 == 0) && (TempDisable_048 == 0)) || (TempDisable_048 == 1) ) && ( ((HwErrAlrm_049 == 0) && (TempIlk_049 == 0) && (TempDisable_049 == 0)) || (TempDisable_049 == 1) ) && ( ((HwErrAlrm_050 == 0) && (TempIlk_050 == 0) && (TempDisable_050 == 0)) || (TempDisable_050 == 1) ) && ( ((HwErrAlrm_051 == 0) && (TempIlk_051 == 0) && (TempDisable_051 == 0)) || (TempDisable_051 == 1) ) && ( ((HwErrAlrm_052 == 0) && (TempIlk_052 == 0) && (TempDisable_052 == 0)) || (TempDisable_052 == 1) ) && ( ((HwErrAlrm_053 == 0) && (TempIlk_053 == 0) && (TempDisable_053 == 0)) || (TempDisable_053 == 1) ) && ( ((HwErrAlrm_054 == 0) && (TempIlk_054 == 0) && (TempDisable_054 == 0)) || (TempDisable_054 == 1) ) && ( ((HwErrAlrm_055 == 0) && (TempIlk_055 == 0) && (TempDisable_055 == 0)) || (TempDisable_055 == 1) ) && ( ((HwErrAlrm_056 == 0) && (TempIlk_056 == 0) && (TempDisable_056 == 0)) || (TempDisable_056 == 1) ) && ( ((HwErrAlrm_057 == 0) && (TempIlk_057 == 0) && (TempDisable_057 == 0)) || (TempDisable_057 == 1) ) && ( ((HwErrAlrm_058 == 0) && (TempIlk_058 == 0) && (TempDisable_058 == 0)) || (TempDisable_058 == 1) ) && ( ((HwErrAlrm_059 == 0) && (TempIlk_059 == 0) && (TempDisable_059 == 0)) || (TempDisable_059 == 1) ) && ( ((HwErrAlrm_060 == 0) && (TempIlk_060 == 0) && (TempDisable_060 == 0)) || (TempDisable_060 == 1) ) && ( ((HwErrAlrm_100 == 0) && (TempIlk_100 == 0) && (TempDisable_100 == 0)) || (TempDisable_100 == 1) ) && ( ((HwErrAlrm_200 == 0) && (TempIlk_200 == 0) && (TempDisable_200 == 0)) || (TempDisable_200 == 1) ) ) {

      printf("[SEQ TEMPERATURE  - TANK1] Sensors Check Passed\n");
    } state ready_for_operation

  }


/* state STARTUP	*/
/* state IDLE   	*/
/* state READY_FOR_OPERATION 	*/
state ready_for_operation {
  entry {
      printf("\n[SEQ TEMPERATURE  - TANK1] Enter in READY FOR OPERATION status\n");
      RfSlow_okstatus=1;
      pvPut(RfSlow_okstatus);
      printf("[SEQ TEMPERATURE  - TANK1] Set TANK 1 Temperature OK STATUS to 1: OK \n");
      StateMachineCode=40;
      pvPut(StateMachineCode);
  }

  /* Interlock status at self-check (with sensor enabled) */
  when ( ( (TempIlk_001 == 1) && (TempDisable_001 == 0) ) || ( (TempIlk_002 == 1) && (TempDisable_002 == 0) ) || ( (TempIlk_003 == 1) && (TempDisable_003 == 0) ) || ( (TempIlk_004 == 1) && (TempDisable_004 == 0) ) || ( (TempIlk_005 == 1) && (TempDisable_005 == 0) ) || ( (TempIlk_006 == 1) && (TempDisable_006 == 0) ) || ( (TempIlk_007 == 1) && (TempDisable_007 == 0) ) || ( (TempIlk_008 == 1) && (TempDisable_008 == 0) ) || ( (TempIlk_009 == 1) && (TempDisable_009 == 0) ) || ( (TempIlk_010 == 1) && (TempDisable_010 == 0) ) || ( (TempIlk_011 == 1) && (TempDisable_011 == 0) ) || ( (TempIlk_012 == 1) && (TempDisable_012 == 0) ) || ( (TempIlk_013 == 1) && (TempDisable_013 == 0) ) || ( (TempIlk_014 == 1) && (TempDisable_014 == 0) ) || ( (TempIlk_015 == 1) && (TempDisable_015 == 0) ) || ( (TempIlk_016 == 1) && (TempDisable_016 == 0) ) || ( (TempIlk_017 == 1) && (TempDisable_017 == 0) ) || ( (TempIlk_018 == 1) && (TempDisable_018 == 0) ) || ( (TempIlk_019 == 1) && (TempDisable_019 == 0) ) || ( (TempIlk_020 == 1) && (TempDisable_020 == 0) ) || ( (TempIlk_021 == 1) && (TempDisable_021 == 0) ) || ( (TempIlk_022 == 1) && (TempDisable_022 == 0) ) || ( (TempIlk_023 == 1) && (TempDisable_023 == 0) ) || ( (TempIlk_024 == 1) && (TempDisable_024 == 0) ) || ( (TempIlk_025 == 1) && (TempDisable_025 == 0) ) || ( (TempIlk_026 == 1) && (TempDisable_026 == 0) ) || ( (TempIlk_027 == 1) && (TempDisable_027 == 0) ) || ( (TempIlk_028 == 1) && (TempDisable_028 == 0) ) || ( (TempIlk_029 == 1) && (TempDisable_029 == 0) ) || ( (TempIlk_030 == 1) && (TempDisable_030 == 0) ) || ( (TempIlk_031 == 1) && (TempDisable_031 == 0) ) || ( (TempIlk_032 == 1) && (TempDisable_032 == 0) ) || ( (TempIlk_033 == 1) && (TempDisable_033 == 0) ) || ( (TempIlk_034 == 1) && (TempDisable_034 == 0) ) || ( (TempIlk_035 == 1) && (TempDisable_035 == 0) ) || ( (TempIlk_036 == 1) && (TempDisable_036 == 0) ) || ( (TempIlk_037 == 1) && (TempDisable_037 == 0) ) || ( (TempIlk_038 == 1) && (TempDisable_038 == 0) ) || ( (TempIlk_039 == 1) && (TempDisable_039 == 0) ) || ( (TempIlk_040 == 1) && (TempDisable_040 == 0) ) || ( (TempIlk_041 == 1) && (TempDisable_041 == 0) ) || ( (TempIlk_042 == 1) && (TempDisable_042 == 0) ) || ( (TempIlk_043 == 1) && (TempDisable_043 == 0) ) || ( (TempIlk_044 == 1) && (TempDisable_044 == 0) ) || ( (TempIlk_045 == 1) && (TempDisable_045 == 0) ) || ( (TempIlk_046 == 1) && (TempDisable_046 == 0) ) || ( (TempIlk_047 == 1) && (TempDisable_047 == 0) ) || ( (TempIlk_048 == 1) && (TempDisable_048 == 0) ) || ( (TempIlk_049 == 1) && (TempDisable_049 == 0) ) || ( (TempIlk_050 == 1) && (TempDisable_050 == 0) ) || ( (TempIlk_051 == 1) && (TempDisable_051 == 0) ) || ( (TempIlk_052 == 1) && (TempDisable_052 == 0) ) || ( (TempIlk_053 == 1) && (TempDisable_053 == 0) ) || ( (TempIlk_054 == 1) && (TempDisable_054 == 0) ) || ( (TempIlk_055 == 1) && (TempDisable_055 == 0) ) || ( (TempIlk_056 == 1) && (TempDisable_056 == 0) ) || ( (TempIlk_057 == 1) && (TempDisable_057 == 0) ) || ( (TempIlk_058 == 1) && (TempDisable_058 == 0) ) || ( (TempIlk_059 == 1) && (TempDisable_059 == 0) ) || ( (TempIlk_060 == 1) && (TempDisable_060 == 0) ) || ( (TempIlk_100 == 1) && (TempDisable_100 == 0) ) || ( (TempIlk_200 == 1) && (TempDisable_200 == 0) ) ) {

     RfSlow_okstatus=0;
     pvPut(RfSlow_okstatus);
     printf("[SEQ TEMPERATURE  - TANK1] Error in software interlock variable\n");
     printf("[SEQ TEMPERATURE  - TANK1] Set TANK 1 Temperature OK STATUS to 0: INTERLOCK \n");
  } state failure

  /* Sensor error if sensor is in PMQ [code 3] or BPM [code 2] position */
  when ( ( (HwErrAlrm_001 == 1) && (TempPos_001 == 2) ) || ( (HwErrAlrm_001 == 1) && (TempPos_001 == 3) ) || ( (HwErrAlrm_002 == 1) && (TempPos_002 == 2) ) || ( (HwErrAlrm_002 == 1) && (TempPos_002 == 3) ) || ( (HwErrAlrm_003 == 1) && (TempPos_003 == 2) ) || ( (HwErrAlrm_003 == 1) && (TempPos_003 == 3) ) ||( (HwErrAlrm_004 == 1) && (TempPos_004 == 2) ) || ( (HwErrAlrm_004 == 1) && (TempPos_004 == 3) ) ||( (HwErrAlrm_005 == 1) && (TempPos_005 == 2) ) || ( (HwErrAlrm_005 == 1) && (TempPos_005 == 3) ) || ( (HwErrAlrm_006 == 1) && (TempPos_006 == 2) ) || ( (HwErrAlrm_006 == 1) && (TempPos_006 == 3) ) || ( (HwErrAlrm_007 == 1) && (TempPos_007 == 2) ) || ( (HwErrAlrm_007 == 1) && (TempPos_007 == 3) ) || ( (HwErrAlrm_008 == 1) && (TempPos_008 == 2) ) || ( (HwErrAlrm_008 == 1) && (TempPos_008 == 3) ) || ( (HwErrAlrm_009 == 1) && (TempPos_009 == 2) ) || ( (HwErrAlrm_009 == 1) && (TempPos_009 == 3) ) || ( (HwErrAlrm_010 == 1) && (TempPos_010 == 2) ) || ( (HwErrAlrm_010 == 1) && (TempPos_010 == 3) ) || ( (HwErrAlrm_011 == 1) && (TempPos_011 == 2) ) || ( (HwErrAlrm_011 == 1) && (TempPos_011 == 3) ) || ( (HwErrAlrm_012 == 1) && (TempPos_012 == 2) ) || ( (HwErrAlrm_012 == 1) && (TempPos_012 == 3) ) || ( (HwErrAlrm_013 == 1) && (TempPos_013 == 2) ) || ( (HwErrAlrm_013 == 1) && (TempPos_013 == 3) ) ||( (HwErrAlrm_014 == 1) && (TempPos_014 == 2) ) || ( (HwErrAlrm_014 == 1) && (TempPos_014 == 3) ) ||( (HwErrAlrm_015 == 1) && (TempPos_015 == 2) ) || ( (HwErrAlrm_015 == 1) && (TempPos_015 == 3) ) || ( (HwErrAlrm_016 == 1) && (TempPos_016 == 2) ) || ( (HwErrAlrm_016 == 1) && (TempPos_016 == 3) ) || ( (HwErrAlrm_017 == 1) && (TempPos_017 == 2) ) || ( (HwErrAlrm_017 == 1) && (TempPos_017 == 3) ) || ( (HwErrAlrm_018 == 1) && (TempPos_018 == 2) ) || ( (HwErrAlrm_018 == 1) && (TempPos_018 == 3) ) || ( (HwErrAlrm_019 == 1) && (TempPos_019 == 2) ) || ( (HwErrAlrm_019 == 1) && (TempPos_019 == 3) ) || ( (HwErrAlrm_020 == 1) && (TempPos_020 == 2) ) || ( (HwErrAlrm_020 == 1) && (TempPos_020 == 3) ) || ( (HwErrAlrm_021 == 1) && (TempPos_021 == 2) ) || ( (HwErrAlrm_021 == 1) && (TempPos_021 == 3) ) || ( (HwErrAlrm_022 == 1) && (TempPos_022 == 2) ) || ( (HwErrAlrm_022 == 1) && (TempPos_022 == 3) ) || ( (HwErrAlrm_023 == 1) && (TempPos_023 == 2) ) || ( (HwErrAlrm_023 == 1) && (TempPos_023 == 3) ) ||( (HwErrAlrm_024 == 1) && (TempPos_024 == 2) ) || ( (HwErrAlrm_024 == 1) && (TempPos_024 == 3) ) ||( (HwErrAlrm_025 == 1) && (TempPos_025 == 2) ) || ( (HwErrAlrm_025 == 1) && (TempPos_025 == 3) ) || ( (HwErrAlrm_026 == 1) && (TempPos_026 == 2) ) || ( (HwErrAlrm_026 == 1) && (TempPos_026 == 3) ) || ( (HwErrAlrm_027 == 1) && (TempPos_027 == 2) ) || ( (HwErrAlrm_027 == 1) && (TempPos_027 == 3) ) || ( (HwErrAlrm_028 == 1) && (TempPos_028 == 2) ) || ( (HwErrAlrm_028 == 1) && (TempPos_028 == 3) ) || ( (HwErrAlrm_029 == 1) && (TempPos_029 == 2) ) || ( (HwErrAlrm_029 == 1) && (TempPos_029 == 3) ) || ( (HwErrAlrm_030 == 1) && (TempPos_030 == 2) ) || ( (HwErrAlrm_030 == 1) && (TempPos_030 == 3) ) || ( (HwErrAlrm_031 == 1) && (TempPos_031 == 2) ) || ( (HwErrAlrm_031 == 1) && (TempPos_031 == 3) ) || ( (HwErrAlrm_032 == 1) && (TempPos_032 == 2) ) || ( (HwErrAlrm_032 == 1) && (TempPos_032 == 3) ) || ( (HwErrAlrm_033 == 1) && (TempPos_033 == 2) ) || ( (HwErrAlrm_033 == 1) && (TempPos_033 == 3) ) ||( (HwErrAlrm_034 == 1) && (TempPos_034 == 2) ) || ( (HwErrAlrm_034 == 1) && (TempPos_034 == 3) ) ||( (HwErrAlrm_035 == 1) && (TempPos_035 == 2) ) || ( (HwErrAlrm_035 == 1) && (TempPos_035 == 3) ) || ( (HwErrAlrm_036 == 1) && (TempPos_036 == 2) ) || ( (HwErrAlrm_036 == 1) && (TempPos_036 == 3) ) || ( (HwErrAlrm_037 == 1) && (TempPos_037 == 2) ) || ( (HwErrAlrm_037 == 1) && (TempPos_037 == 3) ) || ( (HwErrAlrm_038 == 1) && (TempPos_038 == 2) ) || ( (HwErrAlrm_038 == 1) && (TempPos_038 == 3) ) || ( (HwErrAlrm_039 == 1) && (TempPos_039 == 2) ) || ( (HwErrAlrm_039 == 1) && (TempPos_039 == 3) ) || ( (HwErrAlrm_040 == 1) && (TempPos_040 == 2) ) || ( (HwErrAlrm_040 == 1) && (TempPos_040 == 3) ) || ( (HwErrAlrm_041 == 1) && (TempPos_041 == 2) ) || ( (HwErrAlrm_041 == 1) && (TempPos_041 == 3) ) || ( (HwErrAlrm_042 == 1) && (TempPos_042 == 2) ) || ( (HwErrAlrm_042 == 1) && (TempPos_042 == 3) ) || ( (HwErrAlrm_043 == 1) && (TempPos_043 == 2) ) || ( (HwErrAlrm_043 == 1) && (TempPos_043 == 3) ) ||( (HwErrAlrm_044 == 1) && (TempPos_044 == 2) ) || ( (HwErrAlrm_044 == 1) && (TempPos_044 == 3) ) ||( (HwErrAlrm_045 == 1) && (TempPos_045 == 2) ) || ( (HwErrAlrm_045 == 1) && (TempPos_045 == 3) ) || ( (HwErrAlrm_046 == 1) && (TempPos_046 == 2) ) || ( (HwErrAlrm_046 == 1) && (TempPos_046 == 3) ) || ( (HwErrAlrm_047 == 1) && (TempPos_047 == 2) ) || ( (HwErrAlrm_047 == 1) && (TempPos_047 == 3) ) || ( (HwErrAlrm_048 == 1) && (TempPos_048 == 2) ) || ( (HwErrAlrm_048 == 1) && (TempPos_048 == 3) ) || ( (HwErrAlrm_049 == 1) && (TempPos_049 == 2) ) || ( (HwErrAlrm_049 == 1) && (TempPos_049 == 3) ) || ( (HwErrAlrm_050 == 1) && (TempPos_050 == 2) ) || ( (HwErrAlrm_050 == 1) && (TempPos_050 == 3) ) || ( (HwErrAlrm_051 == 1) && (TempPos_051 == 2) ) || ( (HwErrAlrm_051 == 1) && (TempPos_051 == 3) ) || ( (HwErrAlrm_052 == 1) && (TempPos_052 == 2) ) || ( (HwErrAlrm_052 == 1) && (TempPos_052 == 3) ) || ( (HwErrAlrm_053 == 1) && (TempPos_053 == 2) ) || ( (HwErrAlrm_053 == 1) && (TempPos_053 == 3) ) ||( (HwErrAlrm_054 == 1) && (TempPos_054 == 2) ) || ( (HwErrAlrm_054 == 1) && (TempPos_054 == 3) ) ||( (HwErrAlrm_055 == 1) && (TempPos_055 == 2) ) || ( (HwErrAlrm_055 == 1) && (TempPos_055 == 3) ) || ( (HwErrAlrm_056 == 1) && (TempPos_056 == 2) ) || ( (HwErrAlrm_056 == 1) && (TempPos_056 == 3) ) || ( (HwErrAlrm_057 == 1) && (TempPos_057 == 2) ) || ( (HwErrAlrm_057 == 1) && (TempPos_057 == 3) ) || ( (HwErrAlrm_058 == 1) && (TempPos_058 == 2) ) || ( (HwErrAlrm_058 == 1) && (TempPos_058 == 3) ) || ( (HwErrAlrm_059 == 1) && (TempPos_059 == 2) ) || ( (HwErrAlrm_059 == 1) && (TempPos_059 == 3) ) || ( (HwErrAlrm_060 == 1) && (TempPos_060 == 2) ) || ( (HwErrAlrm_060 == 1) && (TempPos_060 == 3) ) || ( (HwErrAlrm_100 == 1) && (TempPos_100 == 2) ) || ( (HwErrAlrm_100 == 1) && (TempPos_100 == 3) ) || ( (HwErrAlrm_200 == 1) && (TempPos_200 == 2) ) || ( (HwErrAlrm_200 == 1) && (TempPos_200 == 3) ) ) {

    RfSlow_okstatus=0;
    pvPut(RfSlow_okstatus);
    printf("[SEQ TEMPERATURE  - TANK1] MAJOR Error in hardware connection: possible broken sensor\n");
    printf("[SEQ TEMPERATURE  - TANK1] Set TANK 1 Temperature OK STATUS to 0: INTERLOCK \n");
  } state failure

  /* Sensor error if sensor is in steerer [code 1] or empty [code 0] position */
  when ( (( (HwErrAlrm_001 == 1) && (TempPos_001 == 0) && (TempDisable_001 == 0)) || (TempDisable_001 == 1) ) || (( (HwErrAlrm_001 == 1) && (TempPos_001 == 1) && (TempDisable_001 == 0)) || (TempDisable_001 == 1) ) || (( (HwErrAlrm_002 == 1) && (TempPos_002 == 0) && (TempDisable_002 == 0)) || (TempDisable_002 == 1) ) || (( (HwErrAlrm_002 == 1) && (TempPos_002 == 1) && (TempDisable_002 == 0)) || (TempDisable_002 == 1) ) || (( (HwErrAlrm_003 == 1) && (TempPos_003 == 0) && (TempDisable_003 == 0)) || (TempDisable_003 == 1) ) || (( (HwErrAlrm_003 == 1) && (TempPos_003 == 1) && (TempDisable_003 == 0)) || (TempDisable_003 == 1) ) || (( (HwErrAlrm_004 == 1) && (TempPos_004 == 0) && (TempDisable_004 == 0)) || (TempDisable_004 == 1) ) || (( (HwErrAlrm_004 == 1) && (TempPos_004 == 1) && (TempDisable_004 == 0)) || (TempDisable_004 == 1) ) || (( (HwErrAlrm_005 == 1) && (TempPos_005 == 0) && (TempDisable_005 == 0)) || (TempDisable_005 == 1) ) || (( (HwErrAlrm_005 == 1) && (TempPos_005 == 1) && (TempDisable_005 == 0)) || (TempDisable_005 == 1) ) || (( (HwErrAlrm_006 == 1) && (TempPos_006 == 0) && (TempDisable_006 == 0)) || (TempDisable_006 == 1) ) || (( (HwErrAlrm_006 == 1) && (TempPos_006 == 1) && (TempDisable_006 == 0)) || (TempDisable_006 == 1) ) || (( (HwErrAlrm_007 == 1) && (TempPos_007 == 0) && (TempDisable_007 == 0)) || (TempDisable_007 == 1) ) || (( (HwErrAlrm_007 == 1) && (TempPos_007 == 1) && (TempDisable_007 == 0)) || (TempDisable_007 == 1) ) || (( (HwErrAlrm_008 == 1) && (TempPos_008 == 0) && (TempDisable_008 == 0)) || (TempDisable_008 == 1) ) || (( (HwErrAlrm_008 == 1) && (TempPos_008 == 1) && (TempDisable_008 == 0)) || (TempDisable_008 == 1) ) || (( (HwErrAlrm_009 == 1) && (TempPos_009 == 0) && (TempDisable_009 == 0)) || (TempDisable_009 == 1) ) || (( (HwErrAlrm_009 == 1) && (TempPos_009 == 1) && (TempDisable_009 == 0)) || (TempDisable_009 == 1) ) || (( (HwErrAlrm_010 == 1) && (TempPos_010 == 0) && (TempDisable_010 == 0)) || (TempDisable_010 == 1) ) || (( (HwErrAlrm_010 == 1) && (TempPos_010 == 1) && (TempDisable_010 == 0)) || (TempDisable_010 == 1) ) || (( (HwErrAlrm_011 == 1) && (TempPos_011 == 0) && (TempDisable_011 == 0)) || (TempDisable_011 == 1) ) || (( (HwErrAlrm_011 == 1) && (TempPos_011 == 1) && (TempDisable_011 == 0)) || (TempDisable_011 == 1) ) || (( (HwErrAlrm_012 == 1) && (TempPos_012 == 0) && (TempDisable_012 == 0)) || (TempDisable_012 == 1) ) || (( (HwErrAlrm_012 == 1) && (TempPos_012 == 1) && (TempDisable_012 == 0)) || (TempDisable_012 == 1) ) || (( (HwErrAlrm_013 == 1) && (TempPos_013 == 0) && (TempDisable_013 == 0)) || (TempDisable_013 == 1) ) || (( (HwErrAlrm_013 == 1) && (TempPos_013 == 1) && (TempDisable_013 == 0)) || (TempDisable_013 == 1) ) || (( (HwErrAlrm_014 == 1) && (TempPos_014 == 0) && (TempDisable_014 == 0)) || (TempDisable_014 == 1) ) || (( (HwErrAlrm_014 == 1) && (TempPos_014 == 1) && (TempDisable_014 == 0)) || (TempDisable_014 == 1) ) || (( (HwErrAlrm_015 == 1) && (TempPos_015 == 0) && (TempDisable_015 == 0)) || (TempDisable_015 == 1) ) || (( (HwErrAlrm_015 == 1) && (TempPos_015 == 1) && (TempDisable_015 == 0)) || (TempDisable_015 == 1) ) || (( (HwErrAlrm_016 == 1) && (TempPos_016 == 0) && (TempDisable_016 == 0)) || (TempDisable_016 == 1) ) || (( (HwErrAlrm_016 == 1) && (TempPos_016 == 1) && (TempDisable_016 == 0)) || (TempDisable_016 == 1) ) || (( (HwErrAlrm_017 == 1) && (TempPos_017 == 0) && (TempDisable_017 == 0)) || (TempDisable_017 == 1) ) || (( (HwErrAlrm_017 == 1) && (TempPos_017 == 1) && (TempDisable_017 == 0)) || (TempDisable_017 == 1) ) || (( (HwErrAlrm_018 == 1) && (TempPos_018 == 0) && (TempDisable_018 == 0)) || (TempDisable_018 == 1) ) || (( (HwErrAlrm_018 == 1) && (TempPos_018 == 1) && (TempDisable_018 == 0)) || (TempDisable_018 == 1) ) || (( (HwErrAlrm_019 == 1) && (TempPos_019 == 0) && (TempDisable_019 == 0)) || (TempDisable_019 == 1) ) || (( (HwErrAlrm_019 == 1) && (TempPos_019 == 1) && (TempDisable_019 == 0)) || (TempDisable_019 == 1) ) || (( (HwErrAlrm_020 == 1) && (TempPos_020 == 0) && (TempDisable_020 == 0)) || (TempDisable_020 == 1) ) || (( (HwErrAlrm_020 == 1) && (TempPos_020 == 1) && (TempDisable_020 == 0)) || (TempDisable_020 == 1) ) || (( (HwErrAlrm_021 == 1) && (TempPos_021 == 1) && (TempDisable_021 == 0)) || (TempDisable_021 == 1) ) || (( (HwErrAlrm_021 == 1) && (TempPos_021 == 0) && (TempDisable_021 == 0)) || (TempDisable_021 == 1) ) || (( (HwErrAlrm_022 == 1) && (TempPos_022 == 0) && (TempDisable_022 == 0)) || (TempDisable_022 == 1) ) || (( (HwErrAlrm_022 == 1) && (TempPos_022 == 1) && (TempDisable_022 == 0)) || (TempDisable_022 == 1) ) || ( ((HwErrAlrm_023 == 1) && (TempPos_023 == 0) && (TempDisable_023 == 0)) || (TempDisable_023 == 1) ) || ( ((HwErrAlrm_023 == 1) && (TempPos_023 == 1) && (TempDisable_023 == 0)) || (TempDisable_023 == 1) ) || ( ((HwErrAlrm_024 == 1) && (TempPos_024 == 0) && (TempDisable_024 == 0)) || (TempDisable_024 == 1) ) || ( ((HwErrAlrm_024 == 1) && (TempPos_024 == 1) && (TempDisable_024 == 0)) || (TempDisable_024 == 1) ) || ( ((HwErrAlrm_025 == 1) && (TempPos_025 == 0) && (TempDisable_025 == 0)) || (TempDisable_025 == 1) ) || ( ((HwErrAlrm_025 == 1) && (TempPos_025 == 1) && (TempDisable_025 == 0)) || (TempDisable_025 == 1) ) || ( ((HwErrAlrm_026 == 1) && (TempPos_026 == 0) && (TempDisable_026 == 0)) || (TempDisable_026 == 1) ) || ( ((HwErrAlrm_026 == 1) && (TempPos_026 == 1) && (TempDisable_026 == 0)) || (TempDisable_026 == 1) ) || ( ((HwErrAlrm_027 == 1) && (TempPos_027 == 0) && (TempDisable_027 == 0)) || (TempDisable_027 == 1) ) || ( ((HwErrAlrm_027 == 1) && (TempPos_027 == 1) && (TempDisable_027 == 0)) || (TempDisable_027 == 1) ) || ( ((HwErrAlrm_028 == 1) && (TempPos_028 == 0) && (TempDisable_028 == 0)) || (TempDisable_028 == 1) ) || ( ((HwErrAlrm_028 == 1) && (TempPos_028 == 1) && (TempDisable_028 == 0)) || (TempDisable_028 == 1) ) || ( ((HwErrAlrm_029 == 1) && (TempPos_029 == 0) && (TempDisable_029 == 0)) || (TempDisable_029 == 1) ) || ( ((HwErrAlrm_029 == 1) && (TempPos_029 == 1) && (TempDisable_029 == 0)) || (TempDisable_029 == 1) ) || ( ((HwErrAlrm_030 == 1) && (TempPos_030 == 0) && (TempDisable_030 == 0)) || (TempDisable_030 == 1) ) || ( ((HwErrAlrm_030 == 1) && (TempPos_030 == 1) && (TempDisable_030 == 0)) || (TempDisable_030 == 1) ) || ( ((HwErrAlrm_031 == 1) && (TempPos_031 == 0) && (TempDisable_031 == 0)) || (TempDisable_031 == 1) ) || ( ((HwErrAlrm_031 == 1) && (TempPos_031 == 1) && (TempDisable_031 == 0)) || (TempDisable_031 == 1) ) || ( ((HwErrAlrm_032 == 1) && (TempPos_032 == 0) && (TempDisable_032 == 0)) || (TempDisable_032 == 1) ) || ( ((HwErrAlrm_032 == 1) && (TempPos_032 == 1) && (TempDisable_032 == 0)) || (TempDisable_032 == 1) ) || ( ((HwErrAlrm_033 == 1) && (TempPos_033 == 0) && (TempDisable_033 == 0)) || (TempDisable_033 == 1) ) || ( ((HwErrAlrm_033 == 1) && (TempPos_033 == 1) && (TempDisable_033 == 0)) || (TempDisable_033 == 1) ) || ( ((HwErrAlrm_034 == 1) && (TempPos_034 == 0) && (TempDisable_034 == 0)) || (TempDisable_034 == 1) ) || ( ((HwErrAlrm_034 == 1) && (TempPos_034 == 1) && (TempDisable_034 == 0)) || (TempDisable_034 == 1) ) || ( ((HwErrAlrm_035 == 1) && (TempPos_035 == 0) && (TempDisable_035 == 0)) || (TempDisable_035 == 1) ) || ( ((HwErrAlrm_035 == 1) && (TempPos_035 == 1) && (TempDisable_035 == 0)) || (TempDisable_035 == 1) ) || ( ((HwErrAlrm_036 == 1) && (TempPos_036 == 0) && (TempDisable_036 == 0)) || (TempDisable_036 == 1) ) || ( ((HwErrAlrm_036 == 1) && (TempPos_036 == 1) && (TempDisable_036 == 0)) || (TempDisable_036 == 1) ) || ( ((HwErrAlrm_037 == 1) && (TempPos_037 == 0) && (TempDisable_037 == 0)) || (TempDisable_037 == 1) ) || ( ((HwErrAlrm_037 == 1) && (TempPos_037 == 1) && (TempDisable_037 == 0)) || (TempDisable_037 == 1) ) || ( ((HwErrAlrm_038 == 1) && (TempPos_038 == 0) && (TempDisable_038 == 0)) || (TempDisable_038 == 1) ) || ( ((HwErrAlrm_038 == 1) && (TempPos_038 == 1) && (TempDisable_038 == 0)) || (TempDisable_038 == 1) ) || ( ((HwErrAlrm_039 == 1) && (TempPos_039 == 0) && (TempDisable_039 == 0)) || (TempDisable_039 == 1) ) || ( ((HwErrAlrm_039 == 1) && (TempPos_039 == 1) && (TempDisable_039 == 0)) || (TempDisable_039 == 1) ) || ( ((HwErrAlrm_040 == 1) && (TempPos_040 == 0) && (TempDisable_040 == 0)) || (TempDisable_040 == 1) ) || ( ((HwErrAlrm_040 == 1) && (TempPos_040 == 1) && (TempDisable_040 == 0)) || (TempDisable_040 == 1) ) || ( ((HwErrAlrm_041 == 1) && (TempPos_041 == 0) && (TempDisable_041 == 0)) || (TempDisable_041 == 1) ) || ( ((HwErrAlrm_041 == 1) && (TempPos_041 == 1) && (TempDisable_041 == 0)) || (TempDisable_041 == 1) ) || ( ((HwErrAlrm_042 == 1) && (TempPos_042 == 0) && (TempDisable_042 == 0)) || (TempDisable_042 == 1) ) || ( ((HwErrAlrm_042 == 1) && (TempPos_042 == 1) && (TempDisable_042 == 0)) || (TempDisable_042 == 1) ) || ( ((HwErrAlrm_043 == 1) && (TempPos_043 == 0) && (TempDisable_043 == 0)) || (TempDisable_043 == 1) ) || ( ((HwErrAlrm_043 == 1) && (TempPos_043 == 1) && (TempDisable_043 == 0)) || (TempDisable_043 == 1) ) || ( ((HwErrAlrm_044 == 1) && (TempPos_044 == 0) && (TempDisable_044 == 0)) || (TempDisable_044 == 1) ) || ( ((HwErrAlrm_044 == 1) && (TempPos_044 == 1) && (TempDisable_044 == 0)) || (TempDisable_044 == 1) ) || ( ((HwErrAlrm_045 == 1) && (TempPos_045 == 0) && (TempDisable_045 == 0)) || (TempDisable_045 == 1) ) || ( ((HwErrAlrm_045 == 1) && (TempPos_045 == 1) && (TempDisable_045 == 0)) || (TempDisable_045 == 1) ) || ( ((HwErrAlrm_046 == 1) && (TempPos_046 == 0) && (TempDisable_046 == 0)) || (TempDisable_046 == 1) ) || ( ((HwErrAlrm_046 == 1) && (TempPos_046 == 1) && (TempDisable_046 == 0)) || (TempDisable_046 == 1) ) || ( ((HwErrAlrm_047 == 1) && (TempPos_047 == 0) && (TempDisable_047 == 0)) || (TempDisable_047 == 1) ) || ( ((HwErrAlrm_047 == 1) && (TempPos_047 == 1) && (TempDisable_047 == 0)) || (TempDisable_047 == 1) ) || ( ((HwErrAlrm_048 == 1) && (TempPos_048 == 0) && (TempDisable_048 == 0)) || (TempDisable_048 == 1) ) || ( ((HwErrAlrm_048 == 1) && (TempPos_048 == 1) && (TempDisable_048 == 0)) || (TempDisable_048 == 1) ) || ( ((HwErrAlrm_049 == 1) && (TempPos_049 == 0) && (TempDisable_049 == 0)) || (TempDisable_049 == 1) ) || ( ((HwErrAlrm_049 == 1) && (TempPos_049 == 1) && (TempDisable_049 == 0)) || (TempDisable_049 == 1) ) || ( ((HwErrAlrm_050 == 1) && (TempPos_050 == 0) && (TempDisable_050 == 0)) || (TempDisable_050 == 1) ) || ( ((HwErrAlrm_050 == 1) && (TempPos_050 == 1) && (TempDisable_050 == 0)) || (TempDisable_050 == 1) ) || ( ((HwErrAlrm_051 == 1) && (TempPos_051 == 0) && (TempDisable_051 == 0)) || (TempDisable_051 == 1) ) || ( ((HwErrAlrm_051 == 1) && (TempPos_051 == 1) && (TempDisable_051 == 0)) || (TempDisable_051 == 1) ) || ( ((HwErrAlrm_052 == 1) && (TempPos_052 == 0) && (TempDisable_052 == 0)) || (TempDisable_052 == 1) ) || ( ((HwErrAlrm_052 == 1) && (TempPos_052 == 1) && (TempDisable_052 == 0)) || (TempDisable_052 == 1) ) || ( ((HwErrAlrm_053 == 1) && (TempPos_053 == 0) && (TempDisable_053 == 0)) || (TempDisable_053 == 1) ) || ( ((HwErrAlrm_053 == 1) && (TempPos_053 == 1) && (TempDisable_053 == 0)) || (TempDisable_053 == 1) ) || ( ((HwErrAlrm_054 == 1) && (TempPos_054 == 0) && (TempDisable_054 == 0)) || (TempDisable_054 == 1) ) || ( ((HwErrAlrm_054 == 1) && (TempPos_054 == 1) && (TempDisable_054 == 0)) || (TempDisable_054 == 1) ) || ( ((HwErrAlrm_055 == 1) && (TempPos_055 == 0) && (TempDisable_055 == 0)) || (TempDisable_055 == 1) ) || ( ((HwErrAlrm_055 == 1) && (TempPos_055 == 1) && (TempDisable_055 == 0)) || (TempDisable_055 == 1) ) || ( ((HwErrAlrm_056 == 1) && (TempPos_056 == 0) && (TempDisable_056 == 0)) || (TempDisable_056 == 1) ) || ( ((HwErrAlrm_056 == 1) && (TempPos_056 == 1) && (TempDisable_056 == 0)) || (TempDisable_056 == 1) ) || ( ((HwErrAlrm_057 == 1) && (TempPos_057 == 0) && (TempDisable_057 == 0)) || (TempDisable_057 == 1) ) || ( ((HwErrAlrm_057 == 1) && (TempPos_057 == 1) && (TempDisable_057 == 0)) || (TempDisable_057 == 1) ) || ( ((HwErrAlrm_058 == 1) && (TempPos_058 == 0) && (TempDisable_058 == 0)) || (TempDisable_058 == 1) ) || ( ((HwErrAlrm_058 == 1) && (TempPos_058 == 1) && (TempDisable_058 == 0)) || (TempDisable_058 == 1) ) || ( ((HwErrAlrm_059 == 1) && (TempPos_059 == 0) && (TempDisable_059 == 0)) || (TempDisable_059 == 1) ) || ( ((HwErrAlrm_059 == 1) && (TempPos_059 == 1) && (TempDisable_059 == 0)) || (TempDisable_059 == 1) ) || ( ((HwErrAlrm_060 == 1) && (TempPos_060 == 0) && (TempDisable_060 == 0)) || (TempDisable_060 == 1) ) || ( ((HwErrAlrm_060 == 1) && (TempPos_060 == 1) && (TempDisable_060 == 0)) || (TempDisable_060 == 1) ) || ( ((HwErrAlrm_100 == 1) && (TempPos_100 == 0) && (TempDisable_100 == 0)) || (TempDisable_100 == 1) ) || ( ((HwErrAlrm_100 == 1) && (TempPos_100 == 1) && (TempDisable_100 == 0)) || (TempDisable_100 == 1) ) || ( ((HwErrAlrm_200 == 1) && (TempPos_200 == 0) && (TempDisable_200 == 0)) || (TempDisable_200 == 1) ) || ( ((HwErrAlrm_200 == 1) && (TempPos_200 == 1) && (TempDisable_200 == 0)) || (TempDisable_200 == 1) ) ) {

    RfSlow_okstatus=0;
    pvPut(RfSlow_okstatus);
    printf("[SEQ TEMPERATURE  - TANK1] MINOR Error in hardware connection: possible broken sensor\n");
    printf("[SEQ TEMPERATURE  - TANK1] Set TANK 1 Temperature OK STATUS to 0: INTERLOCK \n");
  } state maintenance

  /* Sensor broken  */
  when ( (( (HwErrAlrm_001 == 1) && (HwUnderLimAlrm_001 == 1) && (HwOverLimAlrm_001 == 1)) || (TempDisable_001 == 1) ) || (( (HwErrAlrm_002 == 1) && (HwUnderLimAlrm_002 == 1) && (HwOverLimAlrm_002 == 1)) || (TempDisable_002 == 1) ) || (( (HwErrAlrm_003 == 1) && (HwUnderLimAlrm_003 == 1) && (HwOverLimAlrm_003 == 1)) || (TempDisable_003 == 1) ) || (( (HwErrAlrm_004 == 1) && (HwUnderLimAlrm_004 == 1) && (HwOverLimAlrm_004 == 1)) || (TempDisable_004 == 1) ) || (( (HwErrAlrm_005 == 1) && (HwUnderLimAlrm_005 == 1) && (HwOverLimAlrm_005 == 1)) || (TempDisable_005 == 1) ) || (( (HwErrAlrm_006 == 1) && (HwUnderLimAlrm_006 == 1) && (HwOverLimAlrm_006 == 1)) || (TempDisable_006 == 1) ) || (( (HwErrAlrm_007 == 1) && (HwUnderLimAlrm_007 == 1) && (HwOverLimAlrm_007 == 1)) || (TempDisable_007 == 1) ) || (( (HwErrAlrm_008 == 1) && (HwUnderLimAlrm_008 == 1) && (HwOverLimAlrm_008 == 1)) || (TempDisable_008 == 1) ) || (( (HwErrAlrm_009 == 1) && (HwUnderLimAlrm_009 == 1) && (HwOverLimAlrm_009 == 1)) || (TempDisable_009 == 1) ) || (( (HwErrAlrm_010 == 1) && (HwUnderLimAlrm_010 == 1) && (HwOverLimAlrm_010 == 1)) || (TempDisable_010 == 1) ) || (( (HwErrAlrm_011 == 1) && (HwUnderLimAlrm_011 == 1) && (HwOverLimAlrm_011 == 1)) || (TempDisable_011 == 1) ) || (( (HwErrAlrm_012 == 1) && (HwUnderLimAlrm_012 == 1) && (HwOverLimAlrm_012 == 1)) || (TempDisable_012 == 1) ) || (( (HwErrAlrm_013 == 1) && (HwUnderLimAlrm_013 == 1) && (HwOverLimAlrm_013 == 1)) || (TempDisable_013 == 1) ) || (( (HwErrAlrm_014 == 1) && (HwUnderLimAlrm_014 == 1) && (HwOverLimAlrm_014 == 1)) || (TempDisable_014 == 1) ) || (( (HwErrAlrm_015 == 1) && (HwUnderLimAlrm_015 == 1) && (HwOverLimAlrm_015 == 1)) || (TempDisable_015 == 1) ) || (( (HwErrAlrm_016 == 1) && (HwUnderLimAlrm_016 == 1) && (HwOverLimAlrm_016 == 1)) || (TempDisable_016 == 1) ) || (( (HwErrAlrm_017 == 1) && (HwUnderLimAlrm_017 == 1) && (HwOverLimAlrm_017 == 1)) || (TempDisable_017 == 1) ) || (( (HwErrAlrm_018 == 1) && (HwUnderLimAlrm_018 == 1) && (HwOverLimAlrm_018 == 1)) || (TempDisable_018 == 1) ) || (( (HwErrAlrm_019 == 1) && (HwUnderLimAlrm_019 == 1) && (HwOverLimAlrm_019 == 1)) || (TempDisable_019 == 1) ) || (( (HwErrAlrm_020 == 1) && (HwUnderLimAlrm_020 == 1) && (HwOverLimAlrm_020 == 1)) || (TempDisable_020 == 1) ) || (( (HwErrAlrm_021 == 1) && (HwUnderLimAlrm_021 == 1) && (HwOverLimAlrm_021 == 1)) || (TempDisable_021 == 1) ) || (( (HwErrAlrm_022 == 1) && (HwUnderLimAlrm_022 == 1) && (HwOverLimAlrm_022 == 1)) || (TempDisable_022 == 1) ) || ( ((HwErrAlrm_023 == 1) && (HwUnderLimAlrm_023 == 1) && (HwOverLimAlrm_023 == 1)) || (TempDisable_023 == 1) ) || ( ((HwErrAlrm_024 == 1) && (HwUnderLimAlrm_024 == 1) && (HwOverLimAlrm_024 == 1)) || (TempDisable_024 == 1) ) || ( ((HwErrAlrm_025 == 1) && (HwUnderLimAlrm_025 == 1) && (HwOverLimAlrm_025 == 1)) || (TempDisable_025 == 1) ) || ( ((HwErrAlrm_026 == 1) && (HwUnderLimAlrm_026 == 1) && (HwOverLimAlrm_026 == 1)) || (TempDisable_026 == 1) ) || ( ((HwErrAlrm_027 == 1) && (HwUnderLimAlrm_027 == 1) && (HwOverLimAlrm_027 == 1)) || (TempDisable_027 == 1) ) || ( ((HwErrAlrm_028 == 1) && (HwUnderLimAlrm_028 == 1) && (HwOverLimAlrm_028 == 1)) || (TempDisable_028 == 1) ) || ( ((HwErrAlrm_029 == 1) && (HwUnderLimAlrm_029 == 1) && (HwOverLimAlrm_029 == 1)) || (TempDisable_029 == 1) ) || ( ((HwErrAlrm_030 == 1) && (HwUnderLimAlrm_030 == 1) && (HwOverLimAlrm_030 == 1)) || (TempDisable_030 == 1) ) || ( ((HwErrAlrm_031 == 1) && (HwUnderLimAlrm_031 == 1) && (HwOverLimAlrm_031 == 1)) || (TempDisable_031 == 1) ) || ( ((HwErrAlrm_032 == 1) && (HwUnderLimAlrm_032 == 1) && (HwOverLimAlrm_032 == 1)) || (TempDisable_032 == 1) ) || ( ((HwErrAlrm_033 == 1) && (HwUnderLimAlrm_033 == 1) && (HwOverLimAlrm_033 == 1)) || (TempDisable_033 == 1) ) || ( ((HwErrAlrm_034 == 1) && (HwUnderLimAlrm_034 == 1) && (HwOverLimAlrm_034 == 1)) || (TempDisable_034 == 1) ) || ( ((HwErrAlrm_035 == 1) && (HwUnderLimAlrm_035 == 1) && (HwOverLimAlrm_035 == 1)) || (TempDisable_035 == 1) ) || ( ((HwErrAlrm_036 == 1) && (HwUnderLimAlrm_036 == 1) && (HwOverLimAlrm_036 == 1)) || (TempDisable_036 == 1) ) || ( ((HwErrAlrm_037 == 1) && (HwUnderLimAlrm_037 == 1) && (HwOverLimAlrm_037 == 1)) || (TempDisable_037 == 1) ) || ( ((HwErrAlrm_038 == 1) && (HwUnderLimAlrm_038 == 1) && (HwOverLimAlrm_038 == 1)) || (TempDisable_038 == 1) ) || ( ((HwErrAlrm_039 == 1) && (HwUnderLimAlrm_039 == 1) && (HwOverLimAlrm_039 == 1)) || (TempDisable_039 == 1) ) || ( ((HwErrAlrm_040 == 1) && (HwUnderLimAlrm_040 == 1) && (HwOverLimAlrm_040 == 1)) || (TempDisable_040 == 1) ) || ( ((HwErrAlrm_041 == 1) && (HwUnderLimAlrm_041 == 1) && (HwOverLimAlrm_041 == 1)) || (TempDisable_041 == 1) ) || ( ((HwErrAlrm_042 == 1) && (HwUnderLimAlrm_042 == 1) && (HwOverLimAlrm_042 == 1)) || (TempDisable_042 == 1) ) || ( ((HwErrAlrm_043 == 1) && (HwUnderLimAlrm_043 == 1) && (HwOverLimAlrm_043 == 1)) || (TempDisable_043 == 1) ) || ( ((HwErrAlrm_044 == 1) && (HwUnderLimAlrm_044 == 1) && (HwOverLimAlrm_044 == 1)) || (TempDisable_044 == 1) ) || ( ((HwErrAlrm_045 == 1) && (HwUnderLimAlrm_045 == 1) && (HwOverLimAlrm_045 == 1)) || (TempDisable_045 == 1) ) || ( ((HwErrAlrm_046 == 1) && (HwUnderLimAlrm_046 == 1) && (HwOverLimAlrm_046 == 1)) || (TempDisable_046 == 1) ) || ( ((HwErrAlrm_047 == 1) && (HwUnderLimAlrm_047 == 1) && (HwOverLimAlrm_047 == 1)) || (TempDisable_047 == 1) ) || ( ((HwErrAlrm_048 == 1) && (HwUnderLimAlrm_048 == 1) && (HwOverLimAlrm_048 == 1)) || (TempDisable_048 == 1) ) || ( ((HwErrAlrm_049 == 1) && (HwUnderLimAlrm_049 == 1) && (HwOverLimAlrm_049 == 1)) || (TempDisable_049 == 1) ) || ( ((HwErrAlrm_050 == 1) && (HwUnderLimAlrm_050 == 1) && (HwOverLimAlrm_050 == 1)) || (TempDisable_050 == 1) ) || ( ((HwErrAlrm_051 == 1) && (HwUnderLimAlrm_051 == 1) && (HwOverLimAlrm_051 == 1)) || (TempDisable_051 == 1) ) || ( ((HwErrAlrm_052 == 1) && (HwUnderLimAlrm_052 == 1) && (HwOverLimAlrm_052 == 1)) || (TempDisable_052 == 1) ) || ( ((HwErrAlrm_053 == 1) && (HwUnderLimAlrm_053 == 1) && (HwOverLimAlrm_053 == 1)) || (TempDisable_053 == 1) ) || ( ((HwErrAlrm_054 == 1) && (HwUnderLimAlrm_054 == 1) && (HwOverLimAlrm_054 == 1)) || (TempDisable_054 == 1) ) || ( ((HwErrAlrm_055 == 1) && (HwUnderLimAlrm_055 == 1) && (HwOverLimAlrm_055 == 1)) || (TempDisable_055 == 1) ) || ( ((HwErrAlrm_056 == 1) && (HwUnderLimAlrm_056 == 1) && (HwOverLimAlrm_056 == 1)) || (TempDisable_056 == 1) ) || ( ((HwErrAlrm_057 == 1) && (HwUnderLimAlrm_057 == 1) && (HwOverLimAlrm_057 == 1)) || (TempDisable_057 == 1) ) || ( ((HwErrAlrm_058 == 1) && (HwUnderLimAlrm_058 == 1) && (HwOverLimAlrm_058 == 1)) || (TempDisable_058 == 1) ) || ( ((HwErrAlrm_059 == 1) && (HwUnderLimAlrm_059 == 1) && (HwOverLimAlrm_059 == 1)) || (TempDisable_059 == 1) ) || ( ((HwErrAlrm_060 == 1) && (HwUnderLimAlrm_060 == 1) && (HwOverLimAlrm_060 == 1)) || (TempDisable_060 == 1) ) || ( ((HwErrAlrm_100 == 1) && (HwUnderLimAlrm_100 == 1) && (HwOverLimAlrm_100 == 1)) || (TempDisable_100 == 1) ) || ( ((HwErrAlrm_200 == 1) && (HwUnderLimAlrm_200 == 1) && (HwOverLimAlrm_200 == 1)) || (TempDisable_200 == 1) ) ) {

    RfSlow_okstatus=0;
    pvPut(RfSlow_okstatus);
    printf("[SEQ TEMPERATURE  - TANK1] MINOR Error in hardware connection: possible broken sensor\n");
    printf("[SEQ TEMPERATURE  - TANK1] Set TANK 1 Temperature OK STATUS to 0: INTERLOCK \n");
  } state failure

}


/* state FAILURE	*/
  state failure {

    entry {
        printf("\n[SEQ TEMPERATURE  - TANK1] Enter in FAILURE status\n");
        StateMachineCode=50;
        pvPut(StateMachineCode);
    }

    /* No error in any temperature sensor enabled */
    when ( ( FaultReset == 1 ) && ( ((HwErrAlrm_001 == 0) && (TempIlk_001 == 0) && (TempDisable_001 == 0)) || (TempDisable_001 == 1) ) && ( ((HwErrAlrm_002 == 0) && (TempIlk_002 == 0) && (TempDisable_002 == 0)) || (TempDisable_002 == 1) ) && ( ((HwErrAlrm_003 == 0) && (TempIlk_003 == 0) && (TempDisable_003 == 0)) || (TempDisable_003 == 1) ) && ( ((HwErrAlrm_004 == 0) && (TempIlk_004 == 0) && (TempDisable_004 == 0)) || (TempDisable_004 == 1) ) && ( ((HwErrAlrm_005 == 0) && (TempIlk_005 == 0) && (TempDisable_005 == 0)) || (TempDisable_005 == 1) ) && ( ((HwErrAlrm_006 == 0) && (TempIlk_006 == 0) && (TempDisable_006 == 0)) || (TempDisable_006 == 1) ) && ( ((HwErrAlrm_007 == 0) && (TempIlk_007 == 0) && (TempDisable_007 == 0)) || (TempDisable_007 == 1) ) && ( ((HwErrAlrm_008 == 0) && (TempIlk_008 == 0) && (TempDisable_008 == 0)) || (TempDisable_008 == 1) ) && ( ((HwErrAlrm_009 == 0) && (TempIlk_009 == 0) && (TempDisable_009 == 0)) || (TempDisable_009 == 1) ) && ( ((HwErrAlrm_010 == 0) && (TempIlk_010 == 0) && (TempDisable_010 == 0)) || (TempDisable_010 == 1) ) && ( ((HwErrAlrm_011 == 0) && (TempIlk_011 == 0) && (TempDisable_011 == 0)) || (TempDisable_011 == 1) ) && ( ((HwErrAlrm_012 == 0) && (TempIlk_012 == 0) && (TempDisable_012 == 0)) || (TempDisable_012 == 1) ) && ( ((HwErrAlrm_013 == 0) && (TempIlk_013 == 0) && (TempDisable_013 == 0)) || (TempDisable_013 == 1) ) && ( ((HwErrAlrm_014 == 0) && (TempIlk_014 == 0) && (TempDisable_014 == 0)) || (TempDisable_014 == 1) ) && ( ((HwErrAlrm_015 == 0) && (TempIlk_015 == 0) && (TempDisable_015 == 0)) || (TempDisable_015 == 1) ) && ( ((HwErrAlrm_016 == 0) && (TempIlk_016 == 0) && (TempDisable_016 == 0)) || (TempDisable_016 == 1) ) && ( ((HwErrAlrm_017 == 0) && (TempIlk_017 == 0) && (TempDisable_017 == 0)) || (TempDisable_017 == 1) ) && ( ((HwErrAlrm_018 == 0) && (TempIlk_018 == 0) && (TempDisable_018 == 0)) || (TempDisable_018 == 1) ) && ( ((HwErrAlrm_019 == 0) && (TempIlk_019 == 0) && (TempDisable_019 == 0)) || (TempDisable_019 == 1) ) && ( ((HwErrAlrm_020 == 0) && (TempIlk_020 == 0) && (TempDisable_020 == 0)) || (TempDisable_020 == 1) ) && ( ((HwErrAlrm_021 == 0) && (TempIlk_021 == 0) && (TempDisable_021 == 0)) || (TempDisable_021 == 1) ) && ( ((HwErrAlrm_022 == 0) && (TempIlk_022 == 0) && (TempDisable_022 == 0)) || (TempDisable_022 == 1) ) && ( ((HwErrAlrm_023 == 0) && (TempIlk_023 == 0) && (TempDisable_023 == 0)) || (TempDisable_023 == 1) ) && ( ((HwErrAlrm_024 == 0) && (TempIlk_024 == 0) && (TempDisable_024 == 0)) || (TempDisable_024 == 1) ) && ( ((HwErrAlrm_025 == 0) && (TempIlk_025 == 0) && (TempDisable_025 == 0)) || (TempDisable_025 == 1) ) && ( ((HwErrAlrm_026 == 0) && (TempIlk_026 == 0) && (TempDisable_026 == 0)) || (TempDisable_026 == 1) ) && ( ((HwErrAlrm_027 == 0) && (TempIlk_027 == 0) && (TempDisable_027 == 0)) || (TempDisable_027 == 1) ) && ( ((HwErrAlrm_028 == 0) && (TempIlk_028 == 0) && (TempDisable_028 == 0)) || (TempDisable_028 == 1) ) && ( ((HwErrAlrm_029 == 0) && (TempIlk_029 == 0) && (TempDisable_029 == 0)) || (TempDisable_029 == 1) ) && ( ((HwErrAlrm_030 == 0) && (TempIlk_030 == 0) && (TempDisable_030 == 0)) || (TempDisable_030 == 1) ) && ( ((HwErrAlrm_031 == 0) && (TempIlk_031 == 0) && (TempDisable_031 == 0)) || (TempDisable_031 == 1) ) && ( ((HwErrAlrm_032 == 0) && (TempIlk_032 == 0) && (TempDisable_032 == 0)) || (TempDisable_032 == 1) ) && ( ((HwErrAlrm_033 == 0) && (TempIlk_033 == 0) && (TempDisable_033 == 0)) || (TempDisable_033 == 1) ) && ( ((HwErrAlrm_034 == 0) && (TempIlk_034 == 0) && (TempDisable_034 == 0)) || (TempDisable_034 == 1) ) && ( ((HwErrAlrm_035 == 0) && (TempIlk_035 == 0) && (TempDisable_035 == 0)) || (TempDisable_035 == 1) ) && ( ((HwErrAlrm_036 == 0) && (TempIlk_036 == 0) && (TempDisable_036 == 0)) || (TempDisable_036 == 1) ) && ( ((HwErrAlrm_037 == 0) && (TempIlk_037 == 0) && (TempDisable_037 == 0)) || (TempDisable_037 == 1) ) && ( ((HwErrAlrm_038 == 0) && (TempIlk_038 == 0) && (TempDisable_038 == 0)) || (TempDisable_038 == 1) ) && ( ((HwErrAlrm_039 == 0) && (TempIlk_039 == 0) && (TempDisable_039 == 0)) || (TempDisable_039 == 1) ) && ( ((HwErrAlrm_040 == 0) && (TempIlk_040 == 0) && (TempDisable_040 == 0)) || (TempDisable_040 == 1) ) && ( ((HwErrAlrm_041 == 0) && (TempIlk_041 == 0) && (TempDisable_041 == 0)) || (TempDisable_041 == 1) ) && ( ((HwErrAlrm_042 == 0) && (TempIlk_042 == 0) && (TempDisable_042 == 0)) || (TempDisable_042 == 1) ) && ( ((HwErrAlrm_043 == 0) && (TempIlk_043 == 0) && (TempDisable_043 == 0)) || (TempDisable_043 == 1) ) && ( ((HwErrAlrm_044 == 0) && (TempIlk_044 == 0) && (TempDisable_044 == 0)) || (TempDisable_044 == 1) ) && ( ((HwErrAlrm_045 == 0) && (TempIlk_045 == 0) && (TempDisable_045 == 0)) || (TempDisable_045 == 1) ) && ( ((HwErrAlrm_046 == 0) && (TempIlk_046 == 0) && (TempDisable_046 == 0)) || (TempDisable_046 == 1) ) && ( ((HwErrAlrm_047 == 0) && (TempIlk_047 == 0) && (TempDisable_047 == 0)) || (TempDisable_047 == 1) ) && ( ((HwErrAlrm_048 == 0) && (TempIlk_048 == 0) && (TempDisable_048 == 0)) || (TempDisable_048 == 1) ) && ( ((HwErrAlrm_049 == 0) && (TempIlk_049 == 0) && (TempDisable_049 == 0)) || (TempDisable_049 == 1) ) && ( ((HwErrAlrm_050 == 0) && (TempIlk_050 == 0) && (TempDisable_050 == 0)) || (TempDisable_050 == 1) ) && ( ((HwErrAlrm_051 == 0) && (TempIlk_051 == 0) && (TempDisable_051 == 0)) || (TempDisable_051 == 1) ) && ( ((HwErrAlrm_052 == 0) && (TempIlk_052 == 0) && (TempDisable_052 == 0)) || (TempDisable_052 == 1) ) && ( ((HwErrAlrm_053 == 0) && (TempIlk_053 == 0) && (TempDisable_053 == 0)) || (TempDisable_053 == 1) ) && ( ((HwErrAlrm_054 == 0) && (TempIlk_054 == 0) && (TempDisable_054 == 0)) || (TempDisable_054 == 1) ) && ( ((HwErrAlrm_055 == 0) && (TempIlk_055 == 0) && (TempDisable_055 == 0)) || (TempDisable_055 == 1) ) && ( ((HwErrAlrm_056 == 0) && (TempIlk_056 == 0) && (TempDisable_056 == 0)) || (TempDisable_056 == 1) ) && ( ((HwErrAlrm_057 == 0) && (TempIlk_057 == 0) && (TempDisable_057 == 0)) || (TempDisable_057 == 1) ) && ( ((HwErrAlrm_058 == 0) && (TempIlk_058 == 0) && (TempDisable_058 == 0)) || (TempDisable_058 == 1) ) && ( ((HwErrAlrm_059 == 0) && (TempIlk_059 == 0) && (TempDisable_059 == 0)) || (TempDisable_059 == 1) ) && ( ((HwErrAlrm_060 == 0) && (TempIlk_060 == 0) && (TempDisable_060 == 0)) || (TempDisable_060 == 1) ) && ( ((HwErrAlrm_100 == 0) && (TempIlk_100 == 0) && (TempDisable_100 == 0)) || (TempDisable_100 == 1) ) && ( ((HwErrAlrm_200 == 0) && (TempIlk_200 == 0) && (TempDisable_200 == 0)) || (TempDisable_200 == 1) ) ) {

        printf("[SEQ TEMPERATURE  - TANK1] Failure Stage reset by Operator. \n");
        printf("[SEQ TEMPERATURE  - TANK1] Reset conditions satisfied.\n");

        /* Reset FaultReset command */
        FaultReset=0;
        pvPut(FaultReset);

    } state maintenance

  }


/* state MAINTENANCE	*/
  state maintenance {

    entry {
        printf("\n[SEQ TEMPERATURE  - TANK1] Enter in MAINTENANCE status\n");
        StateMachineCode=60;
        pvPut(StateMachineCode);
    }

    /* No error in any temperature sensor enabled */
    when ( ( MaintenanceReset == 1 ) && ( ((HwErrAlrm_001 == 0) && (TempIlk_001 == 0) && (TempDisable_001 == 0)) || (TempDisable_001 == 1) ) && ( ((HwErrAlrm_002 == 0) && (TempIlk_002 == 0) && (TempDisable_002 == 0)) || (TempDisable_002 == 1) ) && ( ((HwErrAlrm_003 == 0) && (TempIlk_003 == 0) && (TempDisable_003 == 0)) || (TempDisable_003 == 1) ) && ( ((HwErrAlrm_004 == 0) && (TempIlk_004 == 0) && (TempDisable_004 == 0)) || (TempDisable_004 == 1) ) && ( ((HwErrAlrm_005 == 0) && (TempIlk_005 == 0) && (TempDisable_005 == 0)) || (TempDisable_005 == 1) ) && ( ((HwErrAlrm_006 == 0) && (TempIlk_006 == 0) && (TempDisable_006 == 0)) || (TempDisable_006 == 1) ) && ( ((HwErrAlrm_007 == 0) && (TempIlk_007 == 0) && (TempDisable_007 == 0)) || (TempDisable_007 == 1) ) && ( ((HwErrAlrm_008 == 0) && (TempIlk_008 == 0) && (TempDisable_008 == 0)) || (TempDisable_008 == 1) ) && ( ((HwErrAlrm_009 == 0) && (TempIlk_009 == 0) && (TempDisable_009 == 0)) || (TempDisable_009 == 1) ) && ( ((HwErrAlrm_010 == 0) && (TempIlk_010 == 0) && (TempDisable_010 == 0)) || (TempDisable_010 == 1) ) && ( ((HwErrAlrm_011 == 0) && (TempIlk_011 == 0) && (TempDisable_011 == 0)) || (TempDisable_011 == 1) ) && ( ((HwErrAlrm_012 == 0) && (TempIlk_012 == 0) && (TempDisable_012 == 0)) || (TempDisable_012 == 1) ) && ( ((HwErrAlrm_013 == 0) && (TempIlk_013 == 0) && (TempDisable_013 == 0)) || (TempDisable_013 == 1) ) && ( ((HwErrAlrm_014 == 0) && (TempIlk_014 == 0) && (TempDisable_014 == 0)) || (TempDisable_014 == 1) ) && ( ((HwErrAlrm_015 == 0) && (TempIlk_015 == 0) && (TempDisable_015 == 0)) || (TempDisable_015 == 1) ) && ( ((HwErrAlrm_016 == 0) && (TempIlk_016 == 0) && (TempDisable_016 == 0)) || (TempDisable_016 == 1) ) && ( ((HwErrAlrm_017 == 0) && (TempIlk_017 == 0) && (TempDisable_017 == 0)) || (TempDisable_017 == 1) ) && ( ((HwErrAlrm_018 == 0) && (TempIlk_018 == 0) && (TempDisable_018 == 0)) || (TempDisable_018 == 1) ) && ( ((HwErrAlrm_019 == 0) && (TempIlk_019 == 0) && (TempDisable_019 == 0)) || (TempDisable_019 == 1) ) && ( ((HwErrAlrm_020 == 0) && (TempIlk_020 == 0) && (TempDisable_020 == 0)) || (TempDisable_020 == 1) ) && ( ((HwErrAlrm_021 == 0) && (TempIlk_021 == 0) && (TempDisable_021 == 0)) || (TempDisable_021 == 1) ) && ( ((HwErrAlrm_022 == 0) && (TempIlk_022 == 0) && (TempDisable_022 == 0)) || (TempDisable_022 == 1) ) && ( ((HwErrAlrm_023 == 0) && (TempIlk_023 == 0) && (TempDisable_023 == 0)) || (TempDisable_023 == 1) ) && ( ((HwErrAlrm_024 == 0) && (TempIlk_024 == 0) && (TempDisable_024 == 0)) || (TempDisable_024 == 1) ) && ( ((HwErrAlrm_025 == 0) && (TempIlk_025 == 0) && (TempDisable_025 == 0)) || (TempDisable_025 == 1) ) && ( ((HwErrAlrm_026 == 0) && (TempIlk_026 == 0) && (TempDisable_026 == 0)) || (TempDisable_026 == 1) ) && ( ((HwErrAlrm_027 == 0) && (TempIlk_027 == 0) && (TempDisable_027 == 0)) || (TempDisable_027 == 1) ) && ( ((HwErrAlrm_028 == 0) && (TempIlk_028 == 0) && (TempDisable_028 == 0)) || (TempDisable_028 == 1) ) && ( ((HwErrAlrm_029 == 0) && (TempIlk_029 == 0) && (TempDisable_029 == 0)) || (TempDisable_029 == 1) ) && ( ((HwErrAlrm_030 == 0) && (TempIlk_030 == 0) && (TempDisable_030 == 0)) || (TempDisable_030 == 1) ) && ( ((HwErrAlrm_031 == 0) && (TempIlk_031 == 0) && (TempDisable_031 == 0)) || (TempDisable_031 == 1) ) && ( ((HwErrAlrm_032 == 0) && (TempIlk_032 == 0) && (TempDisable_032 == 0)) || (TempDisable_032 == 1) ) && ( ((HwErrAlrm_033 == 0) && (TempIlk_033 == 0) && (TempDisable_033 == 0)) || (TempDisable_033 == 1) ) && ( ((HwErrAlrm_034 == 0) && (TempIlk_034 == 0) && (TempDisable_034 == 0)) || (TempDisable_034 == 1) ) && ( ((HwErrAlrm_035 == 0) && (TempIlk_035 == 0) && (TempDisable_035 == 0)) || (TempDisable_035 == 1) ) && ( ((HwErrAlrm_036 == 0) && (TempIlk_036 == 0) && (TempDisable_036 == 0)) || (TempDisable_036 == 1) ) && ( ((HwErrAlrm_037 == 0) && (TempIlk_037 == 0) && (TempDisable_037 == 0)) || (TempDisable_037 == 1) ) && ( ((HwErrAlrm_038 == 0) && (TempIlk_038 == 0) && (TempDisable_038 == 0)) || (TempDisable_038 == 1) ) && ( ((HwErrAlrm_039 == 0) && (TempIlk_039 == 0) && (TempDisable_039 == 0)) || (TempDisable_039 == 1) ) && ( ((HwErrAlrm_040 == 0) && (TempIlk_040 == 0) && (TempDisable_040 == 0)) || (TempDisable_040 == 1) ) && ( ((HwErrAlrm_041 == 0) && (TempIlk_041 == 0) && (TempDisable_041 == 0)) || (TempDisable_041 == 1) ) && ( ((HwErrAlrm_042 == 0) && (TempIlk_042 == 0) && (TempDisable_042 == 0)) || (TempDisable_042 == 1) ) && ( ((HwErrAlrm_043 == 0) && (TempIlk_043 == 0) && (TempDisable_043 == 0)) || (TempDisable_043 == 1) ) && ( ((HwErrAlrm_044 == 0) && (TempIlk_044 == 0) && (TempDisable_044 == 0)) || (TempDisable_044 == 1) ) && ( ((HwErrAlrm_045 == 0) && (TempIlk_045 == 0) && (TempDisable_045 == 0)) || (TempDisable_045 == 1) ) && ( ((HwErrAlrm_046 == 0) && (TempIlk_046 == 0) && (TempDisable_046 == 0)) || (TempDisable_046 == 1) ) && ( ((HwErrAlrm_047 == 0) && (TempIlk_047 == 0) && (TempDisable_047 == 0)) || (TempDisable_047 == 1) ) && ( ((HwErrAlrm_048 == 0) && (TempIlk_048 == 0) && (TempDisable_048 == 0)) || (TempDisable_048 == 1) ) && ( ((HwErrAlrm_049 == 0) && (TempIlk_049 == 0) && (TempDisable_049 == 0)) || (TempDisable_049 == 1) ) && ( ((HwErrAlrm_050 == 0) && (TempIlk_050 == 0) && (TempDisable_050 == 0)) || (TempDisable_050 == 1) ) && ( ((HwErrAlrm_051 == 0) && (TempIlk_051 == 0) && (TempDisable_051 == 0)) || (TempDisable_051 == 1) ) && ( ((HwErrAlrm_052 == 0) && (TempIlk_052 == 0) && (TempDisable_052 == 0)) || (TempDisable_052 == 1) ) && ( ((HwErrAlrm_053 == 0) && (TempIlk_053 == 0) && (TempDisable_053 == 0)) || (TempDisable_053 == 1) ) && ( ((HwErrAlrm_054 == 0) && (TempIlk_054 == 0) && (TempDisable_054 == 0)) || (TempDisable_054 == 1) ) && ( ((HwErrAlrm_055 == 0) && (TempIlk_055 == 0) && (TempDisable_055 == 0)) || (TempDisable_055 == 1) ) && ( ((HwErrAlrm_056 == 0) && (TempIlk_056 == 0) && (TempDisable_056 == 0)) || (TempDisable_056 == 1) ) && ( ((HwErrAlrm_057 == 0) && (TempIlk_057 == 0) && (TempDisable_057 == 0)) || (TempDisable_057 == 1) ) && ( ((HwErrAlrm_058 == 0) && (TempIlk_058 == 0) && (TempDisable_058 == 0)) || (TempDisable_058 == 1) ) && ( ((HwErrAlrm_059 == 0) && (TempIlk_059 == 0) && (TempDisable_059 == 0)) || (TempDisable_059 == 1) ) && ( ((HwErrAlrm_060 == 0) && (TempIlk_060 == 0) && (TempDisable_060 == 0)) || (TempDisable_060 == 1) ) && ( ((HwErrAlrm_100 == 0) && (TempIlk_100 == 0) && (TempDisable_100 == 0)) || (TempDisable_100 == 1) ) && ( ((HwErrAlrm_200 == 0) && (TempIlk_200 == 0) && (TempDisable_200 == 0)) || (TempDisable_200 == 1) ) ) {

        printf("[SEQ TEMPERATURE  - TANK1] Maintenance Stage reset by Operator\n");
        printf("[SEQ TEMPERATURE  - TANK1] Starting TANK 1 State Machine re-initialization\n");

        /* Reset MaintenanceReset command */
        MaintenanceReset=0;
        pvPut(MaintenanceReset);

    } state initialization


  }


/* end statemachine */
}
