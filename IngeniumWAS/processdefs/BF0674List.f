# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0674List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0674-I.s";
INCLUDE "BF0674-O.s";
INCLUDE "BF0674-P.p";
INCLUDE "BF0670Retrieve.f";
INCLUDE "BF0671Create.f";
INCLUDE "BF0672Update.f";
INCLUDE "BF0673Delete.f";
INCLUDE "BF0675Expand.f";

PROCESS BF0674List
{
    Title = STRINGTABLE.IDS_TITLE_BF0674List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF0674-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF0674-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF0674List;
    ButtonBar = "ButtonBarListsCRUDExpand";

    STEP DisplayList
    {
        USES S-STEP "BF0674-O";
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
            USES PROCESS "BF0671Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-UVAL-AGE;
            " " -> MIR-UVAL-HIGH-DUR;
            " " -> MIR-UVAL-LOW-DUR;
            " " -> MIR-UVAL-PAR-CD;
            " " -> MIR-UVAL-ID;
            " " -> MIR-UVAL-SEX-CD;
            " " -> MIR-UVAL-SMKR-CD;
            " " -> MIR-UVAL-STBL-1-CD;
            " " -> MIR-UVAL-STBL-2-CD;
            " " -> MIR-UVAL-STBL-3-CD;
            " " -> MIR-UVAL-STBL-4-CD;
            " " -> MIR-UVAL-TYP-CD;
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

    MIR-UVAL-AGE = MIR-UVAL-AGE-T[index];
    MIR-UVAL-PAR-CD = MIR-UVAL-PAR-CD-T[index];
    MIR-UVAL-ID = MIR-UVAL-ID-T[index];
    MIR-UVAL-SEX-CD = MIR-UVAL-SEX-CD-T[index];
    MIR-UVAL-SMKR-CD = MIR-UVAL-SMKR-CD-T[index];
    MIR-UVAL-STBL-1-CD = MIR-UVAL-STBL-1-CD-T[index];
    MIR-UVAL-STBL-2-CD = MIR-UVAL-STBL-2-CD-T[index];
    MIR-UVAL-STBL-3-CD = MIR-UVAL-STBL-3-CD-T[index];
    MIR-UVAL-STBL-4-CD = MIR-UVAL-STBL-4-CD-T[index];
    MIR-UVAL-TYP-CD = MIR-UVAL-TYP-CD-T[index];
    MIR-UVAL-LOW-DUR = MIR-UVAL-LOW-DUR-T[index];
    MIR-UVAL-HIGH-DUR = MIR-UVAL-HIGH-DUR-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF0670Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-UVAL-AGE -> MIR-UVAL-AGE-CD;
            MIR-UVAL-PAR-CD -> MIR-UVAL-PAR-CD;
            MIR-UVAL-ID -> MIR-UVAL-ID;
            MIR-UVAL-SEX-CD -> MIR-UVAL-SEX-CD;
            MIR-UVAL-SMKR-CD -> MIR-UVAL-SMKR-CD;
            MIR-UVAL-STBL-1-CD -> MIR-UVAL-STBL-1-CD;
            MIR-UVAL-STBL-2-CD -> MIR-UVAL-STBL-2-CD;
            MIR-UVAL-STBL-3-CD -> MIR-UVAL-STBL-3-CD;
            MIR-UVAL-STBL-4-CD -> MIR-UVAL-STBL-4-CD;
            MIR-UVAL-TYP-CD -> MIR-UVAL-TYP-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF0672Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-UVAL-AGE -> MIR-UVAL-AGE-CD;
            MIR-UVAL-PAR-CD -> MIR-UVAL-PAR-CD;
            MIR-UVAL-ID -> MIR-UVAL-ID;
            MIR-UVAL-SEX-CD -> MIR-UVAL-SEX-CD;
            MIR-UVAL-SMKR-CD -> MIR-UVAL-SMKR-CD;
            MIR-UVAL-STBL-1-CD -> MIR-UVAL-STBL-1-CD;
            MIR-UVAL-STBL-2-CD -> MIR-UVAL-STBL-2-CD;
            MIR-UVAL-STBL-3-CD -> MIR-UVAL-STBL-3-CD;
            MIR-UVAL-STBL-4-CD -> MIR-UVAL-STBL-4-CD;
            MIR-UVAL-TYP-CD -> MIR-UVAL-TYP-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF0673Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-UVAL-AGE -> MIR-UVAL-AGE-CD;
            MIR-UVAL-PAR-CD -> MIR-UVAL-PAR-CD;
            MIR-UVAL-ID -> MIR-UVAL-ID;
            MIR-UVAL-SEX-CD -> MIR-UVAL-SEX-CD;
            MIR-UVAL-SMKR-CD -> MIR-UVAL-SMKR-CD;
            MIR-UVAL-STBL-1-CD -> MIR-UVAL-STBL-1-CD;
            MIR-UVAL-STBL-2-CD -> MIR-UVAL-STBL-2-CD;
            MIR-UVAL-STBL-3-CD -> MIR-UVAL-STBL-3-CD;
            MIR-UVAL-STBL-4-CD -> MIR-UVAL-STBL-4-CD;
            MIR-UVAL-TYP-CD -> MIR-UVAL-TYP-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
    IF action == "ACTION_EXPAND"
    {
        STEP ACTION_EXPAND
        {
            USES PROCESS "BF0675Expand";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-UVAL-AGE -> MIR-UVAL-AGE-CD;
            MIR-UVAL-PAR-CD -> MIR-UVAL-PAR-CD;
            MIR-UVAL-ID -> MIR-UVAL-ID;
            MIR-UVAL-SEX-CD -> MIR-UVAL-SEX-CD;
            MIR-UVAL-SMKR-CD -> MIR-UVAL-SMKR-CD;
            MIR-UVAL-STBL-1-CD -> MIR-UVAL-STBL-1-CD;
            MIR-UVAL-STBL-2-CD -> MIR-UVAL-STBL-2-CD;
            MIR-UVAL-STBL-3-CD -> MIR-UVAL-STBL-3-CD;
            MIR-UVAL-STBL-4-CD -> MIR-UVAL-STBL-4-CD;
            MIR-UVAL-TYP-CD -> MIR-UVAL-TYP-CD;
            MIR-UVAL-LOW-DUR -> MIR-UVAL-LOW-DUR;
            MIR-UVAL-HIGH-DUR -> MIR-UVAL-HIGH-DUR;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

