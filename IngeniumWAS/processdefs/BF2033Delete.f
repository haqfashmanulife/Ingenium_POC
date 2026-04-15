# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2033Delete.f                                                *
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

INCLUDE "BF2030-I.s";

# Retrieve Output S Step (Verify)

INCLUDE "BF2030-P.p";

# Standard Delete P Step - If originating outside LIST

INCLUDE "BF2030-O.s";

# Delete Output S Step

INCLUDE "BF2033-P.p";
INCLUDE "BF2033-O.s";

# Parameterized Flow

INCLUDE "GenDelete.f";

PROCESS BF2033Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF2033Delete -> Title;

        # Retrieve Input S Step

        "BF2030-I" -> InputS;

        # Retrieve Input P Step

        "BF2030-P" -> RetrieveP;

        # Retrieve Output S Step

        "BF2030-O" -> ConfirmS;

        # Delete P Step

        "BF2033-P" -> DeleteP;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"

        # If cancelling out of function

        EXIT;

    IF DisplayInput == "FALSE"

        # Came from a list? Then exit

        EXIT;


    BRANCH Main;
}

