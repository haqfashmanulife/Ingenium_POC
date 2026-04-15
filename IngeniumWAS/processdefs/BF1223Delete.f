# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1223Delete.f                                                *
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

INCLUDE "BF1220-I.s";

# Retrieve Output S Step (Verify)

INCLUDE "BF1220-P.p";

# Delete P Step

INCLUDE "BF1220-O.s";

# Delete Output S Step

INCLUDE "BF1223-P.p";
INCLUDE "BF1223-O.s";

# Parameterized Flow

INCLUDE "GenDelete.f";

PROCESS BF1223Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1223Delete -> Title;
        "BF1220-I" -> InputS;
        "BF1220-P" -> RetrieveP;
        "BF1220-O" -> ConfirmS;
        "BF1223-P" -> DeleteP;
        "BF1223-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

