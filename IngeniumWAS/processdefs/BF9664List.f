# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9664List.f                                                  *
#*  Description: Benefit Support Table (BENS) List function                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HPR102  HIN/CL   CLAIM REQUIREMENTS                                        *
#*  AIF158  RP211D   Added subtable 4                                          *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9664-I.s";
INCLUDE "BF9664-O.s";
INCLUDE "BF9664-P.p";
INCLUDE "BF9660Retrieve.f";
INCLUDE "BF9661Create.f";
INCLUDE "BF9662Update.f";
INCLUDE "BF9663Delete.f";

PROCESS BF9664List
{
    Title = STRINGTABLE.IDS_TITLE_BF9664List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF9664-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF9664-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF9664List;
    ButtonBar = "ButtonBarListsCRUD";

    STEP DisplayList
    {
        USES S-STEP "BF9664-O";
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
            USES PROCESS "BF9661Create";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-PLAN-ID;
            " " -> MIR-BNFT-NM-ID;
            " " -> MIR-STBL-2-CD;
            " " -> MIR-STBL-4-CD;
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

    MIR-PLAN-ID = MIR-PLAN-ID-T[index];
    MIR-BNFT-NM-ID = MIR-BNFT-NM-ID-T[index];
    MIR-STBL-2-CD = MIR-STBL-2-CD-T[index];
    MIR-STBL-4-CD = MIR-STBL-4-CD-T[index];

    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF9660Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-PLAN-ID -> MIR-PLAN-ID;
            MIR-BNFT-NM-ID -> MIR-BNFT-NM-ID;
            MIR-STBL-2-CD -> MIR-STBL-2-CD;
            MIR-STBL-4-CD -> MIR-STBL-4-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF9662Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-PLAN-ID -> MIR-PLAN-ID;
            MIR-BNFT-NM-ID -> MIR-BNFT-NM-ID;
            MIR-STBL-2-CD -> MIR-STBL-2-CD;
            MIR-STBL-4-CD -> MIR-STBL-4-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF9663Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-PLAN-ID -> MIR-PLAN-ID;
            MIR-BNFT-NM-ID -> MIR-BNFT-NM-ID;
            MIR-STBL-2-CD -> MIR-STBL-2-CD;
            MIR-STBL-4-CD -> MIR-STBL-4-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

