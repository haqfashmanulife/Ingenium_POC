# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT
# *******************************************************************************
# *  Component:   BF6982Valueln.f                                               *
# *  Description:                                                               *
# *                                                                             *
# *******************************************************************************
# *  Chg#    Release  Description                                               *
# *                                                                             *
# *  014590  6.0      New for release 6.0                                       *
# *  NWLLTC  CTS      POLICY LOAN TRIAL CALCULATION PROCESSING                  *
# *  MP228A  CTS      MP228 CHANGES FOR EFFECTIVE DATE CALCULATION              *
# *  M319A2  CTS      Changes done for FXWL Policy Loan Processing              *
# *  Q94501  CTS      CHANGES TO NEW LOAN INPUT SCREEN FOR FXWL                **
#*  Q94507  CTS      Lable for loan screen                                     *
# *  100522  CTS      FIX FOR TITLE OF LOAN'S SCREEN CHANGE                     *
#*  100561  CTS      CHANGES FOR LAON SCREEN - FXWL                             *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                 *
#*  UYS043  CTS      CHANGES MADE AS PART OF VIRTUAL QUOTE SCREEN               *
#*  S22291  CTS      CHANGES DONE AS PART OF UDSD-2291                          *
#*  S22578  CTS      CHANGES DONE AS PART OF UDSD-2578                          *
#*  S25524  CTS       FIX FOR UDSD-5524                                       **
# *******************************************************************************
INCLUDE "BF6982-P.p";
INCLUDE "BF6982-I.s";
INCLUDE "BF6982-O.s";
# NWLLTC CHANGES STARTS
INCLUDE "GenSetDate.f";
# NWLLTC CHANGES ENDS
#23774A CHANGES BEGIN
#23774A INCLUDE "GenRetrieve.f";
#UYS043 CHANGES START
#INCLUDE "GenRetrieveAud.f";
INCLUDE "BF6982VIR-O.s";
INCLUDE "BF6982VIR-I.s";
#UYS043 CHANGES END
#23774A CHANGES END
#Q94501 CHANGES START HERE
INCLUDE "BF9A5A-I.s";
INCLUDE "BF8000-P.p";
#Q94501 CHANGES END HERE
# UY3004 CHANGES START
INCLUDE "BF9D34List.f";
# UY3004 CHANGES END

