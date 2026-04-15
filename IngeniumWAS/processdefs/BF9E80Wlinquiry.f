# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9E50Wlquote.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3064  CTS      Whole life premium payment completion Inquiry             *
#*******************************************************************************

INCLUDE "BF9E80-I.s";
INCLUDE "BF9E80-P.p";
INCLUDE "BF9E80-O.s";

PROCESS BF9E80Wlinquiry
{

    # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF9E80Wlinquiry;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # Collect the key value 
    # 1st screen-WL premium payment completion quote - Input

    STEP Input
    {
        USES S-STEP "BF9E80-I";
        STRINGTABLE.IDS_TITLE_BF9E80Wlinquiry -> Title;
    }

    IF action == "ACTION_BACK"
       EXIT;
       
#UY3004 CHANGES START
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
        BRANCH KeyFields-S;
       }

    IF WS-POL-COUNTER <="01"
      {
       MIR-POL-ID-BASE = UserDefinedPolicyIDBase;
       MIR-POL-ID-SFX  = UserDefinedPolicyIDSuffix ;
      }

    IF WS-POL-COUNTER >"01"
      {
       MIR-POL-ID-BASE = WS-POL-ID-BASE;
       MIR-POL-ID-SFX  = WS-POL-ID-SFX;
      }

#UY3004 CHANGES END

    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF9E80-P";
    }
    
    IF LSIR-RETURN-CD != "00"
    {
        BRANCH Input;
    }

    ButtonBar = "ButtonBarOK";

    STEP Output
    {
        USES S-STEP "BF9E80-O";
        STRINGTABLE.IDS_TITLE_BF9E80Output -> Title;
    }
}