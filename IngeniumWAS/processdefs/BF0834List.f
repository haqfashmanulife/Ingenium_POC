# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0834List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016892  6.1.2J   Fix presentation problems for pathfinder 1.2              *
#*******************************************************************************
# Change this to the S that starts the list
# Change this to the S that displays the list

INCLUDE "BF0834-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF0834-O.s";
INCLUDE "BF0834-P.p";
INCLUDE "BF0830Retrieve.f";
INCLUDE "BF0831Create.f";
INCLUDE "BF0832Update.f";
INCLUDE "BF0833Delete.f";

PROCESS BF0834List
{
    Title = STRINGTABLE.IDS_TITLE_BF0834List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF0834-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF0834-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF0834List;
    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP "BF0834-O";
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
            USES PROCESS "BF0831Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }

            " " -> MIR-ACTN-COLCT-ID;
            " " -> MIR-ACTN-TYP-CD;
            " " -> MIR-LOC-GR-ID;
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
    # by the following steps and pass them to each step. MIR-REQIR-ID is 
    # used here as an example only.
    #	MIR-CVG-NUM = VALUEOF("MIR-CVG-NUM-T-" + index);

    MIR-ACTN-COLCT-ID = MIR-ACTN-COLCT-ID;
    MIR-ACTN-TYP-CD = MIR-ACTN-TYP-CD-T[index];
    MIR-LOC-GR-ID = MIR-LOC-GR-ID-T[index];
    MIR-SBSDRY-CO-ID = MIR-SBSDRY-CO-ID-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF0830Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-ACTN-COLCT-ID -> MIR-ACTN-COLCT-ID;
            MIR-ACTN-TYP-CD -> MIR-ACTN-TYP-CD;
            MIR-LOC-GR-ID -> MIR-LOC-GR-ID;
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
            USES PROCESS "BF0832Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-ACTN-COLCT-ID -> MIR-ACTN-COLCT-ID;
            MIR-ACTN-TYP-CD -> MIR-ACTN-TYP-CD;
            MIR-LOC-GR-ID -> MIR-LOC-GR-ID;
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
            USES PROCESS "BF0833Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-ACTN-COLCT-ID -> MIR-ACTN-COLCT-ID;
            MIR-ACTN-TYP-CD -> MIR-ACTN-TYP-CD;
            MIR-LOC-GR-ID -> MIR-LOC-GR-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

