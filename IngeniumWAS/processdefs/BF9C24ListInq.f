#*******************************************************************************
#*  Component:   BF9C24ListInq.f                                               *
#*  Description: TD Reinstatement Information(REIN) List function              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  NWLGLR  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************


PROCESS BF9C24ListInq
{

    Title = STRINGTABLE.IDS_TITLE_BF9C24List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    
    STEP ListStart
    {
        USES S-STEP "BF9C24-I";
    }
    
    IF action == "ACTION_BACK"
    {
	EXIT;

    }

    STEP GOTOLIST
    {
        USES PROCESS "BF9C24ListMainInq";
    }

    IF DisplayInput == "FALSE"
    {
        EXIT;
    }

    IF action == "ACTION_BACK"
    {
        EXIT;
    }
    
}

