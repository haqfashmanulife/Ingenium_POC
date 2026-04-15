# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF9F60Retrieve.f                                              *
#*  Description:  U/W Summary Coverage Inquiry Screen                          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP310A  6.0      New for release 6.0                                       *
#*******************************************************************************

INCLUDE "BF9F62-O.s";
INCLUDE "BF9F60-P.p";

PROCESS BF9F60Retrieve
{
    Title = STRINGTABLE.IDS_TITLE_BF9F60Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOK";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # Retrieve the data

    STEP Retrieve
    {
        USES P-STEP "BF9F60-P";
    }

    IF LSIR-RETURN-CD != "00"
        EXIT;

    # Display the record retrieved

    STEP Output
    {
        USES S-STEP "BF9F62-O";
    }

    IF action == "ACTION_OK"
        EXIT;

}