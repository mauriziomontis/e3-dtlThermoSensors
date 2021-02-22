/* DTL Steerer State Machine - Tank 3
# State Machine devoted to control the status and the health of DTL steerer sub-system :
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

program steerer_tank030

/*
# Libraries
*/

%%#include <stdio.h>
%%#include <string.h>
%%#include <unistd.h>

/*
# Variables and Constants
*/

/* ok status */
int T3_V1_OkStat;
assign T3_V1_OkStat  to "{SECTION_NAME}:PwrC-PSCV-001:OkStat";
monitor T3_V1_OkStat;
int T3_H1_OkStat;
assign T3_H1_OkStat  to "{SECTION_NAME}:PwrC-PSCH-001:OkStat";
monitor T3_H1_OkStat;
int T3_V2_OkStat;
assign T3_V2_OkStat  to "{SECTION_NAME}:PwrC-PSCV-002:OkStat";
monitor T3_V2_OkStat;
int T3_H2_OkStat;
assign T3_H2_OkStat  to "{SECTION_NAME}:PwrC-PSCH-002:OkStat";
monitor T3_H2_OkStat;



/* termal switches ok status */
int T3_V1_Termal_OkStat;
assign T3_V1_Termal_OkStat  to "{SECTION_NAME}:PwrC-PSCV-001:TS_OkStat";
monitor T3_V1_Termal_OkStat;
int T3_H1_Termal_OkStat;
assign T3_H1_Termal_OkStat  to "{SECTION_NAME}:PwrC-PSCH-001:TS_OkStat";
monitor T3_H1_Termal_OkStat;
int T3_V2_Termal_OkStat;
assign T3_V2_Termal_OkStat  to "{SECTION_NAME}:PwrC-PSCV-002:TS_OkStat";
monitor T3_V2_Termal_OkStat;
int T3_H2_Termal_OkStat;
assign T3_H2_Termal_OkStat  to "{SECTION_NAME}:PwrC-PSCH-002:TS_OkStat";
monitor T3_H2_Termal_OkStat;



/* termal switches enable commands */
int T3_V1_Termal_Enable_Cmd;
assign T3_V1_Termal_Enable_Cmd  to "{SECTION_NAME}:PwrC-PSCV-001:OnEnCmd";
monitor T3_V1_Termal_Enable_Cmd;
int T3_H1_Termal_Enable_Cmd;
assign T3_H1_Termal_Enable_Cmd  to "{SECTION_NAME}:PwrC-PSCH-001:OnEnCmd";
monitor T3_H1_Termal_Enable_Cmd;
int T3_V2_Termal_Enable_Cmd;
assign T3_V2_Termal_Enable_Cmd  to "{SECTION_NAME}:PwrC-PSCV-002:OnEnCmd";
monitor T3_V2_Termal_Enable_Cmd;
int T3_H2_Termal_Enable_Cmd;
assign T3_H2_Termal_Enable_Cmd  to "{SECTION_NAME}:PwrC-PSCH-002:OnEnCmd";
monitor T3_H2_Termal_Enable_Cmd;



/* 24V Ok Status */
int Rack010_24V;
assign Rack010_24V to "DTL-010ROW:CnPw-U-003:24VPS_OKStat";
monitor Rack010_24V;
int Rack030_24V;
assign Rack030_24V to "DTL-010ROW:CnPw-U-003:24VPS_OKStat";
monitor Rack030_24V;


/* Impedance */
double T3_V1_Impedance;
assign T3_V1_Impedance  to "{SECTION_NAME}:BMD-CV-001:Imp";
monitor T3_V1_Impedance;
double T3_H1_Impedance;
assign T3_H1_Impedance  to "{SECTION_NAME}:BMD-CH-001:Imp";
monitor T3_H1_Impedance;
double T3_V2_Impedance;
assign T3_V2_Impedance  to "{SECTION_NAME}:BMD-CV-002:Imp";
monitor T3_V2_Impedance;
double T3_H2_Impedance;
assign T3_H2_Impedance  to "{SECTION_NAME}:BMD-CH-002:Imp";
monitor T3_H2_Impedance;



/* Delta Impedances */
double MAX_DEVIANCE = 2;     // max impedance deviation accepted before fault [Ohm]

