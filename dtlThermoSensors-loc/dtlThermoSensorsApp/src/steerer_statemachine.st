/* DTL Steerer State Machine
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

/* ok status */
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

/* termal switches ok status */
int T1_V1_Termal_OkStat;
assign T1_V1_Termal_OkStat  to "DTL-010:PwrC-PSCV-001:TS_OkStat";
monitor T1_V1_Termal_OkStat;
int T1_H1_Termal_OkStat;
assign T1_H1_Termal_OkStat  to "DTL-010:PwrC-PSCH-001:TS_OkStat";
monitor T1_H1_Termal_OkStat;
int T1_V2_Termal_OkStat;
assign T1_V2_Termal_OkStat  to "DTL-010:PwrC-PSCV-002:TS_OkStat";
monitor T1_V2_Termal_OkStat;
int T1_H1_Termal_OkStat;
assign T1_H2_Termal_OkStat  to "DTL-010:PwrC-PSCH-002:TS_OkStat";
monitor T1_H2_Termal_OkStat;
int T1_V3_Termal_OkStat;
assign T1_V3_Termal_OkStat  to "DTL-010:PwrC-PSCV-003:TS_OkStat";
monitor T1_V3_Termal_OkStat;
int T1_H3_Termal_OkStat;
assign T1_H3_Termal_OkStat  to "DTL-010:PwrC-PSCH-003:TS_OkStat";
monitor T1_H3_Termal_OkStat;
int T1_V4_Termal_OkStat;
assign T1_V4_Termal_OkStat  to "DTL-010:PwrC-PSCV-004:TS_OkStat";
monitor T1_V4_Termal_OkStat;
int T1_H4_Termal_OkStat;
assign T1_H4_Termal_OkStat  to "DTL-010:PwrC-PSCH-004:TS_OkStat";
monitor T1_H4_Termal_OkStat;
int T1_V5_Termal_OkStat;
assign T1_V5_Termal_OkStat  to "DTL-010:PwrC-PSCV-005:TS_OkStat";
monitor T1_V5_Termal_OkStat;
int T1_H5_Termal_OkStat;
assign T1_H5_Termal_OkStat  to "DTL-010:PwrC-PSCH-005:TS_OkStat";
monitor T1_H5_Termal_OkStat;
int T1_V6_Termal_OkStat;
assign T1_V6_Termal_OkStat  to "DTL-010:PwrC-PSCV-006:TS_OkStat";
monitor T1_V6_Termal_OkStat;
int T1_H6_Termal_OkStat;
assign T1_H6_Termal_OkStat  to "DTL-010:PwrC-PSCH-006:TS_OkStat";
monitor T1_H6_Termal_OkStat;
int T2_V1_Termal_OkStat;
assign T2_V1_Termal_OkStat  to "DTL-020:PwrC-PSCV-001:TS_OkStat";
monitor T2_V1_Termal_OkStat;
int T2_H1_Termal_OkStat;
assign T2_H1_Termal_OkStat  to "DTL-020:PwrC-PSCH-001:TS_OkStat";
monitor T2_H1_Termal_OkStat;
int T2_V2_Termal_OkStat;
assign T2_V2_Termal_OkStat  to "DTL-020:PwrC-PSCV-002:TS_OkStat";
monitor T2_V2_Termal_OkStat;
int T2_H1_Termal_OkStat;
assign T2_H2_Termal_OkStat  to "DTL-020:PwrC-PSCH-002:TS_OkStat";
monitor T2_H2_Termal_OkStat;
int T2_V3_Termal_OkStat;
assign T2_V3_Termal_OkStat  to "DTL-020:PwrC-PSCV-003:TS_OkStat";
monitor T2_V3_Termal_OkStat;
int T2_H3_Termal_OkStat;
assign T2_H3_Termal_OkStat  to "DTL-020:PwrC-PSCH-003:TS_OkStat";
monitor T2_H3_Termal_OkStat;
int T3_V1_Termal_OkStat;
assign T3_V1_Termal_OkStat  to "DTL-030:PwrC-PSCV-001:TS_OkStat";
monitor T3_V1_Termal_OkStat;
int T3_H1_Termal_OkStat;
assign T3_H1_Termal_OkStat  to "DTL-030:PwrC-PSCH-001:TS_OkStat";
monitor T3_H1_Termal_OkStat;
int T3_V2_Termal_OkStat;
assign T3_V2_Termal_OkStat  to "DTL-030:PwrC-PSCV-002:TS_OkStat";
monitor T3_V2_Termal_OkStat;
int T3_H1_Termal_OkStat;
assign T3_H2_Termal_OkStat  to "DTL-030:PwrC-PSCH-002:TS_OkStat";
monitor T3_H2_Termal_OkStat;
int T4_V1_Termal_OkStat;
assign T4_V1_Termal_OkStat  to "DTL-040:PwrC-PSCV-001:TS_OkStat";
monitor T4_V1_Termal_OkStat;
int T4_H1_Termal_OkStat;
assign T4_H1_Termal_OkStat  to "DTL-040:PwrC-PSCH-001:TS_OkStat";
monitor T4_H1_Termal_OkStat;
int T4_V2_Termal_OkStat;
assign T4_V2_Termal_OkStat  to "DTL-040:PwrC-PSCV-002:TS_OkStat";
monitor T4_V2_Termal_OkStat;
int T4_H1_Termal_OkStat;
assign T4_H2_Termal_OkStat  to "DTL-040:PwrC-PSCH-002:TS_OkStat";
monitor T4_H2_Termal_OkStat;
int T5_V1_Termal_OkStat;
assign T5_V1_Termal_OkStat  to "DTL-050:PwrC-PSCV-001:TS_OkStat";
monitor T5_V1_Termal_OkStat;
int T5_H1_Termal_OkStat;
assign T5_H1_Termal_OkStat  to "DTL-050:PwrC-PSCH-001:TS_OkStat";
monitor T5_H1_Termal_OkStat;
int T5_V2_Termal_OkStat;
assign T5_V2_Termal_OkStat  to "DTL-050:PwrC-PSCV-002:TS_OkStat";
monitor T5_V2_Termal_OkStat;
int T5_H1_Termal_OkStat;
assign T5_H2_Termal_OkStat  to "DTL-050:PwrC-PSCH-002:TS_OkStat";
monitor T5_H2_Termal_OkStat;

