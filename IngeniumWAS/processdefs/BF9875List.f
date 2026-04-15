# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9875List.f                                                  *
#*  Description: Associated Disease/Surgery List function                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************
# Input screen

INCLUDE "BF9875-I.s";

# List retrieve process

INCLUDE "BF9875-P.p";

# List output screens for Disease or Surgery

INCLUDE "BF9875D-O.s";
INCLUDE "BF9875S-O.s";
INCLUDE "BF9890Retrieve.f";
INCLUDE "BF9891Create.f";
INCLUDE "BF9892Update.f";
INCLUDE "BF9893Delete.f";

PROCESS BF9875List
{
    Title = STRINGTABLE.IDS_TITLE_BF9875List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF9875-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Reset variables at start of a new list

    PREV-MEDIC-CD = MIR-MEDIC-CD;
    PREV-GRP-MEDC-ID = MIR-GRP-MEDC-ID;
    PREV-MEDIC-CAT-CD = MIR-MEDIC-CAT-CD;
    MIR-MEDC-ID = " ";

    STEP RetrieveList
    {
        USES P-STEP "BF9875-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    # Determine if the list is for Disease or Surgery records and 
    # display on the appropriate Output page

    IF MIR-MEDIC-CD == "D"
    {
        DisplayListS = "BF9875D-O";
        Title = STRINGTABLE.IDS_TITLE_BF9875ListD;

    }
    IF MIR-MEDIC-CD == "S"
    {
        DisplayListS = "BF9875S-O";
        Title = STRINGTABLE.IDS_TITLE_BF9875ListS;

    }

    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP DisplayListS;
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
    {
        IF MIR-MEDIC-CD != PREV-MEDIC-CD || MIR-GRP-MEDC-ID != PREV-GRP-MEDC-ID || MIR-MEDIC-CAT-CD != PREV-MEDIC-CAT-CD
        {
            MIR-MEDC-ID = " ";
            PREV-MEDIC-CD = MIR-MEDIC-CD;
            PREV-MEDIC-CAT-CD = MIR-MEDIC-CAT-CD;
            PREV-GRP-MEDC-ID = MIR-GRP-MEDC-ID;

        }

        BRANCH RetrieveList;

    }

    # The user has indicated that they want to add an element to the list
    # In the Add step, initialize all of the key fields to blank so that the
    # key will not be populated on an add
    # e.g. IMPLICIT;
    #      " " -> MIR-REQIR-ID;

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF9891Create";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
                SendMessages = "NO";
            }

            MIR-MEDIC-CD -> MIR-MEDIC-CD;
            MIR-MEDC-TYP-CD -> MIR-MEDC-TYP-CD;
            " " -> MIR-MEDC-ID;
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

    MIR-MEDC-ID = MIR-MEDC-ID-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF9890Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-MEDIC-CD -> MIR-MEDIC-CD;
            MIR-MEDC-TYP-CD -> MIR-MEDC-TYP-CD;
            MIR-MEDC-ID -> MIR-MEDC-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF9892Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-MEDIC-CD -> MIR-MEDIC-CD;
            MIR-MEDC-TYP-CD -> MIR-MEDC-TYP-CD;
            MIR-MEDC-ID -> MIR-MEDC-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF9893Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-MEDIC-CD -> MIR-MEDIC-CD;
            MIR-MEDC-TYP-CD -> MIR-MEDC-TYP-CD;
            MIR-MEDC-ID -> MIR-MEDC-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

