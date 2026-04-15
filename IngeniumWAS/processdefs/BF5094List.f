# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF5094List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF5094-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF5094-O.s";
INCLUDE "BF5094-P.p";
INCLUDE "BF5090Retrieve.f";
INCLUDE "BF5091Create.f";
INCLUDE "BF5092Update.f";
INCLUDE "BF5093Delete.f";
INCLUDE "BF5095AddPolicy.f";
INCLUDE "BF5096RevPACDrw.f";
INCLUDE "BF5104List.f";

PROCESS BF5094List
{
    Title = STRINGTABLE.IDS_TITLE_BF5094List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF5094-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF5094-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF5094List;
    ButtonBar = "ButtonBarListsBankHistory";

    STEP DisplayList
    {
        USES S-STEP "BF5094-O";
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
            USES PROCESS "BF5091Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-BNK-ID;
            " " -> MIR-BNK-BR-ID;
            " " -> MIR-BNK-ACCT-ID;
            " " -> MIR-PAC-DRW-IDT-NUM;
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

    MIR-PAC-DRW-IDT-NUM = MIR-PAC-DRW-IDT-NUM-T[index];
    MIR-PAC-DRW-SEQ-NUM = MIR-PAC-DRW-SEQ-NUM-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF5090Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-BNK-ID -> MIR-BNK-ID;
            MIR-BNK-BR-ID -> MIR-BNK-BR-ID;
            MIR-BNK-ACCT-ID -> MIR-BNK-ACCT-ID;
            MIR-PAC-DRW-IDT-NUM -> MIR-PAC-DRW-IDT-NUM;
            MIR-PAC-DRW-SEQ-NUM -> MIR-PAC-DRW-SEQ-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF5092Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-BNK-ID -> MIR-BNK-ID;
            MIR-BNK-BR-ID -> MIR-BNK-BR-ID;
            MIR-BNK-ACCT-ID -> MIR-BNK-ACCT-ID;
            MIR-PAC-DRW-IDT-NUM -> MIR-PAC-DRW-IDT-NUM;
            MIR-PAC-DRW-SEQ-NUM -> MIR-PAC-DRW-SEQ-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF5093Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-BNK-ID -> MIR-BNK-ID;
            MIR-BNK-BR-ID -> MIR-BNK-BR-ID;
            MIR-BNK-ACCT-ID -> MIR-BNK-ACCT-ID;
            MIR-PAC-DRW-IDT-NUM -> MIR-PAC-DRW-IDT-NUM;
            MIR-PAC-DRW-SEQ-NUM -> MIR-PAC-DRW-SEQ-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
    IF action == "ACTION_ADDPOLICY"
    {
        STEP ACTION_ADDPOLICY
        {
            USES PROCESS "BF5095AddPolicy";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            MIR-BNK-ID -> MIR-BNK-ID;
            MIR-BNK-BR-ID -> MIR-BNK-BR-ID;
            MIR-BNK-ACCT-ID -> MIR-BNK-ACCT-ID;
            MIR-PAC-DRW-IDT-NUM -> MIR-PAC-DRW-IDT-NUM;
            MIR-PAC-DRW-SEQ-NUM -> MIR-PAC-DRW-SEQ-NUM;
            " " -> MIR-POL-ID-BASE;
            " " -> MIR-POL-ID-SFX;
            " " -> MIR-PAC-DRWD-DUE-DT;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
    IF action == "ACTION_REVERSE"
    {
        STEP ACTION_REVERSE
        {
            USES PROCESS "BF5096RevPACDrw";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            MIR-BNK-ID -> MIR-BNK-ID;
            MIR-BNK-BR-ID -> MIR-BNK-BR-ID;
            MIR-BNK-ACCT-ID -> MIR-BNK-ACCT-ID;
            MIR-PAC-DRW-IDT-NUM -> MIR-PAC-DRW-IDT-NUM;
            MIR-PAC-DRW-SEQ-NUM -> MIR-PAC-DRW-SEQ-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
    IF action == "ACTION_POLICYLIST"
    {
        STEP ACTION_POLICYLIST
        {
            USES PROCESS "BF5104List";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-BNK-ID -> MIR-BNK-ID;
            MIR-BNK-BR-ID -> MIR-BNK-BR-ID;
            MIR-BNK-ACCT-ID -> MIR-BNK-ACCT-ID;
            MIR-PAC-DRW-IDT-NUM -> MIR-PAC-DRW-IDT-NUM;
            MIR-PAC-DRW-SEQ-NUM -> MIR-PAC-DRW-SEQ-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

