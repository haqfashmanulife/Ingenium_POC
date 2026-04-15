# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF9D17SrvbenDed.f                                             *
#*  Description: Survival Benefit Deduction Amount History Inquiry Screen      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP302U  6.0      New for release 6.0                                       *
#*******************************************************************************

INCLUDE "BF9D17-O.s";
INCLUDE "BF9D17-P.p";

PROCESS BF9D17SrvbenDed
{
    Title = STRINGTABLE.IDS_TITLE_BF9D17SrvbenDed;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOK";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # Retrieve the data

    STEP Retrieve
    {
        USES P-STEP "BF9D17-P";
    }

    IF LSIR-RETURN-CD != "00"
        EXIT;

    # Display the record retrieved

    STEP Output
    {
        USES S-STEP "BF9D17-O";
    }

    IF action == "ACTION_OK"
        EXIT;

}