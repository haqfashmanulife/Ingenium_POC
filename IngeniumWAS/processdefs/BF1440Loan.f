# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1440Loan.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  NWLPLP  CTS      POLICY LOAN PROCESSING                                    *
#*                                                                             *
#*  MP228A  CTS      POLICY LOAN CHANGES FOR FIRM BANKING                      *
#*  MP228C  CTS      CHANGES TO POPULATE THE LOAN AMOUNT REQUESTED FIELD       *
#*                   CORRECTLY WHEN THE CANCEL BUTTON IS SELECTED              *
#*  MP0247  CTS      SHORTENING OF FB REMITTANCE DURATION TO 01                *
#*  M319A2  CTS      Changes done for FXWL Policy Loan Processing              *
#*  Q94507  CTS      Lable for loan screen                                     *
#*  Q94517  CTS      REMITTANCE DURATION TO 03 FOR FXWL                        *
#*  100561  CTS      CHANGES FOR LAON SCREEN - FXWL                            *
#*  R15582  CTS      AUDIT LOG RELATED CHANGES                                 *
#*  123718  CTS      BUG FIX FOR AUDIT LOG RELATED CHANGES                     *
#*  UY3004 STREAM3   UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*******************************************************************************

INCLUDE "BF1440Key-I.s";
INCLUDE "BF1440Data-I.s";
INCLUDE "BF1440-O.s";
INCLUDE "BF1440-P.p";
INCLUDE "GenSetDate.f";
#MP228A CHANGES STARTS HERE
#INCLUDE "GenConfrm.f";
INCLUDE "BF1440FB-I.s";
INCLUDE "BF1440FB-O.s";
#MP228A CHANGES ENDS HERE        
#M319A2 CHANGES START HERE
INCLUDE "BF9A5A-I.s";
#M319A2 CHANGES END HERE
#R15582 CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#R15582 CHANGES END

PROCESS BF1440Loan
{
#M319A2 CHANGES START HERE     
    MIR-LOAN-CRCY-CD = "JP";
    MIR-PMT-CRCY-CD = "JP";
#M319A2 CHANGES END HERE
# NWLPLP CHANGES STARTS HERE  
#MP228A CHANGES STARTS HERE
#        MIR-NUM-BUS-DAYS = "03";
#MP0247 CHANGES STARTS HERE
#      MIR-NUM-BUS-DAYS = "02";
       MIR-NUM-BUS-DAYS = "01";
   MIR-DV-TRNXT-PAYO-MTHD-CD = "F";       
#MP228A CHANGES ENDS HERE        
#M319A2 CHANGES START HERE
    Title = IDS_TITLE_BF1440Loan;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

  STEP PolicyInput
    {
        USES S-STEP "BF9A5A-I";
#Q94507 CHANGES START HERE        
#Q94507  STRINGTABLE.IDS_TITLE_BF1440Phase1 -> Title;
        STRINGTABLE.IDS_TITLE_BF1440PhaseI -> Title;
#Q94507
    }
    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        EXIT;
    }

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
        BRANCH PolicyInput;
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

      STEP CURRENCYCD
      {
          USES P-STEP "BF8000-P";
          MIR-POL-CRCY-CD <- MIR-POL-CRCY-CD;
      }
      
      IF LSIR-RETURN-CD != "00"
          BRANCH PolicyInput;
#Q94517 changes begins
      IF  MIR-POL-CRCY-CD != "JP"
      {
          MIR-NUM-BUS-DAYS = "03";
      }
#Q94517 changes ends
#M319A2 CHANGES START HERE
        STEP GETDATE
        {
          USES PROCESS "GenSetDate";
          MIR-LOAN-DT <- Datevalue;
          MIR-JRNL-DT <- Datevalue;
        }
      IF LSIR-RETURN-CD != "00"
          BRANCH PolicyInput;        
# NWLPLP CHANGES ENDS HERE  

#MP228A CHANGES STARTS HERE

#    STEP Main
#    {
#        USES PROCESS "GenConfrm";

        # Set up the title strings. 

#        STRINGTABLE.IDS_TITLE_BF1440Process -> ProcessTitle;
#        STRINGTABLE.IDS_TITLE_BF1440Phase1 -> Phase1Title;
#        STRINGTABLE.IDS_TITLE_BF1440Phase2 -> Phase2Title;
#        STRINGTABLE.IDS_TITLE_BF1440Phase3 -> Phase3Title;

        # LOAN starts with Phase 1.

#        "1" -> InitialState;

        # Set the names of the S and P steps to be used

#        "BF1440Key-I" -> KeyFieldsS;
#        "BF1440-P" -> GetInitialHostDataP;
#        "BF1440Data-I" -> DataInputS;
#        "BF1440-P" -> PerformHostEditsP;
#        "BF1440-O" -> ConfirmS;
#        "BF1440-P" -> UpdateHostP;
#      }

#    IF action == "ACTION_BACK"
#        EXIT;


#    BRANCH Main;

    Title = IDS_TITLE_BF1440Loan;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

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
      
    STEP Input
    {
        USES S-STEP "BF1440Key-I";
        STRINGTABLE.IDS_TITLE_BF1440Phase1 -> Title;
#M319A2 changes begins
          MIR-POL-CRCY-CD -> MIR-POL-CRCY-CD;
                "JP" -> MIR-PMT-CRCY-CD;
          MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
          MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
#M319A2 changes ends
    }
    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        #100561 changes begins
 #       EXIT;
        BRANCH PolicyInput;
      #100561 changes ends
    }    
