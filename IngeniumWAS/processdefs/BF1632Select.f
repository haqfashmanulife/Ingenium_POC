# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1632Select.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************
#INCLUDE "BF1630-I.s";
#INCLUDE "BF1630-P.p";
#INCLUDE "BF1632-I.s";
#INCLUDE "BF1632-P.p";
#INCLUDE "BF1632-O.s";
#INCLUDE "BF1631-P.p";
#INCLUDE "GenConfrm.f";

INCLUDE "BF1630Temp.s";

PROCESS BF1632Select
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
        STRINGTABLE.IDS_TITLE_BF1631Consoldte -> Title;
    }

    IF action == "ACTION_OK" || action == "ACTION_BACK"
        EXIT;

}


#       STEP Main
#	{
#       	NAME "Main step"
#		USES PROCESS GenConfrm IMPLICIT;
#
#		# Set up the title strings.
#		STRINGTABLE.IDS_TITLE_BF1631Process -> ProcessTitle;
#		STRINGTABLE.IDS_TITLE_BF1631Phase1 -> Phase1Title;
#		STRINGTABLE.IDS_TITLE_BF1631Phase2 -> Phase2Title;
#		STRINGTABLE.IDS_TITLE_BF1631Phase3 -> Phase3Title;
#
#		# Consolidate starts with Phase 1.
#		"1" -> InitialState;
#
#		# Set the names of the S and P steps to be used
#		"BF1630-I" -> KeyFieldsS;
#		"BF1630-P" -> GetInitialHostDataP;
# 		"BF1632-I" -> DataInputS;
#		"BF1632-P" -> PerformHostEditsP;
#		"BF1632-O" -> ConfirmS;
#		"BF1631-P" -> UpdateHostP;
#	}
#
#	IF action == "ACTION_BACK"
#		EXIT;
#
#	BRANCH Main;
#}

