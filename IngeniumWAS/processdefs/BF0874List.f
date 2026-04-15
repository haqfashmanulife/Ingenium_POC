# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0874List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF0874-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF0874-O.s";
INCLUDE "BF0874-P.p";
INCLUDE "BF0870Retrieve.f";
INCLUDE "BF0872Update.f";
INCLUDE "BF0873Delete.f";

PROCESS BF0874List
{
    Title = STRINGTABLE.IDS_TITLE_BF0874List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF0874-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF0874-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF0874List;
    ButtonBar = "ButtonBarListsRUD";

    STEP DisplayList
    {
        USES S-STEP "BF0874-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;


    # The user has indicated that they want to add an element to the list
    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-REQIR-ID is 
    # used here as an example only.

    MIR-RRSP-RHST-DT = MIR-RRSP-RHST-DT-T[index];
    MIR-RRSP-RHST-SEQ-NUM = MIR-RRSP-RHST-SEQ-NUM-T[index];
    MIR-RRSP-RHST-TYP-CD = MIR-RRSP-RHST-SEQ-TYP-CD-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF0870Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            MIR-RRSP-RHST-DT -> MIR-RRSP-RHST-DT;
            MIR-RRSP-RHST-SEQ-NUM -> MIR-RRSP-RHST-SEQ-NUM;
            MIR-RRSP-RHST-TYP-CD -> MIR-RRSP-RHST-SEQ-TYP-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF0872Update";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            MIR-RRSP-RHST-DT -> MIR-RRSP-RHST-DT;
            MIR-RRSP-RHST-SEQ-NUM -> MIR-RRSP-RHST-SEQ-NUM;
            MIR-RRSP-RHST-TYP-CD -> MIR-RRSP-RHST-SEQ-TYP-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF0873Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            MIR-RRSP-RHST-DT -> MIR-RRSP-RHST-DT;
            MIR-RRSP-RHST-SEQ-NUM -> MIR-RRSP-RHST-SEQ-NUM;
            MIR-RRSP-RHST-TYP-CD -> MIR-RRSP-RHST-SEQ-TYP-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

