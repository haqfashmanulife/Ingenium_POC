# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0363Delete.f                                                *
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

INCLUDE "BF0360-I.s";

# Retrieve Output S Step (Verify)

INCLUDE "BF0360-P.p";

# Delete P Step

INCLUDE "BF0360-O.s";

# Delete Output S Step

INCLUDE "BF0363-P.p";
INCLUDE "BF0363-O.s";

# Parameterized Flow

INCLUDE "GenDelete.f";

PROCESS BF0363Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0363Delete -> Title;

        # Retrieve Input S Step

        "BF0360-I" -> InputS;

        # ENSURE THE DRIVERS BELOW ARE CORRECT
        # Retrieve Input P Step

        "BF0360-P" -> RetrieveP;

        # Retrieve Output S Step

        "BF0360-O" -> ConfirmS;

        # Delete P Step

        "BF0363-P" -> DeleteP;

        # Delete Output S Step

        "BF0363-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