double T3_V1_DeltaImpedance;
assign T3_V1_DeltaImpedance  to "{SECTION_NAME}:BMD-CV-001:DeltaImp";
monitor T3_V1_DeltaImpedance;
double T3_H1_DeltaImpedance;
assign T3_H1_DeltaImpedance  to "{SECTION_NAME}:BMD-CH-001:DeltaImp";
monitor T3_H1_DeltaImpedance;
double T3_V2_DeltaImpedance;
assign T3_V2_DeltaImpedance  to "{SECTION_NAME}:BMD-CV-002:DeltaImp";
monitor T3_V2_DeltaImpedance;
double T3_H2_DeltaImpedance;
assign T3_H2_DeltaImpedance  to "{SECTION_NAME}:BMD-CH-002:DeltaImp";
monitor T3_H2_DeltaImpedance;



/* PS Channel Enable Command */
int T3_V1_ChEnableCmd;
assign T3_V1_ChEnableCmd  to "{SECTION_NAME}:BMD-CV-001:EnCmd";
monitor T3_V1_ChEnableCmd;
int T3_H1_ChEnableCmd;
assign T3_H1_ChEnableCmd  to "{SECTION_NAME}:BMD-CH-001:EnCmd";
monitor T3_H1_ChEnableCmd;
int T3_V2_ChEnableCmd;
assign T3_V2_ChEnableCmd  to "{SECTION_NAME}:BMD-CV-002:EnCmd";
monitor T3_V2_ChEnableCmd;
int T3_H2_ChEnableCmd;
assign T3_H2_ChEnableCmd  to "{SECTION_NAME}:BMD-CH-002:EnCmd";
monitor T3_H2_ChEnableCmd;



/* PS Channel Enable Readback */
int T3_V1_ChEnable;
assign T3_V1_ChEnable  to "{SECTION_NAME}:BMD-CV-001:En";
monitor T3_V1_ChEnable;
int T3_H1_ChEnable;
assign T3_H1_ChEnable  to "{SECTION_NAME}:BMD-CH-001:En";
monitor T3_H1_ChEnable;
int T3_V2_ChEnable;
assign T3_V2_ChEnable  to "{SECTION_NAME}:BMD-CV-002:En";
monitor T3_V2_ChEnable;
int T3_H2_ChEnable;
assign T3_H2_ChEnable  to "{SECTION_NAME}:BMD-CH-002:En";
monitor T3_H2_ChEnable;



/* PS Channel Current Set */
double T3_V1_CurrentSet;
assign T3_V1_CurrentSet  to "{SECTION_NAME}:BMD-CV-001:CurSet";
monitor T3_V1_CurrentSet;
double T3_H1_CurrentSet;
assign T3_H1_CurrentSet  to "{SECTION_NAME}:BMD-CH-001:CurSet";
monitor T3_H1_CurrentSet;
double T3_V2_CurrentSet;
assign T3_V2_CurrentSet  to "{SECTION_NAME}:BMD-CV-002:CurSet";
monitor T3_V2_CurrentSet;
double T3_H2_CurrentSet;
assign T3_H2_CurrentSet  to "{SECTION_NAME}:BMD-CH-002:CurSet";
monitor T3_H2_CurrentSet;



/* PS Channel Current Set - Readback*/
double T3_V1_CurrentSet_RB;
assign T3_V1_CurrentSet_RB  to "{SECTION_NAME}:BMD-CV-001:CurSet-RB";
monitor T3_V1_CurrentSet_RB;
double T3_H1_CurrentSet_RB;
assign T3_H1_CurrentSet_RB  to "{SECTION_NAME}:BMD-CH-001:CurSet-RB";
monitor T3_H1_CurrentSet_RB;
double T3_V2_CurrentSet_RB;
assign T3_V2_CurrentSet_RB  to "{SECTION_NAME}:BMD-CV-002:CurSet-RB";
monitor T3_V2_CurrentSet_RB;
double T3_H2_CurrentSet_RB;
assign T3_H2_CurrentSet_RB  to "{SECTION_NAME}:BMD-CH-002:CurSet-RB";
monitor T3_H2_CurrentSet_RB;



