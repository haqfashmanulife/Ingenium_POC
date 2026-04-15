# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1554List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016892  6.1.2J   Fix presentation problems for pathfinder 1.2              *
#*******************************************************************************

INCLUDE "BF1554-I.s";
INCLUDE "BF1554-O.s";
INCLUDE "BF1554-P.p";
INCLUDE "BF1550Retrieve.f";
INCLUDE "BF1551Create.f";
INCLUDE "BF1552Update.f";
INCLUDE "BF1553Delete.f";

PROCESS BF1554List
{
    Title = STRINGTABLE.IDS_TITLE_BF1554List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF1554-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF1554-P";
    }

    Title = STRINGTABLE.IDS_TITLE_BF1554List;

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP "BF1554-O";
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
            USES PROCESS "BF1551Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }

            " " -> MIR-CLI-LTST-DT;
            " " -> MIR-LTST-ID;
            " " -> MIR-CLI-LTST-SEQ-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;


    MIR-CLI-ID = MIR-CLI-ID;
    MIR-CLI-LTST-DT = MIR-CLI-LTST-DT-T[index];
    MIR-LTST-ID = MIR-LTST-ID-T[index];
    MIR-CLI-LTST-SEQ-NUM = MIR-CLI-LTST-SEQ-NUM-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF1550Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-CLI-ID -> MIR-CLI-ID;
            MIR-CLI-LTST-DT -> MIR-CLI-LTST-DT;
            MIR-LTST-ID -> MIR-LTST-ID;
            MIR-CLI-LTST-SEQ-NUM -> MIR-CLI-LTST-SEQ-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF1552Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-CLI-ID -> MIR-CLI-ID;
            MIR-CLI-LTST-DT -> MIR-CLI-LTST-DT;
            MIR-LTST-ID -> MIR-LTST-ID;
            MIR-CLI-LTST-SEQ-NUM -> MIR-CLI-LTST-SEQ-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF1553Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-CLI-ID -> MIR-CLI-ID;
            MIR-CLI-LTST-DT -> MIR-CLI-LTST-DT;
            MIR-LTST-ID -> MIR-LTST-ID;
            MIR-CLI-LTST-SEQ-NUM -> MIR-CLI-LTST-SEQ-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

