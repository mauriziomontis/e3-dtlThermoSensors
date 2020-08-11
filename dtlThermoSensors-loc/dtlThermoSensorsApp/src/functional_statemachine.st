/* DTL Tuners State Machine 
# State Machine devoted to control the status and the health of DTL thermo sensors sub-system :
#
# Principal States:
# - Initialization:
# 	* Initalize State Machine when EPICS application starts
# - Self-Check:
#       * Verify HW status (connetions, devices\'' health, etc.)
# - Start-Up:
#       * Prepare the sub-system to perform operations - "Zero Current setup"
# - Idle:
#       * Machine is in attendance of external ok
# - Ready-for-operation:
#       * Machine preared for operation
# - Failure:
#       * Machine goes in safe mode because of HW/SW problems
# - Maintenance:
#       * Status where the machine is under maintenance. Useful to indicate possible operation and works on the apparatus
#
#
# developed by Maurizio Montis | INFN-LNL
# mail: maurizio.montis@lnl.infn.it
*/


program tuners_statemachine

/*
# Libraries
*/

%%#include <stdio.h>
%%#include <string.h>
%%#include <unistd.h>

/*
# Variables and Constants
*/



/* Debug Mode: */
double DEBUG=1;


/*
# State Machine Definition
*/

ss thermo_statemachine {

/* state INITIALIZATION	*/
	state initialization {
		entry {
			printf("\n\nPreliminary controls executed due to Application Startup - Intialization\n\n");	
		}
	
		when (pvConnectCount()==pvAssignCount()) {

		} state self_check
	}


/* state SELF_CHECK	*/
	state self_check {
		when (delay(60)) {
			printf("\nSELF_CHECK status - ok");
		} state self_check
	}


/* state STARTUP	*/
/* state IDLE   	*/
/* state READY_FOR_OPERATION 	*/
/* state FAILURE	*/
/* state MAINTENANCE	*/




/* end statemachine */
}
