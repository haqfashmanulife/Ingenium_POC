# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1744List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1744-I.s";
INCLUDE "BF1744-O.s";
INCLUDE "BF1744-P.p";
INCLUDE "BF1740Retrieve.f";
INCLUDE "BF1741Create.f";
INCLUDE "BF1742Update.f";
INCLUDE "BF1743Delete.f";
INCLUDE "BF1745Copy.f";

PROCESS BF1744List
{
    Title = STRINGTABLE.IDS_TITLE_BF1744List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF1744-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF1744-P";

        # ENSURE THE DRIVERS BELOW ARE CORRECT

    }

    Title = STRINGTABLE.IDS_TITLE_BF1744List;

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    ButtonBar = "ButtonBarListsCRUDCopy";

    STEP DisplayList
    {
        USES S-STEP "BF1744-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE"
        BRANCH RetrieveList;


    # The user has indicated that they want to add an element to the list

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF1741Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-PLAN-ID;
            " " -> MIR-SBSDRY-CO-ID;
            " " -> MIR-LOC-GR-ID;
            " " -> MIR-FND-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # If the user hasn't selected an item to work with, go back to the list.

    IF index == "0"
        BRANCH DisplayList;


    MIR-SBSDRY-CO-ID = MIR-SBSDRY-CO-ID-T[index];
    MIR-LOC-GR-ID = MIR-LOC-GR-ID-T[index];
    MIR-FND-ID = MIR-FND-ID-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF1740Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-PLAN-ID -> MIR-PLAN-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            MIR-LOC-GR-ID -> MIR-LOC-GR-ID;
            MIR-FND-ID -> MIR-FND-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF1742Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-PLAN-ID -> MIR-PLAN-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            MIR-LOC-GR-ID -> MIR-LOC-GR-ID;
            MIR-FND-ID -> MIR-FND-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to copy a record.

    IF action == "ACTION_COPY"
    {
        STEP ACTION_COPY
        {
            USES PROCESS "BF1745Copy";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
                SendMessages = "NO";
            }

            MIR-PLAN-ID -> MIR-PLAN-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            MIR-LOC-GR-ID -> MIR-LOC-GR-ID;
            MIR-FND-ID -> MIR-FND-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF1743Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-PLAN-ID -> MIR-PLAN-ID;
            MIR-SBSDRY-CO-ID -> MIR-SBSDRY-CO-ID;
            MIR-LOC-GR-ID -> MIR-LOC-GR-ID;
            MIR-FND-ID -> MIR-FND-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

