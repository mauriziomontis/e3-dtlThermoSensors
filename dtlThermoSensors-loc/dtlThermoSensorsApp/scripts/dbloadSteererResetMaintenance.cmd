#==============================================================================
# dbloadSteererResetMaintenance.cmd
#- Arguments:

#-d /**
#-d   \brief Load Steerer Maintenance Database
#-d   \details Load steerer maintenance records used by state machines.
#-d   \author Maurizio Montis (INFN-LNL)
#-d   \note Example call:
#-d   \code
#-d    ${SCRIPTEXEC} "${dtlThermo_DIR}dbloadSteerereResetMaintenance.cmd"
#-d   \endcode
#-d */

dbLoadRecords(dbSteererResetMaitenance.db)
