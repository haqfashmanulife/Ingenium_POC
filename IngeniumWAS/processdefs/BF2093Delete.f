# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2093Delete.f                                                *
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

INCLUDE "BF2090-I.s";

# Retrieve Output S Step (Verify)

INCLUDE "BF2090-P.p";

# Delete P Step

INCLUDE "BF2090-O.s";

# Delete Output S Step

INCLUDE "BF2093-P.p";
INCLUDE "BF2093-O.s";

# Parameterized Flow

INCLUDE "GenDelete.f";

PROCESS BF2093Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF2093Delete -> Title;

        # Retrieve Input S Step

        "BF2090-I" -> InputS;

        # ENSURE THE DRIVERS BELOW ARE CORRECT
        # Retrieve Input P Step

        "BF2090-P" -> RetrieveP;

        # Retrieve Output S Step

        "BF2090-O" -> ConfirmS;

        # Delete P Step

        "BF2093-P" -> DeleteP;

        # Delete Output S Step

        "BF2093-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

