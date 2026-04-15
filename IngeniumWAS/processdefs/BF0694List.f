# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0694List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF0694-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF0694-O.s";
INCLUDE "BF0694-P.p";
INCLUDE "BF0690Retrieve.f";
INCLUDE "BF0691Create.f";
INCLUDE "BF0692Update.f";
INCLUDE "BF0693Delete.f";

PROCESS BF0694List
{
    Title = STRINGTABLE.IDS_TITLE_BF0694List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF0694-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF0694-P";
    }

    Title = STRINGTABLE.IDS_TITLE_BF0694List;

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    ButtonBar = "ButtonBarListsCUD";

    STEP DisplayList
    {
        USES S-STEP "BF0694-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;


    # The user has indicated that they want to add an element to the list

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF0691Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-REL-TYP-CD;
            " " -> MIR-REL-SYS-REF-ID;
            " " -> MIR-REL-SYS-ID;
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

    MIR-REL-TYP-CD = MIR-REL-TYP-CD-T[index];
    MIR-REL-SYS-REF-ID = MIR-REL-SYS-REF-ID-T[index];
    MIR-REL-SYS-ID = MIR-REL-SYS-ID-T[index];


    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF0692Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-REL-TYP-CD -> MIR-REL-TYP-CD;
            MIR-REL-SYS-REF-ID -> MIR-REL-SYS-REF-ID;
            MIR-REL-SYS-ID -> MIR-REL-SYS-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF0693Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-REL-TYP-CD -> MIR-REL-TYP-CD;
            MIR-REL-SYS-REF-ID -> MIR-REL-SYS-REF-ID;
            MIR-REL-SYS-ID -> MIR-REL-SYS-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

