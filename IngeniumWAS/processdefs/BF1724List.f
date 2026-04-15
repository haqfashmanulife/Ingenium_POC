# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1724List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF1724-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF1724-O.s";
INCLUDE "BF1724-P.p";
INCLUDE "BF1720Retrieve.f";
INCLUDE "BF1721Create.f";
INCLUDE "BF1722Update.f";
INCLUDE "BF1723Delete.f";
INCLUDE "BF1725Copy.f";

PROCESS BF1724List
{
    Title = STRINGTABLE.IDS_TITLE_BF1724List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP BF1724-I
    {
        USES S-STEP "BF1724-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP BF1724-P
    {
        USES P-STEP "BF1724-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF1724-I;


    Title = STRINGTABLE.IDS_TITLE_BF1724List;
    ButtonBar = "ButtonBarListsCRUDCopy";

    STEP BF1724-O
    {
        USES S-STEP "BF1724-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH BF1724-P;


    # The user has indicated that they want to add an element to the list
    # In the Add step, initialize all of the key fields to blank so that the
    # key will not be populated on an add
    # e.g. IMPLICIT:
    #     " " -> MIR-PLAN-ID;

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF1721Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-PLAN-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH BF1724-P;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH BF1724-O;



    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-PLAN-ID is 
    # used here as an example only.

    MIR-PLAN-ID = MIR-PLAN-ID-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF1720Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-PLAN-ID -> MIR-PLAN-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH BF1724-P;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF1722Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-PLAN-ID -> MIR-PLAN-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH BF1724-P;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF1723Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-PLAN-ID -> MIR-PLAN-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH BF1724-P;

    }

    # The user wants to copy an item in the list

    IF action == "ACTION_COPY"
    {
        STEP ACTION_COPY
        {
            USES PROCESS "BF1725Copy";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
                SendMessages = "NO";
            }

            MIR-PLAN-ID -> MIR-PLAN-ID;
            "TRUE" -> DisplayInput;
        }

        BRANCH BF1724-P;

    }
}

