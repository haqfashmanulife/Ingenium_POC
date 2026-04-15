# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0753Delete.f                                                *
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

INCLUDE "BF0750-I.s";

# Retrieve Output S Step (Verify)

INCLUDE "BF0750-P.p";

# Delete P Step

INCLUDE "BF0750-O.s";

# Delete Output S Step

INCLUDE "BF0753-P.p";
INCLUDE "BF0753-O.s";

# Parameterized Flow

INCLUDE "GenDelete.f";

PROCESS BF0753Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0753Delete -> Title;

        # Retrieve Input S Step

        "BF0750-I" -> InputS;

        # ENSURE THE DRIVERS BELOW ARE CORRECT
        # Retrieve Input P Step

        "BF0750-P" -> RetrieveP;

        # Retrieve Output S Step

        "BF0750-O" -> ConfirmS;

        # Delete P Step

        "BF0753-P" -> DeleteP;

        # Delete Output S Step

        "BF0753-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

