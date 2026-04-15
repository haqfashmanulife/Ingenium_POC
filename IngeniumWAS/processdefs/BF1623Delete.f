# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1623Delete.f                                                *
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

INCLUDE "BF1620-I.s";

# Retrieve Output S Step (Verify)

INCLUDE "BF1620-P.p";

# Standard Delete P Step - If originating outside LIST

INCLUDE "BF1620-O.s";

# Delete Output S Step

INCLUDE "BF1623-P.p";
INCLUDE "BF1623-O.s";

# Parameterized Flow

INCLUDE "GenDelete.f";

PROCESS BF1623Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1623Delete -> Title;

        # Retrieve Input S Step

        "BF1620-I" -> InputS;

        # Retrieve Input P Step

        "BF1620-P" -> RetrieveP;

        # Retrieve Output S Step

        "BF1620-O" -> ConfirmS;

        # Delete P Step

        "BF1623-P" -> DeleteP;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"

        # If cancelling out of function

        EXIT;

    IF DisplayInput == "FALSE"

        # Came from a list? Exit

        EXIT;


    BRANCH Main;
}

