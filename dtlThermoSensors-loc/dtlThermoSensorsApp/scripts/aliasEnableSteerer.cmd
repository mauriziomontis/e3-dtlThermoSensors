#==============================================================================
# aliasEnableSteerer.cmd 
#- Arguments: SLAVE_ID, HW_DESC, BIT_IN, SECTION_NAME, STEERER_POS, POS_INDEX

#-d /**
#-d   \brief Alias Names for DTL Steerer Enable System
#-d   \details Define the aliases for DTL digital bits devoted to enable steerers in order to align Records' Names to ESS Naming Convention.
#-d   \author Maurizio Montis (INFN-LNL)
#-d   \file
#-d   \param SLAVE_ID Bus position
#-d   \param HW_DESC Hardware descriptor, i.e. EL2624
#-d   \param BIT_IN Digital output index, i.e. 3
#-d   \param SECTION_NAME Section name, i.e. DTL-010
#-d   \param STEERER_POS Steerer horizontal|vertiacal position  name, i.e. H
#-d   \param POS_INDEX Device position  name, i.e. 001
#-d   \note Example call:
#-d   \code
#-d    ${SCRIPTEXEC} "${dtlThermo_DIR}aliasEnableSteerer.cmd", "SLAVE_ID=1, HW_DESC=EL2624, BIT_IN=3, SECTION_NAME=DTL-010, STEERER_POS=H, POS_INDEX=001"
#-d   \endcode
#-d */

dbLoadRecords(ecmcGenericAlias.db,"NAME=${SM_PREFIX}ec${MASTER_ID}-s${SLAVE_ID}-${HW_DESC}-BO${BIT_IN}, ALIAS=${SECTION_NAME}:PwrC-PSC${STEERER_POS}-${POS_INDEX}:OnEnCmd")
dbLoadRecords(ecmcGenericAlias.db,"NAME=${SM_PREFIX}ec${MASTER_ID}-s${SLAVE_ID}-${HW_DESC}-BO${BIT_IN}-RB, ALIAS=${SECTION_NAME}:PwrC-PSC${STEERER_POS}-${POS_INDEX}:OnEnCmd-RB")

