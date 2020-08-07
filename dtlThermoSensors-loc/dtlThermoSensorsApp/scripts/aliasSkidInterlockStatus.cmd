#==============================================================================
# aliasSkidInterlockStatus.cmd
#- Arguments: SLAVE_ID, HW_DESC, BIT_IN, SECTION_NAME, SIGNAL

#-d /**
#-d   \brief Alias Names for DTL Digital Status
#-d   \details Define the aliases for DTL digital bits devoted to Skid status in order to align Records' Names to ESS Naming Convention.
#-d   \author Maurizio Montis (INFN-LNL)
#-d   \file
#-d   \param SLAVE_ID Bus position
#-d   \param HW_DESC Hardware descriptor, i.e. EL1809
#-d   \param BIT_IN Digital input index, i.e. 3
#-d   \param SECTION_NAME Section name, i.e. DTL-010
#-d   \param SIGNAL Device signal mapped with this digital interface, i.e. DTL-010Ok
#-d   \note Example call:
#-d   \code
#-d    ${SCRIPTEXEC} "${dtlThermo_DIR}aliasSkidInterlockStatus.cmd", "SLAVE_ID=1, HW_DESC=EL1809, BIT_IN=1, SECTION_NAME=DTL-010, SIGNAL=DTL-010Ok"
#-d   \endcode
#-d */

dbLoadRecords(ecmcGenericAlias.db,"NAME=${SM_PREFIX}ec${MASTER_ID}-s${SLAVE_ID}-${HW_DESC}-BI${BIT_IN}, ALIAS=${SECTION_NAME}:Ctrl-Intf-001:${SIGNAL}-RB")

