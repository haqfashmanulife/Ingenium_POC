# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1625Dsearch.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF1625-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF1625-O.s";
INCLUDE "BF1625-P.p";
INCLUDE "BF1620Retrieve.f";
INCLUDE "BF1621Create.f";
INCLUDE "BF1622Update.f";
INCLUDE "BF1623Delete.f";
INCLUDE "BF1626All.f";
INCLUDE "BF1627Type.f";
INCLUDE "BF1624List.f";

PROCESS BF1625Dsearch
{
    Title = STRINGTABLE.IDS_TITLE_BF1625Dsearch;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF1625-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF1625-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF1625Dsearch;
    ButtonBar = "ButtonBarListsCRUDPlan";

    STEP DisplayList
    {
        USES S-STEP "BF1625-O";
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

    IF action == "ACTION_ADDPLAN"
    {
        STEP ACTION_ADDPLAN
        {
            USES PROCESS "BF1621Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-PLAN-ID;
            " " -> MIR-SBSDRY-CO-ID;
            " " -> MIR-PLAN-BON-IDT-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
    IF action == "ACTION_ADDALL"
    {
        STEP ACTION_ADDALL
        {
            USES PROCESS "BF1626All";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-SBSDRY-CO-ID;
            " " -> MIR-PLAN-BON-IDT-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
    IF action == "ACTION_ADDTYPE"
    {
        STEP ACTION_ADDTYPE
        {
            USES PROCESS "BF1627Type";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-PLAN-INS-TYP-CD;
            " " -> MIR-SBSDRY-CO-ID;
            " " -> MIR-PLAN-BON-IDT-NUM;
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

    MIR-PLAN-ID = MIR-PLAN-ID-T[index];
    MIR-SBSDRY-CO-ID = MIR-SBSDRY-CO-ID-T[index];
    MIR-PLAN-BON-IDT-NUM = MIR-PLAN-BON-IDT-NUM-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF1620Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-PLAN-ID -> MIR-PLAN-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            MIR-PLAN-BON-IDT-NUM -> MIR-PLAN-BON-IDT-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF1622Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-PLAN-ID -> MIR-PLAN-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            MIR-PLAN-BON-IDT-NUM -> MIR-PLAN-BON-IDT-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF1623Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-PLAN-ID -> MIR-PLAN-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            MIR-PLAN-BON-IDT-NUM -> MIR-PLAN-BON-IDT-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
    IF action == "ACTION_PLANLIST"
    {
        STEP ACTION_PLANLIST
        {
            USES PROCESS "BF1624List";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-PLAN-ID -> MIR-PLAN-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

