#==============================================================================
# dbloadTemperatureInterlock.cmd
#- Arguments: SECTION_NAME, POS_INDEX, SCAN, SEVERITY

#-d /**
#-d   \brief Load Temperature Interlock Database 
#-d   \details Load temperature interlock records which raise an interlock in case of alarm severity.
#-d   \author Maurizio Montis (INFN-LNL)
#-d   \file
#-d   \param SECTION_NAME Section name, i.e. DTL-010
#-d   \param POS_INDEX Device signal mapped with this digital interface, i.e. 001
#-d   \param SCAN Scan time for record according to EPICS standard scan values, i.e. .2 second
#-d   \param SEVERITY Severity level according to the mapping done in EPICS: NO_ALARM=0 | MINOR=1 | MAJOR=2, i.e. 2
#-d   \note Example call:
#-d   \code
#-d    ${SCRIPTEXEC} "${dtlThermo_DIR}dbloadTemperatureInterlock.cmd", "SECTION_NAME=DTL-010, POS_INDEX=001, SCAN=.5 second, SEVERITY=2"
#-d   \endcode
#-d */

dbLoadRecords(dtlTemperatureAlarm.db,"PREFIX=${SECTION_NAME}, INDEX=${POS_INDEX}, SCANTIME=${SCAN}, LEVEL=${SEVERITY}")

