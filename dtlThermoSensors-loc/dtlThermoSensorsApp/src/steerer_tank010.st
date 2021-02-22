/* DTL Steerer State Machine - Tank 1
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

program steerer_tank010

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
int T1_V1_OkStat;
assign T1_V1_OkStat  to "{SECTION_NAME}:PwrC-PSCV-001:OkStat";
monitor T1_V1_OkStat;
int T1_H1_OkStat;
assign T1_H1_OkStat  to "{SECTION_NAME}:PwrC-PSCH-001:OkStat";
monitor T1_H1_OkStat;
int T1_V2_OkStat;
assign T1_V2_OkStat  to "{SECTION_NAME}:PwrC-PSCV-002:OkStat";
monitor T1_V2_OkStat;
int T1_H2_OkStat;
assign T1_H2_OkStat  to "{SECTION_NAME}:PwrC-PSCH-002:OkStat";
monitor T1_H2_OkStat;
int T1_V3_OkStat;
assign T1_V3_OkStat  to "{SECTION_NAME}:PwrC-PSCV-003:OkStat";
monitor T1_V3_OkStat;
int T1_H3_OkStat;
assign T1_H3_OkStat  to "{SECTION_NAME}:PwrC-PSCH-003:OkStat";
monitor T1_H3_OkStat;
int T1_V4_OkStat;
assign T1_V4_OkStat  to "{SECTION_NAME}:PwrC-PSCV-004:OkStat";
monitor T1_V4_OkStat;
int T1_H4_OkStat;
assign T1_H4_OkStat  to "{SECTION_NAME}:PwrC-PSCH-004:OkStat";
monitor T1_H4_OkStat;
int T1_V5_OkStat;
assign T1_V5_OkStat  to "{SECTION_NAME}:PwrC-PSCV-005:OkStat";
monitor T1_V5_OkStat;
int T1_H5_OkStat;
assign T1_H5_OkStat  to "{SECTION_NAME}:PwrC-PSCH-005:OkStat";
monitor T1_H5_OkStat;
int T1_V6_OkStat;
assign T1_V6_OkStat  to "{SECTION_NAME}:PwrC-PSCV-006:OkStat";
monitor T1_V6_OkStat;
int T1_H6_OkStat;
assign T1_H6_OkStat  to "{SECTION_NAME}:PwrC-PSCH-006:OkStat";
monitor T1_H6_OkStat;


/* termal switches ok status */
int T1_V1_Termal_OkStat;
assign T1_V1_Termal_OkStat  to "{SECTION_NAME}:PwrC-PSCV-001:TS_OkStat";
monitor T1_V1_Termal_OkStat;
int T1_H1_Termal_OkStat;
assign T1_H1_Termal_OkStat  to "{SECTION_NAME}:PwrC-PSCH-001:TS_OkStat";
monitor T1_H1_Termal_OkStat;
int T1_V2_Termal_OkStat;
assign T1_V2_Termal_OkStat  to "{SECTION_NAME}:PwrC-PSCV-002:TS_OkStat";
monitor T1_V2_Termal_OkStat;
int T1_H2_Termal_OkStat;
assign T1_H2_Termal_OkStat  to "{SECTION_NAME}:PwrC-PSCH-002:TS_OkStat";
monitor T1_H2_Termal_OkStat;
int T1_V3_Termal_OkStat;
assign T1_V3_Termal_OkStat  to "{SECTION_NAME}:PwrC-PSCV-003:TS_OkStat";
monitor T1_V3_Termal_OkStat;
int T1_H3_Termal_OkStat;
assign T1_H3_Termal_OkStat  to "{SECTION_NAME}:PwrC-PSCH-003:TS_OkStat";
monitor T1_H3_Termal_OkStat;
int T1_V4_Termal_OkStat;
assign T1_V4_Termal_OkStat  to "{SECTION_NAME}:PwrC-PSCV-004:TS_OkStat";
monitor T1_V4_Termal_OkStat;
int T1_H4_Termal_OkStat;
assign T1_H4_Termal_OkStat  to "{SECTION_NAME}:PwrC-PSCH-004:TS_OkStat";
monitor T1_H4_Termal_OkStat;
int T1_V5_Termal_OkStat;
assign T1_V5_Termal_OkStat  to "{SECTION_NAME}:PwrC-PSCV-005:TS_OkStat";
monitor T1_V5_Termal_OkStat;
int T1_H5_Termal_OkStat;
assign T1_H5_Termal_OkStat  to "{SECTION_NAME}:PwrC-PSCH-005:TS_OkStat";
monitor T1_H5_Termal_OkStat;
int T1_V6_Termal_OkStat;
assign T1_V6_Termal_OkStat  to "{SECTION_NAME}:PwrC-PSCV-006:TS_OkStat";
monitor T1_V6_Termal_OkStat;
int T1_H6_Termal_OkStat;
assign T1_H6_Termal_OkStat  to "{SECTION_NAME}:PwrC-PSCH-006:TS_OkStat";
monitor T1_H6_Termal_OkStat;


/* termal switches enable commands */
int T1_V1_Termal_Enable_Cmd;
assign T1_V1_Termal_Enable_Cmd  to "{SECTION_NAME}:PwrC-PSCV-001:OnEnCmd";
monitor T1_V1_Termal_Enable_Cmd;
int T1_H1_Termal_Enable_Cmd;
assign T1_H1_Termal_Enable_Cmd  to "{SECTION_NAME}:PwrC-PSCH-001:OnEnCmd";
monitor T1_H1_Termal_Enable_Cmd;
int T1_V2_Termal_Enable_Cmd;
assign T1_V2_Termal_Enable_Cmd  to "{SECTION_NAME}:PwrC-PSCV-002:OnEnCmd";
monitor T1_V2_Termal_Enable_Cmd;
int T1_H2_Termal_Enable_Cmd;
assign T1_H2_Termal_Enable_Cmd  to "{SECTION_NAME}:PwrC-PSCH-002:OnEnCmd";
monitor T1_H2_Termal_Enable_Cmd;
int T1_V3_Termal_Enable_Cmd;
assign T1_V3_Termal_Enable_Cmd  to "{SECTION_NAME}:PwrC-PSCV-003:OnEnCmd";
monitor T1_V3_Termal_Enable_Cmd;
int T1_H3_Termal_Enable_Cmd;
assign T1_H3_Termal_Enable_Cmd  to "{SECTION_NAME}:PwrC-PSCH-003:OnEnCmd";
monitor T1_H3_Termal_Enable_Cmd;
int T1_V4_Termal_Enable_Cmd;
assign T1_V4_Termal_Enable_Cmd  to "{SECTION_NAME}:PwrC-PSCV-004:OnEnCmd";
monitor T1_V4_Termal_Enable_Cmd;
int T1_H4_Termal_Enable_Cmd;
assign T1_H4_Termal_Enable_Cmd  to "{SECTION_NAME}:PwrC-PSCH-004:OnEnCmd";
monitor T1_H4_Termal_Enable_Cmd;
int T1_V5_Termal_Enable_Cmd;
assign T1_V5_Termal_Enable_Cmd  to "{SECTION_NAME}:PwrC-PSCV-005:OnEnCmd";
monitor T1_V5_Termal_Enable_Cmd;
int T1_H5_Termal_Enable_Cmd;
assign T1_H5_Termal_Enable_Cmd  to "{SECTION_NAME}:PwrC-PSCH-005:OnEnCmd";
monitor T1_H5_Termal_Enable_Cmd;
int T1_V6_Termal_Enable_Cmd;
assign T1_V6_Termal_Enable_Cmd  to "{SECTION_NAME}:PwrC-PSCV-006:OnEnCmd";
monitor T1_V6_Termal_Enable_Cmd;
int T1_H6_Termal_Enable_Cmd;
assign T1_H6_Termal_Enable_Cmd  to "{SECTION_NAME}:PwrC-PSCH-006:OnEnCmd";
monitor T1_H6_Termal_Enable_Cmd;


