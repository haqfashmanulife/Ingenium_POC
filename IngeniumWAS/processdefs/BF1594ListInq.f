# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1594ListInq.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MPC703  6.0      New screen for Interest Rate List                         *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1594-I.s";
INCLUDE "BF1594-O.s";
INCLUDE "BF1594-P.p";
INCLUDE "BF1590Retrieve.f";

PROCESS BF1594ListInq
{
    Title = STRINGTABLE.IDS_TITLE_BF1594List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF1594-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF1594-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF1594List;
    ButtonBar = "ButtonBarListsCRUD1";

    STEP DisplayList
    {
        USES S-STEP "BF1594-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE"
        BRANCH RetrieveList;
        
    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # REMOVE EXTRA KEY FIELDS BELOW AND THEN USER SEARCH TO
    # SKIP TO NEXT SECTION OF KEY FIELDS TO MAINTAIN

    MIR-DPOS-TRM-DY-DUR = MIR-DPOS-TRM-DY-DUR-T[index];
    MIR-DPOS-TRM-MO-DUR = MIR-DPOS-TRM-MO-DUR-T[index];
    MIR-INT-RT-EFF-DT = MIR-INT-RT-EFF-DT-T[index];
    MIR-INT-RT-ID = MIR-INT-RT-ID-T[index];
    MIR-INT-RT-MAX-AMT = MIR-INT-RT-MAX-AMT-T[index];

    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF1590Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-DPOS-TRM-DY-DUR -> MIR-DPOS-TRM-DY-DUR;
            MIR-DPOS-TRM-MO-DUR -> MIR-DPOS-TRM-MO-DUR;
            MIR-INT-RT-EFF-DT -> MIR-INT-RT-EFF-DT;
            MIR-INT-RT-ID -> MIR-INT-RT-ID;
            MIR-INT-RT-MAX-AMT -> MIR-INT-MAX-AMT;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }


}

