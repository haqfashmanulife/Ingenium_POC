# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1694List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1694-I.s";
INCLUDE "BF1694-O.s";
INCLUDE "BF1694-P.p";
INCLUDE "BF1690Attach.f";
INCLUDE "BF1693Delete.f";

PROCESS BF1694List
{
    Title = STRINGTABLE.IDS_TITLE_BF1694List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF1694-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF1694-P";
    }


    # We'll need to keep a record of the Key to determine if the user has
    # changed it.

    FLOW-KEY-SUR-NM-VALUE = MIR-CLI-LTST-SUR-NM;

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF1694List;
    ButtonBar = "ButtonBarListsDAtt";

    STEP DisplayList
    {
        USES S-STEP "BF1694-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list
    # if the last name in the key has been changed, zero out the sequence number

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
    {
        IF FLOW-KEY-SUR-NM-VALUE != MIR-CLI-LTST-SUR-NM
            MIR-CLI-LTST-SEQ-NUM = "000";


        BRANCH RetrieveList;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. 

    MIR-CLI-LTST-SUR-NM = MIR-CLI-LTST-SUR-NM-T[index];
    MIR-CLI-LTST-SEQ-NUM = MIR-CLI-LTST-SEQ-NUM-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "ACTION_ATTACH"
    {
        STEP SelectItem
        {
            USES PROCESS "BF1690Attach";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-CLI-LTST-SUR-NM -> MIR-CLI-LTST-SUR-NM;
            MIR-CLI-LTST-SEQ-NUM -> MIR-CLI-LTST-SEQ-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF1693Delete";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-CLI-LTST-SUR-NM -> MIR-CLI-LTST-SUR-NM;
            MIR-CLI-LTST-SEQ-NUM -> MIR-CLI-LTST-SEQ-NUM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

