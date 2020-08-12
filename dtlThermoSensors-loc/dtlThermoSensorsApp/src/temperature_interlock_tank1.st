/* DTL Temperature Interlock -  State Machine 
# State Machine devoted to supervise alarm and interlock for thermo sensors sub-system :
#
# Principal States:
# - Initialization:
# 	* Initalize State Machine when EPICS application starts
# - Normal-Operation:
#       * Normal operation status
# - Interlock:
#       * system raises an interlock
#
#
# developed by Maurizio Montis | INFN-LNL
# mail: maurizio.montis@lnl.infn.it
*/ 


program temperature010_interlock


/*
# Libraries
*/

%%#include <stdio.h>
%%#include <string.h>
%%#include <unistd.h>


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


int RfSlow_okstatus;
assign RfSlow_okstatus to "{SECTION_NAME}:EMR-CAV-001:WrtC_OkStatS";
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
		}
	
		when (pvConnectCount()==pvAssignCount()) {
			printf("[SEQ TEMPERATURE - TANK1] All PVs connected\n");
		} state normal_operation
	}

/* state NORMAL-OPERATION */
	state normal_operation {
		entry {
                        printf("\n[SEQ TEMPERATURE  - TANK1] Enter in normal operation status\n");
                }

		when ( ( (TempIlk_001 == 1) && (TempDisable_001 == 0) ) || ( (TempIlk_002 == 1) && (TempDisable_002 == 0) ) || ( (TempIlk_003 == 1) && (TempDisable_003 == 0) ) || ( (TempIlk_004 == 1) && (TempDisable_004 == 0) ) || ( (TempIlk_005 == 1) && (TempDisable_005 == 0) ) || ( (TempIlk_006 == 1) && (TempDisable_006 == 0) ) || ( (TempIlk_007 == 1) && (TempDisable_007 == 0) ) || ( (TempIlk_008 == 1) && (TempDisable_008 == 0) ) || ( (TempIlk_009 == 1) && (TempDisable_009 == 0) ) || ( (TempIlk_010 == 1) && (TempDisable_010 == 0) ) || ( (TempIlk_011 == 1) && (TempDisable_011 == 0) ) || ( (TempIlk_012 == 1) && (TempDisable_012 == 0) ) || ( (TempIlk_013 == 1) && (TempDisable_013 == 0) ) || ( (TempIlk_014 == 1) && (TempDisable_014 == 0) ) || ( (TempIlk_015 == 1) && (TempDisable_015 == 0) ) || ( (TempIlk_016 == 1) && (TempDisable_016 == 0) ) || ( (TempIlk_017 == 1) && (TempDisable_017 == 0) ) || ( (TempIlk_018 == 1) && (TempDisable_018 == 0) ) || ( (TempIlk_019 == 1) && (TempDisable_019 == 0) ) || ( (TempIlk_020 == 1) && (TempDisable_020 == 0) ) || ( (TempIlk_021 == 1) && (TempDisable_021 == 0) ) || ( (TempIlk_022 == 1) && (TempDisable_022 == 0) ) || ( (TempIlk_023 == 1) && (TempDisable_023 == 0) ) || ( (TempIlk_024 == 1) && (TempDisable_024 == 0) ) || ( (TempIlk_025 == 1) && (TempDisable_025 == 0) ) || ( (TempIlk_026 == 1) && (TempDisable_026 == 0) ) || ( (TempIlk_027 == 1) && (TempDisable_027 == 0) ) || ( (TempIlk_028 == 1) && (TempDisable_028 == 0) ) || ( (TempIlk_029 == 1) && (TempDisable_029 == 0) ) || ( (TempIlk_030 == 1) && (TempDisable_030 == 0) ) || ( (TempIlk_031 == 1) && (TempDisable_031 == 0) ) || ( (TempIlk_032 == 1) && (TempDisable_032 == 0) ) || ( (TempIlk_033 == 1) && (TempDisable_033 == 0) ) || ( (TempIlk_034 == 1) && (TempDisable_034 == 0) ) || ( (TempIlk_035 == 1) && (TempDisable_035 == 0) ) || ( (TempIlk_036 == 1) && (TempDisable_036 == 0) ) || ( (TempIlk_037 == 1) && (TempDisable_037 == 0) ) || ( (TempIlk_038 == 1) && (TempDisable_038 == 0) ) || ( (TempIlk_039 == 1) && (TempDisable_039 == 0) ) || ( (TempIlk_040 == 1) && (TempDisable_040 == 0) ) || ( (TempIlk_041 == 1) && (TempDisable_041 == 0) ) || ( (TempIlk_042 == 1) && (TempDisable_042 == 0) ) || ( (TempIlk_043 == 1) && (TempDisable_043 == 0) ) || ( (TempIlk_044 == 1) && (TempDisable_044 == 0) ) || ( (TempIlk_045 == 1) && (TempDisable_045 == 0) ) || ( (TempIlk_046 == 1) && (TempDisable_046 == 0) ) || ( (TempIlk_047 == 1) && (TempDisable_047 == 0) ) || ( (TempIlk_048 == 1) && (TempDisable_048 == 0) ) || ( (TempIlk_049 == 1) && (TempDisable_049 == 0) ) || ( (TempIlk_050 == 1) && (TempDisable_050 == 0) ) || ( (TempIlk_051 == 1) && (TempDisable_051 == 0) ) || ( (TempIlk_052 == 1) && (TempDisable_052 == 0) ) || ( (TempIlk_053 == 1) && (TempDisable_053 == 0) ) || ( (TempIlk_054 == 1) && (TempDisable_054 == 0) ) || ( (TempIlk_055 == 1) && (TempDisable_055 == 0) ) || ( (TempIlk_056 == 1) && (TempDisable_056 == 0) ) || ( (TempIlk_057 == 1) && (TempDisable_057 == 0) ) || ( (TempIlk_058 == 1) && (TempDisable_058 == 0) ) || ( (TempIlk_059 == 1) && (TempDisable_059 == 0) ) || ( (TempIlk_060 == 1) && (TempDisable_060 == 0) ) || ( (TempIlk_100 == 1) && (TempDisable_100 == 0) ) || ( (TempIlk_200 == 1) && (TempDisable_200 == 0) ) ) {

	 		RfSlow_okstatus=0;
			pvPut(RfSlow_okstatus);	
			printf("[SEQ TEMPERATURE  - TANK1] Set Tank 1 Tempearture OK status to 0\n");
		} state interlock

        }