/* 24V Ok Status */
int Rack010_24V;
assign Rack010_24V to "{SECTION_NAME}ROW:CnPw-U-003:24VPS_OKStat";
monitor Rack010_24V;
int Rack030_24V;
assign Rack030_24V to "{SECTION_NAME}ROW:CnPw-U-003:24VPS_OKStat";
monitor Rack030_24V;


/* Impedance */
double T1_V1_Impedance;
assign T1_V1_Impedance  to "{SECTION_NAME}:BMD-CV-001:Imp";
monitor T1_V1_Impedance;
double T1_H1_Impedance;
assign T1_H1_Impedance  to "{SECTION_NAME}:BMD-CH-001:Imp";
monitor T1_H1_Impedance;
double T1_V2_Impedance;
assign T1_V2_Impedance  to "{SECTION_NAME}:BMD-CV-002:Imp";
monitor T1_V2_Impedance;
double T1_H2_Impedance;
assign T1_H2_Impedance  to "{SECTION_NAME}:BMD-CH-002:Imp";
monitor T1_H2_Impedance;
double T1_V3_Impedance;
assign T1_V3_Impedance  to "{SECTION_NAME}:BMD-CV-003:Imp";
monitor T1_V3_Impedance;
double T1_H3_Impedance;
assign T1_H3_Impedance  to "{SECTION_NAME}:BMD-CH-003:Imp";
monitor T1_H3_Impedance;
double T1_V4_Impedance;
assign T1_V4_Impedance  to "{SECTION_NAME}:BMD-CV-004:Imp";
monitor T1_V4_Impedance;
double T1_H4_Impedance;
assign T1_H4_Impedance  to "{SECTION_NAME}:BMD-CH-004:Imp";
monitor T1_H4_Impedance;
double T1_V5_Impedance;
assign T1_V5_Impedance  to "{SECTION_NAME}:BMD-CV-005:Imp";
monitor T1_V5_Impedance;
double T1_H5_Impedance;
assign T1_H5_Impedance  to "{SECTION_NAME}:BMD-CH-005:Imp";
monitor T1_H5_Impedance;
double T1_V6_Impedance;
assign T1_V6_Impedance  to "{SECTION_NAME}:BMD-CV-001:Imp";
monitor T1_V6_Impedance;
double T1_H6_Impedance;
assign T1_H6_Impedance  to "{SECTION_NAME}:BMD-CH-001:Imp";
monitor T1_H6_Impedance;


/* Delta Impedances */
double MAX_DEVIANCE = 2;     // max impedance deviation accepted before fault [Ohm]

double T1_V1_DeltaImpedance;
assign T1_V1_DeltaImpedance  to "{SECTION_NAME}:BMD-CV-001:DeltaImp";
monitor T1_V1_DeltaImpedance;
double T1_H1_DeltaImpedance;
assign T1_H1_DeltaImpedance  to "{SECTION_NAME}:BMD-CH-001:DeltaImp";
monitor T1_H1_DeltaImpedance;
double T1_V2_DeltaImpedance;
assign T1_V2_DeltaImpedance  to "{SECTION_NAME}:BMD-CV-002:DeltaImp";
monitor T1_V2_DeltaImpedance;
double T1_H2_DeltaImpedance;
assign T1_H2_DeltaImpedance  to "{SECTION_NAME}:BMD-CH-002:DeltaImp";
monitor T1_H2_DeltaImpedance;
double T1_V3_DeltaImpedance;
assign T1_V3_DeltaImpedance  to "{SECTION_NAME}:BMD-CV-003:DeltaImp";
monitor T1_V3_DeltaImpedance;
double T1_H3_DeltaImpedance;
assign T1_H3_DeltaImpedance  to "{SECTION_NAME}:BMD-CH-003:DeltaImp";
monitor T1_H3_DeltaImpedance;
double T1_V4_DeltaImpedance;
assign T1_V4_DeltaImpedance  to "{SECTION_NAME}:BMD-CV-004:DeltaImp";
monitor T1_V4_DeltaImpedance;
double T1_H4_DeltaImpedance;
assign T1_H4_DeltaImpedance  to "{SECTION_NAME}:BMD-CH-004:DeltaImp";
monitor T1_H4_DeltaImpedance;
double T1_V5_DeltaImpedance;
assign T1_V5_DeltaImpedance  to "{SECTION_NAME}:BMD-CV-005:DeltaImp";
monitor T1_V5_DeltaImpedance;
double T1_H5_DeltaImpedance;
assign T1_H5_DeltaImpedance  to "{SECTION_NAME}:BMD-CH-005:DeltaImp";
monitor T1_H5_DeltaImpedance;
double T1_V6_DeltaImpedance;
assign T1_V6_DeltaImpedance  to "{SECTION_NAME}:BMD-CV-001:DeltaImp";
monitor T1_V6_DeltaImpedance;
double T1_H6_DeltaImpedance;
assign T1_H6_DeltaImpedance  to "{SECTION_NAME}:BMD-CH-001:DeltaImp";
monitor T1_H6_DeltaImpedance;


/* PS Channel Enable Command */
int T1_V1_ChEnableCmd;
assign T1_V1_ChEnableCmd  to "{SECTION_NAME}:BMD-CV-001:EnCmd";
monitor T1_V1_ChEnableCmd;
int T1_H1_ChEnableCmd;
assign T1_H1_ChEnableCmd  to "{SECTION_NAME}:BMD-CH-001:EnCmd";
monitor T1_H1_ChEnableCmd;
int T1_V2_ChEnableCmd;
assign T1_V2_ChEnableCmd  to "{SECTION_NAME}:BMD-CV-002:EnCmd";
monitor T1_V2_ChEnableCmd;
int T1_H2_ChEnableCmd;
assign T1_H2_ChEnableCmd  to "{SECTION_NAME}:BMD-CH-002:EnCmd";
monitor T1_H2_ChEnableCmd;
int T1_V3_ChEnableCmd;
assign T1_V3_ChEnableCmd  to "{SECTION_NAME}:BMD-CV-003:EnCmd";
monitor T1_V3_ChEnableCmd;
int T1_H3_ChEnableCmd;
assign T1_H3_ChEnableCmd  to "{SECTION_NAME}:BMD-CH-003:EnCmd";
monitor T1_H3_ChEnableCmd;
int T1_V4_ChEnableCmd;
assign T1_V4_ChEnableCmd  to "{SECTION_NAME}:BMD-CV-004:EnCmd";
monitor T1_V4_ChEnableCmd;
int T1_H4_ChEnableCmd;
assign T1_H4_ChEnableCmd  to "{SECTION_NAME}:BMD-CH-004:EnCmd";
monitor T1_H4_ChEnableCmd;
int T1_V5_ChEnableCmd;
assign T1_V5_ChEnableCmd  to "{SECTION_NAME}:BMD-CV-005:EnCmd";
monitor T1_V5_ChEnableCmd;
int T1_H5_ChEnableCmd;
assign T1_H5_ChEnableCmd  to "{SECTION_NAME}:BMD-CH-005:EnCmd";
monitor T1_H5_ChEnableCmd;
int T1_V6_ChEnableCmd;
assign T1_V6_ChEnableCmd  to "{SECTION_NAME}:BMD-CV-001:EnCmd";
monitor T1_V6_ChEnableCmd;
int T1_H6_ChEnableCmd;
assign T1_H6_ChEnableCmd  to "{SECTION_NAME}:BMD-CH-001:EnCmd";
monitor T1_H6_ChEnableCmd;


