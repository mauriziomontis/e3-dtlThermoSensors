#==============================================================================
# aliasThermoSensorsModule.cmd
#- Arguments: SLAVE_ID, HW_DESC, SECTION_NAME, DEVICE_POS

#-d /**
#-d   \brief Alias Names for DTL thermo sensors Beckhoff module.
#-d   \details Define the aliases for DTL thermo sensors module in order to align Records' Names to ESS Naming Convention.
#-d   \author Maurizio Montis (INFN-LNL)
#-d   \file
#-d   \param SLAVE_ID Bus position
#-d   \param HW_DESC Hardware descriptor, i.e. EL1809
#-d   \param AN_INDEX Analog input index associated related to input read from the module, i.e. 3
#-d   \param SECTION_NAME Section name, i.e. DTL-010
#-d   \param MODULE_POS Module position (one mudule manages 2 different thermo sensors)
#-d   \note Example call:
#-d   \code
#-d    ${SCRIPTEXEC} "${dtlThermo_DIR}aliasThermoSensorsModule.cmd", "SLAVE_ID=1, HW_DESC=EL3205, SECTION_NAME=DTL-010, DEVICE_POS=001"
#-d   \endcode
#-d */


dbLoadRecords(ecmcGenericAlias.db,"NAME=${SM_PREFIX}ec${MASTER_ID}-s${SLAVE_ID}-${HW_DESC}-online, ALIAS=${SECTION_NAME}:EMR-TT-${MODULE_POS}:Online")
dbLoadRecords(ecmcGenericAlias.db,"NAME=${SM_PREFIX}ec${MASTER_ID}-s${SLAVE_ID}-${HW_DESC}-operational, ALIAS=${SECTION_NAME}:EMR-TT-${MODULE_POS}:Op")