/* Impedances */
double T1_V1_Impedance;
assign T1_V1_Impedance  to "DTL-010:BMD-CV-001:Imp";
monitor T1_V1_Impedance;
double T1_H1_Impedance;
assign T1_H1_Impedance  to "DTL-010:BMD-CH-001:Imp";
monitor T1_H1_Impedance;
double T1_V2_Impedance;
assign T1_V2_Impedance  to "DTL-010:BMD-CV-002:Imp";
monitor T1_V2_Impedance;
double T1_H2_Impedance;
assign T1_H2_Impedance  to "DTL-010:BMD-CH-002:Imp";
monitor T1_H2_Impedance;
double T1_V3_Impedance;
assign T1_V3_Impedance  to "DTL-010:BMD-CV-003:Imp";
monitor T1_V3_Impedance;
double T1_H3_Impedance;
assign T1_H3_Impedance  to "DTL-010:BMD-CH-003:Imp";
monitor T1_H3_Impedance;
double T1_V4_Impedance;
assign T1_V4_Impedance  to "DTL-010:BMD-CV-004:Imp";
monitor T1_V4_Impedance;
double T1_H4_Impedance;
assign T1_H4_Impedance  to "DTL-010:BMD-CH-004:Imp";
monitor T1_H4_Impedance;
double T1_V5_Impedance;
assign T1_V5_Impedance  to "DTL-010:BMD-CV-005:Imp";
monitor T1_V5_Impedance;
double T1_H5_Impedance;
assign T1_H5_Impedance  to "DTL-010:BMD-CH-005:Imp";
monitor T1_H5_Impedance;
double T1_V6_Impedance;
assign T1_V6_Impedance  to "DTL-010:BMD-CV-001:Imp";
monitor T1_V6_Impedance;
double T1_H6_Impedance;
assign T1_H6_Impedance  to "DTL-010:BMD-CH-001:Imp";
monitor T1_H6_Impedance;
double T2_V1_Impedance;
assign T2_V1_Impedance  to "DTL-020:BMD-CV-001:Imp";
monitor T2_V1_Impedance;
double T2_H1_Impedance;
assign T2_H1_Impedance  to "DTL-020:BMD-CH-001:Imp";
monitor T2_H1_Impedance;
double T2_V2_Impedance;
assign T2_V2_Impedance  to "DTL-020:BMD-CV-002:Imp";
monitor T2_V2_Impedance;
double T2_H2_Impedance;
assign T2_H2_Impedance  to "DTL-020:BMD-CH-002:Imp";
monitor T2_H2_Impedance;
double T2_V3_Impedance;
assign T2_V3_Impedance  to "DTL-020:BMD-CV-003:Imp";
monitor T2_V3_Impedance;
double T2_H3_Impedance;
assign T2_H3_Impedance  to "DTL-020:BMD-CH-003:Imp";
monitor T2_H3_Impedance;
double T3_V1_Impedance;
assign T3_V1_Impedance  to "DTL-030:BMD-CV-001:Imp";
monitor T3_V1_Impedance;
double T3_H1_Impedance;
assign T3_H1_Impedance  to "DTL-030:BMD-CH-001:Imp";
monitor T3_H1_Impedance;
double T3_V2_Impedance;
assign T3_V2_Impedance  to "DTL-030:BMD-CV-002:Imp";
monitor T3_V2_Impedance;
double T3_H2_Impedance;
assign T3_H2_Impedance  to "DTL-030:BMD-CH-002:Imp";
monitor T3_H2_Impedance;
double T4_V1_Impedance;
assign T4_V1_Impedance  to "DTL-040:BMD-CV-001:Imp";
monitor T4_V1_Impedance;
double T4_H1_Impedance;
assign T4_H1_Impedance  to "DTL-040:BMD-CH-001:Imp";
monitor T4_H1_Impedance;
double T4_V2_Impedance;
assign T4_V2_Impedance  to "DTL-040:BMD-CV-002:Imp";
monitor T4_V2_Impedance;
double T4_H2_Impedance;
assign T4_H2_Impedance  to "DTL-040:BMD-CH-002:Imp";
monitor T4_H2_Impedance;
double T5_V1_Impedance;
assign T5_V1_Impedance  to "DTL-050:BMD-CV-001:Imp";
monitor T5_V1_Impedance;
double T5_H1_Impedance;
assign T5_H1_Impedance  to "DTL-050:BMD-CH-001:Imp";
monitor T5_H1_Impedance;
double T5_V2_Impedance;
assign T5_V2_Impedance  to "DTL-050:BMD-CV-002:Imp";
monitor T5_V2_Impedance;
double T5_H2_Impedance;
assign T5_H2_Impedance  to "DTL-050:BMD-CH-002:Imp";
monitor T5_H2_Impedance;

