# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF5003Settle.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF5000-P.p";
INCLUDE "BF5000-I.s";
INCLUDE "BF5000Life-O.s";
INCLUDE "BF5000Ann-O.s";
INCLUDE "BF5000Dis-O.s";
INCLUDE "BF5003-P.p";

PROCESS BF5003Settle
{
    Title = STRINGTABLE.IDS_TITLE_BF5003Settle;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Enter the Policy ID for the policy to be Settled

    STEP BF5000-I
    {
        USES S-STEP "BF5000-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Retrieve the policy record

    STEP BF5000-P
    {
        USES P-STEP "BF5000-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF5000-I;


    SettlePrceS = "BF5000Life-O";


    # Determine if the policy is Life or Health or Annuity/Equity and display
    # the appropriate Output page

    IF MIR-POL-BUS-CLAS-CD == "A" || MIR-POL-BUS-CLAS-CD == "E"
        SettlePrceS = "BF5000Ann-O";

    IF MIR-POL-BUS-CLAS-CD == "H"
        SettlePrceS = "BF5000Dis-O";



    # Display retrieved policy record for update

    STEP Settle-S
    {
        USES S-STEP SettlePrceS;
        "ButtonBarSettleCancel" -> ButtonBar;
    }

    IF action == "ACTION_BACK"
        EXIT;



    # Process Settle

    STEP Settle-P
    {
        USES P-STEP "BF5003-P";
    }

    STEP Settle-O
    {
        USES S-STEP SettlePrceS;
        "ButtonBarOK" -> ButtonBar;
    }

    IF action == "ACTION_BACK"
        EXIT;

}

