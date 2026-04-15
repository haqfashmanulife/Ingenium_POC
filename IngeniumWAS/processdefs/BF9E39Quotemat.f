# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF9E39Quotemat.f                                              *
#*  Description: Maturity Quote Screen                                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  23802D  13APR22  Intial Version                                            *
#*******************************************************************************

INCLUDE "BF9E39-P.p";
INCLUDE "BF9E39-I.s";
INCLUDE "BF9E39-O.s";
INCLUDE "BF9E39Fund-I.s";
INCLUDE "BF9E39Fund-O.s";

PROCESS BF9E39Quotemat

{

    # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF9E39Quotemat;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

 #1ST SCREEN -> Maturity Quote  Input

    STEP Input
    {
        USES S-STEP "BF9E39-I";
        STRINGTABLE.IDS_TITLE_BF9E39Phase1 -> Title;
    }

    # Hitting Cancel from the first page leaves the flow

    IF  action == "ACTION_BACK"
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

    MIR-DV-PRCES-STATE-CD="1";
         
    STEP Retrieve
    {
        USES P-STEP "BF9E39-P";
    }

    #   IF RETURN IS NOT OK IN SSOM9E39 MODULE ,
    #   THEN BRANCH TO INPUT SCREEN OTHERWISE
    #   CONTINUE THE PROCESS

    IF  LSIR-RETURN-CD != "00" 
        BRANCH Input;

    #   IF THE USER SELECT CHANGE TO SINGLE PREMIUM VI 
    #   THEN BRANCH TO FundAllocation-S (2ND SCREEN)
 #   2ND Screens - Maturity Quote - Fund Allocation

    IF MIR-EVNT-ACTV-CD == "S"
    {
       STEP FundAllocation-S
       {
           USES S-STEP "BF9E39Fund-I";
           STRINGTABLE.IDS_TITLE_BF9E39Phase2 -> Title;
       }

       IF action == "ACTION_BACK"
       {
           BRANCH Input;
       }

       STEP FundAllocation-P
       {
           USES P-STEP "BF9E39-P";
           "2" -> MIR-DV-PRCES-STATE-CD;
       }

       IF  LSIR-RETURN-CD != "00"
           BRANCH FundAllocation-S;

       STEP ResultFund-P
       {
           USES P-STEP "BF9E39-P";
           "3" -> MIR-DV-PRCES-STATE-CD;
       }

       IF  LSIR-RETURN-CD != "00" && MIR-DV-UNDO-VALID-CD != "N"
           BRANCH FundAllocation-S;
       
       STEP ResultFund-S
       {
           USES S-STEP "BF9E39Fund-O";
           STRINGTABLE.IDS_TITLE_BF9E39Phase3 -> Title;
           "ButtonBarOK" -> ButtonBar;
       }

       IF  action == "ACTION_NEXT"
           EXIT;
    }
    ELSE
    {
       STEP UpdateHost-P
       {
           USES P-STEP "BF9E39-P";
           "3" -> MIR-DV-PRCES-STATE-CD;
       }
    
       IF  LSIR-RETURN-CD != "00" && MIR-DV-UNDO-VALID-CD != "N"
           BRANCH Input;
    
# 3RD Screen - Maturity Quote - Result

       STEP Result
       {
           USES S-STEP "BF9E39-O";
           STRINGTABLE.IDS_TITLE_BF9E39Phase3 -> Title;
           "ButtonBarOK" -> ButtonBar;
       } 

       IF  action == "ACTION_NEXT"
           EXIT;
    }
}
