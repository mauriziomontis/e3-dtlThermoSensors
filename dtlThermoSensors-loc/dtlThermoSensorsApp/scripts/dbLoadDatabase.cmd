#==============================================================================
# dbloadDatabase.cmd
#- Arguments: DB_NAME

#-d /**
#-d   \brief Load Generic EPICS Database
#-d   \details Load generic epics DB file which not require any particular macro.
#-d   \author Maurizio Montis (INFN-LNL)
#-d   \file
#-d   \param DB_NAME Database name, i.e. mypersonalrecord.db
#-d   \note Example call:
#-d   \code
#-d    ${SCRIPTEXEC} "${dtlThermos_DIR}dbloadDatabase.cmd", "DB_NAME=mypersonalrecord.db"
#-d   \endcode
#-d */

dbLoadRecords( ${DB_NAME} )
