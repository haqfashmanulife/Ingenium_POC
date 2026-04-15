# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0285List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF0285-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF0285-O.s";
INCLUDE "BF0285-P.p";
INCLUDE "BF0281Create.f";
INCLUDE "BF0282Update.f";
INCLUDE "BF0283Delete.f";
INCLUDE "BF0284List.f";

PROCESS BF0285List
{
    Title = STRINGTABLE.IDS_TITLE_BF0285List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF0285-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF0285-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF0285List;
    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP "BF0285-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;


    # The user has indicated that they want to add an element to the list
    # In the Add step, initialize all of the key fields to blank

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF0281Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-LBILL-CLI-ID;
            " " -> MIR-LBILL-EFF-DT;
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

    MIR-LBILL-CLI-ID = MIR-LBILL-CLI-ID-T[index];
    MIR-LBILL-EFF-DT = MIR-LBILL-EFF-DT-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF0284List";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-LBILL-CLI-ID -> MIR-LBILL-CLI-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            MIR-LBILL-EFF-DT -> MIR-LBILL-EFF-DT;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF0282Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-LBILL-CLI-ID -> MIR-LBILL-CLI-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            MIR-LBILL-EFF-DT -> MIR-LBILL-EFF-DT;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF0283Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-LBILL-CLI-ID -> MIR-LBILL-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            MIR-LBILL-EFF-DT -> MIR-LBILL-EFF-DT;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

