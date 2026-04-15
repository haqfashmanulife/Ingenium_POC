# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF9F90RETRIEVE.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M33418  CTS      POLICY PAID PREMIUM INQUIRY SCREEN                        *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*  28463C  CTS      CHANGES DONE TO DISPLAY MSG IN PAID PREMIUM SCREEN        *
#*                   AS PART OF LP-CONS FOR FRA                                *
#*******************************************************************************

INCLUDE "BF9F90-I.s";
INCLUDE "BF9F90-P.p";
INCLUDE "BF9F90-O.s";
INCLUDE "BF9B84List.f";
INCLUDE "BF6985Valufnd.f";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF9F90Retrieve
{
 # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF9F90Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;
        
    # Collect the key value 

    STEP Input
    {
        USES S-STEP "BF9F90-I";
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
    
    MIR-RECORD-CTR ="00";
    # Retrieve the data for the key value
    
    STEP Retrieve
    {
        USES P-STEP "BF9F90-P";
    }
    
    IF LSIR-RETURN-CD != "00"
    BRANCH Input;    
    
#23774A CHANGES BEGIN

#28463C CHANGES BEGIN

    temp-MSGS-T[1] = MESSAGES-T[1];
    temp-MSGS-T[2] = MESSAGES-T[2];
    temp-MSGS-T[3] = MESSAGES-T[3];
    temp-MSGS-T[4] = MESSAGES-T[4];
    temp-MSGS-T[5] = MESSAGES-T[5];
    temp-MSGS-T[6] = MESSAGES-T[6];
    temp-MSGS-T[7] = MESSAGES-T[7];
    temp-MSGS-T[8] = MESSAGES-T[8];
    temp-MSGS-T[9] = MESSAGES-T[9];
    temp-MSGS-T[10] = MESSAGES-T[10]; 
      
#28463C CHANGES END
    temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;   
  
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO ->MIR-TRNX-DTL-INFO; 
    "I" -> MIR-LOG-LEVL-CD;
    
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

#28463C CHANGES BEGIN

      MESSAGES-T[1]  = temp-MSGS-T[1];
      MESSAGES-T[2]  = temp-MSGS-T[2];
      MESSAGES-T[3]  = temp-MSGS-T[3];
      MESSAGES-T[4]  = temp-MSGS-T[4];
      MESSAGES-T[5]  = temp-MSGS-T[5];
      MESSAGES-T[6]  = temp-MSGS-T[6];
      MESSAGES-T[7]  = temp-MSGS-T[7];
      MESSAGES-T[8]  = temp-MSGS-T[8];
      MESSAGES-T[9]  = temp-MSGS-T[9];
      MESSAGES-T[10] = temp-MSGS-T[10];
              
#28463C CHANGES END

#23774A CHANGES END   


    
 
    
    STEP Output
    {
    USES S-STEP "BF9F90-O";
    "ButtonBarPaidPremiumInq" -> ButtonBar;
    }
    
    IF action == "ACTION_NEXT" 
        BRANCH Input;
        
    IF action == "ACTION_MORE" 
        BRANCH Retrieve;

    IF action == "ACTION_INQ_DEP"
        {
            STEP ACTION_INQ_DEP
            {
                USES PROCESS "BF9B84List";
                ATTRIBUTES
                {
                    Explicit;
                    GetMessages = "NO";
                }
    
                MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
                LSIR-PRCES-DT -> MIR-APPL-CTL-PRCES-DT;                  
                "FALSE" -> DisplayInput;
            }
            BRANCH Retrieve;
        }
    
        IF action == "ACTION_INQ_FUND"
        {
            STEP ACTION_INQ_FUND
            {
                USES PROCESS "BF6985Valufnd";
                ATTRIBUTES
                {
                    Explicit;
                    GetMessages = "NO";
                }
    
                MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
                LSIR-PRCES-DT -> MIR-APPL-CTL-PRCES-DT;  
                "01" -> MIR-CVG-NUM;
                "FALSE" -> DisplayInput;
            }
            BRANCH Retrieve;
        }
}
    

