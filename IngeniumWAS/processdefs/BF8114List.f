# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF8114List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF8114-I.s";
INCLUDE "BF8114-O.s";
INCLUDE "BF8114-P.p";
INCLUDE "BF8111Create.f";
INCLUDE "BF8113Delete.f";

PROCESS BF8114List
{
    Title = STRINGTABLE.IDS_TITLE_BF8114List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP ListStart
    {
        USES S-STEP "BF8114-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF8114-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF8114List;
    ButtonBar = "ButtonBarListsCD";

    STEP DisplayList
    {
        USES S-STEP "BF8114-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;


    # The user has indicated that they want to add an element to the list
    # In the Add step, initialize all of the key fields to blank so that the
    # key will not be populated on an add
    # e.g. IMPLICIT;
    #      " " -> MIR-REQIR-ID;

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF8111Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            "" -> MIR-DM-AV-TBL-CD;
            "" -> MIR-DM-AV-CD;
            "" -> MIR-DM-AV-SUBSET-CD;
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

    MIR-DM-AV-TBL-CD = MIR-DM-AV-TBL-CD-T[index];
    MIR-DM-AV-CD = MIR-DM-AV-CD-T[index];
    MIR-DM-AV-SUBSET-CD = MIR-DM-AV-SUBSET-CD-T[index];


    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF8113Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-DM-AV-TBL-CD -> MIR-DM-AV-TBL-CD;
            MIR-DM-AV-CD -> MIR-DM-AV-CD;
            MIR-DM-AV-SUBSET-CD -> MIR-DM-AV-SUBSET-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
    IF action == "ACTION_RETURN"
        BRANCH RetrieveList;

}