/* PS Channel Enable Readback */
int T1_V1_ChEnable;
assign T1_V1_ChEnable  to "{SECTION_NAME}:BMD-CV-001:En";
monitor T1_V1_ChEnable;
int T1_H1_ChEnable;
assign T1_H1_ChEnable  to "{SECTION_NAME}:BMD-CH-001:En";
monitor T1_H1_ChEnable;
int T1_V2_ChEnable;
assign T1_V2_ChEnable  to "{SECTION_NAME}:BMD-CV-002:En";
monitor T1_V2_ChEnable;
int T1_H2_ChEnable;
assign T1_H2_ChEnable  to "{SECTION_NAME}:BMD-CH-002:En";
monitor T1_H2_ChEnable;
int T1_V3_ChEnable;
assign T1_V3_ChEnable  to "{SECTION_NAME}:BMD-CV-003:En";
monitor T1_V3_ChEnable;
int T1_H3_ChEnable;
assign T1_H3_ChEnable  to "{SECTION_NAME}:BMD-CH-003:En";
monitor T1_H3_ChEnable;
int T1_V4_ChEnable;
assign T1_V4_ChEnable  to "{SECTION_NAME}:BMD-CV-004:En";
monitor T1_V4_ChEnable;
int T1_H4_ChEnable;
assign T1_H4_ChEnable  to "{SECTION_NAME}:BMD-CH-004:En";
monitor T1_H4_ChEnable;
int T1_V5_ChEnable;
assign T1_V5_ChEnable  to "{SECTION_NAME}:BMD-CV-005:En";
monitor T1_V5_ChEnable;
int T1_H5_ChEnable;
assign T1_H5_ChEnable  to "{SECTION_NAME}:BMD-CH-005:En";
monitor T1_H5_ChEnable;
int T1_V6_ChEnable;
assign T1_V6_ChEnable  to "{SECTION_NAME}:BMD-CV-001:En";
monitor T1_V6_ChEnable;
int T1_H6_ChEnable;
assign T1_H6_ChEnable  to "{SECTION_NAME}:BMD-CH-001:En";
monitor T1_H6_ChEnable;


/* PS Channel Current Set */
double T1_V1_CurrentSet;
assign T1_V1_CurrentSet  to "{SECTION_NAME}:BMD-CV-001:CurSet";
monitor T1_V1_CurrentSet;
double T1_H1_CurrentSet;
assign T1_H1_CurrentSet  to "{SECTION_NAME}:BMD-CH-001:CurSet";
monitor T1_H1_CurrentSet;
double T1_V2_CurrentSet;
assign T1_V2_CurrentSet  to "{SECTION_NAME}:BMD-CV-002:CurSet";
monitor T1_V2_CurrentSet;
double T1_H2_CurrentSet;
assign T1_H2_CurrentSet  to "{SECTION_NAME}:BMD-CH-002:CurSet";
monitor T1_H2_CurrentSet;
double T1_V3_CurrentSet;
assign T1_V3_CurrentSet  to "{SECTION_NAME}:BMD-CV-003:CurSet";
monitor T1_V3_CurrentSet;
double T1_H3_CurrentSet;
assign T1_H3_CurrentSet  to "{SECTION_NAME}:BMD-CH-003:CurSet";
monitor T1_H3_CurrentSet;
double T1_V4_CurrentSet;
assign T1_V4_CurrentSet  to "{SECTION_NAME}:BMD-CV-004:CurSet";
monitor T1_V4_CurrentSet;
double T1_H4_CurrentSet;
assign T1_H4_CurrentSet  to "{SECTION_NAME}:BMD-CH-004:CurSet";
monitor T1_H4_CurrentSet;
double T1_V5_CurrentSet;
assign T1_V5_CurrentSet  to "{SECTION_NAME}:BMD-CV-005:CurSet";
monitor T1_V5_CurrentSet;
double T1_H5_CurrentSet;
assign T1_H5_CurrentSet  to "{SECTION_NAME}:BMD-CH-005:CurSet";
monitor T1_H5_CurrentSet;
double T1_V6_CurrentSet;
assign T1_V6_CurrentSet  to "{SECTION_NAME}:BMD-CV-006:CurSet";
monitor T1_V6_CurrentSet;
double T1_H6_CurrentSet;
assign T1_H6_CurrentSet  to "{SECTION_NAME}:BMD-CH-006:CurSet";
monitor T1_H6_CurrentSet;


/* PS Channel Current Set - Readback*/
double T1_V1_CurrentSet_RB;
assign T1_V1_CurrentSet_RB  to "{SECTION_NAME}:BMD-CV-001:CurSet-RB";
monitor T1_V1_CurrentSet_RB;
double T1_H1_CurrentSet_RB;
assign T1_H1_CurrentSet_RB  to "{SECTION_NAME}:BMD-CH-001:CurSet-RB";
monitor T1_H1_CurrentSet_RB;
double T1_V2_CurrentSet_RB;
assign T1_V2_CurrentSet_RB  to "{SECTION_NAME}:BMD-CV-002:CurSet-RB";
monitor T1_V2_CurrentSet_RB;
double T1_H2_CurrentSet_RB;
assign T1_H2_CurrentSet_RB  to "{SECTION_NAME}:BMD-CH-002:CurSet-RB";
monitor T1_H2_CurrentSet_RB;
double T1_V3_CurrentSet_RB;
assign T1_V3_CurrentSet_RB  to "{SECTION_NAME}:BMD-CV-003:CurSet-RB";
monitor T1_V3_CurrentSet_RB;
double T1_H3_CurrentSet_RB;
assign T1_H3_CurrentSet_RB  to "{SECTION_NAME}:BMD-CH-003:CurSet-RB";
monitor T1_H3_CurrentSet_RB;
double T1_V4_CurrentSet_RB;
assign T1_V4_CurrentSet_RB  to "{SECTION_NAME}:BMD-CV-004:CurSet-RB";
monitor T1_V4_CurrentSet_RB;
double T1_H4_CurrentSet_RB;
assign T1_H4_CurrentSet_RB  to "{SECTION_NAME}:BMD-CH-004:CurSet-RB";
monitor T1_H4_CurrentSet_RB;
double T1_V5_CurrentSet_RB;
assign T1_V5_CurrentSet_RB  to "{SECTION_NAME}:BMD-CV-005:CurSet-RB";
monitor T1_V5_CurrentSet_RB;
double T1_H5_CurrentSet_RB;
assign T1_H5_CurrentSet_RB  to "{SECTION_NAME}:BMD-CH-005:CurSet-RB";
monitor T1_H5_CurrentSet_RB;
double T1_V6_CurrentSet_RB;
assign T1_V6_CurrentSet_RB  to "{SECTION_NAME}:BMD-CV-001:CurSet-RB";
monitor T1_V6_CurrentSet_RB;
double T1_H6_CurrentSet_RB;
assign T1_H6_CurrentSet_RB  to "{SECTION_NAME}:BMD-CH-001:CurSet-RB";
monitor T1_H6_CurrentSet_RB;


/* PS Channel Current Measured*/
double T1_V1_Current;
assign T1_V1_Current  to "{SECTION_NAME}:BMD-CV-001:Cur";
monitor T1_V1_Current;
double T1_H1_Current;
assign T1_H1_Current  to "{SECTION_NAME}:BMD-CH-001:Cur";
monitor T1_H1_Current;
double T1_V2_Current;
assign T1_V2_Current  to "{SECTION_NAME}:BMD-CV-002:Cur";
monitor T1_V2_Current;
double T1_H2_Current;
assign T1_H2_Current  to "{SECTION_NAME}:BMD-CH-002:Cur";
monitor T1_H2_Current;
double T1_V3_Current;
assign T1_V3_Current  to "{SECTION_NAME}:BMD-CV-003:Cur";
monitor T1_V3_Current;
double T1_H3_Current;
assign T1_H3_Current  to "{SECTION_NAME}:BMD-CH-003:Cur";
monitor T1_H3_Current;
double T1_V4_Current;
assign T1_V4_Current  to "{SECTION_NAME}:BMD-CV-004:Cur";
monitor T1_V4_Current;
double T1_H4_Current;
assign T1_H4_Current  to "{SECTION_NAME}:BMD-CH-004:Cur";
monitor T1_H4_Current;
double T1_V5_Current;
assign T1_V5_Current  to "{SECTION_NAME}:BMD-CV-005:Cur";
monitor T1_V5_Current;
double T1_H5_Current;
assign T1_H5_Current  to "{SECTION_NAME}:BMD-CH-005:Cur";
monitor T1_H5_Current;
double T1_V6_Current;
assign T1_V6_Current  to "{SECTION_NAME}:BMD-CV-001:Cur";
monitor T1_V6_Current;
double T1_H6_Current;
assign T1_H6_Current  to "{SECTION_NAME}:BMD-CH-001:Cur";
monitor T1_H6_Current;