#   MP228C CHANGES START HERE
    MIR-TEMP-LOAN-AMT = MIR-LOAN-AMT;
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
#   MP228C CHANGES END HERE    
    STEP Retrieve
    {
        USES P-STEP "BF1440-P";   
        "1" -> MIR-DV-PRCES-STATE-CD;
    }
    IF LSIR-RETURN-CD != "00"
        BRANCH Input; 
     
     STEP DataInput
       {
          USES S-STEP "BF1440Data-I";
          STRINGTABLE.IDS_TITLE_BF1440Phase2 -> Title;
       }        
      IF action == "ACTION_BACK"
       {
          MESSAGES-T[0] = "";
#   MP228C CHANGES START HERE          
          MIR-LOAN-AMT = MIR-TEMP-LOAN-AMT;
#   MP228C CHANGES END HERE           
        #100561 changes begins
#          BRANCH Input;
         BRANCH PolicyInput;   
        #100561 changes ends
       }        
     STEP Calculate
       {
          USES P-STEP "BF1440-P";
          "2" -> MIR-DV-PRCES-STATE-CD;        
       }    
     IF LSIR-RETURN-CD != "00"
        BRANCH DataInput;
   
   STEP Confirm
   {
        USES S-STEP "BF1440-O";
        "ButtonBarConfirmCancel" -> ButtonBar;
         STRINGTABLE.IDS_TITLE_BF1440Phase3 -> Title;
    }
    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        BRANCH DataInput;
    }
       
       
    IF action == "ACTION_CONFIRM"
    {
        MESSAGES-T[0] = "";

        IF MIR-DV-TRNXT-PAYO-MTHD-CD != "F"
          {
              STEP CashDisbUpdate
                 {
                   USES P-STEP "BF1440-P";
                   "3" -> MIR-DV-PRCES-STATE-CD;
                 }

                 IF LSIR-RETURN-CD != "00"
                     BRANCH Confirm;
#123718 CHANGES BEGIN
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
#123718 CHANGES END

#R15582 CHANGES BEGIN
                 #ELSE
                 #M319A2 changes begins
                    # BRANCH Input;
                    #  BRANCH PolicyInput;
                 #M319A2 changes ends                  
		     temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;
		     
		    STEP AUTROutput
		     {
		         USES P-STEP "BF9G99-P";
		     
		     SESSION.MIR-USER-ID -> MIR-USER-ID;
		     SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;    
		 
		     temp-DTL-INFO  ->MIR-TRNX-DTL-INFO; 
		     
		     }
		 
		       
		     IF LSIR-RETURN-CD != "00"
                     BRANCH Confirm;
#R15582 CHANGES END  
#123718 CHANGES BEGIN
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
#123718 CHANGES END                   
                     BRANCH PolicyInput;
          }

         ELSE
           {
              STEP FBRetrieve
                 {
                   USES P-STEP "BF1440-P";
                   "4" -> MIR-DV-PRCES-STATE-CD;
                 }

                 IF LSIR-RETURN-CD != "00"
                     BRANCH Confirm;

              STEP FBInput-S
                {
                   USES S-STEP "BF1440FB-I";
                   "ButtonBarOKCancel" -> ButtonBar;
                   STRINGTABLE.IDS_TITLE_BF1440FBInput -> Title;
                }

              IF action == "ACTION_BACK"
                {
                   MESSAGES-T[0] = "";
                #100561 changes begins
#                   BRANCH Input;
                  BRANCH PolicyInput;  
               #100561 changes ends
                }

              STEP FBEdit
                 {
                   USES P-STEP "BF1440-P";
                   "5" -> MIR-DV-PRCES-STATE-CD;
                 }

                 IF LSIR-RETURN-CD != "00"
                     BRANCH FBInput-S;

              STEP FBOutput-S
                {
                   USES S-STEP "BF1440FB-O";
                   "ButtonBarConfirmCancelBack" -> ButtonBar;
                   STRINGTABLE.IDS_TITLE_BF1440FBOutput -> Title;
                }

              IF action == "ACTION_BACK"
                {
                   MESSAGES-T[0] = "";
                 #M319A2 changes begins
                    # BRANCH Input;
                      BRANCH PolicyInput;
                 #M319A2 changes ends
                }

              IF action == "ACTION_PREVIOUS"
                {
                   MESSAGES-T[0] = "";
                   BRANCH FBInput-S;
                }

              STEP FBUpdate
                 {
                   USES P-STEP "BF1440-P";
                   "3" -> MIR-DV-PRCES-STATE-CD;
                 }

                 IF LSIR-RETURN-CD != "00"
                     BRANCH FBOutput-S;
#123718 CHANGES BEGIN
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
#123718 CHANGES END
#R15582 CHANGES BEGIN  
                 #ELSE
                 #M319A2 changes begins
                    # BRANCH Input;
                    #  BRANCH PolicyInput;
                 #M319A2 changes ends               
		     temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;
		     
		    STEP AUTROutput1
		     {
		         USES P-STEP "BF9G99-P";
		     
		     SESSION.MIR-USER-ID -> MIR-USER-ID;
		     SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;    
		 
		     temp-DTL-INFO  ->MIR-TRNX-DTL-INFO; 
		     
		     }
		 
		       
		     IF LSIR-RETURN-CD != "00"
                     BRANCH FBOutput-S;
#R15582 CHANGES END                     
#123718 CHANGES BEGIN
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
#123718 CHANGES END
                     BRANCH PolicyInput;
          }
    }       
#MP228A CHANGES ENDS HERE        
}

