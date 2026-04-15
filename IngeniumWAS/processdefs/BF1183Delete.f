# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1183Delete.f                                                *
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

INCLUDE "BF1180-I.s";

# Retrieve Output S Step (Verify)

INCLUDE "BF1180-P.p";

# Delete P Step

INCLUDE "BF1180-O.s";

# Delete Output S Step

INCLUDE "BF1183-P.p";
INCLUDE "BF1183-O.s";

# Parameterized Flow

INCLUDE "GenDelete.f";

PROCESS BF1183Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1183Delete -> Title;

        # Retrieve Input S Step

        "BF1180-I" -> InputS;

        # ENSURE THE DRIVERS BELOW ARE CORRECT
        # Retrieve Input P Step

        "BF1180-P" -> RetrieveP;

        # Retrieve Output S Step

        "BF1180-O" -> ConfirmS;

        # Delete P Step

        "BF1183-P" -> DeleteP;

        # Delete Output S Step

        "BF1183-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

