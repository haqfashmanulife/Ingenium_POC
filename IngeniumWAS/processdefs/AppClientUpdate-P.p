# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:15 PM EDT

#*******************************************************************************
#*  Component:   AppClientUpdate-P.p                                           *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1222-P.p";
INCLUDE "BF1072-P.p";


# This is a custom P-step that includes the steps for an
# individual record update, as well as the step for
# an individual contact update (this p-step has an inherent
# create function built within it).

P-STEP AppClientUpdate-P
{
    EMBEDS
        BF1222-P
        BF1072-P
}