/* PS Channel Enable Command */
int T1_V1_ChEnableCmd;
assign T1_V1_ChEnableCmd  to "DTL-010:BMD-CV-001:EnCmd";
monitor T1_V1_ChEnableCmd;
int T1_H1_ChEnableCmd;
assign T1_H1_ChEnableCmd  to "DTL-010:BMD-CH-001:EnCmd";
monitor T1_H1_ChEnableCmd;
int T1_V2_ChEnableCmd;
assign T1_V2_ChEnableCmd  to "DTL-010:BMD-CV-002:EnCmd";
monitor T1_V2_ChEnableCmd;
int T1_H2_ChEnableCmd;
assign T1_H2_ChEnableCmd  to "DTL-010:BMD-CH-002:EnCmd";
monitor T1_H2_ChEnableCmd;
int T1_V3_ChEnableCmd;
assign T1_V3_ChEnableCmd  to "DTL-010:BMD-CV-003:EnCmd";
monitor T1_V3_ChEnableCmd;
int T1_H3_ChEnableCmd;
assign T1_H3_ChEnableCmd  to "DTL-010:BMD-CH-003:EnCmd";
monitor T1_H3_ChEnableCmd;
int T1_V4_ChEnableCmd;
assign T1_V4_ChEnableCmd  to "DTL-010:BMD-CV-004:EnCmd";
monitor T1_V4_ChEnableCmd;
int T1_H4_ChEnableCmd;
assign T1_H4_ChEnableCmd  to "DTL-010:BMD-CH-004:EnCmd";
monitor T1_H4_ChEnableCmd;
int T1_V5_ChEnableCmd;
assign T1_V5_ChEnableCmd  to "DTL-010:BMD-CV-005:EnCmd";
monitor T1_V5_ChEnableCmd;
int T1_H5_ChEnableCmd;
assign T1_H5_ChEnableCmd  to "DTL-010:BMD-CH-005:EnCmd";
monitor T1_H5_ChEnableCmd;
int T1_V6_ChEnableCmd;
assign T1_V6_ChEnableCmd  to "DTL-010:BMD-CV-001:EnCmd";
monitor T1_V6_ChEnableCmd;
int T1_H6_ChEnableCmd;
assign T1_H6_ChEnableCmd  to "DTL-010:BMD-CH-001:EnCmd";
monitor T1_H6_ChEnableCmd;
int T2_V1_ChEnableCmd;
assign T2_V1_ChEnableCmd  to "DTL-020:BMD-CV-001:EnCmd";
monitor T2_V1_ChEnableCmd;
int T2_H1_ChEnableCmd;
assign T2_H1_ChEnableCmd  to "DTL-020:BMD-CH-001:EnCmd";
monitor T2_H1_ChEnableCmd;
int T2_V2_ChEnableCmd;
assign T2_V2_ChEnableCmd  to "DTL-020:BMD-CV-002:EnCmd";
monitor T2_V2_ChEnableCmd;
int T2_H2_ChEnableCmd;
assign T2_H2_ChEnableCmd  to "DTL-020:BMD-CH-002:EnCmd";
monitor T2_H2_ChEnableCmd;
int T2_V3_ChEnableCmd;
assign T2_V3_ChEnableCmd  to "DTL-020:BMD-CV-003:EnCmd";
monitor T2_V3_ChEnableCmd;
int T2_H3_ChEnableCmd;
assign T2_H3_ChEnableCmd  to "DTL-020:BMD-CH-003:EnCmd";
monitor T2_H3_ChEnableCmd;
int T3_V1_ChEnableCmd;
assign T3_V1_ChEnableCmd  to "DTL-030:BMD-CV-001:EnCmd";
monitor T3_V1_ChEnableCmd;
int T3_H1_ChEnableCmd;
assign T3_H1_ChEnableCmd  to "DTL-030:BMD-CH-001:EnCmd";
monitor T3_H1_ChEnableCmd;
int T3_V2_ChEnableCmd;
assign T3_V2_ChEnableCmd  to "DTL-030:BMD-CV-002:EnCmd";
monitor T3_V2_ChEnableCmd;
int T3_H2_ChEnableCmd;
assign T3_H2_ChEnableCmd  to "DTL-030:BMD-CH-002:EnCmd";
monitor T3_H2_ChEnableCmd;
int T4_V1_ChEnableCmd;
assign T4_V1_ChEnableCmd  to "DTL-040:BMD-CV-001:EnCmd";
monitor T4_V1_ChEnableCmd;
int T4_H1_ChEnableCmd;
assign T4_H1_ChEnableCmd  to "DTL-040:BMD-CH-001:EnCmd";
monitor T4_H1_ChEnableCmd;
int T4_V2_ChEnableCmd;
assign T4_V2_ChEnableCmd  to "DTL-040:BMD-CV-002:EnCmd";
monitor T4_V2_ChEnableCmd;
int T4_H2_ChEnableCmd;
assign T4_H2_ChEnableCmd  to "DTL-040:BMD-CH-002:EnCmd";
monitor T4_H2_ChEnableCmd;
int T5_V1_ChEnableCmd;
assign T5_V1_ChEnableCmd  to "DTL-050:BMD-CV-001:EnCmd";
monitor T5_V1_ChEnableCmd;
int T5_H1_ChEnableCmd;
assign T5_H1_ChEnableCmd  to "DTL-050:BMD-CH-001:EnCmd";
monitor T5_H1_ChEnableCmd;
int T5_V2_ChEnableCmd;
assign T5_V2_ChEnableCmd  to "DTL-050:BMD-CV-002:EnCmd";
monitor T5_V2_ChEnableCmd;
int T5_H2_ChEnableCmd;
assign T5_H2_ChEnableCmd  to "DTL-050:BMD-CH-002:EnCmd";
monitor T5_H2_ChEnableCmd;

