# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9360TabSurVal.f                                             *
#*  Description: Policy Inquiry - Tabular Surrender Values                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01PR10  CSS      New for MCL                                               *
#*  MFPF07  AC       Added a new screen to display the SA fund details         *
#*                   Rewrote the order of process of P and S steps             *
#*  MFFCC2  SUG      Add a brench statement, when called from other screen,    *
#*                   skip the input step                                       *
#*  MP1669 CTS   To support APL,loan in Future/Back dated trial calculation    *
#*  Q25506  CTS      CHANGES FOR VIRTUAL UNDO                                  *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*  UYS043  CTS      CHANGES MADE AS PART OF VIRTUAL QUOTE SCREEN              *
#*  S22291  CTS      CHANGES DONE AS PART OF UDSD-2291                         *
#*  S22501  CTS      CHANGES DONE AS PART OF UDSD-2501                         *
#*  S22578  CTS      CHANGES DONE AS PART OF UDSD-2578                         *
#*  S23206  CTS      FIX FOR VIRTUAL SURRENDER QUOTE SCREEN                    *
#*  S25333  CTS      FIX FOR UYS043                                            *
#*******************************************************************************

INCLUDE "BF9360-I.s";
INCLUDE "BF9360-P.p";
INCLUDE "BF9360-O.s";
INCLUDE "BF9361-P.p";
INCLUDE "BF9361-O.s";
#INCLUDE "GenRetrieve.f";
# 23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#UYS043 CHANGES START
INCLUDE "BF9360VIR-O.s";
INCLUDE "BF9360VIR-I.s";
#UYS043 CHANGES END
# 23774A CHANGES END

PROCESS BF9360TabSurVal
{
#
#   STEP Main
#   {
#       USES PROCESS "GenRetrieve";
#       ATTRIBUTES
#       {
#           GetMessages = "NO";
#       }
#
#       STRINGTABLE.IDS_TITLE_BF9360TabSurVal -> Title;
#       "BF9360-I" -> InputS;
#       "BF9360-P" -> RetrieveP;
#       "BF9360-O" -> OutputS;
#   }
#
#   IF DisplayInput == "FALSE"
#       EXIT;
#
#   IF action == "ACTION_BACK"
#       EXIT;
#
#
#   BRANCH Main;
 
    Title = STRINGTABLE.IDS_TITLE_BF9360TabSurVal;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
     
# MFFCC2 BEGIN - SUG
    IF DisplayInput == "FALSE"
        BRANCH Retrieve1;
# MFFCC2 END - SUG
 
    STEP Input1
    {
        USES S-STEP "BF9360-I";
    }
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
        BRANCH Input1;
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
    
    IF action == "ACTION_CANCEL"
        EXIT;

# MFFCC2 BEGIN - SUG
    IF action == "ACTION_BACK"
        EXIT;
# MFFCC2 END - SUG
         
    STEP Retrieve1
    {
        USES P-STEP "BF9360-P";
# S25333 CHANGES BEGIN
    "1" -> MIR-DV-PRCES-STATE-CD;

# S25333 CHANGES ENDS
    }
     
DisplayStep:
#MP1669- COMMENT BEGIN
#        IF RETURN IS NOT OK AND UNDO PROCESS IS NOT FORCED TO ERROR 
#        IN CSOM9360 MODULE ,THEN BRANCH TO INPUT1 SCREEN OTHERWISE
#        CONTINUE THE PROCESS
#   IF LSIR-RETURN-CD != "00"
#       BRANCH Input1;
#MP1669- COMMENT END
#MP1669- CODE BEGIN
    IF LSIR-RETURN-CD != "00" && MIR-DV-UNDO-VALID-CD != "N"
        BRANCH Input1;
        
#* 23774A CHANGES BEGIN

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
    
    temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX + " " + MIR-APPL-CTL-PRCES-DT;    
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;  

    temp-DTL-INFO  ->MIR-TRNX-DTL-INFO;
    "C" -> MIR-LOG-LEVL-CD;
    
    }

      
    IF LSIR-RETURN-CD != "00"
        BRANCH Input1; 

      MESSAGES-T[1] = temp-MSGS-T[1];
      MESSAGES-T[2] = temp-MSGS-T[2];
      MESSAGES-T[3] = temp-MSGS-T[3];
      MESSAGES-T[4] = temp-MSGS-T[4];
      MESSAGES-T[5] = temp-MSGS-T[5];
      MESSAGES-T[6] = temp-MSGS-T[6];
      MESSAGES-T[7] = temp-MSGS-T[7];
      MESSAGES-T[8] = temp-MSGS-T[8];
      MESSAGES-T[9] = temp-MSGS-T[9];
      MESSAGES-T[10] = temp-MSGS-T[10];
      
#* 23774A CHANGES END
#MP1669- CODE END
    IF MIR-SA-TYP-IND == "N"
         ButtonBar = "ButtonBarOK";
       ELSE
         ButtonBar = "ButtonBarListsRC";
