#==============================================================================
# dbloadTemperatureStateMachineCode.cmd
#- Arguments: SECTION_NAME

#-d /**
#-d   \brief Load Temperature Descriptin Database
#-d   \details Load temperature description records which indicate information in the GUI.
#-d   \author Maurizio Montis (INFN-LNL)
#-d   \file
#-d   \param SECTION_NAME Section name, i.e. DTL-010
#-d   \note Example call:
#-d   \code
#-d    ${SCRIPTEXEC} "${dtlThermo_DIR}dbloadTemperatureStateMachineCode.cmd", "SECTION_NAME=DTL-010"
#-d   \endcode
#-d */

dbLoadRecords(dtlTemperatureStateMachine.db,"PREFIX=${SECTION_NAME}")