/* PS Channel Enable Readback */
int T1_V1_ChEnable;
assign T1_V1_ChEnable  to "DTL-010:BMD-CV-001:En";
monitor T1_V1_ChEnable;
int T1_H1_ChEnable;
assign T1_H1_ChEnable  to "DTL-010:BMD-CH-001:En";
monitor T1_H1_ChEnable;
int T1_V2_ChEnable;
assign T1_V2_ChEnable  to "DTL-010:BMD-CV-002:En";
monitor T1_V2_ChEnable;
int T1_H2_ChEnable;
assign T1_H2_ChEnable  to "DTL-010:BMD-CH-002:En";
monitor T1_H2_ChEnable;
int T1_V3_ChEnable;
assign T1_V3_ChEnable  to "DTL-010:BMD-CV-003:En";
monitor T1_V3_ChEnable;
int T1_H3_ChEnable;
assign T1_H3_ChEnable  to "DTL-010:BMD-CH-003:En";
monitor T1_H3_ChEnable;
int T1_V4_ChEnable;
assign T1_V4_ChEnable  to "DTL-010:BMD-CV-004:En";
monitor T1_V4_ChEnable;
int T1_H4_ChEnable;
assign T1_H4_ChEnable  to "DTL-010:BMD-CH-004:En";
monitor T1_H4_ChEnable;
int T1_V5_ChEnable;
assign T1_V5_ChEnable  to "DTL-010:BMD-CV-005:En";
monitor T1_V5_ChEnable;
int T1_H5_ChEnable;
assign T1_H5_ChEnable  to "DTL-010:BMD-CH-005:En";
monitor T1_H5_ChEnable;
int T1_V6_ChEnable;
assign T1_V6_ChEnable  to "DTL-010:BMD-CV-001:En";
monitor T1_V6_ChEnable;
int T1_H6_ChEnable;
assign T1_H6_ChEnable  to "DTL-010:BMD-CH-001:En";
monitor T1_H6_ChEnable;
int T2_V1_ChEnable;
assign T2_V1_ChEnable  to "DTL-020:BMD-CV-001:En";
monitor T2_V1_ChEnable;
int T2_H1_ChEnable;
assign T2_H1_ChEnable  to "DTL-020:BMD-CH-001:En";
monitor T2_H1_ChEnable;
int T2_V2_ChEnable;
assign T2_V2_ChEnable  to "DTL-020:BMD-CV-002:En";
monitor T2_V2_ChEnable;
int T2_H2_ChEnable;
assign T2_H2_ChEnable  to "DTL-020:BMD-CH-002:En";
monitor T2_H2_ChEnable;
int T2_V3_ChEnable;
assign T2_V3_ChEnable  to "DTL-020:BMD-CV-003:En";
monitor T2_V3_ChEnable;
int T2_H3_ChEnable;
assign T2_H3_ChEnable  to "DTL-020:BMD-CH-003:En";
monitor T2_H3_ChEnable;
int T3_V1_ChEnable;
assign T3_V1_ChEnable  to "DTL-030:BMD-CV-001:En";
monitor T3_V1_ChEnable;
int T3_H1_ChEnable;
assign T3_H1_ChEnable  to "DTL-030:BMD-CH-001:En";
monitor T3_H1_ChEnable;
int T3_V2_ChEnable;
assign T3_V2_ChEnable  to "DTL-030:BMD-CV-002:En";
monitor T3_V2_ChEnable;
int T3_H2_ChEnable;
assign T3_H2_ChEnable  to "DTL-030:BMD-CH-002:En";
monitor T3_H2_ChEnable;
int T4_V1_ChEnable;
assign T4_V1_ChEnable  to "DTL-040:BMD-CV-001:En";
monitor T4_V1_ChEnable;
int T4_H1_ChEnable;
assign T4_H1_ChEnable  to "DTL-040:BMD-CH-001:En";
monitor T4_H1_ChEnable;
int T4_V2_ChEnable;
assign T4_V2_ChEnable  to "DTL-040:BMD-CV-002:En";
monitor T4_V2_ChEnable;
int T4_H2_ChEnable;
assign T4_H2_ChEnable  to "DTL-040:BMD-CH-002:En";
monitor T4_H2_ChEnable;
int T5_V1_ChEnable;
assign T5_V1_ChEnable  to "DTL-050:BMD-CV-001:En";
monitor T5_V1_ChEnable;
int T5_H1_ChEnable;
assign T5_H1_ChEnable  to "DTL-050:BMD-CH-001:En";
monitor T5_H1_ChEnable;
int T5_V2_ChEnable;
assign T5_V2_ChEnable  to "DTL-050:BMD-CV-002:En";
monitor T5_V2_ChEnable;
int T5_H2_ChEnable;
assign T5_H2_ChEnable  to "DTL-050:BMD-CH-002:En";
monitor T5_H2_ChEnable;


/* PS Channel Current Set */
double T1_V1_CurrentSet;
assign T1_V1_CurrentSet  to "DTL-010:BMD-CV-001:CurSet";
monitor T1_V1_CurrentSet;
double T1_H1_CurrentSet;
assign T1_H1_CurrentSet  to "DTL-010:BMD-CH-001:CurSet";
monitor T1_H1_CurrentSet;
double T1_V2_CurrentSet;
assign T1_V2_CurrentSet  to "DTL-010:BMD-CV-002:CurSet";
monitor T1_V2_CurrentSet;
double T1_H2_CurrentSet;
assign T1_H2_CurrentSet  to "DTL-010:BMD-CH-002:CurSet";
monitor T1_H2_CurrentSet;
double T1_V3_CurrentSet;
assign T1_V3_CurrentSet  to "DTL-010:BMD-CV-003:CurSet";
monitor T1_V3_CurrentSet;
double T1_H3_CurrentSet;
assign T1_H3_CurrentSet  to "DTL-010:BMD-CH-003:CurSet";
monitor T1_H3_CurrentSet;
double T1_V4_CurrentSet;
assign T1_V4_CurrentSet  to "DTL-010:BMD-CV-004:CurSet";
monitor T1_V4_CurrentSet;
double T1_H4_CurrentSet;
assign T1_H4_CurrentSet  to "DTL-010:BMD-CH-004:CurSet";
monitor T1_H4_CurrentSet;
double T1_V5_CurrentSet;
assign T1_V5_CurrentSet  to "DTL-010:BMD-CV-005:CurSet";
monitor T1_V5_CurrentSet;
double T1_H5_CurrentSet;
assign T1_H5_CurrentSet  to "DTL-010:BMD-CH-005:CurSet";
monitor T1_H5_CurrentSet;
double T1_V6_CurrentSet;
assign T1_V6_CurrentSet  to "DTL-010:BMD-CV-001:CurSet";
monitor T1_V6_CurrentSet;
double T1_H6_CurrentSet;
assign T1_H6_CurrentSet  to "DTL-010:BMD-CH-001:CurSet";
monitor T1_H6_CurrentSet;
double T2_V1_CurrentSet;
assign T2_V1_CurrentSet  to "DTL-020:BMD-CV-001:CurSet";
monitor T2_V1_CurrentSet;
double T2_H1_CurrentSet;
assign T2_H1_CurrentSet  to "DTL-020:BMD-CH-001:CurSet";
monitor T2_H1_CurrentSet;
double T2_V2_CurrentSet;
assign T2_V2_CurrentSet  to "DTL-020:BMD-CV-002:CurSet";
monitor T2_V2_CurrentSet;
double T2_H2_CurrentSet;
assign T2_H2_CurrentSet  to "DTL-020:BMD-CH-002:CurSet";
monitor T2_H2_CurrentSet;
double T2_V3_CurrentSet;
assign T2_V3_CurrentSet  to "DTL-020:BMD-CV-003:CurSet";
monitor T2_V3_CurrentSet;
double T2_H3_CurrentSet;
assign T2_H3_CurrentSet  to "DTL-020:BMD-CH-003:CurSet";
monitor T2_H3_CurrentSet;
double T3_V1_CurrentSet;
assign T3_V1_CurrentSet  to "DTL-030:BMD-CV-001:CurSet";
monitor T3_V1_CurrentSet;
double T3_H1_CurrentSet;
assign T3_H1_CurrentSet  to "DTL-030:BMD-CH-001:CurSet";
monitor T3_H1_CurrentSet;
double T3_V2_CurrentSet;
assign T3_V2_CurrentSet  to "DTL-030:BMD-CV-002:CurSet";
monitor T3_V2_CurrentSet;
double T3_H2_CurrentSet;
assign T3_H2_CurrentSet  to "DTL-030:BMD-CH-002:CurSet";
monitor T3_H2_CurrentSet;
double T4_V1_CurrentSet;
assign T4_V1_CurrentSet  to "DTL-040:BMD-CV-001:CurSet";
monitor T4_V1_CurrentSet;
double T4_H1_CurrentSet;
assign T4_H1_CurrentSet  to "DTL-040:BMD-CH-001:CurSet";
monitor T4_H1_CurrentSet;
double T4_V2_CurrentSet;
assign T4_V2_CurrentSet  to "DTL-040:BMD-CV-002:CurSet";
monitor T4_V2_CurrentSet;
double T4_H2_CurrentSet;
assign T4_H2_CurrentSet  to "DTL-040:BMD-CH-002:CurSet";
monitor T4_H2_CurrentSet;
double T5_V1_CurrentSet;
assign T5_V1_CurrentSet  to "DTL-050:BMD-CV-001:CurSet";
monitor T5_V1_CurrentSet;
double T5_H1_CurrentSet;
assign T5_H1_CurrentSet  to "DTL-050:BMD-CH-001:CurSet";
monitor T5_H1_CurrentSet;
double T5_V2_CurrentSet;
assign T5_V2_CurrentSet  to "DTL-050:BMD-CV-002:CurSet";
monitor T5_V2_CurrentSet;
double T5_H2_CurrentSet;
assign T5_H2_CurrentSet  to "DTL-050:BMD-CH-002:CurSet";
monitor T5_H2_CurrentSet;