/* PS Channel Voltage Measured*/
double T1_V1_Voltage;
assign T1_V1_Voltage  to "{SECTION_NAME}:BMD-CV-001:Vol";
monitor T1_V1_Voltage;
double T1_H1_Voltage;
assign T1_H1_Voltage  to "{SECTION_NAME}:BMD-CH-001:Vol";
monitor T1_H1_Voltage;
double T1_V2_Voltage;
assign T1_V2_Voltage  to "{SECTION_NAME}:BMD-CV-002:Vol";
monitor T1_V2_Voltage;
double T1_H2_Voltage;
assign T1_H2_Voltage  to "{SECTION_NAME}:BMD-CH-002:Vol";
monitor T1_H2_Voltage;
double T1_V3_Voltage;
assign T1_V3_Voltage  to "{SECTION_NAME}:BMD-CV-003:Vol";
monitor T1_V3_Voltage;
double T1_H3_Voltage;
assign T1_H3_Voltage  to "{SECTION_NAME}:BMD-CH-003:Vol";
monitor T1_H3_Voltage;
double T1_V4_Voltage;
assign T1_V4_Voltage  to "{SECTION_NAME}:BMD-CV-004:Vol";
monitor T1_V4_Voltage;
double T1_H4_Voltage;
assign T1_H4_Voltage  to "{SECTION_NAME}:BMD-CH-004:Vol";
monitor T1_H4_Voltage;
double T1_V5_Voltage;
assign T1_V5_Voltage  to "{SECTION_NAME}:BMD-CV-005:Vol";
monitor T1_V5_Voltage;
double T1_H5_Voltage;
assign T1_H5_Voltage  to "{SECTION_NAME}:BMD-CH-005:Vol";
monitor T1_H5_Voltage;
double T1_V6_Voltage;
assign T1_V6_Voltage  to "{SECTION_NAME}:BMD-CV-001:Vol";
monitor T1_V6_Voltage;
double T1_H6_Voltage;
assign T1_H6_Voltage  to "{SECTION_NAME}:BMD-CH-001:Vol";
monitor T1_H6_Voltage;


/* PS Channel Reset Command */
int T1_V1_Reset_Cmd;
assign T1_V1_Reset_Cmd  to "{SECTION_NAME}:BMD-CV-001:Clr";
monitor T1_V1_Reset_Cmd;
int T1_H1_Reset_Cmd;
assign T1_H1_Reset_Cmd  to "{SECTION_NAME}:BMD-CH-001:Clr";
monitor T1_H1_Reset_Cmd;
int T1_V2_Reset_Cmd;
assign T1_V2_Reset_Cmd  to "{SECTION_NAME}:BMD-CV-002:Clr";
monitor T1_V2_Reset_Cmd;
int T1_H2_Reset_Cmd;
assign T1_H2_Reset_Cmd  to "{SECTION_NAME}:BMD-CH-002:Clr";
monitor T1_H2_Reset_Cmd;
int T1_V3_Reset_Cmd;
assign T1_V3_Reset_Cmd  to "{SECTION_NAME}:BMD-CV-003:Clr";
monitor T1_V3_Reset_Cmd;
int T1_H3_Reset_Cmd;
assign T1_H3_Reset_Cmd  to "{SECTION_NAME}:BMD-CH-003:Clr";
monitor T1_H3_Reset_Cmd;
int T1_V4_Reset_Cmd;
assign T1_V4_Reset_Cmd  to "{SECTION_NAME}:BMD-CV-004:Clr";
monitor T1_V4_Reset_Cmd;
int T1_H4_Reset_Cmd;
assign T1_H4_Reset_Cmd  to "{SECTION_NAME}:BMD-CH-004:Clr";
monitor T1_H4_Reset_Cmd;
int T1_V5_Reset_Cmd;
assign T1_V5_Reset_Cmd  to "{SECTION_NAME}:BMD-CV-005:Clr";
monitor T1_V5_Reset_Cmd;
int T1_H5_Reset_Cmd;
assign T1_H5_Reset_Cmd  to "{SECTION_NAME}:BMD-CH-005:Clr";
monitor T1_H5_Reset_Cmd;
int T1_V6_Reset_Cmd;
assign T1_V6_Reset_Cmd  to "{SECTION_NAME}:BMD-CV-001:Clr";
monitor T1_V6_Reset_Cmd;
int T1_H6_Reset_Cmd;
assign T1_H6_Reset_Cmd  to "{SECTION_NAME}:BMD-CH-001:Clr";
monitor T1_H6_Reset_Cmd;


/* Chassis Enable */
int Chassis1_enable;
assign Chassis1_enable to "{SECTION_NAME}ROW:PwrC-001:OnEnCmd";
monitor Chassis1_enable;
int Chassis2_enable;
assign Chassis2_enable to "{SECTION_NAME}ROW:PwrC-002:OnEnCmd";
monitor Chassis2_enable;


/* Chassis Enable - readback */
int Chassis1_enable_RB;
assign Chassis1_enable_RB to "DTL-010ROW:PwrC-001:OnEnCmd-RB";
monitor Chassis1_enable_RB;
int Chassis2_enable_RB;
assign Chassis2_enable_RB to "DTL-010ROW:PwrC-002:OnEnCmd-RB";
monitor Chassis2_enable_RB;



/* PS Line Enable */
int T1_V1_LineEnable;
assign T1_V1_LineEnable  to "{SECTION_NAME}:PwrC-PSCV-001:OnEnCmd";
monitor T1_V1_LineEnable;
int T1_H1_LineEnable;
assign T1_H1_LineEnable  to "{SECTION_NAME}:PwrC-PSCH-001:OnEnCmd";
monitor T1_H1_LineEnable;
int T1_V2_LineEnable;
assign T1_V2_LineEnable  to "{SECTION_NAME}:PwrC-PSCV-002:OnEnCmd";
monitor T1_V2_LineEnable;
int T1_H2_LineEnable;
assign T1_H2_LineEnable  to "{SECTION_NAME}:PwrC-PSCH-002:OnEnCmd";
monitor T1_H2_LineEnable;
int T1_V3_LineEnable;
assign T1_V3_LineEnable  to "{SECTION_NAME}:PwrC-PSCV-003:OnEnCmd";
monitor T1_V3_LineEnable;
int T1_H3_LineEnable;
assign T1_H3_LineEnable  to "{SECTION_NAME}:PwrC-PSCH-003:OnEnCmd";
monitor T1_H3_LineEnable;
int T1_V4_LineEnable;
assign T1_V4_LineEnable  to "{SECTION_NAME}:PwrC-PSCV-004:OnEnCmd";
monitor T1_V4_LineEnable;
int T1_H4_LineEnable;
assign T1_H4_LineEnable  to "{SECTION_NAME}:PwrC-PSCH-004:OnEnCmd";
monitor T1_H4_LineEnable;
int T1_V5_LineEnable;
assign T1_V5_LineEnable  to "{SECTION_NAME}:PwrC-PSCV-005:OnEnCmd";
monitor T1_V5_LineEnable;
int T1_H5_LineEnable;
assign T1_H5_LineEnable  to "{SECTION_NAME}:PwrC-PSCH-005:OnEnCmd";
monitor T1_H5_LineEnable;
int T1_V6_LineEnable;
assign T1_V6_LineEnable  to "{SECTION_NAME}:PwrC-PSCV-001:OnEnCmd";
monitor T1_V6_LineEnable;
int T1_H6_LineEnable;
assign T1_H6_LineEnable  to "{SECTION_NAME}:PwrC-PSCH-001:OnEnCmd";
monitor T1_H6_LineEnable;


