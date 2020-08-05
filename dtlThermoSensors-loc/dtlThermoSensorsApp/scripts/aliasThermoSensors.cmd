#==============================================================================
# aliasThermoSensors.cmd
#- Arguments: SLAVE_ID, HW_DESC, AN_INDEX, SECTION_NAME, DEVICE_POS

#-d /**
#-d   \brief Alias Names for DTL thermo sensors devices.
#-d   \details Define the aliases for DTL thermo sensors in order to align Records' Names to ESS Naming Convention.
#-d   \author Maurizio Montis (INFN-LNL)
#-d   \file
#-d   \param SLAVE_ID Bus position
#-d   \param HW_DESC Hardware descriptor, i.e. EL1809
#-d   \param AN_INDEX Analog input index associated related to input read from the module, i.e. 3
#-d   \param SECTION_NAME Section name, i.e. DTL-010
#-d   \param DEVICE_POS Device position (accordig to ESS Naming Convetion indexing)
#-d   \note Example call:
#-d   \code
#-d    ${SCRIPTEXEC} "${dtlTuner_DIR}aliasThermoSensors.cmd", "SLAVE_ID=1, HW_DESC=EL1809, AN_INDEX=1, SECTION_NAME=DTL-010, DEVICE_POS=001"
#-d   \endcode
#-d */


dbLoadRecords(ecmcGenericAlias.db,"NAME=${SM_PREFIX}ec${MASTER_ID}-s${SLAVE_ID}-${HW_DESC}-AI${AN_INDEX}, ALIAS=${SECTION_NAME}:EMR-TT-${DEVICE_POS}:Temp")
dbLoadRecords(ecmcGenericAlias.db,"NAME=${SM_PREFIX}ec${MASTER_ID}-s${SLAVE_ID}-${HW_DESC}-AI${AN_INDEX}-Stat, ALIAS=${SECTION_NAME}:EMR-TT-${DEVICE_POS}:Stat")
dbLoadRecords(ecmcGenericAlias.db,"NAME=${SM_PREFIX}ec${MASTER_ID}-s${SLAVE_ID}-${HW_DESC}-AI${AN_INDEX}-UnderLim-Alrm, ALIAS=${SECTION_NAME}:EMR-TT-${DEVICE_POS}:HwUnderLimAlrm")
dbLoadRecords(ecmcGenericAlias.db,"NAME=${SM_PREFIX}ec${MASTER_ID}-s${SLAVE_ID}-${HW_DESC}-AI${AN_INDEX}-OverLim-Alrm, ALIAS=${SECTION_NAME}:EMR-TT-${DEVICE_POS}:HwOverLimAlrm")
dbLoadRecords(ecmcGenericAlias.db,"NAME=${SM_PREFIX}ec${MASTER_ID}-s${SLAVE_ID}-${HW_DESC}-AI${AN_INDEX}-Err-Alrm, ALIAS=${SECTION_NAME}:EMR-TT-${DEVICE_POS}:HwErrAlrm")



