# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF9H40Retrieve.f                                              *
#*  Description: Maturity Quote Screen                                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  23802D  13APR22  Intial Version                                            *
#*******************************************************************************

INCLUDE "BF9H40-I.s";
INCLUDE "BF9510-P.p";
INCLUDE "BF9H40-O.s";
INCLUDE "BF9D34List.f";

PROCESS BF9H40Retrieve

{

    # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF9H40Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

 #1ST SCREEN -> ANNUITY/DEATH LUMP SUM QUOTE

    STEP Input
    {
        USES S-STEP "BF9H40-I";
        STRINGTABLE.IDS_TITLE_BF9H40Phase1 -> Title;
    }

    # Hitting Cancel from the first page leaves the flow

    IF  action == "ACTION_BACK"
        EXIT;

    UserDefinedPolicyIDBase   = MIR-POL-ID-BASE;
    UserDefinedPolicyIDSuffix = MIR-POL-ID-SFX;
    
    STEP RetrieveList
    {
        USES PROCESS "BF9D34List";
    
        UserDefinedPolicyIDBase -> MIR-POL-ID-BASE;
        UserDefinedPolicyIDSuffix -> MIR-POL-ID-SFX;
        WS-POL-ID-BASE <- WS9D34-POL-ID-BASE;
        WS-POL-ID-SFX  <- WS9D34-POL-ID-SFX;
        WS-POL-COUNTER <-WS9D34-POL-COUNTER;
        WS-CANCEL-IND  <- WS9D34-CANCEL-IND;
        WS-RETURN-CD   <- WS9D34-RETURN-CD;
        UserDefinedPolicyIDBase <- WS9D34-POL-ID-BASE;
        UserDefinedPolicyIDSuffix <- WS9D34-POL-ID-SFX;
    }
	
    IF  WS-CANCEL-IND == "Y" || WS-RETURN-CD !="00"
    {
        BRANCH Input;
    }
	
    IF  WS-POL-COUNTER <="01"
    {
        MIR-POL-ID-BASE = UserDefinedPolicyIDBase;
        MIR-POL-ID-SFX  = UserDefinedPolicyIDSuffix ;
    }
	
    IF  WS-POL-COUNTER >"01"
    {
        MIR-POL-ID-BASE = WS-POL-ID-BASE;
        MIR-POL-ID-SFX  = WS-POL-ID-SFX;
    }
    MIR-POL-ID-BASE = UserDefinedPolicyIDBase;
    MIR-POL-ID-SFX  = UserDefinedPolicyIDSuffix ;
    MIR-DV-PRCES-STATE-CD="1";
         
    STEP Retrieve
    {
        USES P-STEP "BF9510-P";
    }
	
    IF  LSIR-RETURN-CD != "00" 
        BRANCH Input;

    STEP LmpsmResult
    {
        USES S-STEP "BF9H40-O";
        STRINGTABLE.IDS_TITLE_BF9H40Phase2 -> Title;
        "ButtonBarOK" -> ButtonBar;
    } 

    IF  action == "ACTION_NEXT"
        EXIT;
}