/* PS Channel Current Measured*/
double T3_V1_Current;
assign T3_V1_Current  to "{SECTION_NAME}:BMD-CV-001:Cur";
monitor T3_V1_Current;
double T3_H1_Current;
assign T3_H1_Current  to "{SECTION_NAME}:BMD-CH-001:Cur";
monitor T3_H1_Current;
double T3_V2_Current;
assign T3_V2_Current  to "{SECTION_NAME}:BMD-CV-002:Cur";
monitor T3_V2_Current;
double T3_H2_Current;
assign T3_H2_Current  to "{SECTION_NAME}:BMD-CH-002:Cur";
monitor T3_H2_Current;



/* PS Channel Voltage Measured*/
double T3_V1_Voltage;
assign T3_V1_Voltage  to "{SECTION_NAME}:BMD-CV-001:Vol";
monitor T3_V1_Voltage;
double T3_H1_Voltage;
assign T3_H1_Voltage  to "{SECTION_NAME}:BMD-CH-001:Vol";
monitor T3_H1_Voltage;
double T3_V2_Voltage;
assign T3_V2_Voltage  to "{SECTION_NAME}:BMD-CV-002:Vol";
monitor T3_V2_Voltage;
double T3_H2_Voltage;
assign T3_H2_Voltage  to "{SECTION_NAME}:BMD-CH-002:Vol";
monitor T3_H2_Voltage;



/* PS Channel Reset Command */
int T3_V1_Reset_Cmd;
assign T3_V1_Reset_Cmd  to "{SECTION_NAME}:BMD-CV-001:Clr";
monitor T3_V1_Reset_Cmd;
int T3_H1_Reset_Cmd;
assign T3_H1_Reset_Cmd  to "{SECTION_NAME}:BMD-CH-001:Clr";
monitor T3_H1_Reset_Cmd;
int T3_V2_Reset_Cmd;
assign T3_V2_Reset_Cmd  to "{SECTION_NAME}:BMD-CV-002:Clr";
monitor T3_V2_Reset_Cmd;
int T3_H2_Reset_Cmd;
assign T3_H2_Reset_Cmd  to "{SECTION_NAME}:BMD-CH-002:Clr";
monitor T3_H2_Reset_Cmd;



/* Chassis Enable */
int Chassis4_enable;
assign Chassis4_enable to "DTL-030ROW:PwrC-001:OnEnCmd";
monitor Chassis4_enable;


/* Chassis Enable - readback */
int Chassis4_enable_RB;
assign Chassis4_enable_RB to "DTL-030ROW:PwrC-001:OnEnCmd-RB";
monitor Chassis4_enable_RB;



/* PS Line Enable */
int T3_V1_LineEnable;
assign T3_V1_LineEnable  to "{SECTION_NAME}:PwrC-PSCV-001:OnEnCmd";
monitor T3_V1_LineEnable;
int T3_H1_LineEnable;
assign T3_H1_LineEnable  to "{SECTION_NAME}:PwrC-PSCH-001:OnEnCmd";
monitor T3_H1_LineEnable;
int T3_V2_LineEnable;
assign T3_V2_LineEnable  to "{SECTION_NAME}:PwrC-PSCV-002:OnEnCmd";
monitor T3_V2_LineEnable;
int T3_H2_LineEnable;
assign T3_H2_LineEnable  to "{SECTION_NAME}:PwrC-PSCH-002:OnEnCmd";
monitor T3_H2_LineEnable;



/* PS Line Enable - readback */
int T3_V1_LineEnable_RB;
assign T3_V1_LineEnable_RB  to "{SECTION_NAME}:PwrC-PSCV-001:OnEnCmd-RB";
monitor T3_V1_LineEnable_RB;
int T3_H1_LineEnable_RB;
assign T3_H1_LineEnable_RB  to "{SECTION_NAME}:PwrC-PSCH-001:OnEnCmd-RB";
monitor T3_H1_LineEnable_RB;
int T3_V2_LineEnable_RB;
assign T3_V2_LineEnable_RB  to "{SECTION_NAME}:PwrC-PSCV-002:OnEnCmd-RB";
monitor T3_V2_LineEnable_RB;
int T3_H2_LineEnable_RB;
assign T3_H2_LineEnable_RB  to "{SECTION_NAME}:PwrC-PSCH-002:OnEnCmd-RB";
monitor T3_H2_LineEnable_RB;



