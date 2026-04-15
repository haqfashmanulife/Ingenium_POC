# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:09 PM EDT

#*******************************************************************************
#*  Component:   BF9194List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  1CNB02  DEL      New for conversion poliies                                *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF9194-I.s";
INCLUDE "BF9194-O.s";

# Change this to the P that retrieves the list

INCLUDE "BF9194-P.p";
INCLUDE "BF9190Retrieve.f";
INCLUDE "BF9191Create.f";
INCLUDE "BF9192Update.f";
INCLUDE "BF9193Delete.f";

PROCESS BF9194List
{
    Title = STRINGTABLE.IDS_TITLE_BF9194List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF9194-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF9194-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF9194List;
    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP "BF9194-O";
        "0" -> index;
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
            USES PROCESS "BF9191Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-CLI-ID;
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

    MIR-POL-ID = MIR-POL-ID;
    MIR-SEQ-NUM = MIR-SEQ-NUM-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF9190Retrieve";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }

            MIR-SEQ-NUM -> MIR-SEQ-NUM;
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
            USES PROCESS "BF9192Update";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }

            MIR-SEQ-NUM -> MIR-SEQ-NUM;
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
            USES PROCESS "BF9193Delete";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }

            MIR-SEQ-NUM -> MIR-SEQ-NUM;
            MIR-POL-ID -> MIR-POL-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

