# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1034List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF1034-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF1034-O.s";
INCLUDE "BF1034-P.p";
INCLUDE "BF1030Retrieve.f";
INCLUDE "BF1031Create.f";
INCLUDE "BF1032Update.f";
INCLUDE "BF1033Delete.f";
INCLUDE "BF1035Link.f";
INCLUDE "BF1036Unlink.f";

PROCESS BF1034List
{
    Title = STRINGTABLE.IDS_TITLE_BF1034List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF1034-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF1034-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF1034List;
    ButtonBar = "ButtonBarListsCRUDAttDet";

    STEP DisplayList
    {
        USES S-STEP "BF1034-O";
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
            USES PROCESS "BF1031Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-BNK-ACCT-ID;
            " " -> MIR-BNK-BR-ID;
            " " -> MIR-BNK-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
    IF action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF1030Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF1032Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF1033Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
    IF action == "ACTION_ATTACH"
    {
        STEP ACTION_ATTACH
        {
            USES PROCESS "BF1035Link";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            "RETURN" -> DisplayInput;
            " " -> MIR-CLI-ID;
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

    MIR-CLI-ID = MIR-CLI-ID-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "ACTION_DETACH"
    {
        STEP ACTION_DETACH
        {
            USES PROCESS "BF1036Unlink";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            "FALSE" -> DisplayInput;
            MIR-CLI-ID -> MIR-CLI-ID;
        }

        BRANCH RetrieveList;

    }
}