/* state INTERLOCK */
	state interlock {
		entry {
                        printf("\n[SEQ TEMPERATURE  - TANK1] Enter in interlock status\n");
                }

		when ( (TempIlk_001 == 0) && (TempIlk_002 == 0) && (TempIlk_003 == 0) && (TempIlk_004 == 0) && (TempIlk_005 == 0) && (TempIlk_006 == 0) && (TempIlk_007 == 0) && (TempIlk_008 == 0) && (TempIlk_009 == 0) && (TempIlk_010 == 0) && (TempIlk_011 == 0) && (TempIlk_012 == 0) && (TempIlk_013 == 0) && (TempIlk_014 == 0) && (TempIlk_015 == 0) && (TempIlk_016 == 0) && (TempIlk_017 == 0) && (TempIlk_018 == 0) && (TempIlk_019 == 0) && (TempIlk_020 == 0) && (TempIlk_021 == 0) && (TempIlk_022 == 0) && (TempIlk_023 == 0) && (TempIlk_024 == 0) && (TempIlk_025 == 0) && (TempIlk_026 == 0) && (TempIlk_027 == 0) && (TempIlk_028 == 0) && (TempIlk_029 == 0) && (TempIlk_030 == 0) && (TempIlk_031 == 0) && (TempIlk_032 == 0) && (TempIlk_033 == 0) && (TempIlk_034 == 0) && (TempIlk_035 == 0) && (TempIlk_036 == 0) && (TempIlk_037 == 0) && (TempIlk_038 == 0) && (TempIlk_039 == 0) && (TempIlk_040 == 0) && (TempIlk_041 == 0) && (TempIlk_042 == 0) && (TempIlk_043 == 0) && (TempIlk_044 == 0) && (TempIlk_045 == 0) && (TempIlk_046 == 0) && (TempIlk_047 == 0) && (TempIlk_048 == 0) && (TempIlk_049 == 0) && (TempIlk_050 == 0) && (TempIlk_051 == 0) && (TempIlk_052 == 0) && (TempIlk_053 == 0) && (TempIlk_054 == 0) && (TempIlk_055 == 0) && (TempIlk_056 == 0) && (TempIlk_057 == 0) && (TempIlk_058 == 0) && (TempIlk_059 == 0) && (TempIlk_060 == 0) && (TempIlk_100 == 0) && (TempIlk_200 == 0)  ) {
                        RfSlow_okstatus=1;
                        pvPut(RfSlow_okstatus);
			printf("[SEQ TEMPERATURE  - TANK1] Set Tank 1 Tempearture OK status to 1\n");
                } state interlock


	}


}