/* PS Channel Current Set - Readback*/
double T1_V1_CurrentSet_RB;
assign T1_V1_CurrentSet_RB  to "DTL-010:BMD-CV-001:CurSet-RB";
monitor T1_V1_CurrentSet_RB;
double T1_H1_CurrentSet_RB;
assign T1_H1_CurrentSet_RB  to "DTL-010:BMD-CH-001:CurSet-RB";
monitor T1_H1_CurrentSet_RB;
double T1_V2_CurrentSet_RB;
assign T1_V2_CurrentSet_RB  to "DTL-010:BMD-CV-002:CurSet-RB";
monitor T1_V2_CurrentSet_RB;
double T1_H2_CurrentSet_RB;
assign T1_H2_CurrentSet_RB  to "DTL-010:BMD-CH-002:CurSet-RB";
monitor T1_H2_CurrentSet_RB;
double T1_V3_CurrentSet_RB;
assign T1_V3_CurrentSet_RB  to "DTL-010:BMD-CV-003:CurSet-RB";
monitor T1_V3_CurrentSet_RB;
double T1_H3_CurrentSet_RB;
assign T1_H3_CurrentSet_RB  to "DTL-010:BMD-CH-003:CurSet-RB";
monitor T1_H3_CurrentSet_RB;
double T1_V4_CurrentSet_RB;
assign T1_V4_CurrentSet_RB  to "DTL-010:BMD-CV-004:CurSet-RB";
monitor T1_V4_CurrentSet_RB;
double T1_H4_CurrentSet_RB;
assign T1_H4_CurrentSet_RB  to "DTL-010:BMD-CH-004:CurSet-RB";
monitor T1_H4_CurrentSet_RB;
double T1_V5_CurrentSet_RB;
assign T1_V5_CurrentSet_RB  to "DTL-010:BMD-CV-005:CurSet-RB";
monitor T1_V5_CurrentSet_RB;
double T1_H5_CurrentSet_RB;
assign T1_H5_CurrentSet_RB  to "DTL-010:BMD-CH-005:CurSet-RB";
monitor T1_H5_CurrentSet_RB;
double T1_V6_CurrentSet_RB;
assign T1_V6_CurrentSet_RB  to "DTL-010:BMD-CV-001:CurSet-RB";
monitor T1_V6_CurrentSet_RB;
double T1_H6_CurrentSet_RB;
assign T1_H6_CurrentSet_RB  to "DTL-010:BMD-CH-001:CurSet-RB";
monitor T1_H6_CurrentSet_RB;
double T2_V1_CurrentSet_RB;
assign T2_V1_CurrentSet_RB  to "DTL-020:BMD-CV-001:CurSet-RB";
monitor T2_V1_CurrentSet_RB;
double T2_H1_CurrentSet_RB;
assign T2_H1_CurrentSet_RB  to "DTL-020:BMD-CH-001:CurSet-RB";
monitor T2_H1_CurrentSet_RB;
double T2_V2_CurrentSet_RB;
assign T2_V2_CurrentSet_RB  to "DTL-020:BMD-CV-002:CurSet-RB";
monitor T2_V2_CurrentSet_RB;
double T2_H2_CurrentSet_RB;
assign T2_H2_CurrentSet_RB  to "DTL-020:BMD-CH-002:CurSet-RB";
monitor T2_H2_CurrentSet_RB;
double T2_V3_CurrentSet_RB;
assign T2_V3_CurrentSet_RB  to "DTL-020:BMD-CV-003:CurSet-RB";
monitor T2_V3_CurrentSet_RB;
double T2_H3_CurrentSet_RB;
assign T2_H3_CurrentSet_RB  to "DTL-020:BMD-CH-003:CurSet-RB";
monitor T2_H3_CurrentSet_RB;
double T3_V1_CurrentSet_RB;
assign T3_V1_CurrentSet_RB  to "DTL-030:BMD-CV-001:CurSet-RB";
monitor T3_V1_CurrentSet_RB;
double T3_H1_CurrentSet_RB;
assign T3_H1_CurrentSet_RB  to "DTL-030:BMD-CH-001:CurSet-RB";
monitor T3_H1_CurrentSet_RB;
double T3_V2_CurrentSet_RB;
assign T3_V2_CurrentSet_RB  to "DTL-030:BMD-CV-002:CurSet-RB";
monitor T3_V2_CurrentSet_RB;
double T3_H2_CurrentSet_RB;
assign T3_H2_CurrentSet_RB  to "DTL-030:BMD-CH-002:CurSet-RB";
monitor T3_H2_CurrentSet_RB;
double T4_V1_CurrentSet_RB;
assign T4_V1_CurrentSet_RB  to "DTL-040:BMD-CV-001:CurSet-RB";
monitor T4_V1_CurrentSet_RB;
double T4_H1_CurrentSet_RB;
assign T4_H1_CurrentSet_RB  to "DTL-040:BMD-CH-001:CurSet-RB";
monitor T4_H1_CurrentSet_RB;
double T4_V2_CurrentSet_RB;
assign T4_V2_CurrentSet_RB  to "DTL-040:BMD-CV-002:CurSet-RB";
monitor T4_V2_CurrentSet_RB;
double T4_H2_CurrentSet_RB;
assign T4_H2_CurrentSet_RB  to "DTL-040:BMD-CH-002:CurSet-RB";
monitor T4_H2_CurrentSet_RB;
double T5_V1_CurrentSet_RB;
assign T5_V1_CurrentSet_RB  to "DTL-050:BMD-CV-001:CurSet-RB";
monitor T5_V1_CurrentSet_RB;
double T5_H1_CurrentSet_RB;
assign T5_H1_CurrentSet_RB  to "DTL-050:BMD-CH-001:CurSet-RB";
monitor T5_H1_CurrentSet_RB;
double T5_V2_CurrentSet_RB;
assign T5_V2_CurrentSet_RB  to "DTL-050:BMD-CV-002:CurSet-RB";
monitor T5_V2_CurrentSet_RB;
double T5_H2_CurrentSet_RB;
assign T5_H2_CurrentSet_RB  to "DTL-050:BMD-CH-002:CurSet-RB";
monitor T5_H2_CurrentSet_RB;

