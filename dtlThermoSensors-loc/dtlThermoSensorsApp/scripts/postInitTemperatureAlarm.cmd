#==============================================================================
# postInitTemperatureAlarm.cmd
#- Arguments: SECTION_NAME, DEVICE_POS

#-d /**
#-d   \brief Configure Record fields for DTL temperature sensor
#-d   \details Set Alarm values and severity according to the thermosensor system design.
#-d   \author Maurizio Montis (INFN-LNL)
#-d   \file
#-d   \param SECTION_NAME Section name, i.e. DTL-010
#-d   \param DEVICE_POS Device position (accordig to ESS Naming Convetion indexing)
#-d   \param LOLO Lowest alarm value
#-d   \param LLSV Lowest alarm severity, i.e. MAJOR
#-d   \param LOW Low alarm value
#-d   \param LSV Low alarm severity, i.e. MINOR
#-d   \param HIGH High alarm value
#-d   \param HSV HIgh alarm severity, i.e. MAJOR
#-d   \param HIHI Highest alarm value
#-d   \param HHSV Highest alarm severity, i.e. MAJOR
#-d   \param HYST Alarm hysteresis value
#-d   \note Example call:
#-d   \code
#-d    ${SCRIPTEXEC} "${dtlThermo_DIR}postInitTemperatureAlarm.cmd", "SECTION_NAME=DTL-010, DEVICE_POS=001, LOLO=0, LLSV=NO_ALARM, LOW=0, LSV=NO_ALARM, HIGH=30, HSV=MINOR, HIHI=35, HHSV=MAJOR, HYST=5"
#-d   \endcode
#-d */


afterInit(dbpf "${SECTION_NAME}:EMR-TT-${DEVICE_POS}:Temp.LOLO" "${LOLO}")
afterInit(dbpf "${SECTION_NAME}:EMR-TT-${DEVICE_POS}:Temp.LLSV" "${LLSV}")
afterInit(dbpf "${SECTION_NAME}:EMR-TT-${DEVICE_POS}:Temp.LOW" "${LOW}")
afterInit(dbpf "${SECTION_NAME}:EMR-TT-${DEVICE_POS}:Temp.LSV" "${LSV}")
afterInit(dbpf "${SECTION_NAME}:EMR-TT-${DEVICE_POS}:Temp.HIGH" "${HIGH}")
afterInit(dbpf "${SECTION_NAME}:EMR-TT-${DEVICE_POS}:Temp.HSV" "${HSV}")
afterInit(dbpf "${SECTION_NAME}:EMR-TT-${DEVICE_POS}:Temp.HIHI" "${HIHI}")
afterInit(dbpf "${SECTION_NAME}:EMR-TT-${DEVICE_POS}:Temp.HHSV" "${HHSV}")
afterInit(dbpf "${SECTION_NAME}:EMR-TT-${DEVICE_POS}:Temp.HYST" "${HYST}")
# bypass
afterInit(dbpf "${SECTION_NAME}:EMR-TT-${DEVICE_POS}:Temp.SDIS" "${SECTION_NAME}:EMR-TT-${DEVICE_POS}:TempDis")
afterInit(dbpf "${SECTION_NAME}:EMR-TT-${DEVICE_POS}:Temp.DISV" "1")


