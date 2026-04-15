# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0493Delete.f                                                *
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

INCLUDE "BF0490-I.s";

# Retrieve Output S Step (Verify)

INCLUDE "BF0490-P.p";

# Delete P Step

INCLUDE "BF0490-O.s";

# Delete Output S Step

INCLUDE "BF0493-P.p";
INCLUDE "BF0493-O.s";

# Parameterized Flow

INCLUDE "GenDelete.f";

PROCESS BF0493Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0493Delete -> Title;
        "BF0490-I" -> InputS;
        "BF0490-P" -> RetrieveP;
        "BF0490-O" -> ConfirmS;
        "BF0493-P" -> DeleteP;
        "BF0493-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

