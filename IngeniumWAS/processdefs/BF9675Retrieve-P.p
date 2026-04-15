# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:01 PM EDT

#*******************************************************************************
#*  Component:   BF9675Retrieve-P.p                                            *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL110  HIN/CL   Claim Requirements - Moral Risk Retrieve Processing       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1220-P.p";
INCLUDE "BF9675-P.p";
INCLUDE "BF9670-P.p";


# Includes the p-steps for Client Retrieve - Client Moral Risk Retrieve and Free Format Text
# Retrieve
# 

P-STEP BF9675Retrieve-P
{
    EMBEDS
        BF1220-P
        BF9675-P
        BF9670-P
}