/* Manual/Auto Control  */
int AutoControlCmd;
assign AutoControlCmd to "DTL:PwrC-PSC:AutoCmd";
monitor AutoControlCmd;

int AutoControl_ActualStatus;
assign AutoControl_ActualStatus to "DTL:PwrC-PSC:AutoCmd-RB";
monitor AutoControl_ActualStatus;


/* Start and Stop Operations */
int StartOperationCmd;
assign StartOperationCmd to "DTL:PwrC-PSC:OpRun";
monitor StartOperationCmd;
int StopOperationCmd;
assign StopOperationCmd to "DTL:PwrC-PSC:OpStop";
monitor StopOperationCmd;

/* Maintenance and fault control*/
int MaintenanceReset;
assign MaintenanceReset to "DTL:PwrC:MaintenanceRst";
monitor MaintenanceReset;
int FaultReset;
assign FaultReset to "DTL:PwrC:FaultRst";
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
assign StateMachineCode to "{SECTION_NAME}:PwrC:StateMachine";

/*
# DTL Operational State Machine Code:
# 	0   -> INIT
# 	101 -> STAND-BY
# 	202 -> RF CONDITIONING
# 	303 -> RF START-UP
# 	404 -> READY FOR OPERATION
# 	505 -> NO ACCELERATED BEAM
# 	606 -> MAINTENANCE
*/
int dtlOperationalCode;
assign dtlOperationalCode to "DTL::StateMachine";
monitor dtlOperationalCode;


/* Debug Mode: */
double DEBUG=1;



/*
# State Machine Definition
*/

