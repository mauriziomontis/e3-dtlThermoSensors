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
int T1_H2_OkStat;
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
int T2_H2_OkStat;
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
int T3_H2_OkStat;
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
int T4_H2_OkStat;
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
int T5_H2_OkStat;
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
int T1_H2_Termal_OkStat;
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
int T2_H2_Termal_OkStat;
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
int T3_H2_Termal_OkStat;
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
int T4_H2_Termal_OkStat;
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
int T5_H2_Termal_OkStat;
assign T5_H2_Termal_OkStat  to "DTL-050:PwrC-PSCH-002:TS_OkStat";
monitor T5_H2_Termal_OkStat;

/* 24V Ok Status */
int Rack010_24V;
assign Rack010_24V to "DTL-010Row:CnPw-U-003:24VPS_OKStat";
monitor Rack010_24V;
int Rack030_24V;
assign Rack030_24V to "DTL-030Row:CnPw-U-003:24VPS_OKStat";
monitor Rack030_24V;


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

/* Delta Impedances */
double MAX_DEVIANCE = 2;     // max impedance deviation accepted before fault [Ohm]

double T1_V1_DeltaImpedance;
assign T1_V1_DeltaImpedance  to "DTL-010:BMD-CV-001:DeltaImp";
monitor T1_V1_DeltaImpedance;
double T1_H1_DeltaImpedance;
assign T1_H1_DeltaImpedance  to "DTL-010:BMD-CH-001:DeltaImp";
monitor T1_H1_DeltaImpedance;
double T1_V2_DeltaImpedance;
assign T1_V2_DeltaImpedance  to "DTL-010:BMD-CV-002:DeltaImp";
monitor T1_V2_DeltaImpedance;
double T1_H2_DeltaImpedance;
assign T1_H2_DeltaImpedance  to "DTL-010:BMD-CH-002:DeltaImp";
monitor T1_H2_DeltaImpedance;
double T1_V3_DeltaImpedance;
assign T1_V3_DeltaImpedance  to "DTL-010:BMD-CV-003:DeltaImp";
monitor T1_V3_DeltaImpedance;
double T1_H3_DeltaImpedance;
assign T1_H3_DeltaImpedance  to "DTL-010:BMD-CH-003:DeltaImp";
monitor T1_H3_DeltaImpedance;
double T1_V4_DeltaImpedance;
assign T1_V4_DeltaImpedance  to "DTL-010:BMD-CV-004:DeltaImp";
monitor T1_V4_DeltaImpedance;
double T1_H4_DeltaImpedance;
assign T1_H4_DeltaImpedance  to "DTL-010:BMD-CH-004:DeltaImp";
monitor T1_H4_DeltaImpedance;
double T1_V5_DeltaImpedance;
assign T1_V5_DeltaImpedance  to "DTL-010:BMD-CV-005:DeltaImp";
monitor T1_V5_DeltaImpedance;
double T1_H5_DeltaImpedance;
assign T1_H5_DeltaImpedance  to "DTL-010:BMD-CH-005:DeltaImp";
monitor T1_H5_DeltaImpedance;
double T1_V6_DeltaImpedance;
assign T1_V6_DeltaImpedance  to "DTL-010:BMD-CV-001:DeltaImp";
monitor T1_V6_DeltaImpedance;
double T1_H6_DeltaImpedance;
assign T1_H6_DeltaImpedance  to "DTL-010:BMD-CH-001:DeltaImp";
monitor T1_H6_DeltaImpedance;
double T2_V1_DeltaImpedance;
assign T2_V1_DeltaImpedance  to "DTL-020:BMD-CV-001:DeltaImp";
monitor T2_V1_DeltaImpedance;
double T2_H1_DeltaImpedance;
assign T2_H1_DeltaImpedance  to "DTL-020:BMD-CH-001:DeltaImp";
monitor T2_H1_DeltaImpedance;
double T2_V2_DeltaImpedance;
assign T2_V2_DeltaImpedance  to "DTL-020:BMD-CV-002:DeltaImp";
monitor T2_V2_DeltaImpedance;
double T2_H2_DeltaImpedance;
assign T2_H2_DeltaImpedance  to "DTL-020:BMD-CH-002:DeltaImp";
monitor T2_H2_DeltaImpedance;
double T2_V3_DeltaImpedance;
assign T2_V3_DeltaImpedance  to "DTL-020:BMD-CV-003:DeltaImp";
monitor T2_V3_DeltaImpedance;
double T2_H3_DeltaImpedance;
assign T2_H3_DeltaImpedance  to "DTL-020:BMD-CH-003:DeltaImp";
monitor T2_H3_DeltaImpedance;
double T3_V1_DeltaImpedance;
assign T3_V1_DeltaImpedance  to "DTL-030:BMD-CV-001:DeltaImp";
monitor T3_V1_DeltaImpedance;
double T3_H1_DeltaImpedance;
assign T3_H1_DeltaImpedance  to "DTL-030:BMD-CH-001:DeltaImp";
monitor T3_H1_DeltaImpedance;
double T3_V2_DeltaImpedance;
assign T3_V2_DeltaImpedance  to "DTL-030:BMD-CV-002:DeltaImp";
monitor T3_V2_DeltaImpedance;
double T3_H2_DeltaImpedance;
assign T3_H2_DeltaImpedance  to "DTL-030:BMD-CH-002:DeltaImp";
monitor T3_H2_DeltaImpedance;
double T4_V1_DeltaImpedance;
assign T4_V1_DeltaImpedance  to "DTL-040:BMD-CV-001:DeltaImp";
monitor T4_V1_DeltaImpedance;
double T4_H1_DeltaImpedance;
assign T4_H1_DeltaImpedance  to "DTL-040:BMD-CH-001:DeltaImp";
monitor T4_H1_DeltaImpedance;
double T4_V2_DeltaImpedance;
assign T4_V2_DeltaImpedance  to "DTL-040:BMD-CV-002:DeltaImp";
monitor T4_V2_DeltaImpedance;
double T4_H2_DeltaImpedance;
assign T4_H2_DeltaImpedance  to "DTL-040:BMD-CH-002:DeltaImp";
monitor T4_H2_DeltaImpedance;
double T5_V1_DeltaImpedance;
assign T5_V1_DeltaImpedance  to "DTL-050:BMD-CV-001:DeltaImp";
monitor T5_V1_DeltaImpedance;
double T5_H1_DeltaImpedance;
assign T5_H1_DeltaImpedance  to "DTL-050:BMD-CH-001:DeltaImp";
monitor T5_H1_DeltaImpedance;
double T5_V2_DeltaImpedance;
assign T5_V2_DeltaImpedance  to "DTL-050:BMD-CV-002:DeltaImp";
monitor T5_V2_DeltaImpedance;
double T5_H2_DeltaImpedance;
assign T5_H2_DeltaImpedance  to "DTL-050:BMD-CH-002:DeltaImp";
monitor T5_H2_DeltaImpedance;



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

