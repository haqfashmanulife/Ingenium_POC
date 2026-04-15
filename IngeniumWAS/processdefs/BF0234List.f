# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0234List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  611J     Code cleanup					       *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF0234-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF0234-O.s";
INCLUDE "BF0234-P.p";
INCLUDE "BF0230Retrieve.f";
INCLUDE "BF0231Create.f";
INCLUDE "BF0232Update.f";
INCLUDE "BF0233Cancel.f";
INCLUDE "BF0235Reversal.f";
INCLUDE "BF0236Paid.f";

PROCESS BF0234List
{
    Title = STRINGTABLE.IDS_TITLE_BF0234List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF0234-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF0234-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF0234List;
    ButtonBar = "ButtonBarListsChqRec";

    STEP DisplayList
    {
        USES S-STEP "BF0234-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;


    # The user has indicated that they want to add an element to the list
    # In the Add step, initialize all of the key fields to blank so that the
    # key will not be populated on an add
    # e.g. IMPLICIT;
    #      " " -> MIR-REQIR-ID;

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF0231Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-CHQ-ID;
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

    MIR-CHQ-ID = MIR-CHQ-ID-T[index];
    MIR-SBSDRY-CO-ID = MIR-SBSDRY-CO-ID-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF0230Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-CHQ-ID -> MIR-CHQ-ID;
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
            USES PROCESS "BF0232Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-CHQ-ID -> MIR-CHQ-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to cancel a cheque in the list

    IF action == "ACTION_VOID"
    {
        STEP ACTION_VOID
        {
            USES PROCESS "BF0233Cancel";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-CHQ-ID -> MIR-CHQ-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to reverse a cheque in the list

    IF action == "ACTION_REVERSE"
    {
        STEP ACTION_REVERSE
        {
            USES PROCESS "BF0235Reversal";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-CHQ-ID -> MIR-CHQ-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to mark as paid a cheque in the list

    IF action == "ACTION_PAY"
    {
        STEP ACTION_PAY
        {
            USES PROCESS "BF0236Paid";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-CHQ-ID -> MIR-CHQ-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

