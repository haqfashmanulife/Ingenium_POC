# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0715Print.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
# Print Input S Step
# Print P Step

INCLUDE "BF0715-I.s";

# Print Output S Step

INCLUDE "BF0715-P.p";
INCLUDE "BF0715-O.s";

# Parameteized Flow

INCLUDE "GenProcess.f";


# NOTE:  Must Match File Name

PROCESS BF0715Print
{
    STEP Main
    {
        USES PROCESS "GenProcess";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0715Print -> Title;

        # Print Input S Step

        "BF0715-I" -> InputS;

        # Print P Step

        "BF0715-P" -> ProcessP;

        # Print Output S Step

        "BF0715-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

