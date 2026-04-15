# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0784List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016892  6.1.2J   Fix presentation problems before pathfinder 1.2           *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF0784-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF0784-O.s";
INCLUDE "BF0784-P.p";
INCLUDE "BF0780Retrieve.f";
INCLUDE "BF0781Create.f";
INCLUDE "BF0782Update.f";
INCLUDE "BF0783Delete.f";
INCLUDE "BF0785Copy.f";

PROCESS BF0784List
{
    Title = STRINGTABLE.IDS_TITLE_BF0784List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP BF0784-I
    {
        USES S-STEP "BF0784-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP BF0784-P
    {
        USES P-STEP "BF0784-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF0784-I;


    Title = STRINGTABLE.IDS_TITLE_BF0784List;
    ButtonBar = "ButtonBarListsCRUDCopy";

    STEP BF0784-O
    {
        USES S-STEP "BF0784-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH BF0784-P;


    # The user has indicated that they want to add an element to the list
    # In the Add step, initialize all of the key fields to blank so that the
    # key will not be populated on an add
    # e.g. IMPLICIT:
    #     " " -> MIR-PLAN-ID;

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF0781Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-LOC-GR-EFF-IDT-NUM;
            " " -> MIR-LOC-GR-LOC-CD;
            " " -> MIR-LOC-GR-COLCT-ID;
            " " -> MIR-LOC-GR-TYP-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH BF0784-P;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH BF0784-O;



    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-PLAN-ID is 
    # used here as an example only.

    MIR-LOC-GR-EFF-IDT-NUM = MIR-LOC-GR-EFF-IDT-NUM-T[index];
    MIR-LOC-GR-LOC-CD = MIR-LOC-GR-LOC-CD-T[index];
    MIR-LOC-GR-COLCT-ID = MIR-LOC-GR-COLCT-ID;
    MIR-LOC-GR-TYP-CD = MIR-LOC-GR-TYP-CD-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF0780Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-LOC-GR-COLCT-ID -> MIR-LOC-GR-COLCT-ID;
            MIR-LOC-GR-LOC-CD -> MIR-LOC-GR-LOC-CD;
            MIR-LOC-GR-EFF-IDT-NUM -> MIR-LOC-GR-EFF-IDT-NUM;
            MIR-LOC-GR-TYP-CD -> MIR-LOC-GR-TYP-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH BF0784-P;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF0782Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-LOC-GR-EFF-IDT-NUM -> MIR-LOC-GR-EFF-IDT-NUM;
            MIR-LOC-GR-LOC-CD -> MIR-LOC-GR-LOC-CD;
            MIR-LOC-GR-COLCT-ID -> MIR-LOC-GR-COLCT-ID;
            MIR-LOC-GR-TYP-CD -> MIR-LOC-GR-TYP-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH BF0784-P;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF0783Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-LOC-GR-EFF-IDT-NUM -> MIR-LOC-GR-EFF-IDT-NUM;
            MIR-LOC-GR-LOC-CD -> MIR-LOC-GR-LOC-CD;
            MIR-LOC-GR-COLCT-ID -> MIR-LOC-GR-COLCT-ID;
            MIR-LOC-GR-TYP-CD -> MIR-LOC-GR-TYP-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH BF0784-P;

    }

    # The user wants to copy an item in the list

    IF action == "ACTION_COPY"
    {
        STEP ACTION_COPY
        {
            USES PROCESS "BF0785Copy";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-LOC-GR-COLCT-ID -> MIR-LOC-GR-COLCT-ID;
            MIR-LOC-GR-TYP-CD -> MIR-LOC-GR-TYP-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH BF0784-P;

    }
}

