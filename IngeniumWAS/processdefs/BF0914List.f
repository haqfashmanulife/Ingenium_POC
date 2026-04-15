# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0914List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF0914-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF0914-O.s";
INCLUDE "BF0914-P.p";
INCLUDE "BF0910Retrieve.f";
INCLUDE "BF0911Create.f";
INCLUDE "BF0912Update.f";

PROCESS BF0914List
{
    Title = STRINGTABLE.IDS_TITLE_BF0914List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF0914-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF0914-P";
    }

    Title = STRINGTABLE.IDS_TITLE_BF0914List;

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    ButtonBar = "ButtonBarListsCRU";

    STEP DisplayList
    {
        USES S-STEP "BF0914-O";
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
            USES PROCESS "BF0911Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }

            " " -> MIR-AGT-ID;
            " " -> MIR-USTM-EFF-DT;
            " " -> MIR-USTM-EFF-YR;
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

    MIR-USTM-EFF-DT = MIR-USTM-EFF-DT-T[index];
    MIR-USTM-SEQ-NUM = MIR-USTM-SEQ-NUM-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF0910Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-AGT-ID -> MIR-AGT-ID;
            MIR-USTM-EFF-YR -> MIR-USTM-EFF-YR;
            MIR-USTM-EFF-DT -> MIR-USTM-EFF-DT;
            MIR-USTM-SEQ-NUM -> MIR-USTM-SEQ-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF0912Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-AGT-ID -> MIR-AGT-ID;
            MIR-USTM-EFF-YR -> MIR-USTM-EFF-YR;
            MIR-USTM-EFF-DT -> MIR-USTM-EFF-DT;
            MIR-USTM-SEQ-NUM -> MIR-USTM-SEQ-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

