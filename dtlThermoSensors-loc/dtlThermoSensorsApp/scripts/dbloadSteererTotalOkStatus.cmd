#==============================================================================
# dbloadSteererTotalOkStatus.cmd
#- Arguments: 

#-d /**
#-d   \brief Steerer Load Total Ok Status Database
#-d   \details Load  steerer total ok status db required to check status for each rack containing steerer's PS chassis
#-d   \author Maurizio Montis (INFN-LNL)
#-d   \file
#-d   \note Example call:
#-d   \code
#-d    ${SCRIPTEXEC} "${dtlThermo_DIR}dbloadSteererTotalOkStatus.cmd"
#-d   \endcode
#-d */

dbLoadRecords(dtlSteererTotalOkStatus.db)

