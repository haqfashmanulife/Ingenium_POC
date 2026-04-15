# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1203Delete.f                                                *
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

INCLUDE "BF1200-I.s";

# Retrieve Output S Step (Verify)

INCLUDE "BF1200-P.p";

# Delete P Step

INCLUDE "BF1200-O.s";

# Delete Output S Step

INCLUDE "BF1203-P.p";
INCLUDE "BF1203-O.s";

# Parameterized Flow

INCLUDE "GenDelete.f";

PROCESS BF1203Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1203Delete -> Title;
        "BF1200-I" -> InputS;
        "BF1200-P" -> RetrieveP;
        "BF1200-O" -> ConfirmS;
        "BF1203-P" -> DeleteP;
        "BF1203-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

