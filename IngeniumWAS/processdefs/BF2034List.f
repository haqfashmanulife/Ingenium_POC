# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2034List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF2034-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF2034-O.s";
INCLUDE "BF2034-P.p";
INCLUDE "BF2030Retrieve.f";
INCLUDE "BF2031Create.f";
INCLUDE "BF2032Update.f";
INCLUDE "BF2033Delete.f";

PROCESS BF2034List
{
    Title = STRINGTABLE.IDS_TITLE_BF2034List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list
    # If coming from the Bank History List,
    # then go to retrieve the list immediately (because key is already filled in)

    IF DisplayInput == "FALSE"
        BRANCH RetrieveList;


    STEP ListStart
    {
        USES S-STEP "BF2034-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF2034-P";
    }

    TRACE("ADB packaging code 2 after RetrievelistP: (" + MIR-PLAN-PKG-ADB-CD-T[2] + ")");

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF2034List;
    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP "BF2034-O";
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
            USES PROCESS "BF2031Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-BASIC-PLAN-ID;
            " " -> MIR-SBSDRY-CO-ID;
            " " -> MIR-LOC-GR-ID;
            " " -> MIR-ADDL-PLAN-ID;
            " " -> MIR-ADDL-PLAN-MAND-IND;
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

    MIR-BASIC-PLAN-ID = MIR-BASIC-PLAN-ID-T[index];
    MIR-SBSDRY-CO-ID = MIR-SBSDRY-CO-ID-T[index];
    MIR-LOC-GR-ID = MIR-LOC-GR-ID-T[index];
    MIR-ADDL-PLAN-ID = MIR-ADDL-PLAN-ID-T[index];
    MIR-ADDL-PLAN-MAND-IND = MIR-ADDL-PLAN-MAND-IND-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF2030Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-BASIC-PLAN-ID -> MIR-BASIC-PLAN-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            MIR-LOC-GR-ID -> MIR-LOC-GR-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF2032Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-BASIC-PLAN-ID -> MIR-BASIC-PLAN-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            MIR-LOC-GR-ID -> MIR-LOC-GR-ID;
            MIR-ADDL-PLAN-MAND-IND -> MIR-ADDL-PLAN-MAND-IND;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF2033Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-BASIC-PLAN-ID -> MIR-BASIC-PLAN-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            MIR-LOC-GR-ID -> MIR-LOC-GR-ID;
            MIR-ADDL-PLAN-MAND-IND -> MIR-ADDL-PLAN-MAND-IND;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

