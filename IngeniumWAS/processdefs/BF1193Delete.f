# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1193Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  611J     Code Cleanup                                              *
#*                                                                             *
#*******************************************************************************
# Retrieve Input S Step
# Retrieve P Step

INCLUDE "BF1190-I.s";

# Retrieve Output S Step (Verify)

INCLUDE "BF1190-P.p";

# Delete P Step

INCLUDE "BF1190-O.s";
INCLUDE "BF1193-P.p";

# Parameterized Flow

INCLUDE "GenDelete.f";

PROCESS BF1193Delete
{
    IF DisplayInput == "FALSE"
        BRANCH Main;



    # Set One of the Radio Buttons As Default
    # Underwriting Requirements = 1
    # Issue Requirements = 2

    ReqtType = 1;

    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1193Delete -> Title;

        # Retrieve Input S Step

        "BF1190-I" -> InputS;

        # Retrieve Input P Step

        "BF1190-P" -> RetrieveP;

        # Retrieve Output S Step

        "BF1190-O" -> ConfirmS;

        # Delete P Step

        "BF1193-P" -> DeleteP;

        # Delete Output S Step

        "BF1190-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

