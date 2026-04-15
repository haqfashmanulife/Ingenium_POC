# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2014List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF2014-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF2014-O.s";
INCLUDE "BF2014-P.p";
INCLUDE "BF2010Retrieve.f";
INCLUDE "BF2011Create.f";
INCLUDE "BF2012Update.f";
INCLUDE "BF2013Delete.f";

PROCESS BF2014List
{
    Title = STRINGTABLE.IDS_TITLE_BF2014List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP BF2014-I
    {
        USES S-STEP "BF2014-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP BF2014-P
    {
        USES P-STEP "BF2014-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF2014-I;


    Title = STRINGTABLE.IDS_TITLE_BF2014List;
    ButtonBar = "ButtonBarListsCRUD";

    STEP BF2014-O
    {
        USES S-STEP "BF2014-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH BF2014-P;


    # The user has indicated that they want to add an element to the list
    # In the Add step, initialize all of the key fields to blank so that the
    # key will not be populated on an add
    # e.g. IMPLICIT:
    #     " " -> MIR-PRTR-ID;

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF2011Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-PRTR-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH BF2014-P;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH BF2014-O;



    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-PRTR-ID is 
    # used here as an example only.

    MIR-PRTR-ID = MIR-PRTR-ID-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF2010Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-PRTR-ID -> MIR-PRTR-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH BF2014-P;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF2012Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-PRTR-ID -> MIR-PRTR-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH BF2014-P;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF2013Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-PRTR-ID -> MIR-PRTR-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH BF2014-P;

    }
}

