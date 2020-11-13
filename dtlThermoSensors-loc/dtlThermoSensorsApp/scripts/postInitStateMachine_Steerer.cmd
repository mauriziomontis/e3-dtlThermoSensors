#==============================================================================
# postInitStateMachine_Steerer.cmd
#- Arguments:

#-d /**
#-d   \brief Execute DTL Steerer State Machine.
#-d   \details Configure and start SNL State Machine devoted to manage tuners system.
#-d   \author Maurizio Montis (INFN-LNL)
#-d   \file
#-d   \note Example call:
#-d   \code
#-d    ${SCRIPTEXEC} "${dtlTuner_DIR}postInitStateMachine_Steerer.cmd"
#-d   \endcode
#-d */

afterInit(seq steerer_statemachine)
