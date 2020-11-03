/* DTL Steerer State Machine
# State Machine devoted to control the status and the health of DTL steerer sub-system :
#
# Principal States:
# - Initialization:
# 	* Initalize State Machine when EPICS application starts
# - Self-Check:
#       * Verify HW status (connetions, devices\'' health, etc.)
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

program steerer_statemachine

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

int T1_V1_OkStat;
assign T1_V1_OkStat  to "DTL-010:PwrC-PSCV-001:OkStat";
monitor T1_V1_OkStat;
int T1_H1_OkStat;
assign T1_H1_OkStat  to "DTL-010:PwrC-PSCH-001:OkStat";
monitor T1_H1_OkStat;
int T1_V2_OkStat;
assign T1_V2_OkStat  to "DTL-010:PwrC-PSCV-002:OkStat";
monitor T1_V2_OkStat;
int T1_H1_OkStat;
assign T1_H2_OkStat  to "DTL-010:PwrC-PSCH-002:OkStat";
monitor T1_H2_OkStat;
int T1_V3_OkStat;
assign T1_V3_OkStat  to "DTL-010:PwrC-PSCV-003:OkStat";
monitor T1_V3_OkStat;
int T1_H3_OkStat;
assign T1_H3_OkStat  to "DTL-010:PwrC-PSCH-003:OkStat";
monitor T1_H3_OkStat;
int T1_V4_OkStat;
assign T1_V4_OkStat  to "DTL-010:PwrC-PSCV-004:OkStat";
monitor T1_V4_OkStat;
int T1_H4_OkStat;
assign T1_H4_OkStat  to "DTL-010:PwrC-PSCH-004:OkStat";
monitor T1_H4_OkStat;
int T1_V5_OkStat;
assign T1_V5_OkStat  to "DTL-010:PwrC-PSCV-005:OkStat";
monitor T1_V5_OkStat;
int T1_H5_OkStat;
assign T1_H5_OkStat  to "DTL-010:PwrC-PSCH-005:OkStat";
monitor T1_H5_OkStat;
int T1_V6_OkStat;
assign T1_V6_OkStat  to "DTL-010:PwrC-PSCV-006:OkStat";
monitor T1_V6_OkStat;
int T1_H6_OkStat;
assign T1_H6_OkStat  to "DTL-010:PwrC-PSCH-006:OkStat";
monitor T1_H6_OkStat;
int T2_V1_OkStat;
assign T2_V1_OkStat  to "DTL-020:PwrC-PSCV-001:OkStat";
monitor T2_V1_OkStat;
int T2_H1_OkStat;
assign T2_H1_OkStat  to "DTL-020:PwrC-PSCH-001:OkStat";
monitor T2_H1_OkStat;
int T2_V2_OkStat;
assign T2_V2_OkStat  to "DTL-020:PwrC-PSCV-002:OkStat";
monitor T2_V2_OkStat;
int T2_H1_OkStat;
assign T2_H2_OkStat  to "DTL-020:PwrC-PSCH-002:OkStat";
monitor T2_H2_OkStat;
int T2_V3_OkStat;
assign T2_V3_OkStat  to "DTL-020:PwrC-PSCV-003:OkStat";
monitor T2_V3_OkStat;
int T2_H3_OkStat;
assign T2_H3_OkStat  to "DTL-020:PwrC-PSCH-003:OkStat";
monitor T2_H3_OkStat;
int T3_V1_OkStat;
assign T3_V1_OkStat  to "DTL-030:PwrC-PSCV-001:OkStat";
monitor T3_V1_OkStat;
int T3_H1_OkStat;
assign T3_H1_OkStat  to "DTL-030:PwrC-PSCH-001:OkStat";
monitor T3_H1_OkStat;
int T3_V2_OkStat;
assign T3_V2_OkStat  to "DTL-030:PwrC-PSCV-002:OkStat";
monitor T3_V2_OkStat;
int T3_H1_OkStat;
assign T3_H2_OkStat  to "DTL-030:PwrC-PSCH-002:OkStat";
monitor T3_H2_OkStat;
int T4_V1_OkStat;
assign T4_V1_OkStat  to "DTL-040:PwrC-PSCV-001:OkStat";
monitor T4_V1_OkStat;
int T4_H1_OkStat;
assign T4_H1_OkStat  to "DTL-040:PwrC-PSCH-001:OkStat";
monitor T4_H1_OkStat;
int T4_V2_OkStat;
assign T4_V2_OkStat  to "DTL-040:PwrC-PSCV-002:OkStat";
monitor T4_V2_OkStat;
int T4_H1_OkStat;
assign T4_H2_OkStat  to "DTL-040:PwrC-PSCH-002:OkStat";
monitor T4_H2_OkStat;
int T5_V1_OkStat;
assign T5_V1_OkStat  to "DTL-050:PwrC-PSCV-001:OkStat";
monitor T5_V1_OkStat;
int T5_H1_OkStat;
assign T5_H1_OkStat  to "DTL-050:PwrC-PSCH-001:OkStat";
monitor T5_H1_OkStat;
int T5_V2_OkStat;
assign T5_V2_OkStat  to "DTL-050:PwrC-PSCV-002:OkStat";
monitor T5_V2_OkStat;
int T5_H1_OkStat;
assign T5_H2_OkStat  to "DTL-050:PwrC-PSCH-002:OkStat";
monitor T5_H2_OkStat;















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

ss temperature030_interlock {

/* state INITIALIZATION	*/
	state initialization {
      entry {
        printf("\n\nPreliminary controls executed due to Application Startup - Intialization\n\n");
        StateMachineCode=0;
        pvPut(StateMachineCode);
      }

      when (pvConnectCount()==pvAssignCount()) {
        printf("[SEQ STEERERS  - TANK1] All PVs connected\n");
        printf("[SEQ STEERERS  - TANK1] Starting Self Check Process\n");
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
    when ( ( (TempIlk_001 == 1) && (TempDisable_001 == 0) ) || ( (TempIlk_200 == 1) && (TempDisable_200 == 0) ) ) {

 		   RfSlow_okstatus=0;
	     pvPut(RfSlow_okstatus);
       printf("[SEQ TEMPERATURE  - TANK5] Error in software interlock variable\n");
		   printf("[SEQ TEMPERATURE  - TANK5] Set TANK 5 Temperature OK STATUS to 0: INTERLOCK \n");
		} state failure

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
    when ( ( FaultReset == 1 ) && ( (HwErrAlrm_001 == 0) && (TempIlk_001 == 0) && (TempDisable_001 == 0) ) && ( (HwErrAlrm_002 == 0) && (TempIlk_002 == 0) && (TempDisable_002 == 0) ) && ( (HwErrAlrm_003 == 0) && (TempIlk_003 == 0) && (TempDisable_003 == 0) ) && ( (HwErrAlrm_004 == 0) && (TempIlk_004 == 0) && (TempDisable_004 == 0) ) && ( (HwErrAlrm_005 == 0) && (TempIlk_005 == 0) && (TempDisable_005 == 0) ) && ( (HwErrAlrm_006 == 0) && (TempIlk_006 == 0) && (TempDisable_006 == 0) ) && ( (HwErrAlrm_007 == 0) && (TempIlk_007 == 0) && (TempDisable_007 == 0) ) && ( (HwErrAlrm_008 == 0) && (TempIlk_008 == 0) && (TempDisable_008 == 0) ) && ( (HwErrAlrm_009 == 0) && (TempIlk_009 == 0) && (TempDisable_009 == 0) ) && ( (HwErrAlrm_010 == 0) && (TempIlk_010 == 0) && (TempDisable_010 == 0) ) && ( (HwErrAlrm_011 == 0) && (TempIlk_011 == 0) && (TempDisable_011 == 0) ) && ( (HwErrAlrm_012 == 0) && (TempIlk_012 == 0) && (TempDisable_012 == 0) ) && ( (HwErrAlrm_013 == 0) && (TempIlk_013 == 0) && (TempDisable_013 == 0) ) && ( (HwErrAlrm_014 == 0) && (TempIlk_014 == 0) && (TempDisable_014 == 0) ) && ( (HwErrAlrm_015 == 0) && (TempIlk_015 == 0) && (TempDisable_015 == 0) ) && ( (HwErrAlrm_016 == 0) && (TempIlk_016 == 0) && (TempDisable_016 == 0) ) && ( (HwErrAlrm_017 == 0) && (TempIlk_017 == 0) && (TempDisable_017 == 0) ) && ( (HwErrAlrm_018 == 0) && (TempIlk_018 == 0) && (TempDisable_018 == 0) ) && ( (HwErrAlrm_019 == 0) && (TempIlk_019 == 0) && (TempDisable_019 == 0) ) && ( (HwErrAlrm_020 == 0) && (TempIlk_020 == 0) && (TempDisable_020 == 0) ) && ( (HwErrAlrm_021 == 0) && (TempIlk_021 == 0) && (TempDisable_021 == 0) ) && ( (HwErrAlrm_022 == 0) && (TempIlk_022 == 0) && (TempDisable_022 == 0) ) && ( (HwErrAlrm_100 == 0) && (TempIlk_100 == 0) && (TempDisable_100 == 0) ) && ( (HwErrAlrm_200 == 0) && (TempIlk_200 == 0) && (TempDisable_200 == 0) ) ) {

        printf("[SEQ TEMPERATURE  - TANK5] Failure Stage reset by Operator. \n");
        printf("[SEQ TEMPERATURE  - TANK5] Reset conditions satisfied.\n");
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
    when ( ( MaintenanceReset == 1 ) && ( (HwErrAlrm_001 == 0) && (TempIlk_001 == 0) && (TempDisable_001 == 0) ) && ( (HwErrAlrm_002 == 0) && (TempIlk_002 == 0) && (TempDisable_002 == 0) ) && ( (HwErrAlrm_003 == 0) && (TempIlk_003 == 0) && (TempDisable_003 == 0) ) && ( (HwErrAlrm_004 == 0) && (TempIlk_004 == 0) && (TempDisable_004 == 0) ) && ( (HwErrAlrm_005 == 0) && (TempIlk_005 == 0) && (TempDisable_005 == 0) ) && ( (HwErrAlrm_006 == 0) && (TempIlk_006 == 0) && (TempDisable_006 == 0) ) && ( (HwErrAlrm_007 == 0) && (TempIlk_007 == 0) && (TempDisable_007 == 0) ) && ( (HwErrAlrm_008 == 0) && (TempIlk_008 == 0) && (TempDisable_008 == 0) ) && ( (HwErrAlrm_009 == 0) && (TempIlk_009 == 0) && (TempDisable_009 == 0) ) && ( (HwErrAlrm_010 == 0) && (TempIlk_010 == 0) && (TempDisable_010 == 0) ) && ( (HwErrAlrm_011 == 0) && (TempIlk_011 == 0) && (TempDisable_011 == 0) ) && ( (HwErrAlrm_012 == 0) && (TempIlk_012 == 0) && (TempDisable_012 == 0) ) && ( (HwErrAlrm_013 == 0) && (TempIlk_013 == 0) && (TempDisable_013 == 0) ) && ( (HwErrAlrm_014 == 0) && (TempIlk_014 == 0) && (TempDisable_014 == 0) ) && ( (HwErrAlrm_015 == 0) && (TempIlk_015 == 0) && (TempDisable_015 == 0) ) && ( (HwErrAlrm_016 == 0) && (TempIlk_016 == 0) && (TempDisable_016 == 0) ) && ( (HwErrAlrm_017 == 0) && (TempIlk_017 == 0) && (TempDisable_017 == 0) ) && ( (HwErrAlrm_018 == 0) && (TempIlk_018 == 0) && (TempDisable_018 == 0) ) && ( (HwErrAlrm_019 == 0) && (TempIlk_019 == 0) && (TempDisable_019 == 0) ) && ( (HwErrAlrm_020 == 0) && (TempIlk_020 == 0) && (TempDisable_020 == 0) ) && ( (HwErrAlrm_021 == 0) && (TempIlk_021 == 0) && (TempDisable_021 == 0) ) && ( (HwErrAlrm_022 == 0) && (TempIlk_022 == 0) && (TempDisable_022 == 0) ) && ( (HwErrAlrm_100 == 0) && (TempIlk_100 == 0) && (TempDisable_100 == 0) ) && ( (HwErrAlrm_200 == 0) && (TempIlk_200 == 0) && (TempDisable_200 == 0) ) ) {

        printf("[SEQ TEMPERATURE  - TANK5] Maintenance Stage reset by Operator\n");
        printf("[SEQ TEMPERATURE  - TANK5] Starting TANK 5 State Machine re-initialization\n");

    } state initialization


  }


/* end statemachine */
}
