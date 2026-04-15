# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1693Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1693-P.p";
INCLUDE "BF1694-O.s";

PROCESS BF1693Delete
{
	VARIABLES
	{
	    IN Title;
	}
    Title = STRINGTABLE.IDS_TITLE_BF1693Delete;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP Delete
    {
        USES P-STEP "BF1693-P";
    }

    IF LSIR-RETURN-CD != "00"
        EXIT;

}

