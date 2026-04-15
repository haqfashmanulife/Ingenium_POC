# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0414Clmlist.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0414-I.s";
INCLUDE "BF0414-O.s";
INCLUDE "BF0414-P.p";
INCLUDE "BF0411Closeclm.f";
INCLUDE "BF0410Openclm.f";
INCLUDE "BF0412Reopenclm.f";
INCLUDE "BF0413Deleteclm.f";

PROCESS BF0414Clmlist
{
    Title = STRINGTABLE.IDS_TITLE_BF0414Clmlist;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF0414-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP ClmList
    {
        USES P-STEP "BF0414-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF0414Clmlist;
    ButtonBar = "ButtonBarListsClaim";

    STEP DisplayList
    {
        USES S-STEP "BF0414-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH ClmList;


    # The user has indicated that they want to add an element to the list
    # In the Add step, initialize all of the key fields to blank so that the
    # key will not be populated on an add
    # e.g. IMPLICIT;
    #      " " -> MIR-REQIR-ID;

    IF action == "ACTION_OPEN"
    {
        STEP ACTION_OPEN
        {
            USES PROCESS "BF0410Openclm";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-DI-CLM-ID;
            " " -> MIR-CLI-ID;
            " " -> MIR-INSRD-DISAB-DT;
            " " -> MIR-CLM-CLOS-REASN-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH ClmList;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-REQIR-ID is 
    # used here as an example only.

    MIR-DI-CLM-ID = MIR-DI-CLM-ID-T[index];
    MIR-CLI-ID = MIR-CLI-ID-T[index];
    MIR-INSRD-DISAB-DT = MIR-INSRD-DISAB-DT-T[index];
    MIR-CLM-CLOS-REASN-CD = MIR-CLM-CLOS-REASN-CD-T[index];


    # It will be ACTION_CLOSE if they pressed the Close button.

    IF action == "ACTION_CLOSE"
    {
        STEP ACTION_CLOSE
        {
            USES PROCESS "BF0411Closeclm";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
                SendMessages = "NO";
            }

            MIR-DI-CLM-ID -> MIR-DI-CLM-ID;
            MIR-CLI-ID -> MIR-CLI-ID;
            MIR-INSRD-DISAB-DT -> MIR-INSRD-DISAB-DT;
            MIR-CLM-CLOS-REASN-CD -> MIR-CLM-CLOS-REASN-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH ClmList;

    }

    # The user wants to Reopenclm an item in the list

    IF action == "ACTION_REOPEN"
    {
        STEP ACTION_REOPEN
        {
            USES PROCESS "BF0412Reopenclm";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
                SendMessages = "NO";
            }

            MIR-DI-CLM-ID -> MIR-DI-CLM-ID;
            MIR-CLI-ID -> MIR-CLI-ID;
            MIR-INSRD-DISAB-DT -> MIR-INSRD-DISAB-DT;
            "FALSE" -> DisplayInput;
        }

        BRANCH ClmList;

    }

    # The user wants to Deleteclm an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF0413Deleteclm";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
                SendMessages = "NO";
            }

            MIR-DI-CLM-ID -> MIR-DI-CLM-ID;
            MIR-CLI-ID -> MIR-CLI-ID;
            MIR-INSRD-DISAB-DT -> MIR-INSRD-DISAB-DT;
            "FALSE" -> DisplayInput;
        }

        BRANCH ClmList;

    }
}

