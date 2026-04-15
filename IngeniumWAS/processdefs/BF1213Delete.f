# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1213Delete.f                                                *
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

INCLUDE "BF1211-I.s";

# Retrieve Output S Step (Verify)

INCLUDE "BF1210-P.p";

# Delete P Step

INCLUDE "BF1210-O.s";

# Delete Output S Step

INCLUDE "BF1213-P.p";
INCLUDE "BF1213-O.s";

# Parameterized Flow

INCLUDE "GenDelete.f";

PROCESS BF1213Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1213Delete -> Title;
        "BF1211-I" -> InputS;
        "BF1210-P" -> RetrieveP;
        "BF1210-O" -> ConfirmS;
        "BF1213-P" -> DeleteP;
        "BF1213-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