PROCESS BF6982Valueln
{
# NWLLTC CHANGES STARTS
#MP228 CHANGES STARTS HERE
#        MIR-NUM-BUS-DAYS = "03";
        
#        STEP GETDATE
#        {
#          USES PROCESS "GenSetDate";
#          MIR-APPL-CTL-PRCES-DT <- Datevalue;
#        }
#Q94501 CHANGES START HERE
    Title = IDS_TITLE_BF6982Valueln;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

  STEP Input
    {
        USES S-STEP "BF9A5A-I";
#Q94507 CHANGES START HERE        
#Q94507  STRINGTABLE.IDS_TITLE_BF1440Phase1 -> Title;
#100522  CHANGE STARTS HERE
#        STRINGTABLE.IDS_TITLE_BF6982PhaseI -> Title;
         STRINGTABLE.IDS_TITLE_BF6982Valueln -> Title;
#100522  CHANGES ENDS HERE         
#Q94507 CHANGES END HERE
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
    
    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        EXIT;
    }

  STEP CURRENCYCD
  {
      USES P-STEP "BF8000-P";
      MIR-POL-CRCY-CD <- MIR-POL-CRCY-CD;
  }
  
  IF LSIR-RETURN-CD != "00"
          BRANCH Input;

#Q94501 CHANGES START HERE
#MP228 CHANGES ENDS HERE
# NWLLTC CHANGES ENDS
#UYS043 CHANGES BEGIN
#       STEP Main
#       {

#* 23774A CHANGES START
#* 23774A   USES PROCESS "GenRetrieve";
#            USES PROCESS "GenRetrieveAud";   
#* 23774A CHANGES END

#           ATTRIBUTES
#           {
#               GetMessages = "NO";
#           }
#               "C" -> MIR-LOAN-TYP-CD;
#               STRINGTABLE.IDS_TITLE_BF6982Valueln -> Title;
#               "BF6982-I" -> InputS;
#               "BF6982-P" -> RetrieveP;
#               "BF6982-O" -> OutputS;
#Q94501 CHANGES START HERE
#                MIR-POL-CRCY-CD -> MIR-POL-CRCY-CD;
#                "JP" -> MIR-PMT-CRCY-CD;
#                MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
#Q94501 CHANGES START HERE              
#        }
#        IF DisplayInput == "FALSE"
#           EXIT;

    STEP InputI
    {
        USES S-STEP "BF6982-I";
        "C" -> MIR-LOAN-TYP-CD;
        STRINGTABLE.IDS_TITLE_BF6982Valueln -> Title;
        MIR-POL-CRCY-CD -> MIR-POL-CRCY-CD;
        "JP" -> MIR-PMT-CRCY-CD;
        MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
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
    
#  S25524
     WS-MIR-LOAN-AMT     = MIR-LOAN-AMT;
     WS-MIR-JPY-TRXN-AMT = MIR-JPY-TRXN-AMT;
#  S25524

    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF6982-P";
#S25524
            "3" -> MIR-DV-PRCES-STATE-CD;
#S25524
    }

#S25524
#    IF LSIR-RETURN-CD != "00"
    IF LSIR-RETURN-CD != "00" && MIR-DV-UNDO-VALID-CD != "N"
#S25524
        BRANCH InputI;         

    temp-trad-pd-to-mo-num = MIR-VIR-TRAD-PD-TO-MO-NUM;
    temp-ci-frst-elaps-yrs-dur = MIR-VIR-CI-FRST-ELAPS-YRS-DUR;
    temp-loan-amt = MIR-VIR-LOAN-AMT;
    temp-apl-loan-amt = MIR-VIR-APL-LOAN-AMT;
    temp-actv-ind = MIR-VIR-ACTV-IND;

             

    IF MIR-VIR-SCREEN-IND == "Y"
    {
      
        STEP InputV
        {
            USES S-STEP "BF6982VIR-I";
            STRINGTABLE.IDS_TITLE_BF6982Valueln -> Title;
#S22291 CHANGES STARTS
#            "" -> MIR-VIR-INT-STR-DT;
#S22291 CHANGES ENDS
#S22578 CHANGES STARTS
#            "" -> MIR-VIR-POL-LOAN-EFF-DT;
#S22578 CHANGES ENDS
        }

        IF action == "ACTION_BACK"
            BRANCH InputI;

#  S25524
        MIR-LOAN-AMT     = WS-MIR-LOAN-AMT    ;
        MIR-JPY-TRXN-AMT = WS-MIR-JPY-TRXN-AMT;
#  S25524
        STEP ProcessP
        {
            USES P-STEP "BF6982-P";
            "2" -> MIR-DV-PRCES-STATE-CD;
            "JP" -> MIR-PMT-CRCY-CD;
        }         
  
#S25524
#        IF LSIR-RETURN-CD != "00"
         IF LSIR-RETURN-CD != "00" && MIR-DV-UNDO-VALID-CD != "N"
#S25524
           BRANCH InputI;

        IF MIR-VIR-TRAD-PD-TO-MO-NUM == temp-trad-pd-to-mo-num
        && MIR-VIR-CI-FRST-ELAPS-YRS-DUR == temp-ci-frst-elaps-yrs-dur
        && MIR-VIR-LOAN-AMT == temp-loan-amt
        && MIR-VIR-APL-LOAN-AMT == temp-apl-loan-amt
        && MIR-VIR-ACTV-IND == "N"
              
            OutputS = "BF6982-O";

        ELSE
            OutputS = "BF6982VIR-O";

    }
    ELSE
       OutputS = "BF6982-O";

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
    temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;
  
   STEP AudOutput
    {
      USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;
    temp-DTL-INFO  ->MIR-TRNX-DTL-INFO;
    "I" -> MIR-LOG-LEVL-CD;
    
    }
      
    IF LSIR-RETURN-CD != "00"
        BRANCH InputI;

    ButtonBar = "ButtonBarOK";
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

    # Display the record retrieved

    STEP Output
    {
        USES S-STEP OutputS;
        STRINGTABLE.IDS_TITLE_BF6982Valueln -> Title;
    }
#UYS043 CHANGES END

        IF action == "ACTION_BACK"
        #100561 CHANGES BEGINS
#           EXIT;
           BRANCH Input;
        #100561 CHANGES ENDS
        #100561 CHANGES BEGINS
#        BRANCH Main;
           BRANCH Input;
        #100561 CHANGES ENDS

}