ss  steerer_tank030 {

/* state INITIALIZATION	*/
	state initialization {
      entry {
        printf("\n\nPreliminary controls executed due to Application Startup - Intialization\n\n");
        StateMachineCode=0;
        pvPut(StateMachineCode);
      }

      when ( pvConnectCount()==pvAssignCount() ) {
        printf("[SEQ STEERER - TANK 3] All PVs connected\n");
        printf("[SEQ STEERER - TANK 3] Starting Self Check Process\n");

        /* Actual man|auto control initialization */
        AutoControl_ActualStatus = AutoControlCmd;
        pvPut(AutoControl_ActualStatus);

	/* Disable Start and Stop Operaton Commands */
	StartOperationCmd=0;
	pvPut(StartOperationCmd);
	StopOperationCmd=0;
	pvPut(StopOperationCmd);

        printf("[SEQ STEERER - TANK 3] 1. Channels Disable channels \n");
				sleep(1);

        T3_V1_ChEnableCmd = 0;
        pvPut(T3_V1_ChEnableCmd, SYNC);
				sleep(1);
        T3_H1_ChEnableCmd = 0;
        pvPut(T3_H1_ChEnableCmd, SYNC);
				sleep(1);
        T3_V2_ChEnableCmd = 0;
        pvPut(T3_V2_ChEnableCmd, SYNC);
				sleep(1);
        T3_H2_ChEnableCmd = 0;
        pvPut(T3_H2_ChEnableCmd, SYNC);
				sleep(3);


        printf("[SEQ STEERER - TANK 3] 2. Channels Error Reset \n");

        T3_V1_Reset_Cmd=0;
        pvPut(T3_V1_Reset_Cmd, SYNC);
        sleep(1);
        T3_H1_Reset_Cmd=0;
        pvPut(T3_H1_Reset_Cmd, SYNC);
        sleep(1);
        T3_V2_Reset_Cmd=0;
        pvPut(T3_V2_Reset_Cmd, SYNC);
        sleep(1);
        T3_H2_Reset_Cmd=0;
        pvPut(T3_H2_Reset_Cmd, SYNC);
        sleep(1);


        printf("[SEQ STEERER - TANK 3] 3. Enable Chassis \n");
        Chassis4_enable=1;
        pvPut(Chassis4_enable);
        sleep(1);


        printf("[SEQ STEERER - TANK 3] 4. Enable Lines \n");
        T3_V1_Termal_Enable_Cmd=1;
        pvPut(T3_V1_Termal_Enable_Cmd, SYNC);
        sleep(1);
        T3_H1_Termal_Enable_Cmd=1;
        pvPut(T3_H1_Termal_Enable_Cmd, SYNC);
        sleep(1);
        T3_V2_Termal_Enable_Cmd=1;
        pvPut(T3_V2_Termal_Enable_Cmd, SYNC);
        sleep(1);
        T3_H2_Termal_Enable_Cmd=1;
        pvPut(T3_H2_Termal_Enable_Cmd, SYNC);
        sleep(1);


        /* [Man|Auto] Control Actual Value initialization */
        AutoControl_ActualStatus = AutoControlCmd;
        if ( AutoControl_ActualStatus == 0 ) {
          printf("[SEQ STEERER - TANK 3] Manual|Auto Steerers Control readback initialized to: MANUAL\n");
        }
        else if ( AutoControl_ActualStatus == 1 ) {
          printf("[SEQ STEERER - TANK 3] Manual|Auto Steerers Control readback initialized to: AUTO\n");
        }
        pvPut(AutoControl_ActualStatus);
      } state self_check
	}


/* state SELF_CHECK	*/
	state self_check {
    entry {
        printf("\n[SEQ STEERER - TANK 3] Enter in SELF CHECK status\n");
        StateMachineCode=10;
        pvPut(StateMachineCode);

    }

    /* Chassis disconnected (HW) */
    when ( (Chassis4_enable_RB == 0) ) {
        printf("[SEQ STEERER - TANK 3] Error in chassis enable system: one or more chassis are not available\n");
        printf("[SEQ STEERER - TANK 3] System not passed self check: go to FAILURE \n");
    } state failure

    /* Thermal Switch problem */
    when ( (T3_V1_Termal_OkStat == 0) || (T3_H1_Termal_OkStat == 0) || (T3_V2_Termal_OkStat == 0) || (T3_H2_Termal_OkStat == 0) ) {
    /* Line disconnected (HW) */
        printf("[SEQ STEERER - TANK 3] Error in line enable system: thermal switch problem in one or more lines \n");
        printf("[SEQ STEERER - TANK 3] System not passed self check: go to FAILURE \n");
    } state failure

    /* 24V Error */
    when ( (Rack010_24V == 0) || (Rack030_24V == 0) ) {
        printf("[SEQ STEERER - TANK 3] Error in 24V power racks. \n");
        printf("[SEQ STEERER - TANK 3] System not passed self check: go to FAILURE \n");
    } state failure

    /* no error in any line */
    when ( (T3_V1_Termal_OkStat == 1) && (T3_H1_Termal_OkStat == 1) && (T3_V2_Termal_OkStat == 1) && (T3_H2_Termal_OkStat == 1) ) {
        printf("[SEQ STEERER - TANK 3] Self Check Passed. \n");
        printf("[SEQ STEERER - TANK 3] Enable steerers channels. \n");

        /* NOTE: when steerer is switched ON, the device goes to the last setpoint set. */
        /*       pay attention if the behavior is correct according to the general operations */

        T3_V1_ChEnableCmd = 1;
        pvPut(T3_V1_ChEnableCmd, SYNC);
        sleep(1);
	      T3_H1_ChEnableCmd = 1;
        pvPut(T3_H1_ChEnableCmd, SYNC);
        sleep(1);
        T3_V2_ChEnableCmd = 1;
        pvPut(T3_V2_ChEnableCmd, SYNC);
        sleep(1);
        T3_H2_ChEnableCmd = 1;
        pvPut(T3_H2_ChEnableCmd, SYNC);
        sleep(1);


    } state start_up

  }


/* state STARTUP	*/
state start_up {
  entry {
    printf("\n[SEQ STEERER - TANK 3] Enter in START UP status\n");
    StateMachineCode=30;
    pvPut(StateMachineCode);
  }

  /* Channels are not enabled */
  when ( (T3_V1_ChEnable == 0) || (T3_H1_ChEnable == 0) || (T3_V2_ChEnable == 0) || (T3_H2_ChEnable == 0) ) {
  /* Line disconnected (HW) */
      printf("[SEQ STEERER - TANK 3] One or more channels are not enabled \n");
      //printf("[SEQ STEERER - TANK 3] Try to rescan the system status \n");
      printf("[SEQ STEERER - TANK 3] System not ok: go to FAILURE \n");
  } state failure  //self_check

  when ( (Chassis4_enable_RB == 0) ) {
      printf("[SEQ STEERER - TANK 3] Error in chassis enable system: one or more chassis are not available\n");
      printf("[SEQ STEERER - TANK 3] System not ok: go to FAILURE \n");
  } state failure

  /* Thermal Switch problem */
  when ( (T3_V1_Termal_OkStat == 0) || (T3_H1_Termal_OkStat == 0) || (T3_V2_Termal_OkStat == 0) || (T3_H2_Termal_OkStat == 0) ) {
  /* Line disconnected (HW) */
      printf("[SEQ STEERER - TANK 3] Error in line enable system: thermal switch problem in one or more lines \n");
      printf("[SEQ STEERER - TANK 3] System not ok: go to FAILURE \n");
  } state failure

  /* 24V Error */
  when ( (Rack010_24V == 0) || (Rack030_24V == 0) ) {
      printf("[SEQ STEERER - TANK 3] Error in 24V power racks. \n");
      printf("[SEQ STEERER - TANK 3] System not ok: go to FAILURE \n");
  } state failure

  /* Problems with steerers impedances */
  when ( (T3_V1_DeltaImpedance > MAX_DEVIANCE) || (T3_H1_DeltaImpedance > MAX_DEVIANCE) || (T3_V2_DeltaImpedance > MAX_DEVIANCE) || (T3_H2_DeltaImpedance > MAX_DEVIANCE) ) {
  /* Line disconnected (HW) */
      printf("[SEQ STEERER - TANK 3] Error in steerer system: one or more stereres register HIGH IMPEDANCE DEVIANCE \n");
      printf("[SEQ STEERER - TANK 3] System not ok: go to FAILURE \n");
  } state failure


  /* No problems with steerers channels */
  when ( (T3_V1_ChEnable == 1) && (T3_H1_ChEnable == 1) && (T3_V2_ChEnable == 1) && (T3_H2_ChEnable == 1) ) {
  /* Line disconnected (HW) */
      printf("[SEQ STEERER - TANK 3] Channels correctly enabled. Start setpoint reset. \n");
      T3_V1_CurrentSet = 0;
      pvPut(T3_V1_CurrentSet, SYNC);
      T3_H1_CurrentSet = 0;
      pvPut(T3_H1_CurrentSet, SYNC);
      T3_V2_CurrentSet = 0;
      pvPut(T3_V2_CurrentSet, SYNC);
      T3_H2_CurrentSet = 0;
      pvPut(T3_H2_CurrentSet, SYNC);


  } state idle

}


/* state IDLE   	*/
state idle {
  entry {
    printf("\n[SEQ STEERER - TANK 3] Enter in IDLE status\n");
    StateMachineCode=20;
    pvPut(StateMachineCode);

    StopOperationCmd=0;
    pvPut(StopOperationCmd);
  }

  /* Channels are not enabled */
  when ( (T3_V1_ChEnable == 0) || (T3_H1_ChEnable == 0) || (T3_V2_ChEnable == 0) || (T3_H2_ChEnable == 0) ) {
  /* Line disconnected (HW) */
      printf("[SEQ STEERER - TANK 3] One or more channels are not enabled \n");
      printf("[SEQ STEERER - TANK 3] Try to rescan the system status \n");
  } state self_check

  when ( (Chassis4_enable_RB == 0) ) {
      printf("[SEQ STEERER - TANK 3] Error in chassis enable system: one or more chassis are not available\n");
      printf("[SEQ STEERER - TANK 3] System not ok: go to FAILURE \n");
  } state failure

  /* Thermal Switch problem */
  when ( (T3_V1_Termal_OkStat == 0) || (T3_H1_Termal_OkStat == 0) || (T3_V2_Termal_OkStat == 0) || (T3_H2_Termal_OkStat == 0) ) {
  /* Line disconnected (HW) */
      printf("[SEQ STEERER - TANK 3] Error in line enable system: thermal switch problem in one or more lines \n");
      printf("[SEQ STEERER - TANK 3] System not ok: go to FAILURE \n");
  } state failure

  /* 24V Error */
  when ( (Rack010_24V == 0) || (Rack030_24V == 0) ) {
      printf("[SEQ STEERER - TANK 3] Error in 24V power racks. \n");
      printf("[SEQ STEERER - TANK 3] System not ok: go to FAILURE \n");
  } state failure


  /* Some PVs are disconnected */
  when (pvConnectCount() != pvAssignCount()) {
    printf("[SEQ STEERER - TANK 3] Error in steerer system: one or more PVs are not available for the state machine. \n");
    printf("[SEQ STEERER - TANK 3] System not ok: go to FAILURE \n");
  } state failure

  /* Execute chosen configuration [man|auto] */
  when ( (StartOperationCmd == 1) ) {
      if ( (AutoControl_ActualStatus == 0) && (AutoControl_ActualStatus == AutoControlCmd) ) {
        printf("[SEQ STEERER - TANK 3] Start Control Operations in MANUAL Mode\n");
      }
      else if ( (AutoControl_ActualStatus == 1) && (AutoControl_ActualStatus == AutoControlCmd) ) {
        printf("[SEQ STEERER - TANK 3] Start Control Operations in AUTOMATIC Mode\n");
      }
      else if ( (AutoControl_ActualStatus == 1) && (AutoControl_ActualStatus != AutoControlCmd) ) {
        printf("[SEQ STEERER - TANK 3] Updated control configuration\n");
        printf("[SEQ STEERER - TANK 3] Start Control Operations in MANUAL Mode\n");
        AutoControl_ActualStatus = AutoControlCmd;
        pvPut(AutoControl_ActualStatus);
      }
      else if ( (AutoControl_ActualStatus == 0) && (AutoControl_ActualStatus != AutoControlCmd) ) {
        printf("[SEQ STEERER - TANK 3] Updated control configuration\n");
        printf("[SEQ STEERER - TANK 3] Start Control Operations in AUTOMATIC Mode\n");
        AutoControl_ActualStatus = AutoControlCmd;
        pvPut(AutoControl_ActualStatus);
      }
      else {
        printf("[SEQ STEERER - TANK 3] This message should not appear :)\n");
      }

  } state ready_for_operation
}


/* state READY_FOR_OPERATION 	*/
  state ready_for_operation {

    entry {
      printf("\n[SEQ STEERER - TANK 3] Enter in READY FOR OPERATION status\n");
      StateMachineCode=40;
      pvPut(StateMachineCode);
      }

    /* Chassis problem */
    when ( (Chassis4_enable_RB == 0) ) {
      printf("[SEQ STEERER - TANK 3] Error in chassis enable system: one or more chassis are not available\n");
      printf("[SEQ STEERER - TANK 3] System not ok: go to FAILURE \n");
    } state failure

    /* Thermal Switch problem */
    when ( (T3_V1_Termal_OkStat == 0) || (T3_H1_Termal_OkStat == 0) || (T3_V2_Termal_OkStat == 0) || (T3_H2_Termal_OkStat == 0) ) {
    /* Line disconnected (HW) */
        printf("[SEQ STEERER - TANK 3] Error in line enable system: thermal switch problem in one or more lines \n");
        printf("[SEQ STEERER - TANK 3] System not ok: go to FAILURE \n");
    } state failure

    /* 24V Error */
    when ( (Rack010_24V == 0) || (Rack030_24V == 0) ) {
        printf("[SEQ STEERER - TANK 3] Error in 24V power racks. \n");
        printf("[SEQ STEERER - TANK 3] System not ok: go to FAILURE \n");
    } state failure

    /* Error with Impedance deviance */
    when ( (T3_V1_DeltaImpedance > MAX_DEVIANCE) || (T3_H1_DeltaImpedance > MAX_DEVIANCE) || (T3_V2_DeltaImpedance > MAX_DEVIANCE) || (T3_H2_DeltaImpedance > MAX_DEVIANCE) ) {
    /* Line disconnected (HW) */
        printf("[SEQ STEERER - TANK 3] Error in steerer system: one or more stereres register HIGH IMPEDANCE DEVIANCE \n");
        printf("[SEQ STEERER - TANK 3] System not ok: go to FAILURE \n");
    } state failure

    /* Stop Operation (for every mode of operation) */
    when ( StopOperationCmd == 1 ) {
        printf("[SEQ STEERER - TANK 3] Stop Control Operations. System goes back to Idle Status.\n");
        StartOperationCmd=0;
        pvPut(StartOperationCmd);
    } state idle

    /* Possibility to modify [MAN|AUTO] control during operations without changing state*/
    when ( AutoControl_ActualStatus != AutoControlCmd ) {
        AutoControl_ActualStatus = AutoControlCmd;
        pvPut(AutoControl_ActualStatus);
        if ( AutoControl_ActualStatus == 0 ) {
          printf("[SEQ STEERER - TANK 3] Control Configuration changed to MANUAL .\n");
        }
        else if ( AutoControl_ActualStatus == 1 ) {
          printf("[SEQ STEERER - TANK 3] Control Configuration changed to AUTOMATIC.\n");
        }
    } state ready_for_operation

    /* NOTES: */
    /* Case of Operation: RF Conditioning */
    /*
    Conditions:
     - Steerers are OFF
     - Setpoints are at 0A
    */
    /* Case of Operation: Ready for Beam */
    /*
    Conditions:
     - Steerers are ON
     - Setpoints are set at "operative" value
    */

    /* Configurations done in DTL Orchestration State Machine  */
  }



/* state FAILURE	*/
  state failure {

    entry {
        printf("\n[SEQ STEERER - TANK 3] Enter in FAILURE status\n");
        StateMachineCode=50;
        pvPut(StateMachineCode);

        /* Switch off each steerer channel */
        T3_V1_ChEnableCmd = 0;
        pvPut(T3_V1_ChEnableCmd, SYNC);
        T3_H1_ChEnableCmd = 0;
        pvPut(T3_H1_ChEnableCmd, SYNC);
        T3_V2_ChEnableCmd = 0;
        pvPut(T3_V2_ChEnableCmd, SYNC);
        T3_H2_ChEnableCmd = 0;
        pvPut(T3_H2_ChEnableCmd, SYNC);


    }

    /* System should provide an healthy status to confirm failure reset */
    /* Check on: Chassis, Thermal Switches, 24V Rack Power */
    when ( (FaultReset == 1) &&  (Chassis4_enable_RB == 1) && (T3_V1_Termal_OkStat == 1) && (T3_H1_Termal_OkStat == 1) && (T3_V2_Termal_OkStat == 1) && (T3_H2_Termal_OkStat == 1) && (Rack010_24V == 1) && (Rack030_24V == 1) ) {

        printf("[SEQ STEERER - TANK 3] Failure Stage reset by Operator. \n");
        printf("[SEQ STEERER - TANK 3] Reset conditions satisfied.\n");

        /* Reset FaultReset command */
        FaultReset=0;
        pvPut(FaultReset);

    } state maintenance

  }


/* state MAINTENANCE	*/
  state maintenance {

    entry {
        printf("\n[SEQ STEERER - TANK 3] Enter in MAINTENANCE status\n");
        StateMachineCode=60;
        pvPut(StateMachineCode);
    }

    /* System should provide an healthy status to confirm failure reset */
    /* Check on: Chassis, Thermal Switches, 24V Rack Power */
    when ( (MaintenanceReset == 1) &&  (Chassis4_enable_RB == 1) && (T3_V1_Termal_OkStat == 1) && (T3_H1_Termal_OkStat == 1) && (T3_V2_Termal_OkStat == 1) && (T3_H2_Termal_OkStat == 1) && (Rack010_24V == 1) && (Rack030_24V == 1) ) {

        printf("[SEQ STEERER - TANK 3] Failure Stage reset by Operator. \n");
        printf("[SEQ STEERER - TANK 3] Reset conditions satisfied.\n");

        /* Reset MaintenanceReset command */
        MaintenanceReset=0;
        pvPut(MaintenanceReset);

    } state initialization


  }


/* end statemachine */
}
