# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0504List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF0504-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF0504-O.s";
INCLUDE "BF0504-P.p";
INCLUDE "BF0500Retrieve.f";
INCLUDE "BF0501Create.f";
INCLUDE "BF0502Update.f";
INCLUDE "BF0503Delete.f";

PROCESS BF0504List
{
    Title = STRINGTABLE.IDS_TITLE_BF0504List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF0504-I";

        #		" " -> MIR-BR-ID;
        #		" " -> MIR-UWAR-TCR-AMT;
        #		" " -> MIR-UWAR-ALPHA-CD;

    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF0504-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF0504List;
    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP "BF0504-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE"
        BRANCH RetrieveList;


    # The user has indicated that they want to add an element to the list
    # In the Add step, initialize all of the key fields to blank so that the
    # key will not be populated on an add
    # e.g. IMPLICIT:
    #      " " -> MIR-REQIR-ID;

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF0501Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }

            " " -> MIR-BR-ID;
            " " -> MIR-UWAR-BUS-CLAS-CD;
            " " -> MIR-UWAR-TCR-AMT;
            " " -> MIR-UWAR-ALPHA-CD;
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

    MIR-BR-ID = MIR-BR-ID-T[index];
    MIR-UWAR-BUS-CLAS-CD = MIR-UWAR-BUS-CLAS-CD-T[index];
    MIR-UWAR-TCR-AMT = MIR-UWAR-TCR-AMT-T[index];
    MIR-UWAR-ALPHA-CD = MIR-UWAR-ALPHA-CD-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF0500Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-BR-ID -> MIR-BR-ID;
            MIR-UWAR-BUS-CLAS-CD -> MIR-UWAR-BUS-CLAS-CD;
            MIR-UWAR-TCR-AMT -> MIR-UWAR-TCR-AMT;
            MIR-UWAR-ALPHA-CD -> MIR-UWAR-ALPHA-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF0502Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-BR-ID -> MIR-BR-ID;
            MIR-UWAR-BUS-CLAS-CD -> MIR-UWAR-BUS-CLAS-CD;
            MIR-UWAR-TCR-AMT -> MIR-UWAR-TCR-AMT;
            MIR-UWAR-ALPHA-CD -> MIR-UWAR-ALPHA-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF0503Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-BR-ID -> MIR-BR-ID;
            MIR-UWAR-BUS-CLAS-CD -> MIR-UWAR-BUS-CLAS-CD;
            MIR-UWAR-TCR-AMT -> MIR-UWAR-TCR-AMT;
            MIR-UWAR-ALPHA-CD -> MIR-UWAR-ALPHA-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

