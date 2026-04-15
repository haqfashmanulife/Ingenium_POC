# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1553Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
# Retrieve Input S Step
# Retrieve P Step

INCLUDE "BF1550-I.s";

# Retrieve Output S Step (Verify)

INCLUDE "BF1550-P.p";

# Delete P Step

INCLUDE "BF1550-O.s";
INCLUDE "BF1553-P.p";

# Parameterized Flow

INCLUDE "GenDelete.f";

PROCESS BF1553Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1553Delete -> Title;
        "BF1550-I" -> InputS;
        "BF1550-P" -> RetrieveP;
        "BF1550-O" -> ConfirmS;
        "BF1553-P" -> DeleteP;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

