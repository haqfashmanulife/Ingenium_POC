# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF9D11SrvbChrbc.f                                             *
#*  Description: Survival Benefit / Deferral Benefit Chargeback Details        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP302M  6.0      New for release 6.0    
#*  UY323A  CTS      MEDICAL CLAIM PAYMENT                                     *                                   *
#*******************************************************************************

INCLUDE "BF9D11-O.s";
INCLUDE "BF9D11-P.p";

PROCESS BF9D11SrvbChrbc
{
	VARIABLES
	{
	    IN DisplayInput;
	}
    Title = STRINGTABLE.IDS_TITLE_BF9D11SrvbChrbc;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # Retrieve the data
    MIR-DV-PRCES-STATE-CD = "1";
    STEP Retrieve
    {
        USES P-STEP "BF9D11-P";
    }

    IF LSIR-RETURN-CD != "00"
        EXIT;

    # Display the record retrieved

    IF DisplayInput == "R"																						
    {
        STEP ADJINQ
        {
        USES S-STEP "BF9D11AI-O";
        "ButtonBarOK" -> ButtonBar;
        }
        EXIT;
    }
	
    STEP Output
    {
        USES S-STEP "BF9D11-O";
        "ButtonBarOK" -> ButtonBar;
    }

# UY323A CHANGES STARTS
    IF action == "ACTION_NEXT"																						
    {
        STEP UpdateCLPS
        {
            USES P-STEP "BF9D11-P";
            "3" -> MIR-DV-PRCES-STATE-CD;
        }
        EXIT;
    }
#UY323A CHANGES ENDS    
}