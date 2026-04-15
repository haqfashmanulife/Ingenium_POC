# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF9E39Quotedef.f                                              *
#*  Description: Deferment Quote Screen                                        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3093     30JUN23  Intial Version                                         *
#*******************************************************************************

INCLUDE "BF9E43-P.p";
INCLUDE "BF9E43-I.s";
INCLUDE "BF9E43-O.s";

PROCESS BF9E43Quotedef

{

    # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF9E43Quotedef;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

 #1ST SCREEN -> Deferment Quote  Input

    STEP Input
    {
        USES S-STEP "BF9E43-I";
        STRINGTABLE.IDS_TITLE_BF9E43Phase1 -> Title;
    }

    # Hitting Cancel from the first page leaves the flow

    IF  action == "ACTION_BACK"
        EXIT;

    # UY3004 CHANGES START

    UserDefinedPolicyIDBase   = MIR-POL-ID-BASE;
    
    STEP RetrieveList
    {
        USES PROCESS "BF9D34List";

        UserDefinedPolicyIDBase -> MIR-POL-ID-BASE;
        WS-POL-ID-BASE <- WS9D34-POL-ID-BASE;
        WS-POL-ID-SFX  <- WS9D34-POL-ID-SFX;
        WS-POL-COUNTER <-WS9D34-POL-COUNTER;
        WS-CANCEL-IND  <- WS9D34-CANCEL-IND;
        WS-RETURN-CD   <- WS9D34-RETURN-CD;
        UserDefinedPolicyIDBase <- WS9D34-POL-ID-BASE;
    }

    IF  WS-CANCEL-IND == "Y" || WS-RETURN-CD !="00"
       {
        BRANCH Input;
       }

    IF WS-POL-COUNTER <="01"
       {
       MIR-POL-ID-BASE = UserDefinedPolicyIDBase;
       }

    IF WS-POL-COUNTER >"01"
       {
       MIR-POL-ID-BASE  = WS-POL-ID-BASE;
       MIR-POL-ID-BASE  = WS-POL-ID-BASE + WS-POL-ID-SFX;
       }

   # UY3004 CHANGES END         

    # Retrieve the data for the key value

    MIR-DV-PRCES-STATE-CD="1";                      
         
    STEP Retrieve
    {
        USES P-STEP "BF9E43-P";
    }

    #   IF RETURN IS NOT OK IN CSOM9E43 MODULE ,
    #   THEN BRANCH TO INPUT SCREEN OTHERWISE
    #   CONTINUE THE PROCESS

    IF  LSIR-RETURN-CD != "00" 
        BRANCH Input;
      
# 2nd Screen - Deferment Quote - Result

    WS-TEMP-ID1 = MIR-POL-ID-BASE;
    MIR-POL-ID-BASE = SUBSTRING (WS-TEMP-ID1,1,7);
    STEP Result
    {
        USES S-STEP "BF9E43-O";
        STRINGTABLE.IDS_TITLE_BF9E43Phase2 -> Title;
        "ButtonBarOK" -> ButtonBar;
    } 
    MIR-POL-ID-BASE = WS-TEMP-ID1;

       IF  action == "ACTION_NEXT"
           EXIT;
}
