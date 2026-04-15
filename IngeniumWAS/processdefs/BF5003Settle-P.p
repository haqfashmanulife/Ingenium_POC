# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:52 PM EDT

#*******************************************************************************
#*  Component:   BF5003Settle-P.p                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF5003-P.p";
INCLUDE "BF5000-P.p";


# New P-step that includes the p-steps for the JETI Policy Issue
# Settle and Retrieve
# This p-step will be called in the JETI create flow

P-STEP BF5003Settle-P
{
    EMBEDS
        BF5003-P
        BF5000-P
}