#UYS043 - CHANGES BEGIN 

    temp-trad-pd-to-mo-num = MIR-VIR-TRAD-PD-TO-MO-NUM;
    temp-ci-frst-elaps-yrs-dur = MIR-VIR-CI-FRST-ELAPS-YRS-DUR;
    temp-loan-amt = MIR-VIR-LOAN-AMT;
    temp-apl-loan-amt = MIR-VIR-APL-LOAN-AMT;

    IF MIR-VIR-SCREEN-IND == "Y"
    {
 
        STEP InputS
        {
            USES S-STEP "BF9360VIR-I";
            STRINGTABLE.IDS_TITLE_BF9360TabSurVal -> Title;
#S22291 CHANGES STARTS
#            "" -> MIR-INT-STR-DT;
#            "" -> MIR-POL-LOAN-EFF-DT;
#S22578 CHANGES STARTS
#            "" -> MIR-VIR-POL-LOAN-EFF-DT;
#S22578 CHANGES ENDS
#S22291 CHANGES ENDS

        }

        IF action == "ACTION_BACK"
            EXIT;

        STEP ProcessP
        {
            USES P-STEP "BF9360-P";
             "2" -> MIR-DV-PRCES-STATE-CD;
        }

#S23206 CHANGES START
#        IF LSIR-RETURN-CD != "00"
       IF LSIR-RETURN-CD != "00" && MIR-DV-UNDO-VALID-CD != "N"
#S23206 CHANGES END       
           BRANCH Input1;
#S22501 CHANGES STARTS           
        IF MIR-VIR-TRAD-PD-TO-MO-NUM == temp-trad-pd-to-mo-num
        && MIR-VIR-CI-FRST-ELAPS-YRS-DUR == temp-ci-frst-elaps-yrs-dur
        && MIR-VIR-LOAN-AMT == temp-loan-amt
        && MIR-VIR-APL-LOAN-AMT == temp-apl-loan-amt
        && MIR-VIR-ACTV-IND == "N"
              
            Output  = "BF9360-O";

        ELSE
            Output  = "BF9360VIR-O";           
    }
    ELSE
       Output  = "BF9360-O";    

#    IF MIR-VIR-TRAD-PD-TO-MO-NUM == temp-trad-pd-to-mo-num
#    && MIR-VIR-CI-FRST-ELAPS-YRS-DUR == temp-ci-frst-elaps-yrs-dur
#    && MIR-VIR-BILL-MODE-CD == ""
#    && MIR-VIR-LOAN-AMT == temp-loan-amt
#    && MIR-VIR-APL-LOAN-AMT == temp-apl-loan-amt
#    && MIR-VIR-ACTV-IND == "N"
#           
#        Output = "BF9360-O";
#
#    ELSE
#        Output = "BF9360VIR-O";
#S22501 CHANGES ENDS
#UYS043 - CHANGES ends 
          
    STEP DisplayList
    {
#UYS043 - CHANGES BEGIN
#       USES S-STEP "BF9360-O";
        USES S-STEP Output;
#UYS043 - CHANGES ends 
    }

    IF action == "ACTION_NEXT" || action == "ACTION_BACK"
        EXIT;
 
    MIR-CVG-NUM = MIR-CVG-NUM-T[index];
    MIR-CVG-SURRCHRG = MIR-DV-SURRCHRG-T[index];
     
    STEP Retrieve2
    {
        USES P-STEP "BF9361-P";
    }
#Q25506- CODE BEGIN    
    IF LSIR-RETURN-CD != "00" && MIR-DV-UNDO-VALID-CD != "N"
        BRANCH Input1;
#Q25506- CODE END        
#* 23774A CHANGES BEGIN

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
    
    temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX + " " + MIR-APPL-CTL-PRCES-DT;    
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;  

    temp-DTL-INFO  ->MIR-TRNX-DTL-INFO;
    "C" -> MIR-LOG-LEVL-CD;
    
    }

      
    IF LSIR-RETURN-CD != "00"
        BRANCH Input1; 

      MESSAGES-T[1] = temp-MSGS-T[1];
      MESSAGES-T[2] = temp-MSGS-T[2];
      MESSAGES-T[3] = temp-MSGS-T[3];
      MESSAGES-T[4] = temp-MSGS-T[4];
      MESSAGES-T[5] = temp-MSGS-T[5];
      MESSAGES-T[6] = temp-MSGS-T[6];
      MESSAGES-T[7] = temp-MSGS-T[7];
      MESSAGES-T[8] = temp-MSGS-T[8];
      MESSAGES-T[9] = temp-MSGS-T[9];
      MESSAGES-T[10] = temp-MSGS-T[10];
      
#* 23774A CHANGES END
    ButtonBar = "ButtonBarOK";
    STEP DisplayFund
    {
        USES S-STEP "BF9361-O";
    }

    IF action == "ACTION_NEXT" 
        BRANCH DisplayStep;
         
    EXIT;
}

