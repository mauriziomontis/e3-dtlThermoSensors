#==============================================================================
# aliasEnableSteererPower.cmd
#- Arguments: SLAVE_ID, HW_DESC, BIT_IN, SECTION_NAME, START_INDEX, STOP_INDEX

#-d /**
#-d   \brief Alias Names for DTL Steerer Power Enable
#-d   \details Define the aliases for DTL digital bits devoted to check steerers PS power enable in order to align Records' Names to ESS Naming Convention.
#-d   \author Maurizio Montis (INFN-LNL)
#-d   \file
#-d   \param SLAVE_ID Bus position
#-d   \param HW_DESC Hardware descriptor, i.e. EL2624
#-d   \param BIT_IN Digital output index, i.e. 3
#-d   \param SECTION_NAME Section name, i.e. DTL-010ROW
#-d   \param START_INDEX First device position  name, i.e. 1
#-d   \param STOP_INDEX Last device position  name, i.e. 5
#-d   \note Example call:
#-d   \code
#-d    ${SCRIPTEXEC} "${dtlThermo_DIR}aliasEnableSteererPower.cmd", "SLAVE_ID=1, HW_DESC=EL2624, BIT_IN=3, SECTION_NAME=DTL-010, START_INDEX=1, STOP_INDEX=5"
#-d   \endcode
#-d */

dbLoadRecords(ecmcGenericAlias.db,"NAME=${SM_PREFIX}ec${MASTER_ID}-s${SLAVE_ID}-${HW_DESC}-BI${BIT_IN}, ALIAS=${SECTION_NAME}:PwrC${START_INDEX}-${STOP_INDEX}:OnEn")

