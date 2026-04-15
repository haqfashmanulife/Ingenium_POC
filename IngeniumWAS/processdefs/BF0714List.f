# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0714List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF0714-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF0714-O.s";
INCLUDE "BF0714-P.p";
INCLUDE "BF0710Retrieve.f";
INCLUDE "BF0711Create.f";
INCLUDE "BF0712Update.f";
INCLUDE "BF0713Delete.f";
INCLUDE "BF0715Print.f";

PROCESS BF0714List
{
    Title = STRINGTABLE.IDS_TITLE_BF0714List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP BF0714-I
    {
        USES S-STEP "BF0714-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP BF0714-P
    {
        USES P-STEP "BF0714-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF0714-I;


    Title = STRINGTABLE.IDS_TITLE_BF0714List;
    ButtonBar = "ButtonBarListsCRUDPrt";

    STEP BF0714-O
    {
        USES S-STEP "BF0714-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH BF0714-P;


    # The user has indicated that they want to add an element to the list
    # In the Add step, initialize all of the key fields to blank so that the
    # key will not be populated on an add

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF0711Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-IA-QUOT-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH BF0714-P;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH BF0714-O;



    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-IA-QUOT-NUM is 
    # used here as an example only.

    MIR-IA-QUOT-NUM = MIR-IA-QUOT-NUM-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF0710Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-IA-QUOT-NUM -> MIR-IA-QUOT-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH BF0714-P;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF0712Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-IA-QUOT-NUM -> MIR-IA-QUOT-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH BF0714-P;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF0713Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-IA-QUOT-NUM -> MIR-IA-QUOT-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH BF0714-P;

    }

    # The user wants to print an item in the list

    IF action == "ACTION_PRINT"
    {
        STEP ACTION_PRINT
        {
            USES PROCESS "BF0715Print";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-IA-QUOT-NUM -> MIR-IA-QUOT-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH BF0714-P;

    }
}

