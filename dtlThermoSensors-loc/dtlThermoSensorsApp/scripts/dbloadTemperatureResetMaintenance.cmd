#==============================================================================
# dbloadTemperatureResetMaintenance.cmd
#- Arguments: SECTION_NAME, POS_INDEX, DESCRIPTION, POSITION_CODE

#-d /**
#-d   \brief Load Temperature Maintenance Database
#-d   \details Load temperature maintenance records used by state machines.
#-d   \author Maurizio Montis (INFN-LNL)
#-d   \note Example call:
#-d   \code
#-d    ${SCRIPTEXEC} "${dtlThermo_DIR}dbloadTemperatureResetMaintenance.cmd"
#-d   \endcode
#-d */

dbLoadRecords(dbTemperatureResetMaitenance.db)
