# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1063Delete.f                                                *
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

INCLUDE "BF1060-I.s";

# Retrieve Output S Step (Verify)

INCLUDE "BF1060-P.p";

# Delete P Step

INCLUDE "BF1060-O.s";

# Delete Output S Step

INCLUDE "BF1063-P.p";
INCLUDE "BF1063-O.s";

# Parameterized Flow

INCLUDE "GenDelete.f";

PROCESS BF1063Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1063Delete -> Title;

        # Retrieve Input S Step

        "BF1060-I" -> InputS;

        # ENSURE THE DRIVERS BELOW ARE CORRECT
        # Retrieve Input P Step

        "BF1060-P" -> RetrieveP;

        # Retrieve Output S Step

        "BF1060-O" -> ConfirmS;

        # Delete P Step

        "BF1063-P" -> DeleteP;

        # Delete Output S Step

        "BF1063-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