/* PS Channel Current Measured*/
double T1_V1_Current;
assign T1_V1_Current  to "DTL-010:BMD-CV-001:Cur";
monitor T1_V1_Current;
double T1_H1_Current;
assign T1_H1_Current  to "DTL-010:BMD-CH-001:Cur";
monitor T1_H1_Current;
double T1_V2_Current;
assign T1_V2_Current  to "DTL-010:BMD-CV-002:Cur";
monitor T1_V2_Current;
double T1_H2_Current;
assign T1_H2_Current  to "DTL-010:BMD-CH-002:Cur";
monitor T1_H2_Current;
double T1_V3_Current;
assign T1_V3_Current  to "DTL-010:BMD-CV-003:Cur";
monitor T1_V3_Current;
double T1_H3_Current;
assign T1_H3_Current  to "DTL-010:BMD-CH-003:Cur";
monitor T1_H3_Current;
double T1_V4_Current;
assign T1_V4_Current  to "DTL-010:BMD-CV-004:Cur";
monitor T1_V4_Current;
double T1_H4_Current;
assign T1_H4_Current  to "DTL-010:BMD-CH-004:Cur";
monitor T1_H4_Current;
double T1_V5_Current;
assign T1_V5_Current  to "DTL-010:BMD-CV-005:Cur";
monitor T1_V5_Current;
double T1_H5_Current;
assign T1_H5_Current  to "DTL-010:BMD-CH-005:Cur";
monitor T1_H5_Current;
double T1_V6_Current;
assign T1_V6_Current  to "DTL-010:BMD-CV-001:Cur";
monitor T1_V6_Current;
double T1_H6_Current;
assign T1_H6_Current  to "DTL-010:BMD-CH-001:Cur";
monitor T1_H6_Current;
double T2_V1_Current;
assign T2_V1_Current  to "DTL-020:BMD-CV-001:Cur";
monitor T2_V1_Current;
double T2_H1_Current;
assign T2_H1_Current  to "DTL-020:BMD-CH-001:Cur";
monitor T2_H1_Current;
double T2_V2_Current;
assign T2_V2_Current  to "DTL-020:BMD-CV-002:Cur";
monitor T2_V2_Current;
double T2_H2_Current;
assign T2_H2_Current  to "DTL-020:BMD-CH-002:Cur";
monitor T2_H2_Current;
double T2_V3_Current;
assign T2_V3_Current  to "DTL-020:BMD-CV-003:Cur";
monitor T2_V3_Current;
double T2_H3_Current;
assign T2_H3_Current  to "DTL-020:BMD-CH-003:Cur";
monitor T2_H3_Current;
double T3_V1_Current;
assign T3_V1_Current  to "DTL-030:BMD-CV-001:Cur";
monitor T3_V1_Current;
double T3_H1_Current;
assign T3_H1_Current  to "DTL-030:BMD-CH-001:Cur";
monitor T3_H1_Current;
double T3_V2_Current;
assign T3_V2_Current  to "DTL-030:BMD-CV-002:Cur";
monitor T3_V2_Current;
double T3_H2_Current;
assign T3_H2_Current  to "DTL-030:BMD-CH-002:Cur";
monitor T3_H2_Current;
double T4_V1_Current;
assign T4_V1_Current  to "DTL-040:BMD-CV-001:Cur";
monitor T4_V1_Current;
double T4_H1_Current;
assign T4_H1_Current  to "DTL-040:BMD-CH-001:Cur";
monitor T4_H1_Current;
double T4_V2_Current;
assign T4_V2_Current  to "DTL-040:BMD-CV-002:Cur";
monitor T4_V2_Current;
double T4_H2_Current;
assign T4_H2_Current  to "DTL-040:BMD-CH-002:Cur";
monitor T4_H2_Current;
double T5_V1_Current;
assign T5_V1_Current  to "DTL-050:BMD-CV-001:Cur";
monitor T5_V1_Current;
double T5_H1_Current;
assign T5_H1_Current  to "DTL-050:BMD-CH-001:Cur";
monitor T5_H1_Current;
double T5_V2_Current;
assign T5_V2_Current  to "DTL-050:BMD-CV-002:Cur";
monitor T5_V2_Current;
double T5_H2_Current;
assign T5_H2_Current  to "DTL-050:BMD-CH-002:Cur";
monitor T5_H2_Current;