/* Chassis Enable - readback */
int Chassis1_enable_RB;
assign Chassis1_enable_RB to "DTL-010ROW:PwrC-001:OnEnCmd-RB";
monitor Chassis1_enable_RB;
int Chassis2_enable_RB;
assign Chassis2_enable_RB to "DTL-010ROW:PwrC-002:OnEnCmd-RB";
monitor Chassis2_enable_RB;
int Chassis3_enable_RB;
assign Chassis3_enable_RB to "DTL-010ROW:PwrC-003:OnEnCmd-RB";
monitor Chassis3_enable_RB;
int Chassis4_enable_RB;
assign Chassis4_enable_RB to "DTL-030ROW:PwrC-001:OnEnCmd-RB";
monitor Chassis4_enable_RB;
int Chassis5_enable_RB;
assign Chassis5_enable_RB to "DTL-030ROW:PwrC-002:OnEnCmd-RB";
monitor Chassis5_enable_RB;



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

/* PS Line Enable - readback */
int T1_V1_LineEnable_RB;
assign T1_V1_LineEnable_RB  to "DTL-010:PwrC-PSCV-001OnEnCmd-RB";
monitor T1_V1_LineEnable_RB;
int T1_H1_LineEnable_RB;
assign T1_H1_LineEnable_RB  to "DTL-010:PwrC-PSCH-001OnEnCmd-RB";
monitor T1_H1_LineEnable_RB;
int T1_V2_LineEnable_RB;
assign T1_V2_LineEnable_RB  to "DTL-010:PwrC-PSCV-002OnEnCmd-RB";
monitor T1_V2_LineEnable_RB;
int T1_H2_LineEnable_RB;
assign T1_H2_LineEnable_RB  to "DTL-010:PwrC-PSCH-002OnEnCmd-RB";
monitor T1_H2_LineEnable_RB;
int T1_V3_LineEnable_RB;
assign T1_V3_LineEnable_RB  to "DTL-010:PwrC-PSCV-003OnEnCmd-RB";
monitor T1_V3_LineEnable_RB;
int T1_H3_LineEnable_RB;
assign T1_H3_LineEnable_RB  to "DTL-010:PwrC-PSCH-003OnEnCmd-RB";
monitor T1_H3_LineEnable_RB;
int T1_V4_LineEnable_RB;
assign T1_V4_LineEnable_RB  to "DTL-010:PwrC-PSCV-004OnEnCmd-RB";
monitor T1_V4_LineEnable_RB;
int T1_H4_LineEnable_RB;
assign T1_H4_LineEnable_RB  to "DTL-010:PwrC-PSCH-004OnEnCmd-RB";
monitor T1_H4_LineEnable_RB;
int T1_V5_LineEnable_RB;
assign T1_V5_LineEnable_RB  to "DTL-010:PwrC-PSCV-005OnEnCmd-RB";
monitor T1_V5_LineEnable_RB;
int T1_H5_LineEnable_RB;
assign T1_H5_LineEnable_RB  to "DTL-010:PwrC-PSCH-005OnEnCmd-RB";
monitor T1_H5_LineEnable_RB;
int T1_V6_LineEnable_RB;
assign T1_V6_LineEnable_RB  to "DTL-010:PwrC-PSCV-001OnEnCmd-RB";
monitor T1_V6_LineEnable_RB;
int T1_H6_LineEnable_RB;
assign T1_H6_LineEnable_RB  to "DTL-010:PwrC-PSCH-001OnEnCmd-RB";
monitor T1_H6_LineEnable_RB;
int T2_V1_LineEnable_RB;
assign T2_V1_LineEnable_RB  to "DTL-020:PwrC-PSCV-001OnEnCmd-RB";
monitor T2_V1_LineEnable_RB;
int T2_H1_LineEnable_RB;
assign T2_H1_LineEnable_RB  to "DTL-020:PwrC-PSCH-001OnEnCmd-RB";
monitor T2_H1_LineEnable_RB;
int T2_V2_LineEnable_RB;
assign T2_V2_LineEnable_RB  to "DTL-020:PwrC-PSCV-002OnEnCmd-RB";
monitor T2_V2_LineEnable_RB;
int T2_H2_LineEnable_RB;
assign T2_H2_LineEnable_RB  to "DTL-020:PwrC-PSCH-002OnEnCmd-RB";
monitor T2_H2_LineEnable_RB;
int T2_V3_LineEnable_RB;
assign T2_V3_LineEnable_RB  to "DTL-020:PwrC-PSCV-003OnEnCmd-RB";
monitor T2_V3_LineEnable_RB;
int T2_H3_LineEnable_RB;
assign T2_H3_LineEnable_RB  to "DTL-020:PwrC-PSCH-003OnEnCmd-RB";
monitor T2_H3_LineEnable_RB;
int T3_V1_LineEnable_RB;
assign T3_V1_LineEnable_RB  to "DTL-030:PwrC-PSCV-001OnEnCmd-RB";
monitor T3_V1_LineEnable_RB;
int T3_H1_LineEnable_RB;
assign T3_H1_LineEnable_RB  to "DTL-030:PwrC-PSCH-001OnEnCmd-RB";
monitor T3_H1_LineEnable_RB;
int T3_V2_LineEnable_RB;
assign T3_V2_LineEnable_RB  to "DTL-030:PwrC-PSCV-002OnEnCmd-RB";
monitor T3_V2_LineEnable_RB;
int T3_H2_LineEnable_RB;
assign T3_H2_LineEnable_RB  to "DTL-030:PwrC-PSCH-002OnEnCmd-RB";
monitor T3_H2_LineEnable_RB;
int T4_V1_LineEnable_RB;
assign T4_V1_LineEnable_RB  to "DTL-040:PwrC-PSCV-001OnEnCmd-RB";
monitor T4_V1_LineEnable_RB;
int T4_H1_LineEnable_RB;
assign T4_H1_LineEnable_RB  to "DTL-040:PwrC-PSCH-001OnEnCmd-RB";
monitor T4_H1_LineEnable_RB;
int T4_V2_LineEnable_RB;
assign T4_V2_LineEnable_RB  to "DTL-040:PwrC-PSCV-002OnEnCmd-RB";
monitor T4_V2_LineEnable_RB;
int T4_H2_LineEnable_RB;
assign T4_H2_LineEnable_RB  to "DTL-040:PwrC-PSCH-002OnEnCmd-RB";
monitor T4_H2_LineEnable_RB;
int T5_V1_LineEnable_RB;
assign T5_V1_LineEnable_RB  to "DTL-050:PwrC-PSCV-001OnEnCmd-RB";
monitor T5_V1_LineEnable_RB;
int T5_H1_LineEnable_RB;
assign T5_H1_LineEnable_RB  to "DTL-050:PwrC-PSCH-001OnEnCmd-RB";
monitor T5_H1_LineEnable_RB;
int T5_V2_LineEnable_RB;
assign T5_V2_LineEnable_RB  to "DTL-050:PwrC-PSCV-002OnEnCmd-RB";
monitor T5_V2_LineEnable_RB;
int T5_H2_LineEnable_RB;
assign T5_H2_LineEnable_RB  to "DTL-050:PwrC-PSCH-002OnEnCmd-RB";
monitor T5_H2_LineEnable_RB;


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
assign StateMachineCode to "DTL:PwrC:StateMachine";

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

