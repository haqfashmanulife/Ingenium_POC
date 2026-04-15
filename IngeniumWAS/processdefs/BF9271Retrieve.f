# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9271Retrieve.f                                              *
#*  Description: Adjudicator Details Inquiry                                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL106A HIN/CL   ADJUDICATOR INQUIRY                                       *
#*  CS0008  CTS      NEW TABLE ADDITION IN THE EXISTING ADJUDICATOR                                                                            *
#*******************************************************************************
#fix these includes

INCLUDE "BF9271-O.s";
INCLUDE "BF9271-P.p";
    # CS0008 changes starts here
INCLUDE "BF9275-P.p";
    # CS0008 changes ends here

PROCESS BF9271Retrieve
{
	VARIABLES
	{
	    OUT action;
	}
    Title = STRINGTABLE.IDS_TITLE_BF9270Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ClmButtonBarBackCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Retrieve the information

    STEP Retrieve
    {
        USES P-STEP "BF9271-P";
    }

    IF LSIR-RETURN-CD != "00"
        EXIT;

    # CS0008 changes starts here
    # Retrieve the information

    STEP Retrieve1
    {
        USES P-STEP "BF9275-P";
    }

    IF LSIR-RETURN-CD != "00"
        EXIT;

    # CS0008 changes ends here



    # Display the retrieved information

    STEP Output
    {
        USES S-STEP "BF9271-O";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_EXIT"
        EXIT;

}

