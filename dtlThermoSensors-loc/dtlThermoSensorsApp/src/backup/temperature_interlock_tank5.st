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


program temperature050_interlock


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
		}
	
		when (pvConnectCount()==pvAssignCount()) {
			printf("[SEQ TEMPERATURE - TANK5] All PVs connected\n");
			RfSlow_okstatus=1;
			pvPut(RfSlow_okstatus);
		} state normal_operation
	}

/* state NORMAL-OPERATION */
	state normal_operation {
		entry {
                        printf("\n[SEQ TEMPERATURE - TANK5] Enter in normal operation status\n");
                }

		when ( ( (TempIlk_001 == 1) && (TempDisable_001 == 0) ) || ( (TempIlk_002 == 1) && (TempDisable_002 == 0) ) || ( (TempIlk_003 == 1) && (TempDisable_003 == 0) ) || ( (TempIlk_004 == 1) && (TempDisable_004 == 0) ) || ( (TempIlk_005 == 1) && (TempDisable_005 == 0) ) || ( (TempIlk_006 == 1) && (TempDisable_006 == 0) ) || ( (TempIlk_007 == 1) && (TempDisable_007 == 0) ) || ( (TempIlk_008 == 1) && (TempDisable_008 == 0) ) || ( (TempIlk_009 == 1) && (TempDisable_009 == 0) ) || ( (TempIlk_010 == 1) && (TempDisable_010 == 0) ) || ( (TempIlk_011 == 1) && (TempDisable_011 == 0) ) || ( (TempIlk_012 == 1) && (TempDisable_012 == 0) ) || ( (TempIlk_013 == 1) && (TempDisable_013 == 0) ) || ( (TempIlk_014 == 1) && (TempDisable_014 == 0) ) || ( (TempIlk_015 == 1) && (TempDisable_015 == 0) ) || ( (TempIlk_016 == 1) && (TempDisable_016 == 0) ) || ( (TempIlk_017 == 1) && (TempDisable_017 == 0) ) || ( (TempIlk_018 == 1) && (TempDisable_018 == 0) ) || ( (TempIlk_019 == 1) && (TempDisable_019 == 0) ) || ( (TempIlk_020 == 1) && (TempDisable_020 == 0) ) || ( (TempIlk_021 == 1) && (TempDisable_021 == 0) ) || ( (TempIlk_022 == 1) && (TempDisable_022 == 0) ) || ( (TempIlk_100 == 1) && (TempDisable_100 == 0) ) || ( (TempIlk_200 == 1) && (TempDisable_200 == 0) )  ) {

	 		RfSlow_okstatus=0;
			pvPut(RfSlow_okstatus);	
			printf("[SEQ TEMPERATURE - TANK5] Set Tank 5 Tempearture OK status to 0: INTERLOCK \n");
		} state interlock

        }




/* state INTERLOCK */
	state interlock {
		entry {
                        printf("\n[SEQ TEMPERATURE - TANK5] Enter in interlock status\n");
                }

		when ( (TempIlk_001 == 0) && (TempIlk_002 == 0) && (TempIlk_003 == 0) && (TempIlk_004 == 0) && (TempIlk_005 == 0) && (TempIlk_006 == 0) && (TempIlk_007 == 0) && (TempIlk_008 == 0) && (TempIlk_009 == 0) && (TempIlk_010 == 0) && (TempIlk_011 == 0) && (TempIlk_012 == 0) && (TempIlk_013 == 0) && (TempIlk_014 == 0) && (TempIlk_015 == 0) && (TempIlk_016 == 0) && (TempIlk_017 == 0) && (TempIlk_018 == 0) && (TempIlk_019 == 0) && (TempIlk_020 == 0) && (TempIlk_021 == 0) && (TempIlk_022 == 0) && (TempIlk_100 == 0) && (TempIlk_200 == 0) ) {
                        RfSlow_okstatus=1;
                        pvPut(RfSlow_okstatus);
			printf("[SEQ TEMPERATURE - TANK5] Set Tank 5 Tempearture OK status to 1: NORMAL OPERATION\n");
                } state interlock

	}

}


