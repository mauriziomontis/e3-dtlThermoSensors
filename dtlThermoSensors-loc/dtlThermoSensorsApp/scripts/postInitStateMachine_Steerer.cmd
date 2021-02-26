#==============================================================================
# postInitStateMachine_Steerer.cmd
#- Arguments: SECTION_NAME, TANK

#-d /**
#-d   \brief Execute DTL Steerer State Machine.
#-d   \details Configure and start SNL State Machine devoted to manage tuners system.
#-d   \author Maurizio Montis (INFN-LNL)
#-d   \file
#-d   \param SECTION_NAME Section name, i.e. DTL-010
#-d   \param TANK Section name, i.e. 010
#-d   \note Example call:
#-d   \code
#-d    ${SCRIPTEXEC} "${dtlThermo_DIR}postInitStateMachine_Steerer.cmd", "SECTION_NAME=DTL-010, TANK=010"
#-d   \endcode
#-d */

afterInit(seq steerer_tank{TANK}  "SECTION_NAME=${SECTION_NAME})
