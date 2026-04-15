# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2044ListInq.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MPC703  6.0      New screen for Text by Language                           *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF2044-I.s";
INCLUDE "BF2044-O.s";
INCLUDE "BF2044-P.p";
INCLUDE "BF2040Retrieve.f";


PROCESS BF2044ListInq
{
    Title = STRINGTABLE.IDS_TITLE_BF2044List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP BF2044-I
    {
        USES S-STEP "BF2044-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP BF2044-P
    {
        USES P-STEP "BF2044-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF2044-I;


    Title = STRINGTABLE.IDS_TITLE_BF2044List;
    ButtonBar = "ButtonBarListsCRUD1";

    STEP BF2044-O
    {
        USES S-STEP "BF2044-O";
    }
    IF action == "ACTION_BACK"
        EXIT;
        
    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH BF2044-P;

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH BF2044-O;

    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-USER-EXIT-ID is 
    # used here as an example only.

    MIR-TXT-LANG-CD = MIR-TXT-LANG-CD-T[index];
    MIR-TXT-SRC-REF-ID = MIR-TXT-SRC-REF-ID-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF2040Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-TXT-LANG-CD -> MIR-TXT-LANG-CD;
            MIR-TXT-SRC-REF-ID -> MIR-TXT-SRC-REF-ID;
            MIR-TXT-SRC-ID -> MIR-TXT-SRC-ID;
            "FALSE" -> DisplayInput;
        }

        BRANCH BF2044-P;

    }

    
}

