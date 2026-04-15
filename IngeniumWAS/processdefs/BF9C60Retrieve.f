#*******************************************************************************
#*  Component:   BF9C60Retrive.f                                               *
#*  Description: CSOM9C60                                                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M161CA  CTS     Implementing the Screen changes for the Credit card        *
#*  M161CA          processing                                                 *
#*  UY3004  STREAM3 UNISYS POST MIGRATION DUPLICATION POLICY                   *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*******************************************************************************

INCLUDE "BF9C60-I.s";
INCLUDE "BF9C60-P.p";
INCLUDE "BF9C60-O.s";
INCLUDE "GenRetrieve.f";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF9C60Retrieve
{
    Title = STRINGTABLE.IDS_TITLE_BF9C60Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    
    STEP KeyFields-S
    {
        USES S-STEP "BF9C60-I";
    }
    
    IF action == "ACTION_BACK"
        EXIT;
    
    IF action == "ACTION_REFRESH"
        BRANCH KeyFields-S;
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

        
    STEP Retrieve
    {
            USES P-STEP "BF9C60-P"; 
    }    
    
    IF LSIR-RETURN-CD != "00"
        BRANCH KeyFields-S;
    
# 23774A CHANGES BEGIN

    temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX; 

    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO -> MIR-TRNX-DTL-INFO;    
    "I" -> MIR-LOG-LEVL-CD;    
    }
      
    IF LSIR-RETURN-CD != "00"
        BRANCH KeyFields-S;
        
# 23774A CHANGES END
    
    ButtonBar = "ButtonBarOK";

        
    STEP Output
    {
        USES S-STEP "BF9C60-O";
    }
   
    IF action == "ACTION_OK"
    {
        ButtonBar = "ButtonBarOKCancel";    
        BRANCH KeyFields-S;
    }
    
}    

