# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0654List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016037  602J     Fix Cheque name                                           *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF0654-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF0654-O.s";
INCLUDE "BF0654-P.p";
INCLUDE "BF0650Change.f";

PROCESS BF0654List
{
    Title = STRINGTABLE.IDS_TITLE_BF0654List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF0654-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF0654-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF0654List;
    ButtonBar = "ButtonBarListsChgStatus";

    STEP DisplayList
    {
        USES S-STEP "BF0654-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;


    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. MIR-REQIR-ID is 
    # used here as an example only.

    MIR-CHQ-ID = MIR-CHQ-ID-T[index];
    MIR-CHQ-PAYE-NM = MIR-CHQ-PAYE-NM-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "ACTION_CHGSTATUS"
    {
        STEP ChangeStatus
        {
            USES PROCESS "BF0650Change";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
                SendMessages = "NO";
            }

            MIR-CHQ-ID -> MIR-CHQ-ID;
            MIR-CHQ-PAYE-NM -> MIR-CHQ-PAYE-NM;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