/* PS Channel Voltage Measured*/
double T1_V1_Voltage;
assign T1_V1_Voltage  to "DTL-010:BMD-CV-001:Vol";
monitor T1_V1_Voltage;
double T1_H1_Voltage;
assign T1_H1_Voltage  to "DTL-010:BMD-CH-001:Vol";
monitor T1_H1_Voltage;
double T1_V2_Voltage;
assign T1_V2_Voltage  to "DTL-010:BMD-CV-002:Vol";
monitor T1_V2_Voltage;
double T1_H2_Voltage;
assign T1_H2_Voltage  to "DTL-010:BMD-CH-002:Vol";
monitor T1_H2_Voltage;
double T1_V3_Voltage;
assign T1_V3_Voltage  to "DTL-010:BMD-CV-003:Vol";
monitor T1_V3_Voltage;
double T1_H3_Voltage;
assign T1_H3_Voltage  to "DTL-010:BMD-CH-003:Vol";
monitor T1_H3_Voltage;
double T1_V4_Voltage;
assign T1_V4_Voltage  to "DTL-010:BMD-CV-004:Vol";
monitor T1_V4_Voltage;
double T1_H4_Voltage;
assign T1_H4_Voltage  to "DTL-010:BMD-CH-004:Vol";
monitor T1_H4_Voltage;
double T1_V5_Voltage;
assign T1_V5_Voltage  to "DTL-010:BMD-CV-005:Vol";
monitor T1_V5_Voltage;
double T1_H5_Voltage;
assign T1_H5_Voltage  to "DTL-010:BMD-CH-005:Vol";
monitor T1_H5_Voltage;
double T1_V6_Voltage;
assign T1_V6_Voltage  to "DTL-010:BMD-CV-001:Vol";
monitor T1_V6_Voltage;
double T1_H6_Voltage;
assign T1_H6_Voltage  to "DTL-010:BMD-CH-001:Vol";
monitor T1_H6_Voltage;
double T2_V1_Voltage;
assign T2_V1_Voltage  to "DTL-020:BMD-CV-001:Vol";
monitor T2_V1_Voltage;
double T2_H1_Voltage;
assign T2_H1_Voltage  to "DTL-020:BMD-CH-001:Vol";
monitor T2_H1_Voltage;
double T2_V2_Voltage;
assign T2_V2_Voltage  to "DTL-020:BMD-CV-002:Vol";
monitor T2_V2_Voltage;
double T2_H2_Voltage;
assign T2_H2_Voltage  to "DTL-020:BMD-CH-002:Vol";
monitor T2_H2_Voltage;
double T2_V3_Voltage;
assign T2_V3_Voltage  to "DTL-020:BMD-CV-003:Vol";
monitor T2_V3_Voltage;
double T2_H3_Voltage;
assign T2_H3_Voltage  to "DTL-020:BMD-CH-003:Vol";
monitor T2_H3_Voltage;
double T3_V1_Voltage;
assign T3_V1_Voltage  to "DTL-030:BMD-CV-001:Vol";
monitor T3_V1_Voltage;
double T3_H1_Voltage;
assign T3_H1_Voltage  to "DTL-030:BMD-CH-001:Vol";
monitor T3_H1_Voltage;
double T3_V2_Voltage;
assign T3_V2_Voltage  to "DTL-030:BMD-CV-002:Vol";
monitor T3_V2_Voltage;
double T3_H2_Voltage;
assign T3_H2_Voltage  to "DTL-030:BMD-CH-002:Vol";
monitor T3_H2_Voltage;
double T4_V1_Voltage;
assign T4_V1_Voltage  to "DTL-040:BMD-CV-001:Vol";
monitor T4_V1_Voltage;
double T4_H1_Voltage;
assign T4_H1_Voltage  to "DTL-040:BMD-CH-001:Vol";
monitor T4_H1_Voltage;
double T4_V2_Voltage;
assign T4_V2_Voltage  to "DTL-040:BMD-CV-002:Vol";
monitor T4_V2_Voltage;
double T4_H2_Voltage;
assign T4_H2_Voltage  to "DTL-040:BMD-CH-002:Vol";
monitor T4_H2_Voltage;
double T5_V1_Voltage;
assign T5_V1_Voltage  to "DTL-050:BMD-CV-001:Vol";
monitor T5_V1_Voltage;
double T5_H1_Voltage;
assign T5_H1_Voltage  to "DTL-050:BMD-CH-001:Vol";
monitor T5_H1_Voltage;
double T5_V2_Voltage;
assign T5_V2_Voltage  to "DTL-050:BMD-CV-002:Vol";
monitor T5_V2_Voltage;
double T5_H2_Voltage;
assign T5_H2_Voltage  to "DTL-050:BMD-CH-002:Vol";
monitor T5_H2_Voltage;


/* Chassis Enable */
int Chassis1_enable;
assign Chassis1_enable to "DTL-010ROW:PwrC-001:OnEnCmd";
monitor Chassis1_enable;
int Chassis2_enable;
assign Chassis2_enable to "DTL-010ROW:PwrC-002:OnEnCmd";
monitor Chassis2_enable;
int Chassis3_enable;
assign Chassis3_enable to "DTL-010ROW:PwrC-003:OnEnCmd";
monitor Chassis3_enable;
int Chassis4_enable;
assign Chassis4_enable to "DTL-030ROW:PwrC-001:OnEnCmd";
monitor Chassis4_enable;
int Chassis5_enable;
assign Chassis5_enable to "DTL-030ROW:PwrC-002:OnEnCmd";
monitor Chassis5_enable;

