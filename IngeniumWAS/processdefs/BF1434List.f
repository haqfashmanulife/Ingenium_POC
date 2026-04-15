# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1434List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1434-I.s";
INCLUDE "BF1434-O.s";
INCLUDE "BF1434-P.p";
INCLUDE "BF1430Retrieve.f";
INCLUDE "BF1431Create.f";
INCLUDE "BF1432Update.f";
INCLUDE "BF1433Delete.f";

PROCESS BF1434List
{
    Title = STRINGTABLE.IDS_TITLE_BF1434List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF1434-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF1434-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF1434List;
    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP "BF1434-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;


    # The user has indicated that they want to add an element to the list
    # In the Add step, initialize all of the key fields to blank so that the
    # key will not be populated on an add

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF1431Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-ACCT-BASE-ID;
            " " -> MIR-ACCT-CRCY-CD;
            " " -> MIR-ACCT-CRNT-LOC-CD;
            " " -> MIR-ACCT-ISS-LOC-CD;
            " " -> MIR-ACCT-YR;
            " " -> MIR-BR-OR-DEPT-ID;
            " " -> MIR-PLAN-ID;
            " " -> MIR-SBSDRY-CO-ID;
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

    MIR-ACCT-BASE-ID = MIR-ACCT-BASE-ID-T[index];
    MIR-ACCT-CRCY-CD = MIR-ACCT-CRCY-CD-T[index];
    MIR-ACCT-CRNT-LOC-CD = MIR-ACCT-CRNT-LOC-CD-T[index];
    MIR-ACCT-ISS-LOC-CD = MIR-ACCT-ISS-LOC-CD-T[index];
    MIR-ACCT-YR = MIR-ACCT-YR-T[index];
    MIR-BR-OR-DEPT-ID = MIR-BR-OR-DEPT-ID-T[index];
    MIR-PLAN-ID = MIR-PLAN-ID-T[index];
    MIR-SBSDRY-CO-ID = MIR-SBSDRY-CO-ID-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF1430Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-ACCT-BASE-ID -> MIR-ACCT-BASE-ID;
            MIR-ACCT-CRCY-CD -> MIR-ACCT-CRCY-CD;
            MIR-ACCT-CRNT-LOC-CD -> MIR-ACCT-CRNT-LOC-CD;
            MIR-ACCT-ISS-LOC-CD -> MIR-ACCT-ISS-LOC-CD;
            MIR-ACCT-YR -> MIR-ACCT-YR;
            MIR-PLAN-ID -> MIR-PLAN-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF1432Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-ACCT-BASE-ID -> MIR-ACCT-BASE-ID;
            MIR-ACCT-CRCY-CD -> MIR-ACCT-CRCY-CD;
            MIR-ACCT-CRNT-LOC-CD -> MIR-ACCT-CRNT-LOC-CD;
            MIR-ACCT-ISS-LOC-CD -> MIR-ACCT-ISS-LOC-CD;
            MIR-ACCT-YR -> MIR-ACCT-YR;
            MIR-PLAN-ID -> MIR-PLAN-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF1433Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-ACCT-BASE-ID -> MIR-ACCT-BASE-ID;
            MIR-ACCT-CRCY-CD -> MIR-ACCT-CRCY-CD;
            MIR-ACCT-CRNT-LOC-CD -> MIR-ACCT-CRNT-LOC-CD;
            MIR-ACCT-ISS-LOC-CD -> MIR-ACCT-ISS-LOC-CD;
            MIR-ACCT-YR -> MIR-ACCT-YR;
            MIR-PLAN-ID -> MIR-PLAN-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

