# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9054List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB05  CSS      New for MCL                                               *
#*******************************************************************************

INCLUDE "BF9054-I.s";
INCLUDE "BF9054-O.s";
INCLUDE "BF9054-P.p";
INCLUDE "BF9050Retrieve.f";
INCLUDE "BF9051Create.f";
INCLUDE "BF9052Update.f";
INCLUDE "BF9053Delete.f";

PROCESS BF9054List
{
    Title = STRINGTABLE.IDS_TITLE_BF9054List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF9054-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF9054-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF9054List;
    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP "BF9054-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;


    # The user has indicated that they want to add an element to the list
    # In the Add step, initialize all of the key fields to blank

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF9051Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-CLI-ID;
            " " -> MIR-POL-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step.

    MIR-CLI-ID = MIR-CLI-ID-T[index];
    MIR-POL-ID = MIR-POL-ID-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF9050Retrieve";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }

            MIR-CLI-ID -> MIR-CLI-ID;
            MIR-POL-ID -> MIR-POL-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF9052Update";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }

            MIR-CLI-ID -> MIR-CLI-ID;
            MIR-POL-ID -> MIR-POL-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF9053Delete";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }

            MIR-CLI-ID -> MIR-CLI-ID;
            MIR-POL-ID -> MIR-POL-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

