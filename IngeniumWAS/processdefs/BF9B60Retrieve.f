# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9B60Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN5231  27MAR09  COVERAGE LIST BY INSURED SCREEN                           *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9B60-I.s";
INCLUDE "BF9B60-P.p";
INCLUDE "BF9B60-O.s";

PROCESS BF9B60Retrieve
{

    Title = " ";
    TitleBar = "TitleBarPrint";
    TitleBarSize = "120";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    STEP Start
    {
        USES S-STEP "BF9B60-I";
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
        BRANCH Start;
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

    STEP RetrieveList
    {
        USES P-STEP "BF9B60-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Start;


    STEP DisplayList
    {
        USES S-STEP "BF9B60-O";
    }


    EXIT;

}
