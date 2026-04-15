# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0514List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  611J     Code cleanup					       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0514-I.s";
INCLUDE "BF0514-O.s";
INCLUDE "BF0514-P.p";
INCLUDE "BF0510Retrieve.f";
INCLUDE "BF0511Create.f";
INCLUDE "BF0512Update.f";
INCLUDE "BF0513Delete.f";
INCLUDE "BF0515Copy.f";

PROCESS BF0514List
{
    Title = STRINGTABLE.IDS_TITLE_BF0514List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF0514-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF0514-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF0514List;
    ButtonBar = "ButtonBarListsCRUDCopy";

    STEP DisplayList
    {
        USES S-STEP "BF0514-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE"
        BRANCH RetrieveList;


    # The user has indicated that they want to add an element to the list

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF0511Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-MTHV-FND-EFF-DT;
            " " -> MIR-POL-ID-BASE;
            " " -> MIR-POL-ID-SFX;
        }

        BRANCH RetrieveList;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # REMOVE EXTRA KEY FIELDS BELOW AND THEN USER SEARCH TO
    # SKIP TO NEXT SECTION OF KEY FIELDS TO MAINTAIN

    MIR-MTHV-FND-EFF-DT = MIR-MTHV-FND-EFF-DT-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF0510Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-MTHV-FND-EFF-DT -> MIR-MTHV-FND-EFF-DT;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF0512Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-MTHV-FND-EFF-DT -> MIR-MTHV-FND-EFF-DT;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF0513Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-MTHV-FND-EFF-DT -> MIR-MTHV-FND-EFF-DT;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to copy an item in the list

    IF action == "ACTION_COPY"
    {
        STEP ACTION_COPY
        {
            USES PROCESS "BF0515Copy";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
                SendMessages = "NO";
            }

            MIR-MTHV-FND-EFF-DT -> MIR-MTHV-FND-EFF-DT;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

