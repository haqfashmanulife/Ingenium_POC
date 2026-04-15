# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:01 PM EDT

#*******************************************************************************
#*  Component:   BF9676Create-P.p                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL110  HIN/CL   Claim Requirements - Moral Risk Create Processing         *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1220-P.p";
INCLUDE "BF9676-P.p";
INCLUDE "BF9671-P.p";


# Includes the p-steps for Client Retrieve - Client Moral Risk Create and Free Format Text
# Create
# 

P-STEP BF9676Create-P
{
    EMBEDS
        BF1220-P
        BF9676-P
        BF9671-P
}
