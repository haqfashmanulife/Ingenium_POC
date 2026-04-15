# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF9B88TrlBthSx.f                                              *
#*  Description: Trial calculation for Birth Date/Sex Modification             *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M319A5  CTS      Initial Version                                           *
#*  100512  CTS      FIX FOR NEW BIRTH DATE OR SEX                             *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*******************************************************************************

INCLUDE "BF9B88Key-I.s";
INCLUDE "BF9B88Data-I.s";
INCLUDE "BF9B88-P.p";
INCLUDE "BF9B88-O.s";

PROCESS BF9B88TrlBthSx
{

    Title = STRINGTABLE.IDS_TITLE_BF9B88key;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    
    STEP KeyFields-S
            {
                USES S-STEP "BF9B88Key-I";
                STRINGTABLE.IDS_TITLE_BF9B88key -> Title;
          #100512 changes begins  
                "ButtonBarOKCancel"  -> ButtonBar; 
          #100512 changes ends
            }

            IF action == "ACTION_LANGCHANGE"
               BRANCH KeyFields-S;
            
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
            
    STEP GetInitialHostData-P
            {
                USES P-STEP "BF9B88-P";
                "1" -> MIR-DV-PRCES-STATE-CD;
            }
            
            IF LSIR-RETURN-CD != "00"
            BRANCH KeyFields-S;
            
            temp-POL-ID-BASE = MIR-POL-ID-BASE;
            temp-POL-ID-SFX = MIR-POL-ID-SFX;
            temp-HO-RCVD-DT = MIR-HO-RCVD-DT;
            temp-RECPT-DT = MIR-RECPT-DT;
            temp-INSRD-CLI-NM = MIR-INSRD-CLI-NM;
            temp-INSRD-CLI-ID = MIR-INSRD-CLI-ID;
            temp-INSRD-AGE = MIR-INSRD-AGE;
            temp-PLAN-ID = MIR-PLAN-ID;
            temp-POL-BILL-MODE-CD = MIR-POL-BILL-MODE-CD;
            temp-POL-ISS-EFF-DT = MIR-POL-ISS-EFF-DT;
            temp-POL-MPREM-AMT = MIR-POL-MPREM-AMT;
            temp-CLI-BTH-DT = MIR-CLI-BTH-DT;
            temp-CLI-SEX-CD = MIR-CLI-SEX-CD; 
            temp-PREM-CRCY-CD = MIR-PREM-CRCY-CD;
          #100512 changes begins  
            ButtonBar = "ButtonBarOKCancel";
          #100512 changes ends
    STEP DataFields-I
            {
                USES S-STEP "BF9B88Data-I";
                STRINGTABLE.IDS_TITLE_BF9B88Details -> Title;
            }   
            
            # Hitting Cancel from the Second page goes to Key details screen
        
            IF action == "ACTION_BACK"
            BRANCH KeyFields-S;   
            
            MIR-POL-ID-BASE = temp-POL-ID-BASE;
            MIR-POL-ID-SFX = temp-POL-ID-SFX;
            MIR-HO-RCVD-DT = temp-HO-RCVD-DT;
            MIR-RECPT-DT = temp-RECPT-DT;
            
    STEP ProcessData-P
            {
                USES P-STEP "BF9B88-P";
                "2" -> MIR-DV-PRCES-STATE-CD; 
            }
            
            IF LSIR-RETURN-CD != "00" && MIR-DV-UNDO-VALID-CD != "N"
               {
                MIR-INSRD-CLI-NM = temp-INSRD-CLI-NM;
                MIR-INSRD-CLI-ID = temp-INSRD-CLI-ID;
                MIR-INSRD-AGE = temp-INSRD-AGE;
                MIR-PLAN-ID = temp-PLAN-ID;
                MIR-POL-BILL-MODE-CD = temp-POL-BILL-MODE-CD;
                MIR-POL-ISS-EFF-DT = temp-POL-ISS-EFF-DT;
                MIR-POL-MPREM-AMT = temp-POL-MPREM-AMT;
                MIR-CLI-BTH-DT = temp-CLI-BTH-DT;
                MIR-CLI-SEX-CD = temp-CLI-SEX-CD; 
                MIR-PREM-CRCY-CD = temp-PREM-CRCY-CD;                
                BRANCH DataFields-I;                 
               }

        #100512 changes begins
        ButtonBar = "ButtonBarOK";
        #100512 changes ends
        
    STEP Result-O
            {
                USES S-STEP "BF9B88-O";
                STRINGTABLE.IDS_TITLE_BF9B88Result -> Title;
            }   
            
            # Hitting Cancel from the Third page goes to First screen
        
            MESSAGES-T[0] = ""; 
            #100512 changes begins   
           # IF action == "ACTION_BACK"    
             #100512 changes ends
            BRANCH KeyFields-S;       
            #100512 changes begins  
            #BRANCH DataFields-I;   
           #100512 changes ends
}            