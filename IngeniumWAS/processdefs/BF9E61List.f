# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9E61List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  15997A  CTS      CHANGES FOR FRA PREMIUM REDUCTION SIMULATION SCREEN       *
#*******************************************************************************

INCLUDE "BF9E61-P.p";
INCLUDE "BF9E61-O.s";

PROCESS BF9E61List
{

    # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF9E61List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOK";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP Retrieve
    {
        USES P-STEP "BF9E61-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

      
    STEP Output
    {
        USES S-STEP "BF9E61-O";
        STRINGTABLE.IDS_TITLE_BF9E61List -> Title;
    }

    IF action == "ACTION_NEXT"
        EXIT;

}

