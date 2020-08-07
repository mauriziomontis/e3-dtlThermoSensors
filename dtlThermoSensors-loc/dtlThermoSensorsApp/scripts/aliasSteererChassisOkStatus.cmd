#==============================================================================
# aliasSteererChassisOkStatus.cmd

#- Arguments: SLAVE_ID, HW_DESC, BIT_IN, SECTION_NAME, POS_INDEX

#-d /**
#-d   \brief Alias Names for DTL Steerer Enable Chassis 
#-d   \details Define the aliases for DTL digital bits devoted to enable steerers PS chassis in order to align Records' Names to ESS Naming Convention.
#-d   \author Maurizio Montis (INFN-LNL)
#-d   \file
#-d   \param SLAVE_ID Bus position
#-d   \param HW_DESC Hardware descriptor, i.e. EL1809
#-d   \param BIT_IN Digital output index, i.e. 3
#-d   \param SECTION_NAME Section name, i.e. DTL-010ROW
#-d   \param POS_INDEX Device position  name, i.e. 001
#-d   \note Example call:
#-d   \code
#-d    ${SCRIPTEXEC} "${dtlThermo_DIR}aliasSteererChassisOkStatus.cmd", "SLAVE_ID=1, HW_DESC=EL1809, BIT_IN=3, SECTION_NAME=DTL-010ROW, POS_INDEX=001"
#-d   \endcode
#-d */

dbLoadRecords(ecmcGenericAlias.db,"NAME=${SM_PREFIX}ec${MASTER_ID}-s${SLAVE_ID}-${HW_DESC}-BI${BIT_IN}, ALIAS=${SECTION_NAME}:PwrC-${POS_INDEX}:PSOkStat")

