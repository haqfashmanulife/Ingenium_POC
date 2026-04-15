# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:01 PM EDT

#*******************************************************************************
#*  Component:   BF9801Update-P.p                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HIS032  HIN/LJ   Created to allow rollback of Sundry Amount update if      *
#*                   fatal error returned by Policy Diagnostics                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9801-P.p";
INCLUDE "BF8004-P.p";


# New P-step that includes the p-steps for the Sundry Amount update 
# and Policy Diagnostics
# This p-step will be called in the MLJ Add/Update Riders flow

P-STEP BF9801Update-P
{
    EMBEDS
        BF9801-P
        BF8004-P
}