/* PS Line Enable - readback */
int T1_V1_LineEnable_RB;
assign T1_V1_LineEnable_RB  to "{SECTION_NAME}:PwrC-PSCV-001:OnEnCmd-RB";
monitor T1_V1_LineEnable_RB;
int T1_H1_LineEnable_RB;
assign T1_H1_LineEnable_RB  to "{SECTION_NAME}:PwrC-PSCH-001:OnEnCmd-RB";
monitor T1_H1_LineEnable_RB;
int T1_V2_LineEnable_RB;
assign T1_V2_LineEnable_RB  to "{SECTION_NAME}:PwrC-PSCV-002:OnEnCmd-RB";
monitor T1_V2_LineEnable_RB;
int T1_H2_LineEnable_RB;
assign T1_H2_LineEnable_RB  to "{SECTION_NAME}:PwrC-PSCH-002:OnEnCmd-RB";
monitor T1_H2_LineEnable_RB;
int T1_V3_LineEnable_RB;
assign T1_V3_LineEnable_RB  to "{SECTION_NAME}:PwrC-PSCV-003:OnEnCmd-RB";
monitor T1_V3_LineEnable_RB;
int T1_H3_LineEnable_RB;
assign T1_H3_LineEnable_RB  to "{SECTION_NAME}:PwrC-PSCH-003:OnEnCmd-RB";
monitor T1_H3_LineEnable_RB;
int T1_V4_LineEnable_RB;
assign T1_V4_LineEnable_RB  to "{SECTION_NAME}:PwrC-PSCV-004:OnEnCmd-RB";
monitor T1_V4_LineEnable_RB;
int T1_H4_LineEnable_RB;
assign T1_H4_LineEnable_RB  to "{SECTION_NAME}:PwrC-PSCH-004:OnEnCmd-RB";
monitor T1_H4_LineEnable_RB;
int T1_V5_LineEnable_RB;
assign T1_V5_LineEnable_RB  to "{SECTION_NAME}:PwrC-PSCV-005:OnEnCmd-RB";
monitor T1_V5_LineEnable_RB;
int T1_H5_LineEnable_RB;
assign T1_H5_LineEnable_RB  to "{SECTION_NAME}:PwrC-PSCH-005:OnEnCmd-RB";
monitor T1_H5_LineEnable_RB;
int T1_V6_LineEnable_RB;
assign T1_V6_LineEnable_RB  to "{SECTION_NAME}:PwrC-PSCV-001:OnEnCmd-RB";
monitor T1_V6_LineEnable_RB;
int T1_H6_LineEnable_RB;
assign T1_H6_LineEnable_RB  to "{SECTION_NAME}:PwrC-PSCH-001:OnEnCmd-RB";
monitor T1_H6_LineEnable_RB;


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

