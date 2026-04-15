# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0684List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016892  6.1.2J   Fix presentation problems before pathfinder 1.2           *
#*******************************************************************************
# Change this to the S that starts the list
# Change this to the S that displays the list

INCLUDE "BF0684-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF0684-O.s";
INCLUDE "BF0684-P.p";
INCLUDE "BF0680Retrieve.f";
INCLUDE "BF0681Create.f";
INCLUDE "BF0682Update.f";
INCLUDE "BF0683Delete.f";

PROCESS BF0684List
{
    Title = STRINGTABLE.IDS_TITLE_BF0684List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF0684-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF0684-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF0684List;
    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP "BF0684-O";
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
            USES PROCESS "BF0681Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }

            " " -> MIR-ETBL-TYP-ID;
            " " -> MIR-ETBL-LANG-CD;
            " " -> MIR-ETBL-VALU-ID;
            " " -> MIR-ETBL-DESC-TXT;
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

    MIR-ETBL-DESC-TXT = MIR-ETBL-DESC-TXT-T[index];
    MIR-ETBL-VALU-ID = MIR-ETBL-VALU-ID-T[index];
    MIR-ETBL-LANG-CD = MIR-ETBL-LANG-CD-T[index];
    MIR-ETBL-TYP-ID = MIR-ETBL-TYP-ID-T[index];
    MIR-ETBL-VALU-ID = MIR-ETBL-VALU-ID;
    MIR-ETBL-LANG-CD = MIR-ETBL-LANG-CD;
    MIR-ETBL-TYP-ID = MIR-ETBL-TYP-ID;


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF0680Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-ETBL-TYP-ID -> MIR-ETBL-TYP-ID;
            MIR-ETBL-LANG-CD -> MIR-ETBL-LANG-CD;
            MIR-ETBL-VALU-ID -> MIR-ETBL-VALU-ID;
            MIR-ETBL-DESC-TXT -> MIR-ETBL-DESC-TXT;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF0682Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-ETBL-TYP-ID -> MIR-ETBL-TYP-ID;
            MIR-ETBL-LANG-CD -> MIR-ETBL-LANG-CD;
            MIR-ETBL-VALU-ID -> MIR-ETBL-VALU-ID;
            MIR-ETBL-DESC-TXT -> MIR-ETBL-DESC-TXT;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF0683Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-ETBL-TYP-ID -> MIR-ETBL-TYP-ID;
            MIR-ETBL-LANG-CD -> MIR-ETBL-LANG-CD;
            MIR-ETBL-VALU-ID -> MIR-ETBL-VALU-ID;
            MIR-ETBL-DESC-TXT -> MIR-ETBL-DESC-TXT;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

