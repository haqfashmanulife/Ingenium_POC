# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:01 PM EDT

#*******************************************************************************
#*  Component:   BF9677Update-P.p                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL110  HIN/CL   Claim Requirements - Moral Risk Update Processing         *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1220-P.p";
INCLUDE "BF9677-P.p";
INCLUDE "BF9672-P.p";


# Includes the p-steps for Client Retrieve - Client Moral Risk Update and Free Format Text
# Update
# 

P-STEP BF9677Update-P
{
    EMBEDS
        BF1220-P
        BF9677-P
        BF9672-P
}