ss  steerer_tank010 {

/* state INITIALIZATION	*/
	state initialization {
      entry {
        printf("\n\nPreliminary controls executed due to Application Startup - Intialization\n\n");
        StateMachineCode=0;
        pvPut(StateMachineCode);
      }

      when ( pvConnectCount()==pvAssignCount() ) {
        printf("[SEQ STEERER - TANK 1] All PVs connected\n");
        printf("[SEQ STEERER - TANK 1] Starting Self Check Process\n");

        /* Actual man|auto control initialization */
        AutoControl_ActualStatus = AutoControlCmd;
        pvPut(AutoControl_ActualStatus);

	/* Disable Start and Stop Operaton Commands */
	StartOperationCmd=0;
	pvPut(StartOperationCmd);
	StopOperationCmd=0;
	pvPut(StopOperationCmd);

        printf("[SEQ STEERER - TANK 1] 1. Channels Disable channels \n");
	sleep(1);

        T1_V1_ChEnableCmd = 0;
        pvPut(T1_V1_ChEnableCmd, SYNC);
	sleep(1);
        T1_H1_ChEnableCmd = 0;
        pvPut(T1_H1_ChEnableCmd, SYNC);
	sleep(1);
        T1_V2_ChEnableCmd = 0;
        pvPut(T1_V2_ChEnableCmd, SYNC);
	sleep(1);
        T1_H2_ChEnableCmd = 0;
        pvPut(T1_H2_ChEnableCmd, SYNC);
	sleep(1);
        T1_V3_ChEnableCmd = 0;
        pvPut(T1_V3_ChEnableCmd, SYNC);
	sleep(1);
        T1_H3_ChEnableCmd = 0;
        pvPut(T1_H3_ChEnableCmd, SYNC);
	sleep(1);
        T1_V4_ChEnableCmd = 0;
        pvPut(T1_V4_ChEnableCmd, SYNC);
	sleep(1);
        T1_H4_ChEnableCmd = 0;
        pvPut(T1_H4_ChEnableCmd, SYNC);
	sleep(1);
        T1_V5_ChEnableCmd = 0;
        pvPut(T1_V5_ChEnableCmd, SYNC);
	sleep(1);
        T1_H5_ChEnableCmd = 0;
        pvPut(T1_H5_ChEnableCmd, SYNC);
	sleep(1);
        T1_V6_ChEnableCmd = 0;
        pvPut(T1_V6_ChEnableCmd, SYNC);
	sleep(1);
        T1_H6_ChEnableCmd = 0;
        pvPut(T1_H6_ChEnableCmd, SYNC);
	sleep(3);



        printf("[SEQ STEERER - TANK 1] 2. Channels Error Reset \n");

        T1_V1_Reset_Cmd=0;
        pvPut(T1_V1_Reset_Cmd, SYNC);
        sleep(1);
        T1_H1_Reset_Cmd=0;
        pvPut(T1_H1_Reset_Cmd, SYNC);
        sleep(1);
        T1_V2_Reset_Cmd=0;
        pvPut(T1_V2_Reset_Cmd, SYNC);
        sleep(1);
        T1_H2_Reset_Cmd=0;
        pvPut(T1_H2_Reset_Cmd, SYNC);
        sleep(1);
        T1_V3_Reset_Cmd=0;
        pvPut(T1_V3_Reset_Cmd, SYNC);
        sleep(1);
        T1_H3_Reset_Cmd=0;
        pvPut(T1_H3_Reset_Cmd, SYNC);
        sleep(1);
        T1_V4_Reset_Cmd=0;
        pvPut(T1_V4_Reset_Cmd, SYNC);
        sleep(1);
        T1_H4_Reset_Cmd=0;
        pvPut(T1_H4_Reset_Cmd, SYNC);
        sleep(1);
        T1_V5_Reset_Cmd=0;
        pvPut(T1_V5_Reset_Cmd, SYNC);
        sleep(1);
        T1_H5_Reset_Cmd=0;
        pvPut(T1_H5_Reset_Cmd, SYNC);
        sleep(1);
        T1_V6_Reset_Cmd=0;
        pvPut(T1_V6_Reset_Cmd, SYNC);
        sleep(1);
        T1_H6_Reset_Cmd=0;
        pvPut(T1_H6_Reset_Cmd, SYNC);
        sleep(1);


        printf("[SEQ STEERER - TANK 1] 3. Enable Chassis \n");
        Chassis1_enable=1;
        pvPut(Chassis1_enable);
        sleep(1);
        Chassis2_enable=1;
        pvPut(Chassis2_enable);
        sleep(1);


        printf("[SEQ STEERER - TANK 1] 4. Enable Lines \n");
        T1_V1_Termal_Enable_Cmd=1;
        pvPut(T1_V1_Termal_Enable_Cmd, SYNC);
        sleep(1);
        T1_H1_Termal_Enable_Cmd=1;
        pvPut(T1_H1_Termal_Enable_Cmd, SYNC);
        sleep(1);
        T1_V2_Termal_Enable_Cmd=1;
        pvPut(T1_V2_Termal_Enable_Cmd, SYNC);
        sleep(1);
        T1_H2_Termal_Enable_Cmd=1;
        pvPut(T1_H2_Termal_Enable_Cmd, SYNC);
        sleep(1);
        T1_V3_Termal_Enable_Cmd=1;
        pvPut(T1_V3_Termal_Enable_Cmd, SYNC);
        sleep(1);
        T1_H3_Termal_Enable_Cmd=1;
        pvPut(T1_H3_Termal_Enable_Cmd, SYNC);
        sleep(1);
        T1_V4_Termal_Enable_Cmd=1;
        pvPut(T1_V4_Termal_Enable_Cmd, SYNC);
        sleep(1);
        T1_H4_Termal_Enable_Cmd=1;
        pvPut(T1_H4_Termal_Enable_Cmd, SYNC);
        sleep(1);
        T1_V5_Termal_Enable_Cmd=1;
        pvPut(T1_V5_Termal_Enable_Cmd, SYNC);
        sleep(1);
        T1_H5_Termal_Enable_Cmd=1;
        pvPut(T1_H5_Termal_Enable_Cmd, SYNC);
        sleep(1);
        T1_V6_Termal_Enable_Cmd=1;
        pvPut(T1_V6_Termal_Enable_Cmd, SYNC);
        sleep(1);
        T1_H6_Termal_Enable_Cmd=1;
        pvPut(T1_H6_Termal_Enable_Cmd, SYNC);
        sleep(1);


        /* [Man|Auto] Control Actual Value initialization */
        AutoControl_ActualStatus = AutoControlCmd;
        if ( AutoControl_ActualStatus == 0 ) {
          printf("[SEQ STEERER - TANK 1] Manual|Auto Steerers Control readback initialized to: MANUAL\n");
        }
        else if ( AutoControl_ActualStatus == 1 ) {
          printf("[SEQ STEERER - TANK 1] Manual|Auto Steerers Control readback initialized to: AUTO\n");
        }
        pvPut(AutoControl_ActualStatus);
      } state self_check
	}


/* state SELF_CHECK	*/
	state self_check {
    entry {
        printf("\n[SEQ STEERER - TANK 1] Enter in SELF CHECK status\n");
        StateMachineCode=10;
        pvPut(StateMachineCode);

    }

    /* Chassis disconnected (HW) */
    when ( (Chassis1_enable_RB == 0) || (Chassis2_enable_RB == 0) ) {
        printf("[SEQ STEERER - TANK 1] Error in chassis enable system: one or more chassis are not available\n");
        printf("[SEQ STEERER - TANK 1] System not passed self check: go to FAILURE \n");
    } state failure

    /* Thermal Switch problem */
    when ( (T1_V1_Termal_OkStat == 0) || (T1_H1_Termal_OkStat == 0) || (T1_V2_Termal_OkStat == 0) || (T1_H2_Termal_OkStat == 0) || (T1_V3_Termal_OkStat == 0) || (T1_H3_Termal_OkStat == 0) || (T1_V4_Termal_OkStat == 0) || (T1_H4_Termal_OkStat == 0) || (T1_V5_Termal_OkStat == 0) || (T1_H5_Termal_OkStat == 0) || (T1_V6_Termal_OkStat == 0) || (T1_H6_Termal_OkStat == 0) ) {
    /* Line disconnected (HW) */
        printf("[SEQ STEERER - TANK 1] Error in line enable system: thermal switch problem in one or more lines \n");
        printf("[SEQ STEERER - TANK 1] System not passed self check: go to FAILURE \n");
    } state failure

    /* 24V Error */
    when ( (Rack010_24V == 0) || (Rack030_24V == 0) ) {
        printf("[SEQ STEERER - TANK 1] Error in 24V power racks. \n");
        printf("[SEQ STEERER - TANK 1] System not passed self check: go to FAILURE \n");
    } state failure

    /* no error in any line */
    when ( (T1_V1_Termal_OkStat == 1) && (T1_H1_Termal_OkStat == 1) && (T1_V2_Termal_OkStat == 1) && (T1_H2_Termal_OkStat == 1) && (T1_V3_Termal_OkStat == 1) && (T1_H3_Termal_OkStat == 1) && (T1_V4_Termal_OkStat == 1) && (T1_H4_Termal_OkStat == 1) && (T1_V5_Termal_OkStat == 1) && (T1_H5_Termal_OkStat == 1) && (T1_V6_Termal_OkStat == 1) && (T1_H6_Termal_OkStat == 1) ) {
        printf("[SEQ STEERER - TANK 1] Self Check Passed. \n");
        printf("[SEQ STEERER - TANK 1] Enable steerers channels. \n");

        /* NOTE: when steerer is switched ON, the device goes to the last setpoint set. */
        /*       pay attention if the behavior is correct according to the general operations */

        T1_V1_ChEnableCmd = 1;
        pvPut(T1_V1_ChEnableCmd, SYNC);
        sleep(1);
	      T1_H1_ChEnableCmd = 1;
        pvPut(T1_H1_ChEnableCmd, SYNC);
        sleep(1);
        T1_V2_ChEnableCmd = 1;
        pvPut(T1_V2_ChEnableCmd, SYNC);
        sleep(1);
        T1_H2_ChEnableCmd = 1;
        pvPut(T1_H2_ChEnableCmd, SYNC);
        sleep(1);
        T1_V3_ChEnableCmd = 1;
        pvPut(T1_V3_ChEnableCmd, SYNC);
        sleep(1);
        T1_H3_ChEnableCmd = 1;
        pvPut(T1_H3_ChEnableCmd, SYNC);
        sleep(1);
        T1_V4_ChEnableCmd = 1;
        pvPut(T1_V4_ChEnableCmd, SYNC);
        sleep(1);
        T1_H4_ChEnableCmd = 1;
        pvPut(T1_H4_ChEnableCmd, SYNC);
        sleep(1);
        T1_V5_ChEnableCmd = 1;
        pvPut(T1_V5_ChEnableCmd, SYNC);
        sleep(1);
        T1_H5_ChEnableCmd = 1;
        pvPut(T1_H5_ChEnableCmd, SYNC);
        sleep(1);
        T1_V6_ChEnableCmd = 1;
        pvPut(T1_V6_ChEnableCmd, SYNC);
        sleep(1);
        T1_H6_ChEnableCmd = 1;
        pvPut(T1_H6_ChEnableCmd, SYNC);
        sleep(1);

    } state start_up

  }


/* state STARTUP	*/
state start_up {
  entry {
    printf("\n[SEQ STEERER - TANK 1] Enter in START UP status\n");
    StateMachineCode=30;
    pvPut(StateMachineCode);
  }

  /* Channels are not enabled */
  when ( (T1_V1_ChEnable == 0) || (T1_H1_ChEnable == 0) || (T1_V2_ChEnable == 0) || (T1_H2_ChEnable == 0) || (T1_V3_ChEnable == 0) || (T1_H3_ChEnable == 0) || (T1_V4_ChEnable == 0) || (T1_H4_ChEnable == 0) || (T1_V5_ChEnable == 0) || (T1_H5_ChEnable == 0) || (T1_V6_ChEnable == 0) || (T1_H6_ChEnable == 0) ) {
  /* Line disconnected (HW) */
      printf("[SEQ STEERER - TANK 1] One or more channels are not enabled \n");
      //printf("[SEQ STEERER - TANK 1] Try to rescan the system status \n");
      printf("[SEQ STEERER - TANK 1] System not ok: go to FAILURE \n");
  } state failure  //self_check

  when ( (Chassis1_enable_RB == 0) || (Chassis2_enable_RB == 0) ) {
      printf("[SEQ STEERER - TANK 1] Error in chassis enable system: one or more chassis are not available\n");
      printf("[SEQ STEERER - TANK 1] System not ok: go to FAILURE \n");
  } state failure

  /* Thermal Switch problem */
  when ( (T1_V1_Termal_OkStat == 0) || (T1_H1_Termal_OkStat == 0) || (T1_V2_Termal_OkStat == 0) || (T1_H2_Termal_OkStat == 0) || (T1_V3_Termal_OkStat == 0) || (T1_H3_Termal_OkStat == 0) || (T1_V4_Termal_OkStat == 0) || (T1_H4_Termal_OkStat == 0) || (T1_V5_Termal_OkStat == 0) || (T1_H5_Termal_OkStat == 0) || (T1_V6_Termal_OkStat == 0) || (T1_H6_Termal_OkStat == 0) ) {
  /* Line disconnected (HW) */
      printf("[SEQ STEERER - TANK 1] Error in line enable system: thermal switch problem in one or more lines \n");
      printf("[SEQ STEERER - TANK 1] System not ok: go to FAILURE \n");
  } state failure

  /* 24V Error */
  when ( (Rack010_24V == 0) || (Rack030_24V == 0) ) {
      printf("[SEQ STEERER - TANK 1] Error in 24V power racks. \n");
      printf("[SEQ STEERER - TANK 1] System not ok: go to FAILURE \n");
  } state failure

  /* Problems with steerers impedances */
  when ( (T1_V1_DeltaImpedance > MAX_DEVIANCE) || (T1_H1_DeltaImpedance > MAX_DEVIANCE) || (T1_V2_DeltaImpedance > MAX_DEVIANCE) || (T1_H2_DeltaImpedance > MAX_DEVIANCE) || (T1_V3_DeltaImpedance > MAX_DEVIANCE) || (T1_H3_DeltaImpedance > MAX_DEVIANCE) || (T1_V4_DeltaImpedance > MAX_DEVIANCE) || (T1_H4_DeltaImpedance > MAX_DEVIANCE) || (T1_V5_DeltaImpedance > MAX_DEVIANCE) || (T1_H5_DeltaImpedance > MAX_DEVIANCE) || (T1_V6_DeltaImpedance > MAX_DEVIANCE) || (T1_H6_DeltaImpedance > MAX_DEVIANCE) ) {
  /* Line disconnected (HW) */
      printf("[SEQ STEERER - TANK 1] Error in steerer system: one or more stereres register HIGH IMPEDANCE DEVIANCE \n");
      printf("[SEQ STEERER - TANK 1] System not ok: go to FAILURE \n");
  } state failure


  /* No problems with steerers channels */
  when ( (T1_V1_ChEnable == 1) && (T1_H1_ChEnable == 1) && (T1_V2_ChEnable == 1) && (T1_H2_ChEnable == 1) && (T1_V3_ChEnable == 1) && (T1_H3_ChEnable == 1) && (T1_V4_ChEnable == 1) && (T1_H4_ChEnable == 1) && (T1_V5_ChEnable == 1) && (T1_H5_ChEnable == 1) && (T1_V6_ChEnable == 1) && (T1_H6_ChEnable == 1) ) {
  /* Line disconnected (HW) */
      printf("[SEQ STEERER - TANK 1] Channels correctly enabled. Start setpoint reset. \n");
      T1_V1_CurrentSet = 0;
      pvPut(T1_V1_CurrentSet, SYNC);
      T1_H1_CurrentSet = 0;
      pvPut(T1_H1_CurrentSet, SYNC);
      T1_V2_CurrentSet = 0;
      pvPut(T1_V2_CurrentSet, SYNC);
      T1_H2_CurrentSet = 0;
      pvPut(T1_H2_CurrentSet, SYNC);
      T1_V3_CurrentSet = 0;
      pvPut(T1_V3_CurrentSet, SYNC);
      T1_H3_CurrentSet = 0;
      pvPut(T1_H3_CurrentSet, SYNC);
      T1_V4_CurrentSet = 0;
      pvPut(T1_V4_CurrentSet, SYNC);
      T1_H4_CurrentSet = 0;
      pvPut(T1_H4_CurrentSet, SYNC);
      T1_V5_CurrentSet = 0;
      pvPut(T1_V5_CurrentSet, SYNC);
      T1_H5_CurrentSet = 0;
      pvPut(T1_H5_CurrentSet, SYNC);
      T1_V6_CurrentSet = 0;
      pvPut(T1_V6_CurrentSet, SYNC);
      T1_H6_CurrentSet = 0;
      pvPut(T1_H6_CurrentSet, SYNC);

  } state idle

}


/* state IDLE   	*/
state idle {
  entry {
    printf("\n[SEQ STEERER - TANK 1] Enter in IDLE status\n");
    StateMachineCode=20;
    pvPut(StateMachineCode);

    StopOperationCmd=0;
    pvPut(StopOperationCmd);
  }

  /* Channels are not enabled */
  when ( (T1_V1_ChEnable == 0) || (T1_H1_ChEnable == 0) || (T1_V2_ChEnable == 0) || (T1_H2_ChEnable == 0) || (T1_V3_ChEnable == 0) || (T1_H3_ChEnable == 0) || (T1_V4_ChEnable == 0) || (T1_H4_ChEnable == 0) || (T1_V5_ChEnable == 0) || (T1_H5_ChEnable == 0) || (T1_V6_ChEnable == 0) || (T1_H6_ChEnable == 0) ) {
  /* Line disconnected (HW) */
      printf("[SEQ STEERER - TANK 1] One or more channels are not enabled \n");
      printf("[SEQ STEERER - TANK 1] Try to rescan the system status \n");
  } state self_check

  when ( (Chassis1_enable_RB == 0) || (Chassis2_enable_RB == 0) ) {
      printf("[SEQ STEERER - TANK 1] Error in chassis enable system: one or more chassis are not available\n");
      printf("[SEQ STEERER - TANK 1] System not ok: go to FAILURE \n");
  } state failure

  /* Thermal Switch problem */
  when ( (T1_V1_Termal_OkStat == 0) || (T1_H1_Termal_OkStat == 0) || (T1_V2_Termal_OkStat == 0) || (T1_H2_Termal_OkStat == 0) || (T1_V3_Termal_OkStat == 0) || (T1_H3_Termal_OkStat == 0) || (T1_V4_Termal_OkStat == 0) || (T1_H4_Termal_OkStat == 0) || (T1_V5_Termal_OkStat == 0) || (T1_H5_Termal_OkStat == 0) || (T1_V6_Termal_OkStat == 0) || (T1_H6_Termal_OkStat == 0) ) {
  /* Line disconnected (HW) */
      printf("[SEQ STEERER - TANK 1] Error in line enable system: thermal switch problem in one or more lines \n");
      printf("[SEQ STEERER - TANK 1] System not ok: go to FAILURE \n");
  } state failure

  /* 24V Error */
  when ( (Rack010_24V == 0) || (Rack030_24V == 0) ) {
      printf("[SEQ STEERER - TANK 1] Error in 24V power racks. \n");
      printf("[SEQ STEERER - TANK 1] System not ok: go to FAILURE \n");
  } state failure


  /* Some PVs are disconnected */
  when (pvConnectCount() != pvAssignCount()) {
    printf("[SEQ STEERER - TANK 1] Error in steerer system: one or more PVs are not available for the state machine. \n");
    printf("[SEQ STEERER - TANK 1] System not ok: go to FAILURE \n");
  } state failure

  /* Execute chosen configuration [man|auto] */
  when ( (StartOperationCmd == 1) ) {
      if ( (AutoControl_ActualStatus == 0) && (AutoControl_ActualStatus == AutoControlCmd) ) {
        printf("[SEQ STEERER - TANK 1] Start Control Operations in MANUAL Mode\n");
      }
      else if ( (AutoControl_ActualStatus == 1) && (AutoControl_ActualStatus == AutoControlCmd) ) {
        printf("[SEQ STEERER - TANK 1] Start Control Operations in AUTOMATIC Mode\n");
      }
      else if ( (AutoControl_ActualStatus == 1) && (AutoControl_ActualStatus != AutoControlCmd) ) {
        printf("[SEQ STEERER - TANK 1] Updated control configuration\n");
        printf("[SEQ STEERER - TANK 1] Start Control Operations in MANUAL Mode\n");
        AutoControl_ActualStatus = AutoControlCmd;
        pvPut(AutoControl_ActualStatus);
      }
      else if ( (AutoControl_ActualStatus == 0) && (AutoControl_ActualStatus != AutoControlCmd) ) {
        printf("[SEQ STEERER - TANK 1] Updated control configuration\n");
        printf("[SEQ STEERER - TANK 1] Start Control Operations in AUTOMATIC Mode\n");
        AutoControl_ActualStatus = AutoControlCmd;
        pvPut(AutoControl_ActualStatus);
      }
      else {
        printf("[SEQ STEERER - TANK 1] This message should not appear :)\n");
      }

  } state ready_for_operation
}


/* state READY_FOR_OPERATION 	*/
  state ready_for_operation {

    entry {
      printf("\n[SEQ STEERER - TANK 1] Enter in READY FOR OPERATION status\n");
      StateMachineCode=40;
      pvPut(StateMachineCode);
      }

    /* Chassis problem */
    when ( (Chassis1_enable_RB == 0) || (Chassis2_enable_RB == 0) ) {
      printf("[SEQ STEERER - TANK 1] Error in chassis enable system: one or more chassis are not available\n");
      printf("[SEQ STEERER - TANK 1] System not ok: go to FAILURE \n");
    } state failure

    /* Thermal Switch problem */
    when ( (T1_V1_Termal_OkStat == 0) || (T1_H1_Termal_OkStat == 0) || (T1_V2_Termal_OkStat == 0) || (T1_H2_Termal_OkStat == 0) || (T1_V3_Termal_OkStat == 0) || (T1_H3_Termal_OkStat == 0) || (T1_V4_Termal_OkStat == 0) || (T1_H4_Termal_OkStat == 0) || (T1_V5_Termal_OkStat == 0) || (T1_H5_Termal_OkStat == 0) || (T1_V6_Termal_OkStat == 0) || (T1_H6_Termal_OkStat == 0) ) {
    /* Line disconnected (HW) */
        printf("[SEQ STEERER - TANK 1] Error in line enable system: thermal switch problem in one or more lines \n");
        printf("[SEQ STEERER - TANK 1] System not ok: go to FAILURE \n");
    } state failure

    /* 24V Error */
    when ( (Rack010_24V == 0) || (Rack030_24V == 0) ) {
        printf("[SEQ STEERER - TANK 1] Error in 24V power racks. \n");
        printf("[SEQ STEERER - TANK 1] System not ok: go to FAILURE \n");
    } state failure

    /* Error with Impedance deviance */
    when ( (T1_V1_DeltaImpedance > MAX_DEVIANCE) || (T1_H1_DeltaImpedance > MAX_DEVIANCE) || (T1_V2_DeltaImpedance > MAX_DEVIANCE) || (T1_H2_DeltaImpedance > MAX_DEVIANCE) || (T1_V3_DeltaImpedance > MAX_DEVIANCE) || (T1_H3_DeltaImpedance > MAX_DEVIANCE) || (T1_V4_DeltaImpedance > MAX_DEVIANCE) || (T1_H4_DeltaImpedance > MAX_DEVIANCE) || (T1_V5_DeltaImpedance > MAX_DEVIANCE) || (T1_H5_DeltaImpedance > MAX_DEVIANCE) || (T1_V6_DeltaImpedance > MAX_DEVIANCE) || (T1_H6_DeltaImpedance > MAX_DEVIANCE) ) {
    /* Line disconnected (HW) */
        printf("[SEQ STEERER - TANK 1] Error in steerer system: one or more stereres register HIGH IMPEDANCE DEVIANCE \n");
        printf("[SEQ STEERER - TANK 1] System not ok: go to FAILURE \n");
    } state failure

    /* Stop Operation (for every mode of operation) */
    when ( StopOperationCmd == 1 ) {
        printf("[SEQ STEERER - TANK 1] Stop Control Operations. System goes back to Idle Status.\n");
        StartOperationCmd=0;
        pvPut(StartOperationCmd);
    } state idle

    /* Possibility to modify [MAN|AUTO] control during operations without changing state*/
    when ( AutoControl_ActualStatus != AutoControlCmd ) {
        AutoControl_ActualStatus = AutoControlCmd;
        pvPut(AutoControl_ActualStatus);
        if ( AutoControl_ActualStatus == 0 ) {
          printf("[SEQ STEERER - TANK 1] Control Configuration changed to MANUAL .\n");
        }
        else if ( AutoControl_ActualStatus == 1 ) {
          printf("[SEQ STEERER - TANK 1] Control Configuration changed to AUTOMATIC.\n");
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
        printf("\n[SEQ STEERER - TANK 1] Enter in FAILURE status\n");
        StateMachineCode=50;
        pvPut(StateMachineCode);

        /* Switch off each steerer channel */
        T1_V1_ChEnableCmd = 0;
        pvPut(T1_V1_ChEnableCmd, SYNC);
        T1_H1_ChEnableCmd = 0;
        pvPut(T1_H1_ChEnableCmd, SYNC);
        T1_V2_ChEnableCmd = 0;
        pvPut(T1_V2_ChEnableCmd, SYNC);
        T1_H2_ChEnableCmd = 0;
        pvPut(T1_H2_ChEnableCmd, SYNC);
        T1_V3_ChEnableCmd = 0;
        pvPut(T1_V3_ChEnableCmd, SYNC);
        T1_H3_ChEnableCmd = 0;
        pvPut(T1_H3_ChEnableCmd, SYNC);
        T1_V4_ChEnableCmd = 0;
        pvPut(T1_V4_ChEnableCmd, SYNC);
        T1_H4_ChEnableCmd = 0;
        pvPut(T1_H4_ChEnableCmd, SYNC);
        T1_V5_ChEnableCmd = 0;
        pvPut(T1_V5_ChEnableCmd, SYNC);
        T1_H5_ChEnableCmd = 0;
        pvPut(T1_H5_ChEnableCmd, SYNC);
        T1_V6_ChEnableCmd = 0;
        pvPut(T1_V6_ChEnableCmd, SYNC);
        T1_H6_ChEnableCmd = 0;
        pvPut(T1_H6_ChEnableCmd, SYNC);

    }

    /* System should provide an healthy status to confirm failure reset */
    /* Check on: Chassis, Thermal Switches, 24V Rack Power */
    when ( (FaultReset == 1) &&  (Chassis1_enable_RB == 1) && (Chassis2_enable_RB == 1) && (T1_V1_Termal_OkStat == 1) && (T1_H1_Termal_OkStat == 1) && (T1_V2_Termal_OkStat == 1) && (T1_H2_Termal_OkStat == 1) && (T1_V3_Termal_OkStat == 1) && (T1_H3_Termal_OkStat == 1) && (T1_V4_Termal_OkStat == 1) && (T1_H4_Termal_OkStat == 1) && (T1_V5_Termal_OkStat == 1) && (T1_H5_Termal_OkStat == 1) && (T1_V6_Termal_OkStat == 1) && (T1_H6_Termal_OkStat == 1) && (Rack010_24V == 1) && (Rack030_24V == 1) ) {

        printf("[SEQ STEERER - TANK 1] Failure Stage reset by Operator. \n");
        printf("[SEQ STEERER - TANK 1] Reset conditions satisfied.\n");

        /* Reset FaultReset command */
        FaultReset=0;
        pvPut(FaultReset);

    } state maintenance

  }


/* state MAINTENANCE	*/
  state maintenance {

    entry {
        printf("\n[SEQ STEERER - TANK 1] Enter in MAINTENANCE status\n");
        StateMachineCode=60;
        pvPut(StateMachineCode);
    }

    /* System should provide an healthy status to confirm failure reset */
    /* Check on: Chassis, Thermal Switches, 24V Rack Power */
    when ( (MaintenanceReset == 1) &&  (Chassis1_enable_RB == 1) && (Chassis2_enable_RB == 1) && (T1_V1_Termal_OkStat == 1) && (T1_H1_Termal_OkStat == 1) && (T1_V2_Termal_OkStat == 1) && (T1_H2_Termal_OkStat == 1) && (T1_V3_Termal_OkStat == 1) && (T1_H3_Termal_OkStat == 1) && (T1_V4_Termal_OkStat == 1) && (T1_H4_Termal_OkStat == 1) && (T1_V5_Termal_OkStat == 1) && (T1_H5_Termal_OkStat == 1) && (T1_V6_Termal_OkStat == 1) && (T1_H6_Termal_OkStat == 1) && (Rack010_24V == 1) && (Rack030_24V == 1) ) {

        printf("[SEQ STEERER - TANK 1] Failure Stage reset by Operator. \n");
        printf("[SEQ STEERER - TANK 1] Reset conditions satisfied.\n");

        /* Reset MaintenanceReset command */
        MaintenanceReset=0;
        pvPut(MaintenanceReset);

    } state initialization


  }


/* end statemachine */
}
