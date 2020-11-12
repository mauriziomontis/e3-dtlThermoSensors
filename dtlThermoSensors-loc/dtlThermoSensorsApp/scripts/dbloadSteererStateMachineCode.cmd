#==============================================================================
# dbloadSteererStateMachineCode.cmd
#- Arguments:

#-d /**
#-d   \brief Load Steerer Description Database
#-d   \details Load steerer description records which indicate information in the GUI.
#-d   \author Maurizio Montis (INFN-LNL)
#-d   \note Example call:
#-d   \code
#-d    ${SCRIPTEXEC} "${dtlThermo_DIR}dbloadSteererStateMachineCode.cmd"
#-d   \endcode
#-d */

dbLoadRecords(dtlSteererStateMachine.db)
