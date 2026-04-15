# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:01 PM EDT

#*******************************************************************************
#*  Component:   BF9678Delete-P.p                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL110  HIN/CL   Claim Requirements - Moral Risk Delete Processing         *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1220-P.p";
INCLUDE "BF9678-P.p";
INCLUDE "BF9673-P.p";


# Includes the p-steps for Client Retrieve - Client Moral Risk Delete and Free Format Text
# Delete
# 

P-STEP BF9678Delete-P
{
    EMBEDS
        BF1220-P
        BF9678-P
        BF9673-P
}
