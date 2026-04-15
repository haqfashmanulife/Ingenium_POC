# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1630Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
#INCLUDE "BF1630-P.p";
#INCLUDE "BF1630-I.s";
#INCLUDE "BF1630-O.s";
#INCLUDE "GenRetrieve.f";

INCLUDE "BF1630Temp.s";

PROCESS BF1630Retrieve
{
    Title = "Temporary title";
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP TemporaryRetrieve
    {
        USES S-STEP "BF1630Temp";
        STRINGTABLE.IDS_TITLE_BF1630Retrieve -> Title;
    }

    IF action == "ACTION_OK" || action == "ACTION_BACK"
        EXIT;

}


#       original flow left intact below.
#       remove flow logic above once restructuring for consolidation completed.
#
#
#
#	STEP Main
#
#	{
#
#		NAME "Main"
#
#		USES PROCESS GenRetrieve IMPLICIT;
#		STRINGTABLE.IDS_TITLE_BF1630Retrieve -> Title;
#		"BF1630-I" -> InputS;
#		"BF1630-P" -> RetrieveP;
#		"BF1630-O" -> OutputS;
#	}
#
#        IF DisplayInput == "FALSE"
#		EXIT;
#
#	IF action == "ACTION_BACK"
#		EXIT;
#
#	BRANCH Main;
#
#}

