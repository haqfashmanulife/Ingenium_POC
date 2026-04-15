# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:55 PM EDT

#*******************************************************************************
#*  Component:   BF8022Update-P.p                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF8022-P.p";
INCLUDE "BF8004-P.p";


# New P-step that includes the p-steps for the Coverage record
# Update and Diagnostics
# This p-step will be called in the Coverage Record update flow

P-STEP BF8022Update-P
{
    EMBEDS
        BF8022-P
        BF8004-P
}
