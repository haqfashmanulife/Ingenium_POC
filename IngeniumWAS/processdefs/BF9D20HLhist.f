# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF9D20HLhist.f                                                *
#*  Description: Health Congratulatory benefit History                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3071  CTS      INGENIUM HEALTH CONGRATULATORY BENEFIT                    *
#*******************************************************************************
INCLUDE "BF9D20-P.p";
INCLUDE "BF9D20-I.s";
INCLUDE "BF9D20-O.s";

PROCESS BF9D20HLhist
{
     Title = STRINGTABLE.IDS_TITLE_BF9D20HLhist;
     TitleBar = "TitleBar";
     TitleBarSize = "70";
     ButtonBar = "ButtonBarOKCancel";
     ButtonBarSize = "40";
     MessageFrame = "MessagesDisp";
     MessageFrameSize = "70";
    
     # Collect the key value 
    
     STEP Input
     {
         USES S-STEP "BF9D20-I";
     }
    
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
         USES P-STEP "BF9D20-P";
     }
    
     IF LSIR-RETURN-CD != "00"
        BRANCH Input;
    
     ButtonBar = "ButtonBarOK";
    
     # Display the record retrieved
    
     STEP Output
     {
         USES S-STEP "BF9D20-O";
     }

     # This action signifies the users request to exit from this routine 

     IF action == "ACTION_BACK"
        EXIT;

}
