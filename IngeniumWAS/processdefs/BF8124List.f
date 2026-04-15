# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF8124List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list
# Change this to the S that displays the list

INCLUDE "BF8124-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF8124-O.s";
INCLUDE "BF8124-P.p";
INCLUDE "BF8121Create.f";
INCLUDE "BF8123Delete.f";

PROCESS BF8124List
{
    Title = STRINGTABLE.IDS_TITLE_BF8124List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF8124-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF8124-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF8124List;
    ButtonBar = "ButtonBarListsCD";

    STEP DisplayList
    {
        USES S-STEP "BF8124-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;


    # The user has indicated that they want to add an element to the list
    # In the Add step, initialize all of the key fields to blank so that the key will not be populated on the add
    # e.g.	IMPLICIIT:
    #	" " -> MIR-REQIR-ID;

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF8121Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-CO-ID;
            " " -> MIR-CTRY-CD;
            " " -> MIR-CTRY-LOC-TYP-CD;
            " " -> MIR-CTRY-LOC-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-REQIR-ID is 
    # used here as an example only.

    MIR-CO-ID = MIR-CO-ID-T[index];
    MIR-CTRY-CD = MIR-CTRY-CD-T[index];
    MIR-CTRY-LOC-TYP-CD = MIR-CTRY-LOC-TYP-CD-T[index];
    MIR-CTRY-LOC-CD = MIR-CTRY-LOC-CD-T[index];


    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF8123Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-CO-ID -> MIR-CO-ID;
            MIR-CTRY-CD -> MIR-CTRY-CD;
            MIR-CTRY-LOC-TYP-CD -> MIR-CTRY-LOC-TYP-CD;
            MIR-CTRY-LOC-CD -> MIR-CTRY-LOC-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
    IF action == "ACTION_RETURN"
        BRANCH RetrieveList;

}

