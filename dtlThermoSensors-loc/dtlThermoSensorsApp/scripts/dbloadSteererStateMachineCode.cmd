#==============================================================================
# dbloadSteererStateMachineCode.cmd
#- Arguments:

#-d /**
#-d   \brief Load Steerer Description Database
#-d   \details Load steerer description records which indicate information in the GUI.
#-d   \author Maurizio Montis (INFN-LNL)
#-d   \file
#-d   \param SECTION_NAME Section name, i.e. DTL-010
#-d   \note Example call:
#-d   \code
#-d    ${SCRIPTEXEC} "${dtlThermo_DIR}dbloadSteererStateMachineCode.cmd", "SECTION_NAME=DTL-010"
#-d   \endcode
#-d */

dbLoadRecords(dtlSteererStateMachine.db,"PREFIX=${SECTION_NAME}")
