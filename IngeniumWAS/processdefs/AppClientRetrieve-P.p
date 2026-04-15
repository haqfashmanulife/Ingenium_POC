# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:15 PM EDT

#*******************************************************************************
#*  Component:   AppClientRetrieve-P.p                                         *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1220-P.p";
INCLUDE "BF1074-P.p";


# This is a custom P-step that includes the steps for an
# individual record retrieve, as well as the step for
# a contact list.

P-STEP AppClientRetrieve-P
{
    EMBEDS
        BF1220-P
        BF1074-P
}
