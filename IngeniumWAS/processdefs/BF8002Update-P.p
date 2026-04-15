# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:54 PM EDT

#*******************************************************************************
#*  Component:   BF8002Update-P.p                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF8002-P.p";
INCLUDE "BF8004-P.p";


# New P-step that includes the p-steps for the Policy update
# and Diagnostics
# This p-step will be called in the Policy create and Update flows

P-STEP BF8002Update-P
{
    EMBEDS
        BF8002-P
        BF8004-P
}
