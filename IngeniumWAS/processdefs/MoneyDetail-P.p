# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:03 PM EDT

#*******************************************************************************
#*  Component:   MoneyDetail-P.p                                               *
#*  Description: Custom P-step for Policy Value Detail plus Client Suspense    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016053  6.1      New for release 6.1                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF6981-P.p";
INCLUDE "BF1009-P.p";


# This is a custom P-step that includes the steps to update the
# policy values and the client suspense funds

P-STEP MoneyDetail-P
{
    EMBEDS
        BF6981-P
        BF1009-P
}
