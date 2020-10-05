#==============================================================================
# dbloadTemperatureDescription.cmd
#- Arguments: SECTION_NAME, POS_INDEX, DESCRIPTION

#-d /**
#-d   \brief Load Temperature Descriptin Database
#-d   \details Load temperature description records which indicate information in the GUI.
#-d   \author Maurizio Montis (INFN-LNL)
#-d   \file
#-d   \param SECTION_NAME Section name, i.e. DTL-010
#-d   \param POS_INDEX Device signal mapped with this digital interface, i.e. 001
#-d   \param DESCRIPTION Description visible in GUI  
#-d   \note Example call:
#-d   \code
#-d    ${SCRIPTEXEC} "${dtlThermo_DIR}dbloadTemperatureDescription.cmd", "SECTION_NAME=DTL-010, POS_INDEX=001, DESCRIPTION="Example of gui info""
#-d   \endcode
#-d */

dbLoadRecords(dtlTemperatureDescription.db,"PREFIX=${SECTION_NAME}, INDEX=${POS_INDEX}, DESCRIPTION=${DESCRIPTION}")

