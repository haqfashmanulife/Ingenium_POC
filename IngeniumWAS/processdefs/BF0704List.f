# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0704List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF0704-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF0704-O.s";
INCLUDE "BF0704-P.p";
INCLUDE "BF0700Retrieve.f";
INCLUDE "BF0701Create.f";
INCLUDE "BF0702Update.f";
INCLUDE "BF0703Delete.f";

PROCESS BF0704List
{
    Title = STRINGTABLE.IDS_TITLE_BF0704List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF0704-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF0704-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF0704List;
    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP "BF0704-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # The user has indicated that they want to add an element to the list

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
            USES PROCESS "BF0701Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-LIC-ID;
            " " -> MIR-LIC-LOC-CD;
            " " -> MIR-LIC-BUS-CLAS-CD;
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

    MIR-LIC-ID = MIR-LIC-ID-T[index];
    MIR-LIC-LOC-CD = MIR-LIC-LOC-CD-T[index];
    MIR-LIC-BUS-CLAS-CD = MIR-LIC-BUS-CLAS-CD-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF0700Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-LIC-BUS-CLAS-CD -> MIR-LIC-BUS-CLAS-CD;
            MIR-LIC-ID -> MIR-LIC-ID;
            MIR-LIC-LOC-CD -> MIR-LIC-LOC-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF0702Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-LIC-BUS-CLAS-CD -> MIR-LIC-BUS-CLAS-CD;
            MIR-LIC-ID -> MIR-LIC-ID;
            MIR-LIC-LOC-CD -> MIR-LIC-LOC-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF0703Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-LIC-BUS-CLAS-CD -> MIR-LIC-BUS-CLAS-CD;
            MIR-LIC-ID -> MIR-LIC-ID;
            MIR-LIC-LOC-CD -> MIR-LIC-LOC-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

