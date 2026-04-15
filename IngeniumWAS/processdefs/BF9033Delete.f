# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9033Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB10  01aug01      New for release NB10                                  *
#*                                                                             *
#*******************************************************************************
# Retrieve Input S Step
# Retrieve P Step

INCLUDE "BF9030-I.s";
INCLUDE "BF9030-P.p";

# Delete P Step

INCLUDE "BF9030-O.s";

# Delete Output S Step

INCLUDE "BF9033-P.p";
INCLUDE "BF9033-O.s";

# Parameterized Flow

INCLUDE "GenDelete.f";

PROCESS BF9033Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF9033Delete -> Title;

        # Retrieve Input S Step

        "BF9033-I" -> InputS;

        # ENSURE THE DRIVERS BELOW ARE CORRECT
        # Retrieve Input P Step

        "BF9030-P" -> RetrieveP;

        # Retrieve Output S Step

        "BF9030-O" -> ConfirmS;

        # Delete P Step

        "BF9033-P" -> DeleteP;

        # Delete Output S Step

        "BF9033-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

