#<HEADER>
#<COPYRIGHT>
#© 2001 INSURANCE SOFTWARE SOLUTIONS CORP.  ALL RIGHTS RESERVED
#</COPYRIGHT>
#</HEADER>
# Converted from PathFinder 2.2 to 3.0 on Jan 20, 2004 1:42:19 PM EST
# Converted to Enterprise Designer 1.1 format on Oct 4, 2002 1:51:56 PM EDT
# Change this to the S that starts the list
# Change this to the P that retrieves the list
#*******************************************************************************
#*  Component:   BF9001List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  SESCAP  31OCT04  New for Session Cap Enhancement                           *
#*                                                                             *
#*******************************************************************************

PROCESS BF9001List
{

	Title = STRINGTABLE.IDS_TITLE_BF9001List;
	TitleBar = "TitleBar";
	TitleBarSize = "70";
	ButtonBar = "ButtonBarOKCancel";
	ButtonBarSize = "40";
	MessageFrame = "MessagesDisp";
	MessageFrameSize = "70";
	# Ask the user where they'd like to start the list
	STEP ListStart
	{
		USES S-STEP "BF9001-I";
		STRINGTABLE.IDS_TITLE_BF9001List -> Title;
	}

	IF action == "ACTION_BACK"
	{
		EXIT;

	}

	STEP RetrieveList
	{
		USES P-STEP "BF9001-P";
	}

	ButtonBar = "ButtonBarListsScroll";
	STEP DisplayList
	{
		USES S-STEP "BF9001-O";
	}

	IF action == "ACTION_BACK"
	{
		EXIT;

	}

	# If the user has pressed the more button, go back and reget the list
	IF action == "ACTION_MORE"
	{
		BRANCH RetrieveList;
	}

}