/* PS Line Enable */
int T1_V1_LineEnable;
assign T1_V1_LineEnable  to "DTL-010:PwrC-PSCV-001:OnEnCmd";
monitor T1_V1_LineEnable;
int T1_H1_LineEnable;
assign T1_H1_LineEnable  to "DTL-010:PwrC-PSCH-001:OnEnCmd";
monitor T1_H1_LineEnable;
int T1_V2_LineEnable;
assign T1_V2_LineEnable  to "DTL-010:PwrC-PSCV-002:OnEnCmd";
monitor T1_V2_LineEnable;
int T1_H2_LineEnable;
assign T1_H2_LineEnable  to "DTL-010:PwrC-PSCH-002:OnEnCmd";
monitor T1_H2_LineEnable;
int T1_V3_LineEnable;
assign T1_V3_LineEnable  to "DTL-010:PwrC-PSCV-003:OnEnCmd";
monitor T1_V3_LineEnable;
int T1_H3_LineEnable;
assign T1_H3_LineEnable  to "DTL-010:PwrC-PSCH-003:OnEnCmd";
monitor T1_H3_LineEnable;
int T1_V4_LineEnable;
assign T1_V4_LineEnable  to "DTL-010:PwrC-PSCV-004:OnEnCmd";
monitor T1_V4_LineEnable;
int T1_H4_LineEnable;
assign T1_H4_LineEnable  to "DTL-010:PwrC-PSCH-004:OnEnCmd";
monitor T1_H4_LineEnable;
int T1_V5_LineEnable;
assign T1_V5_LineEnable  to "DTL-010:PwrC-PSCV-005:OnEnCmd";
monitor T1_V5_LineEnable;
int T1_H5_LineEnable;
assign T1_H5_LineEnable  to "DTL-010:PwrC-PSCH-005:OnEnCmd";
monitor T1_H5_LineEnable;
int T1_V6_LineEnable;
assign T1_V6_LineEnable  to "DTL-010:PwrC-PSCV-001:OnEnCmd";
monitor T1_V6_LineEnable;
int T1_H6_LineEnable;
assign T1_H6_LineEnable  to "DTL-010:PwrC-PSCH-001:OnEnCmd";
monitor T1_H6_LineEnable;
int T2_V1_LineEnable;
assign T2_V1_LineEnable  to "DTL-020:PwrC-PSCV-001:OnEnCmd";
monitor T2_V1_LineEnable;
int T2_H1_LineEnable;
assign T2_H1_LineEnable  to "DTL-020:PwrC-PSCH-001:OnEnCmd";
monitor T2_H1_LineEnable;
int T2_V2_LineEnable;
assign T2_V2_LineEnable  to "DTL-020:PwrC-PSCV-002:OnEnCmd";
monitor T2_V2_LineEnable;
int T2_H2_LineEnable;
assign T2_H2_LineEnable  to "DTL-020:PwrC-PSCH-002:OnEnCmd";
monitor T2_H2_LineEnable;
int T2_V3_LineEnable;
assign T2_V3_LineEnable  to "DTL-020:PwrC-PSCV-003:OnEnCmd";
monitor T2_V3_LineEnable;
int T2_H3_LineEnable;
assign T2_H3_LineEnable  to "DTL-020:PwrC-PSCH-003:OnEnCmd";
monitor T2_H3_LineEnable;
int T3_V1_LineEnable;
assign T3_V1_LineEnable  to "DTL-030:PwrC-PSCV-001:OnEnCmd";
monitor T3_V1_LineEnable;
int T3_H1_LineEnable;
assign T3_H1_LineEnable  to "DTL-030:PwrC-PSCH-001:OnEnCmd";
monitor T3_H1_LineEnable;
int T3_V2_LineEnable;
assign T3_V2_LineEnable  to "DTL-030:PwrC-PSCV-002:OnEnCmd";
monitor T3_V2_LineEnable;
int T3_H2_LineEnable;
assign T3_H2_LineEnable  to "DTL-030:PwrC-PSCH-002:OnEnCmd";
monitor T3_H2_LineEnable;
int T4_V1_LineEnable;
assign T4_V1_LineEnable  to "DTL-040:PwrC-PSCV-001:OnEnCmd";
monitor T4_V1_LineEnable;
int T4_H1_LineEnable;
assign T4_H1_LineEnable  to "DTL-040:PwrC-PSCH-001:OnEnCmd";
monitor T4_H1_LineEnable;
int T4_V2_LineEnable;
assign T4_V2_LineEnable  to "DTL-040:PwrC-PSCV-002:OnEnCmd";
monitor T4_V2_LineEnable;
int T4_H2_LineEnable;
assign T4_H2_LineEnable  to "DTL-040:PwrC-PSCH-002:OnEnCmd";
monitor T4_H2_LineEnable;
int T5_V1_LineEnable;
assign T5_V1_LineEnable  to "DTL-050:PwrC-PSCV-001:OnEnCmd";
monitor T5_V1_LineEnable;
int T5_H1_LineEnable;
assign T5_H1_LineEnable  to "DTL-050:PwrC-PSCH-001:OnEnCmd";
monitor T5_H1_LineEnable;
int T5_V2_LineEnable;
assign T5_V2_LineEnable  to "DTL-050:PwrC-PSCV-002:OnEnCmd";
monitor T5_V2_LineEnable;
int T5_H2_LineEnable;
assign T5_H2_LineEnable  to "DTL-050:PwrC-PSCH-002:OnEnCmd";
monitor T5_H2_LineEnable;


/* Manual/Auto Control  */
int AutoControlCmd;
assign AutoControlCmd to "DTL:PwrC-PSC:AutoCmd";
monitor AutoControlCmd;






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
assign StateMachineCode to "DTL:PwrC:StateMachine";


/*  check
int RfSlow_okstatus;
assign RfSlow_okstatus to "{SECTION_NAME}:EMR-Cav-001:WrtC_OkStatS";
monitor RfSlow_okstatus;
*/

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
