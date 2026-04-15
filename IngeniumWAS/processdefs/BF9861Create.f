# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9861Create.f                                                *
#*  Description: Claim Requirement Table (CRTB) Create function                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL102  HIN/CL   CLAIM REQUIREMENTS                                        *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9860-P.p";
INCLUDE "BF9861-P.p";
INCLUDE "BF9861-I.s";
INCLUDE "BF9862-I.s";
INCLUDE "BF9860-O.s";
INCLUDE "BF9862-P.p";
INCLUDE "GenCreate.f";

PROCESS BF9861Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9861Create -> Title;
        "BF9861-I" -> InputS;
        "BF9861-P" -> CreateP;
        "BF9860-P" -> RetrieveP;
        "BF9862-I" -> EditS;
        "BF9862-P" -> UpdateP;
        "BF9860-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

