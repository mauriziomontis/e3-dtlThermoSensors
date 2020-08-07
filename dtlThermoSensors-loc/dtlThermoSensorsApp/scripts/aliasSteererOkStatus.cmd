#==============================================================================
# aliasSteererOkStatus.cmd
#- Arguments: SLAVE_ID, HW_DESC, BIT_IN, SECTION_NAME, STEERER_POS, POS_INDEX, SIGNAL

#-d /**
#-d   \brief Alias Names for DTL Steerer Ok Status
#-d   \details Define the aliases for DTL digital bits devoted to steerer ok status in order to align Records' Names to ESS Naming Convention.
#-d   \author Maurizio Montis (INFN-LNL)
#-d   \file
#-d   \param SLAVE_ID Bus position
#-d   \param HW_DESC Hardware descriptor, i.e. EL1809
#-d   \param BIT_IN Digital input index, i.e. 3
#-d   \param SECTION_NAME Section name, i.e. DTL-010
#-d   \param STEERER_POS Steerer horizontal|vertical position, i.e. H
#-d   \param POS_INDEX Position index, i.e. 001
#-d   \param SIGNAL Digital signal elaborated, i.e. OkStat
#-d   \note Example call:
#-d   \code
#-d    ${SCRIPTEXEC} "${dtlThermo_DIR}aliasSteererOkStatus.cmd", "SLAVE_ID=1, HW_DESC=EL1809, BIT_IN=1, SECTION_NAME=DTL-010, STEERER_POS=H, POS_INDEX=001, SIGNAL=OkStat"
#-d   \endcode
#-d */

dbLoadRecords(ecmcGenericAlias.db,"NAME=${SM_PREFIX}ec${MASTER_ID}-s${SLAVE_ID}-${HW_DESC}-BI${BIT_IN}, ALIAS=${SECTION_NAME}:PwrC-PSC${STEERER_POS}-${POS_INDEX}:${SIGNAL}")
