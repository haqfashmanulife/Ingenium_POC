# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0503Delete.f                                                *
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

INCLUDE "BF0500-I.s";

# Retrieve Output S Step (Verify)

INCLUDE "BF0500-P.p";

# Delete P Step

INCLUDE "BF0500-O.s";

# Delete Output S Step

INCLUDE "BF0503-P.p";
INCLUDE "BF0503-O.s";

# Parameterized Flow

INCLUDE "GenDelete.f";

PROCESS BF0503Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0503Delete -> Title;

        # Retrieve Input S Step

        "BF0500-I" -> InputS;

        # ENSURE THE DRIVERS BELOW ARE CORRECT
        # Retrieve Input P Step

        "BF0500-P" -> RetrieveP;

        # Retrieve Output S Step

        "BF0500-O" -> ConfirmS;

        # Delete P Step

        "BF0503-P" -> DeleteP;

        # Delete Output S Step

        "BF0503-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

