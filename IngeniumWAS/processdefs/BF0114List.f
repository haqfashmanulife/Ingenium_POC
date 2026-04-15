# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0114List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016892  6.1.2J   Fix presentation problems for pathfinder 1.2              *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF0114-I.s";
INCLUDE "BF0114LstAccumSame-O.s";
INCLUDE "BF0114LstAccumDiff-O.s";
INCLUDE "BF0114LstInitAccumSame-O.s";

# Change this to the P that retrieves the list

INCLUDE "BF0114LstInitAccumDiff-O.s";
INCLUDE "BF0114-P.p";
INCLUDE "BF0110Retrieve.f";
INCLUDE "BF0111Create.f";
INCLUDE "BF0112Update.f";
INCLUDE "BF0113Delete.f";
INCLUDE "BF0115Nextdate.f";

PROCESS BF0114List
{
    Title = STRINGTABLE.IDS_TITLE_BF0114List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF0114-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF0114-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;



    # This view displays Accum Units only, same Buy/Sell Price

    IF MIR-FND-PRIC-STRUCT-CD == "S" && MIR-FND-UNIT-TYP-CD == "1"
        DisplayListS = "BF0114LstAccumSame-O";

    ELSE

        # This view displays Accum Units only, different Buy/Sell Price

        IF MIR-FND-PRIC-STRUCT-CD == "D" && MIR-FND-UNIT-TYP-CD == "1"
            DisplayListS = "BF0114LstAccumDiff-O";

        ELSE

            # This view displays Initial & Accum Units, same Buy/Sell Price

            IF MIR-FND-PRIC-STRUCT-CD == "S" && MIR-FND-UNIT-TYP-CD == "2"
                DisplayListS = "BF0114LstInitAccumSame-O";

            ELSE

                # This view displays Initial & Accum Units, different Buy/Sell Price

                IF MIR-FND-PRIC-STRUCT-CD == "D" && MIR-FND-UNIT-TYP-CD == "2"
                    DisplayListS = "BF0114LstInitAccumDiff-O";





    ButtonBar = "ButtonBarListsFundUnitPrice";

    STEP DisplayList
    {
        USES S-STEP DisplayListS;
        STRINGTABLE.IDS_TITLE_BF0114List -> Title;
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE"
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
            USES PROCESS "BF0111Create";
            ATTRIBUTES
            {
                SendMessages = "NO";
            }

            MIR-FND-ID -> MIR-FND-ID;
            " " -> MIR-FNDVL-EFF-DT;
            " " -> MIR-FND-NXT-VALN-DT;
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

    MIR-FND-ID = MIR-FND-ID;
    MIR-FNDVL-EFF-DT = MIR-FNDVL-EFF-DT-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF0110Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-FND-ID -> MIR-FND-ID;
            MIR-FNDVL-EFF-DT -> MIR-FNDVL-EFF-DT;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF0112Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-FND-ID -> MIR-FND-ID;
            MIR-FNDVL-EFF-DT -> MIR-FNDVL-EFF-DT;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF0113Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-FND-ID -> MIR-FND-ID;
            MIR-FNDVL-EFF-DT -> MIR-FNDVL-EFF-DT;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to maintain the Valuation Date

    IF action == "ACTION_NEXTDATE"
    {
        STEP ACTION_NEXTDATE
        {
            USES PROCESS "BF0115Nextdate";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
                SendMessages = "NO";
            }

            MIR-FND-ID -> MIR-FND-ID;
            " " -> MIR-FNDVL-EFF-DT;
            " " -> MIR-FND-NXT-VALN-DT;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

