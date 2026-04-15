# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9E70Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  TV209B  CTS      CHANGES FOR TRIAL FOR FUND TRANSFER % TO % SCREEN         *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*******************************************************************************

INCLUDE "BF1772Key-I.s";
INCLUDE "BF9E70-P.p";
INCLUDE "BF1772Data-I.s";
INCLUDE "BF1772-O.s";

PROCESS BF9E70Retrieve
{

    # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF9E70Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # Collect the key value 

    STEP Input
    {
        USES S-STEP "BF1772Key-I";
        STRINGTABLE.IDS_TITLE_BF9E70Input -> Title;
    }
    
    # Hitting Cancel from the first page leaves the flow

    IF action == "ACTION_BACK"
        EXIT;
    # UY3004 CHANGES START
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

     # UY3004 CHANGES END
    
    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF9E70-P";
        "1" -> MIR-DV-PRCES-STATE-CD;
    }
    
    IF LSIR-RETURN-CD != "00"  
        BRANCH Input;
     
    STEP DataInput-S
    {
       USES S-STEP "BF1772Data-I";
       STRINGTABLE.IDS_TITLE_BF9E70DataInput -> Title;

    }  
   
    # If the user hit Cancel, return to the key input screen.
    
    IF action == "ACTION_BACK" 
    {
       MESSAGES-T[0] = "";
        BRANCH Input;
    }

    STEP Calculate-P
    {
        USES P-STEP "BF9E70-P";
        "2" -> MIR-DV-PRCES-STATE-CD;
    }   
    
    IF LSIR-RETURN-CD != "00"
        BRANCH DataInput-S;

    STEP Output
    {
        USES S-STEP "BF1772-O";
        STRINGTABLE.IDS_TITLE_BF9E70Output -> Title;
    }

    # If the user hit Cancel, return to the key input screen.
         
    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        BRANCH Input;
    }

    # Hitting ok it leaves the flow

    IF action == "ACTION_NEXT"
       EXIT;
    
}

