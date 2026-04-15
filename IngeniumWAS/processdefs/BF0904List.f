# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0904List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF0904-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF0904-O.s";
INCLUDE "BF0904-P.p";
INCLUDE "BF0900Retrieve.f";
INCLUDE "BF0901Create.f";
INCLUDE "BF0902Update.f";

PROCESS BF0904List
{
    Title = STRINGTABLE.IDS_TITLE_BF0904List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF0904-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF0904-P";
    }

    Title = STRINGTABLE.IDS_TITLE_BF0904List;

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    ButtonBar = "ButtonBarListsCRU";

    STEP DisplayList
    {
        USES S-STEP "BF0904-O";
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
            USES PROCESS "BF0901Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }

            " " -> MIR-USTX-EFF-DT;
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

    MIR-USTX-EFF-DT = MIR-USTX-EFF-DT-T[index];
    MIR-USTX-SEQ-NUM = MIR-USTX-SEQ-NUM-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF0900Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            MIR-USTX-EFF-DT -> MIR-USTX-EFF-DT;
            MIR-USTX-SEQ-NUM -> MIR-USTX-SEQ-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF0902Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            MIR-USTX-EFF-DT -> MIR-USTX-EFF-DT;
            MIR-USTX-SEQ-NUM -> MIR-USTX-SEQ-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

