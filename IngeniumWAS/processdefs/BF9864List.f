# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9864List.f                                                  *
#*  Description: Claim Requirement Table (CRTB) List function                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL102  HIN/CL   CLAIM REQUIREMENTS                                        *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9864-I.s";
INCLUDE "BF9864-O.s";
INCLUDE "BF9864-P.p";
INCLUDE "BF9860Retrieve.f";
INCLUDE "BF9861Create.f";
INCLUDE "BF9862Update.f";
INCLUDE "BF9863Delete.f";

PROCESS BF9864List
{
    Title = STRINGTABLE.IDS_TITLE_BF9864List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF9864-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF9864-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF9864List;
    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP "BF9864-O";
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
            USES PROCESS "BF9861Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-CLM-REQIR-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # Build the key ID from the row that the user selected
    # Build all of the key variables that will be required
    # by the following steps and pass them to each step. 

    MIR-CLM-REQIR-ID = MIR-CLM-REQIR-ID-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF9860Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-CLM-REQIR-ID -> MIR-CLM-REQIR-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF9862Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-CLM-REQIR-ID -> MIR-CLM-REQIR-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF9863Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-CLM-REQIR-ID -> MIR-CLM-REQIR-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

