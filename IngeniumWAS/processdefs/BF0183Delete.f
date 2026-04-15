# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0183Delete.f                                                *
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

INCLUDE "BF0180-I.s";

# Retrieve Output S Step (Verify)

INCLUDE "BF0180-P.p";

# Delete P Step

INCLUDE "BF0180-O.s";

# Delete Output S Step

INCLUDE "BF0183-P.p";
INCLUDE "BF0183-O.s";

# Parameterized Flow

INCLUDE "GenDelete.f";

PROCESS BF0183Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0183Delete -> Title;

        # Retrieve Input S Step

        "BF0180-I" -> InputS;

        # ENSURE THE DRIVERS BELOW ARE CORRECT
        # Retrieve Input P Step

        "BF0180-P" -> RetrieveP;

        # Retrieve Output S Step

        "BF0180-O" -> ConfirmS;

        # Delete P Step

        "BF0183-P" -> DeleteP;

        # Delete Output S Step

        "BF0183-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