ss temperature030_interlock {

/* state INITIALIZATION	*/
	state initialization {
      entry {
        printf("\n\nPreliminary controls executed due to Application Startup - Intialization\n\n");
        StateMachineCode=0;
        pvPut(StateMachineCode);
      }

      when ( pvConnectCount()==pvAssignCount() ) {
        printf("[SEQ STEERERS] All PVs connected\n");
        printf("[SEQ STEERERS] Starting Self Check Process\n");
        printf("[SEQ STEERERS] 1. Enable Chassis \n");
        Chassis1_enable=1;
        pvPut(Chassis1_enable);
        Chassis2_enable=1;
        pvPut(Chassis2_enable);
        Chassis3_enable=1;
        pvPut(Chassis3_enable);
        Chassis4_enable=1;
        pvPut(Chassis4_enable);
        Chassis5_enable=1;
        pvPut(Chassis5_enable);
        printf("[SEQ STEERERS] 2. Enable Lines \n");
        T1_V1_Termal_OkStat=1;
        pvPut(T1_V1_Termal_OkStat);
        T1_H1_Termal_OkStat=1;
        pvPut(T1_H1_Termal_OkStat);
        T1_V2_Termal_OkStat=1;
        pvPut(T1_V2_Termal_OkStat);
        T1_H2_Termal_OkStat=1;
        pvPut(T1_H2_Termal_OkStat);
        T1_V3_Termal_OkStat=1;
        pvPut(T1_V3_Termal_OkStat);
        T1_H3_Termal_OkStat=1;
        pvPut(T1_H3_Termal_OkStat);
        T1_V4_Termal_OkStat=1;
        pvPut(T1_V4_Termal_OkStat);
        T1_H4_Termal_OkStat=1;
        pvPut(T1_H4_Termal_OkStat);
        T1_V5_Termal_OkStat=1;
        pvPut(T1_V5_Termal_OkStat);
        T1_H5_Termal_OkStat=1;
        pvPut(T1_H5_Termal_OkStat);
        T1_V6_Termal_OkStat=1;
        pvPut(T1_V6_Termal_OkStat);
        T1_H6_Termal_OkStat=1;
        pvPut(T1_H6_Termal_OkStat);
        T2_V1_Termal_OkStat=1;
        pvPut(T2_V1_Termal_OkStat);
        T2_H1_Termal_OkStat=1;
        pvPut(T2_H1_Termal_OkStat);
        T2_V2_Termal_OkStat=1;
        pvPut(T2_V2_Termal_OkStat);
        T2_H2_Termal_OkStat=1;
        pvPut(T2_H2_Termal_OkStat);
        T2_V3_Termal_OkStat=1;
        pvPut(T2_V3_Termal_OkStat);
        T2_H3_Termal_OkStat=1;
        pvPut(T2_H3_Termal_OkStat);
        T3_V1_Termal_OkStat=1;
        pvPut(T3_V1_Termal_OkStat);
        T3_H1_Termal_OkStat=1;
        pvPut(T3_H1_Termal_OkStat);
        T3_V2_Termal_OkStat=1;
        pvPut(T3_V2_Termal_OkStat);
        T3_H2_Termal_OkStat=1;
        pvPut(T3_H2_Termal_OkStat);
        T3_V3_Termal_OkStat=1;
        pvPut(T3_V3_Termal_OkStat);
        T3_H3_Termal_OkStat=1;
        pvPut(T3_H3_Termal_OkStat);
        T4_V1_Termal_OkStat=1;
        pvPut(T4_V1_Termal_OkStat);
        T4_H1_Termal_OkStat=1;
        pvPut(T4_H1_Termal_OkStat);
        T4_V2_Termal_OkStat=1;
        pvPut(T4_V2_Termal_OkStat);
        T4_H2_Termal_OkStat=1;
        pvPut(T4_H2_Termal_OkStat);
        T5_V1_Termal_OkStat=1;
        pvPut(T5_V1_Termal_OkStat);
        T5_H1_Termal_OkStat=1;
        pvPut(T5_H1_Termal_OkStat);
        T5_V2_Termal_OkStat=1;
        pvPut(T5_V2_Termal_OkStat);
        T5_H2_Termal_OkStat=1;
        pvPut(T5_H2_Termal_OkStat);

        /* [Man|Auto] Control Actual Value initialization */
        AutoControl_ActualStatus = AutoControlCmd;
        if ( AutoControl_ActualStatus == 0 ) {
          printf("[SEQ STEERER] Manual|Auto Steerers Control readback initialized to: MANUAL\n");
        }
        else if ( AutoControl_ActualStatus == 1 ) {
          printf("[SEQ STEERER] Manual|Auto Steerers Control readback initialized to: AUTO\n");
        }
        pvPut(AutoControl_ActualStatus);
      } state self_check
	}


/* state SELF_CHECK	*/
	state self_check {
    entry {
        printf("\n[SEQ STEERER] Enter in SELF CHECK status\n");
        StateMachineCode=10;
        pvPut(StateMachineCode);
    }

    /* Chassis disconnected (HW) */
    when ( (Chassis1_enable_RB == 0) || (Chassis2_enable_RB == 0) || (Chassis3_enable_RB == 0) || (Chassis4_enable_RB == 0) || (Chassis5_enable_RB == 0) ) {
        printf("[SEQ STEERER] Error in chassis enable system: one or more chassis are not available\n");
        printf("[SEQ STEERER] System not passed self check: go to FAILURE \n");
    } state failure

    /* Thermas Switch problem */
    when ( (T1_V1_Termal_OkStat == 0) || (T1_H1_Termal_OkStat == 0) || (T1_V2_Termal_OkStat == 0) || (T1_H2_Termal_OkStat == 0) || (T1_V3_Termal_OkStat == 0) || (T1_H3_Termal_OkStat == 0) || (T1_V4_Termal_OkStat == 0) || (T1_H4_Termal_OkStat == 0) || (T1_V5_Termal_OkStat == 0) || (T1_H5_Termal_OkStat == 0) || (T1_V6_Termal_OkStat == 0) || (T1_H6_Termal_OkStat == 0) || (T2_V1_Termal_OkStat == 0) || (T2_H1_Termal_OkStat == 0) || (T2_V2_Termal_OkStat == 0) || (T2_H2_Termal_OkStat == 0) || (T2_V3_Termal_OkStat == 0) || (T2_H3_Termal_OkStat == 0) || (T3_V1_Termal_OkStat == 0) || (T3_H1_Termal_OkStat == 0) || (T3_V2_Termal_OkStat == 0) || (T3_H2_Termal_OkStat == 0) || (T4_V1_Termal_OkStat == 0) || (T4_H1_Termal_OkStat == 0) || (T4_V2_Termal_OkStat == 0) || (T4_H2_Termal_OkStat == 0) || (T5_V1_Termal_OkStat == 0) || (T5_H1_Termal_OkStat == 0) || (T5_V2_Termal_OkStat == 0) || (T5_H2_Termal_OkStat == 0) ) {
    /* Line disconnected (HW) */
        printf("[SEQ STEERER] Error in line enable system: thermal switch problem in one or more lines \n");
        printf("[SEQ STEERER] System not passed self check: go to FAILURE \n");
    } state failure

    /* 24V Error */
    when ( (Rack010_24V == 0) || (Rack030_24V == 0) ) {
        printf("[SEQ STEERER] Error in 24V power racks. \n");
        printf("[SEQ STEERER] System not passed self check: go to FAILURE \n");
    } state failure

    /* no error in any line */
    when ( (T1_V1_Termal_OkStat == 1) && (T1_H1_Termal_OkStat == 1) && (T1_V2_Termal_OkStat == 1) && (T1_H2_Termal_OkStat == 1) && (T1_V3_Termal_OkStat == 1) && (T1_H3_Termal_OkStat == 1) && (T1_V4_Termal_OkStat == 1) && (T1_H4_Termal_OkStat == 1) && (T1_V5_Termal_OkStat == 1) && (T1_H5_Termal_OkStat == 1) && (T1_V6_Termal_OkStat == 1) && (T1_H6_Termal_OkStat == 1) && (T2_V1_Termal_OkStat == 1) && (T2_H1_Termal_OkStat == 1) && (T2_V2_Termal_OkStat == 1) && (T2_H2_Termal_OkStat == 1) && (T2_V3_Termal_OkStat == 1) && (T2_H3_Termal_OkStat == 1) && (T3_V1_Termal_OkStat == 1) && (T3_H1_Termal_OkStat == 1) && (T3_V2_Termal_OkStat == 1) && (T3_H2_Termal_OkStat == 1) && (T4_V1_Termal_OkStat == 1) && (T4_H1_Termal_OkStat == 1) && (T4_V2_Termal_OkStat == 1) && (T4_H2_Termal_OkStat == 1) && (T5_V1_Termal_OkStat == 1) && (T5_H1_Termal_OkStat == 1) && (T5_V2_Termal_OkStat == 1) && (T5_H2_Termal_OkStat == 1) ) {
        printf("[SEQ STEERER] Self Check Passed. \n");
        printf("[SEQ STEERER] Enable steerers channels. \n");

        /* NOTE: when steerer is swithced ON, the device goes to the last setpoint set. */
        /*       pay attention if the behavior is correct according to the general operations */
        T1_V1_ChEnableCmd = 1;
        pvPut(T1_V1_ChEnableCmd);
        T1_H1_ChEnableCmd = 1;
        pvPut(T1_H1_ChEnableCmd);
        T1_V2_ChEnableCmd = 1;
        pvPut(T1_V2_ChEnableCmd);
        T1_H2_ChEnableCmd = 1;
        pvPut(T1_H2_ChEnableCmd);
        T1_V3_ChEnableCmd = 1;
        pvPut(T1_V3_ChEnableCmd);
        T1_H3_ChEnableCmd = 1;
        pvPut(T1_H3_ChEnableCmd);
        T1_V4_ChEnableCmd = 1;
        pvPut(T1_V4_ChEnableCmd);
        T1_H4_ChEnableCmd = 1;
        pvPut(T1_H4_ChEnableCmd);
        T1_V5_ChEnableCmd = 1;
        pvPut(T1_V5_ChEnableCmd);
        T1_H5_ChEnableCmd = 1;
        pvPut(T1_H5_ChEnableCmd);
        T1_V6_ChEnableCmd = 1;
        pvPut(T1_V6_ChEnableCmd);
        T1_H6_ChEnableCmd = 1;
        pvPut(T1_H6_ChEnableCmd);
        T2_V1_ChEnableCmd = 1;
        pvPut(T2_V1_ChEnableCmd);
        T2_H1_ChEnableCmd = 1;
        pvPut(T2_H1_ChEnableCmd);
        T2_V2_ChEnableCmd = 1;
        pvPut(T2_V2_ChEnableCmd);
        T2_H2_ChEnableCmd = 1;
        pvPut(T2_H2_ChEnableCmd);
        T2_V3_ChEnableCmd = 1;
        pvPut(T2_V3_ChEnableCmd);
        T2_H3_ChEnableCmd = 1;
        pvPut(T2_H3_ChEnableCmd);
        T3_V1_ChEnableCmd = 1;
        pvPut(T3_V1_ChEnableCmd);
        T3_H1_ChEnableCmd = 1;
        pvPut(T3_H1_ChEnableCmd);
        T3_V2_ChEnableCmd = 1;
        pvPut(T3_V2_ChEnableCmd);
        T3_H2_ChEnableCmd = 1;
        pvPut(T3_H2_ChEnableCmd);
        T4_V1_ChEnableCmd = 1;
        pvPut(T4_V1_ChEnableCmd);
        T4_H1_ChEnableCmd = 1;
        pvPut(T4_H1_ChEnableCmd);
        T4_V2_ChEnableCmd = 1;
        pvPut(T4_V2_ChEnableCmd);
        T4_H2_ChEnableCmd = 1;
        pvPut(T4_H2_ChEnableCmd);
        T5_V1_ChEnableCmd = 1;
        pvPut(T5_V1_ChEnableCmd);
        T5_H1_ChEnableCmd = 1;
        pvPut(T5_H1_ChEnableCmd);
        T5_V2_ChEnableCmd = 1;
        pvPut(T5_V2_ChEnableCmd);
        T5_H2_ChEnableCmd = 1;
        pvPut(T5_H2_ChEnableCmd);
    } state start_up

  }


/* state STARTUP	*/
state start_up {
  entry {
    printf("\n[SEQ STEERER] Enter in START UP status\n");
    StateMachineCode=30;
    pvPut(StateMachineCode);
  }

  /* Channels are not enabled */
  when ( (T1_V1_ChEnable == 0) || (T1_H1_ChEnable == 0) || (T1_V2_ChEnable == 0) || (T1_H2_ChEnable == 0) || (T1_V3_ChEnable == 0) || (T1_H3_ChEnable == 0) || (T1_V4_ChEnable == 0) || (T1_H4_ChEnable == 0) || (T1_V5_ChEnable == 0) || (T1_H5_ChEnable == 0) || (T1_V6_ChEnable == 0) || (T1_H6_ChEnable == 0) || (T2_V1_ChEnable == 0) || (T2_H1_ChEnable == 0) || (T2_V2_ChEnable == 0) || (T2_H2_ChEnable == 0) || (T2_V3_ChEnable == 0) || (T2_H3_ChEnable == 0) || (T3_V1_ChEnable == 0) || (T3_H1_ChEnable == 0) || (T3_V2_ChEnable == 0) || (T3_H2_ChEnable == 0) || (T4_V1_ChEnable == 0) || (T4_H1_ChEnable == 0) || (T4_V2_ChEnable == 0) || (T4_H2_ChEnable == 0) || (T5_V1_ChEnable == 0) || (T5_H1_ChEnable == 0) || (T5_V2_ChEnable == 0) || (T5_H2_ChEnable == 0) ) {
  /* Line disconnected (HW) */
      printf("[SEQ STEERER] One or more channels are not enabled \n");
      printf("[SEQ STEERER] Try to rescan the system status \n");
  } state self_check

  when ( (Chassis1_enable_RB == 0) || (Chassis2_enable_RB == 0) || (Chassis3_enable_RB == 0) || (Chassis4_enable_RB == 0) || (Chassis5_enable_RB == 0) ) {
      printf("[SEQ STEERER] Error in chassis enable system: one or more chassis are not available\n");
      printf("[SEQ STEERER] System not ok: go to FAILURE \n");
  } state failure

  /* Thermas Switch problem */
  when ( (T1_V1_Termal_OkStat == 0) || (T1_H1_Termal_OkStat == 0) || (T1_V2_Termal_OkStat == 0) || (T1_H2_Termal_OkStat == 0) || (T1_V3_Termal_OkStat == 0) || (T1_H3_Termal_OkStat == 0) || (T1_V4_Termal_OkStat == 0) || (T1_H4_Termal_OkStat == 0) || (T1_V5_Termal_OkStat == 0) || (T1_H5_Termal_OkStat == 0) || (T1_V6_Termal_OkStat == 0) || (T1_H6_Termal_OkStat == 0) || (T2_V1_Termal_OkStat == 0) || (T2_H1_Termal_OkStat == 0) || (T2_V2_Termal_OkStat == 0) || (T2_H2_Termal_OkStat == 0) || (T2_V3_Termal_OkStat == 0) || (T2_H3_Termal_OkStat == 0) || (T3_V1_Termal_OkStat == 0) || (T3_H1_Termal_OkStat == 0) || (T3_V2_Termal_OkStat == 0) || (T3_H2_Termal_OkStat == 0) || (T4_V1_Termal_OkStat == 0) || (T4_H1_Termal_OkStat == 0) || (T4_V2_Termal_OkStat == 0) || (T4_H2_Termal_OkStat == 0) || (T5_V1_Termal_OkStat == 0) || (T5_H1_Termal_OkStat == 0) || (T5_V2_Termal_OkStat == 0) || (T5_H2_Termal_OkStat == 0) ) {
  /* Line disconnected (HW) */
      printf("[SEQ STEERER] Error in line enable system: thermal switch problem in one or more lines \n");
      printf("[SEQ STEERER] System not ok: go to FAILURE \n");
  } state failure

  /* 24V Error */
  when ( (Rack010_24V == 0) || (Rack030_24V == 0) ) {
      printf("[SEQ STEERER] Error in 24V power racks. \n");
      printf("[SEQ STEERER] System not ok: go to FAILURE \n");
  } state failure

  /* Problems with steerers impedances */
  when ( (T1_V1_DeltaImpedance > MAX_DEVIANCE) || (T1_H1_DeltaImpedance > MAX_DEVIANCE) || (T1_V2_DeltaImpedance > MAX_DEVIANCE) || (T1_H2_DeltaImpedance > MAX_DEVIANCE) || (T1_V3_DeltaImpedance > MAX_DEVIANCE) || (T1_H3_DeltaImpedance > MAX_DEVIANCE) || (T1_V4_DeltaImpedance > MAX_DEVIANCE) || (T1_H4_DeltaImpedance > MAX_DEVIANCE) || (T1_V5_DeltaImpedance > MAX_DEVIANCE) || (T1_H5_DeltaImpedance > MAX_DEVIANCE) || (T1_V6_DeltaImpedance > MAX_DEVIANCE) || (T1_H6_DeltaImpedance > MAX_DEVIANCE) || (T2_V1_DeltaImpedance > MAX_DEVIANCE) || (T2_H1_DeltaImpedance > MAX_DEVIANCE) || (T2_V2_DeltaImpedance > MAX_DEVIANCE) || (T2_H2_DeltaImpedance > MAX_DEVIANCE) || (T2_V3_DeltaImpedance > MAX_DEVIANCE) || (T2_H3_DeltaImpedance > MAX_DEVIANCE) || (T3_V1_DeltaImpedance > MAX_DEVIANCE) || (T3_H1_DeltaImpedance > MAX_DEVIANCE) || (T3_V2_DeltaImpedance > MAX_DEVIANCE) || (T3_H2_DeltaImpedance > MAX_DEVIANCE) || (T4_V1_DeltaImpedance > MAX_DEVIANCE) || (T4_H1_DeltaImpedance > MAX_DEVIANCE) || (T4_V2_DeltaImpedance > MAX_DEVIANCE) || (T4_H2_DeltaImpedance > MAX_DEVIANCE) || (T5_V1_DeltaImpedance > MAX_DEVIANCE) || (T5_H1_DeltaImpedance > MAX_DEVIANCE) || (T5_V2_DeltaImpedance > MAX_DEVIANCE) || (T5_H2_DeltaImpedance > MAX_DEVIANCE) ) {
  /* Line disconnected (HW) */
      printf("[SEQ STEERER] Error in steerer system: one or more stereres register HIGH IMPEDANCE DEVIANCE \n");
      printf("[SEQ STEERER] System not ok: go to FAILURE \n");
  } state failure


  /* No problems with steerers channels */
  when ( (T1_V1_ChEnable == 1) && (T1_H1_ChEnable == 1) && (T1_V2_ChEnable == 1) && (T1_H2_ChEnable == 1) && (T1_V3_ChEnable == 1) && (T1_H3_ChEnable == 1) && (T1_V4_ChEnable == 1) && (T1_H4_ChEnable == 1) && (T1_V5_ChEnable == 1) && (T1_H5_ChEnable == 1) && (T1_V6_ChEnable == 1) && (T1_H6_ChEnable == 1) && (T2_V1_ChEnable == 1) && (T2_H1_ChEnable == 1) && (T2_V2_ChEnable == 1) && (T2_H2_ChEnable == 1) && (T2_V3_ChEnable == 1) && (T2_H3_ChEnable == 1) && (T3_V1_ChEnable == 1) && (T3_H1_ChEnable == 1) && (T3_V2_ChEnable == 1) && (T3_H2_ChEnable == 1) && (T4_V1_ChEnable == 1) && (T4_H1_ChEnable == 1) && (T4_V2_ChEnable == 1) && (T4_H2_ChEnable == 1) && (T5_V1_ChEnable == 1) && (T5_H1_ChEnable == 1) && (T5_V2_ChEnable == 1) && (T5_H2_ChEnable == 1) ) {
  /* Line disconnected (HW) */
      printf("[SEQ STEERER] Channels correctly enabled. Start setpoint reset. \n");
      T1_V1_CurrentSet = 0;
      pvPut(T1_V1_CurrentSet);
      T1_H1_CurrentSet = 0;
      pvPut(T1_H1_CurrentSet);
      T1_V2_CurrentSet = 0;
      pvPut(T1_V2_CurrentSet);
      T1_H2_CurrentSet = 0;
      pvPut(T1_H2_CurrentSet);
      T1_V3_CurrentSet = 0;
      pvPut(T1_V3_CurrentSet);
      T1_H3_CurrentSet = 0;
      pvPut(T1_H3_CurrentSet);
      T1_V4_CurrentSet = 0;
      pvPut(T1_V4_CurrentSet);
      T1_H4_CurrentSet = 0;
      pvPut(T1_H4_CurrentSet);
      T1_V5_CurrentSet = 0;
      pvPut(T1_V5_CurrentSet);
      T1_H5_CurrentSet = 0;
      pvPut(T1_H5_CurrentSet);
      T1_V6_CurrentSet = 0;
      pvPut(T1_V6_CurrentSet);
      T1_H6_CurrentSet = 0;
      pvPut(T1_H6_CurrentSet);
      T2_V1_CurrentSet = 0;
      pvPut(T2_V1_CurrentSet);
      T2_H1_CurrentSet = 0;
      pvPut(T2_H1_CurrentSet);
      T2_V2_CurrentSet = 0;
      pvPut(T2_V2_CurrentSet);
      T2_H2_CurrentSet = 0;
      pvPut(T2_H2_CurrentSet);
      T2_V3_CurrentSet = 0;
      pvPut(T2_V3_CurrentSet);
      T2_H3_CurrentSet = 0;
      pvPut(T2_H3_CurrentSet);
      T3_V1_CurrentSet = 0;
      pvPut(T3_V1_CurrentSet);
      T3_H1_CurrentSet = 0;
      pvPut(T3_H1_CurrentSet);
      T3_V2_CurrentSet = 0;
      pvPut(T3_V2_CurrentSet);
      T3_H2_CurrentSet = 0;
      pvPut(T3_H2_CurrentSet);
      T4_V1_CurrentSet = 0;
      pvPut(T4_V1_CurrentSet);
      T4_H1_CurrentSet = 0;
      pvPut(T4_H1_CurrentSet);
      T4_V2_CurrentSet = 0;
      pvPut(T4_V2_CurrentSet);
      T4_H2_CurrentSet = 0;
      pvPut(T4_H2_CurrentSet);
      T5_V1_CurrentSet = 0;
      pvPut(T5_V1_CurrentSet);
      T5_H1_CurrentSet = 0;
      pvPut(T5_H1_CurrentSet);
      T5_V2_CurrentSet = 0;
      pvPut(T5_V2_CurrentSet);
      T5_H2_CurrentSet = 0;
      pvPut(T5_H2_CurrentSet);
  } state idle

}


/* state IDLE   	*/
state idle {
  entry {
    printf("\n[SEQ STEERER] Enter in IDLE status\n");
    StateMachineCode=20;
    pvPut(StateMachineCode);
  }

  /* Channels are not enabled */
  when ( (T1_V1_ChEnable == 0) || (T1_H1_ChEnable == 0) || (T1_V2_ChEnable == 0) || (T1_H2_ChEnable == 0) || (T1_V3_ChEnable == 0) || (T1_H3_ChEnable == 0) || (T1_V4_ChEnable == 0) || (T1_H4_ChEnable == 0) || (T1_V5_ChEnable == 0) || (T1_H5_ChEnable == 0) || (T1_V6_ChEnable == 0) || (T1_H6_ChEnable == 0) || (T2_V1_ChEnable == 0) || (T2_H1_ChEnable == 0) || (T2_V2_ChEnable == 0) || (T2_H2_ChEnable == 0) || (T2_V3_ChEnable == 0) || (T2_H3_ChEnable == 0) || (T3_V1_ChEnable == 0) || (T3_H1_ChEnable == 0) || (T3_V2_ChEnable == 0) || (T3_H2_ChEnable == 0) || (T4_V1_ChEnable == 0) || (T4_H1_ChEnable == 0) || (T4_V2_ChEnable == 0) || (T4_H2_ChEnable == 0) || (T5_V1_ChEnable == 0) || (T5_H1_ChEnable == 0) || (T5_V2_ChEnable == 0) || (T5_H2_ChEnable == 0) ) {
  /* Line disconnected (HW) */
      printf("[SEQ STEERER] One or more channels are not enabled \n");
      printf("[SEQ STEERER] Try to rescan the system status \n");
  } state self_check

  when ( (Chassis1_enable_RB == 0) || (Chassis2_enable_RB == 0) || (Chassis3_enable_RB == 0) || (Chassis4_enable_RB == 0) || (Chassis5_enable_RB == 0) ) {
      printf("[SEQ STEERER] Error in chassis enable system: one or more chassis are not available\n");
      printf("[SEQ STEERER] System not ok: go to FAILURE \n");
  } state failure

  /* Thermas Switch problem */
  when ( (T1_V1_Termal_OkStat == 0) || (T1_H1_Termal_OkStat == 0) || (T1_V2_Termal_OkStat == 0) || (T1_H2_Termal_OkStat == 0) || (T1_V3_Termal_OkStat == 0) || (T1_H3_Termal_OkStat == 0) || (T1_V4_Termal_OkStat == 0) || (T1_H4_Termal_OkStat == 0) || (T1_V5_Termal_OkStat == 0) || (T1_H5_Termal_OkStat == 0) || (T1_V6_Termal_OkStat == 0) || (T1_H6_Termal_OkStat == 0) || (T2_V1_Termal_OkStat == 0) || (T2_H1_Termal_OkStat == 0) || (T2_V2_Termal_OkStat == 0) || (T2_H2_Termal_OkStat == 0) || (T2_V3_Termal_OkStat == 0) || (T2_H3_Termal_OkStat == 0) || (T3_V1_Termal_OkStat == 0) || (T3_H1_Termal_OkStat == 0) || (T3_V2_Termal_OkStat == 0) || (T3_H2_Termal_OkStat == 0) || (T4_V1_Termal_OkStat == 0) || (T4_H1_Termal_OkStat == 0) || (T4_V2_Termal_OkStat == 0) || (T4_H2_Termal_OkStat == 0) || (T5_V1_Termal_OkStat == 0) || (T5_H1_Termal_OkStat == 0) || (T5_V2_Termal_OkStat == 0) || (T5_H2_Termal_OkStat == 0) ) {
  /* Line disconnected (HW) */
      printf("[SEQ STEERER] Error in line enable system: thermal switch problem in one or more lines \n");
      printf("[SEQ STEERER] System not ok: go to FAILURE \n");
  } state failure

  /* 24V Error */
  when ( (Rack010_24V == 0) || (Rack030_24V == 0) ) {
      printf("[SEQ STEERER] Error in 24V power racks. \n");
      printf("[SEQ STEERER] System not ok: go to FAILURE \n");
  } state failure


  /* Some PVs are disconnected */
  when (pvConnectCount() != pvAssignCount()) {
    printf("[SEQ STEERER] Error in steerer system: one or more PVs are not available for the state machine. \n");
    printf("[SEQ STEERER] System not ok: go to FAILURE \n");
  } state failure

  /* Execute chosen configuration [man|auto] */
  when ( (StartOperationCmd == 1) ) {
      if ( (AutoControl_ActualStatus == 0) && (AutoControl_ActualStatus == AutoControlCmd) ) {
        printf("[SEQ STEERER] Start Control Operations in MANUAL Mode\n");
      }
      else if ( (AutoControl_ActualStatus == 1) && (AutoControl_ActualStatus == AutoControlCmd) ) {
        printf("[SEQ STEERER] Start Control Operations in AUTOMATIC Mode\n");
      }
      else if ( (AutoControl_ActualStatus == 1) && (AutoControl_ActualStatus != AutoControlCmd) ) {
        printf("[SEQ STEERER] Updated control configuration\n");
        printf("[SEQ STEERER] Start Control Operations in MANUAL Mode\n");
        AutoControl_ActualStatus = AutoControlCmd;
        pvPut(AutoControl_ActualStatus);
      }
      else if ( (AutoControl_ActualStatus == 0) && (AutoControl_ActualStatus != AutoControlCmd) ) {
        printf("[SEQ STEERER] Updated control configuration\n");
        printf("[SEQ STEERER] Start Control Operations in AUTOMATIC Mode\n");
        AutoControl_ActualStatus = AutoControlCmd;
        pvPut(AutoControl_ActualStatus);
      }
      else {
        printf("[SEQ STEERER] This message should not appear :)\n");
      }

  } state ready_for_operation
}


/* state READY_FOR_OPERATION 	*/
  state ready_for_operation {

    entry {
      printf("\n[SEQ STEERER] Enter in READY FOR OPERATION status\n");
      StateMachineCode=40;
      pvPut(StateMachineCode);
      }

    /* Chassis problem */
    when ( (Chassis1_enable_RB == 0) || (Chassis2_enable_RB == 0) || (Chassis3_enable_RB == 0) || (Chassis4_enable_RB == 0) || (Chassis5_enable_RB == 0) ) {
      printf("[SEQ STEERER] Error in chassis enable system: one or more chassis are not available\n");
      printf("[SEQ STEERER] System not ok: go to FAILURE \n");
    } state failure

    /* Thermas Switch problem */
    when ( (T1_V1_Termal_OkStat == 0) || (T1_H1_Termal_OkStat == 0) || (T1_V2_Termal_OkStat == 0) || (T1_H2_Termal_OkStat == 0) || (T1_V3_Termal_OkStat == 0) || (T1_H3_Termal_OkStat == 0) || (T1_V4_Termal_OkStat == 0) || (T1_H4_Termal_OkStat == 0) || (T1_V5_Termal_OkStat == 0) || (T1_H5_Termal_OkStat == 0) || (T1_V6_Termal_OkStat == 0) || (T1_H6_Termal_OkStat == 0) || (T2_V1_Termal_OkStat == 0) || (T2_H1_Termal_OkStat == 0) || (T2_V2_Termal_OkStat == 0) || (T2_H2_Termal_OkStat == 0) || (T2_V3_Termal_OkStat == 0) || (T2_H3_Termal_OkStat == 0) || (T3_V1_Termal_OkStat == 0) || (T3_H1_Termal_OkStat == 0) || (T3_V2_Termal_OkStat == 0) || (T3_H2_Termal_OkStat == 0) || (T4_V1_Termal_OkStat == 0) || (T4_H1_Termal_OkStat == 0) || (T4_V2_Termal_OkStat == 0) || (T4_H2_Termal_OkStat == 0) || (T5_V1_Termal_OkStat == 0) || (T5_H1_Termal_OkStat == 0) || (T5_V2_Termal_OkStat == 0) || (T5_H2_Termal_OkStat == 0) ) {
    /* Line disconnected (HW) */
        printf("[SEQ STEERER] Error in line enable system: thermal switch problem in one or more lines \n");
        printf("[SEQ STEERER] System not ok: go to FAILURE \n");
    } state failure

    /* 24V Error */
    when ( (Rack010_24V == 0) || (Rack030_24V == 0) ) {
        printf("[SEQ STEERER] Error in 24V power racks. \n");
        printf("[SEQ STEERER] System not ok: go to FAILURE \n");
    } state failure

    /* Error with Impedance deviance */
    when ( (T1_V1_DeltaImpedance > MAX_DEVIANCE) || (T1_H1_DeltaImpedance > MAX_DEVIANCE) || (T1_V2_DeltaImpedance > MAX_DEVIANCE) || (T1_H2_DeltaImpedance > MAX_DEVIANCE) || (T1_V3_DeltaImpedance > MAX_DEVIANCE) || (T1_H3_DeltaImpedance > MAX_DEVIANCE) || (T1_V4_DeltaImpedance > MAX_DEVIANCE) || (T1_H4_DeltaImpedance > MAX_DEVIANCE) || (T1_V5_DeltaImpedance > MAX_DEVIANCE) || (T1_H5_DeltaImpedance > MAX_DEVIANCE) || (T1_V6_DeltaImpedance > MAX_DEVIANCE) || (T1_H6_DeltaImpedance > MAX_DEVIANCE) || (T2_V1_DeltaImpedance > MAX_DEVIANCE) || (T2_H1_DeltaImpedance > MAX_DEVIANCE) || (T2_V2_DeltaImpedance > MAX_DEVIANCE) || (T2_H2_DeltaImpedance > MAX_DEVIANCE) || (T2_V3_DeltaImpedance > MAX_DEVIANCE) || (T2_H3_DeltaImpedance > MAX_DEVIANCE) || (T3_V1_DeltaImpedance > MAX_DEVIANCE) || (T3_H1_DeltaImpedance > MAX_DEVIANCE) || (T3_V2_DeltaImpedance > MAX_DEVIANCE) || (T3_H2_DeltaImpedance > MAX_DEVIANCE) || (T4_V1_DeltaImpedance > MAX_DEVIANCE) || (T4_H1_DeltaImpedance > MAX_DEVIANCE) || (T4_V2_DeltaImpedance > MAX_DEVIANCE) || (T4_H2_DeltaImpedance > MAX_DEVIANCE) || (T5_V1_DeltaImpedance > MAX_DEVIANCE) || (T5_H1_DeltaImpedance > MAX_DEVIANCE) || (T5_V2_DeltaImpedance > MAX_DEVIANCE) || (T5_H2_DeltaImpedance > MAX_DEVIANCE) ) {
    /* Line disconnected (HW) */
        printf("[SEQ STEERER] Error in steerer system: one or more stereres register HIGH IMPEDANCE DEVIANCE \n");
        printf("[SEQ STEERER] System not ok: go to FAILURE \n");
    } state failure

    /* Stop Operation (for every mode of operation) */
    when ( StopOperationCmd == 1 ) {
        printf("[SEQ STEERER] Stop Control Operations. System goes back to Idle Status.\n");
    } state idle

    /* Possibility to modify [MAN|AUTO] control during operations without changing state*/
    when ( AutoControl_ActualStatus != AutoControlCmd ) {
        AutoControl_ActualStatus = AutoControlCmd;
        pvPut(AutoControl_ActualStatus);
        if ( AutoControl_ActualStatus == 0 ) {
          printf("[SEQ STEERER] Control Configuration changed to MANUAL .\n");
        }
        else if ( AutoControl_ActualStatus == 1 ) {
          printf("[SEQ STEERER] Control Configuration changed to AUTOMATIC.\n");
        }
    } state ready_for_operation

    /* NOTES: */
    /* Case of Operation: RF Conditioning */
    /*
    Conditions:
     - Steerers are OFF
     - Setpoints are at 0A
    */
    /* Case of Operation: RF Conditioning */
    /*
    Conditions:
     - Steerers are ON
     - Setpoints are set at "operative" value
    */

  }



/* state FAILURE	*/
  state failure {

    entry {
        printf("\n[SEQ STEERER] Enter in FAILURE status\n");
        StateMachineCode=50;
        pvPut(StateMachineCode);

        /* Switch off each steerer channel */
        T1_V1_ChEnableCmd = 0;
        pvPut(T1_V1_ChEnableCmd);
        T1_H1_ChEnableCmd = 0;
        pvPut(T1_H1_ChEnableCmd);
        T1_V2_ChEnableCmd = 0;
        pvPut(T1_V2_ChEnableCmd);
        T1_H2_ChEnableCmd = 0;
        pvPut(T1_H2_ChEnableCmd);
        T1_V3_ChEnableCmd = 0;
        pvPut(T1_V3_ChEnableCmd);
        T1_H3_ChEnableCmd = 0;
        pvPut(T1_H3_ChEnableCmd);
        T1_V4_ChEnableCmd = 0;
        pvPut(T1_V4_ChEnableCmd);
        T1_H4_ChEnableCmd = 0;
        pvPut(T1_H4_ChEnableCmd);
        T1_V5_ChEnableCmd = 0;
        pvPut(T1_V5_ChEnableCmd);
        T1_H5_ChEnableCmd = 0;
        pvPut(T1_H5_ChEnableCmd);
        T1_V6_ChEnableCmd = 0;
        pvPut(T1_V6_ChEnableCmd);
        T1_H6_ChEnableCmd = 0;
        pvPut(T1_H6_ChEnableCmd);
        T2_V1_ChEnableCmd = 0;
        pvPut(T2_V1_ChEnableCmd);
        T2_H1_ChEnableCmd = 0;
        pvPut(T2_H1_ChEnableCmd);
        T2_V2_ChEnableCmd = 0;
        pvPut(T2_V2_ChEnableCmd);
        T2_H2_ChEnableCmd = 0;
        pvPut(T2_H2_ChEnableCmd);
        T2_V3_ChEnableCmd = 0;
        pvPut(T2_V3_ChEnableCmd);
        T2_H3_ChEnableCmd = 0;
        pvPut(T2_H3_ChEnableCmd);
        T3_V1_ChEnableCmd = 0;
        pvPut(T3_V1_ChEnableCmd);
        T3_H1_ChEnableCmd = 0;
        pvPut(T3_H1_ChEnableCmd);
        T3_V2_ChEnableCmd = 0;
        pvPut(T3_V2_ChEnableCmd);
        T3_H2_ChEnableCmd = 0;
        pvPut(T3_H2_ChEnableCmd);
        T4_V1_ChEnableCmd = 0;
        pvPut(T4_V1_ChEnableCmd);
        T4_H1_ChEnableCmd = 0;
        pvPut(T4_H1_ChEnableCmd);
        T4_V2_ChEnableCmd = 0;
        pvPut(T4_V2_ChEnableCmd);
        T4_H2_ChEnableCmd = 0;
        pvPut(T4_H2_ChEnableCmd);
        T5_V1_ChEnableCmd = 0;
        pvPut(T5_V1_ChEnableCmd);
        T5_H1_ChEnableCmd = 0;
        pvPut(T5_H1_ChEnableCmd);
        T5_V2_ChEnableCmd = 0;
        pvPut(T5_V2_ChEnableCmd);
        T5_H2_ChEnableCmd = 0;
        pvPut(T5_H2_ChEnableCmd);
    }

    /* System should provide an healthy status to confirm failure reset */
    /* Check on: Chassis, Thermal Switches, 24V Rack Power */
    when ( (FaultReset == 1) &&  (Chassis1_enable_RB == 1) && (Chassis2_enable_RB == 1) && (Chassis3_enable_RB == 1) && (Chassis4_enable_RB == 1) && (Chassis5_enable_RB == 1) && (T1_V1_Termal_OkStat == 1) && (T1_H1_Termal_OkStat == 1) && (T1_V2_Termal_OkStat == 1) && (T1_H2_Termal_OkStat == 1) && (T1_V3_Termal_OkStat == 1) && (T1_H3_Termal_OkStat == 1) && (T1_V4_Termal_OkStat == 1) && (T1_H4_Termal_OkStat == 1) && (T1_V5_Termal_OkStat == 1) && (T1_H5_Termal_OkStat == 1) && (T1_V6_Termal_OkStat == 1) && (T1_H6_Termal_OkStat == 1) && (T2_V1_Termal_OkStat == 1) && (T2_H1_Termal_OkStat == 1) && (T2_V2_Termal_OkStat == 1) && (T2_H2_Termal_OkStat == 1) && (T2_V3_Termal_OkStat == 1) && (T2_H3_Termal_OkStat == 1) && (T3_V1_Termal_OkStat == 1) && (T3_H1_Termal_OkStat == 1) && (T3_V2_Termal_OkStat == 1) && (T3_H2_Termal_OkStat == 1) && (T4_V1_Termal_OkStat == 1) && (T4_H1_Termal_OkStat == 1) && (T4_V2_Termal_OkStat == 1) && (T4_H2_Termal_OkStat == 1) && (T5_V1_Termal_OkStat == 1) && (T5_H1_Termal_OkStat == 1) && (T5_V2_Termal_OkStat == 1) && (T5_H2_Termal_OkStat == 1) && (Rack010_24V == 1) && (Rack030_24V == 1) ) {

        printf("[SEQ STEERER] Failure Stage reset by Operator. \n");
        printf("[SEQ STEERER] Reset conditions satisfied.\n");
    } state maintenance

  }


/* state MAINTENANCE	*/
  state maintenance {

    entry {
        printf("\n[SEQ STEERER] Enter in MAINTENANCE status\n");
        StateMachineCode=60;
        pvPut(StateMachineCode);
    }

    /* System should provide an healthy status to confirm failure reset */
    /* Check on: Chassis, Thermal Switches, 24V Rack Power */
    when ( (MaintenanceReset == 1) &&  (Chassis1_enable_RB == 1) && (Chassis2_enable_RB == 1) && (Chassis3_enable_RB == 1) && (Chassis4_enable_RB == 1) && (Chassis5_enable_RB == 1) && (T1_V1_Termal_OkStat == 1) && (T1_H1_Termal_OkStat == 1) && (T1_V2_Termal_OkStat == 1) && (T1_H2_Termal_OkStat == 1) && (T1_V3_Termal_OkStat == 1) && (T1_H3_Termal_OkStat == 1) && (T1_V4_Termal_OkStat == 1) && (T1_H4_Termal_OkStat == 1) && (T1_V5_Termal_OkStat == 1) && (T1_H5_Termal_OkStat == 1) && (T1_V6_Termal_OkStat == 1) && (T1_H6_Termal_OkStat == 1) && (T2_V1_Termal_OkStat == 1) && (T2_H1_Termal_OkStat == 1) && (T2_V2_Termal_OkStat == 1) && (T2_H2_Termal_OkStat == 1) && (T2_V3_Termal_OkStat == 1) && (T2_H3_Termal_OkStat == 1) && (T3_V1_Termal_OkStat == 1) && (T3_H1_Termal_OkStat == 1) && (T3_V2_Termal_OkStat == 1) && (T3_H2_Termal_OkStat == 1) && (T4_V1_Termal_OkStat == 1) && (T4_H1_Termal_OkStat == 1) && (T4_V2_Termal_OkStat == 1) && (T4_H2_Termal_OkStat == 1) && (T5_V1_Termal_OkStat == 1) && (T5_H1_Termal_OkStat == 1) && (T5_V2_Termal_OkStat == 1) && (T5_H2_Termal_OkStat == 1) && (Rack010_24V == 1) && (Rack030_24V == 1) ) {

        printf("[SEQ STEERER] Failure Stage reset by Operator. \n");
        printf("[SEQ STEERER] Reset conditions satisfied.\n");
    } state initialization


  }


/* end statemachine */
}
