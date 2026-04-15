# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0603Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************
# Retrieve Input S Step
# Retrieve P Step

INCLUDE "BF0600-I.s";

# Retrieve Output S Step (Verify)

INCLUDE "BF0600-P.p";

# Delete P Step

INCLUDE "BF0600-O.s";

# Delete Output S Step

INCLUDE "BF0603-P.p";
INCLUDE "BF0603-O.s";

# Parameterized Flow

INCLUDE "GenDelete.f";

PROCESS BF0603Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF0603Delete -> Title;

        # Retrieve Input S Step

        "BF0600-I" -> InputS;

        # Retrieve Input P Step

        "BF0600-P" -> RetrieveP;

        # Retrieve Output S Step

        "BF0600-O" -> ConfirmS;

        # Delete P Step

        "BF0603-P" -> DeleteP;

        # Delete Output S Step

        "BF0603-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

