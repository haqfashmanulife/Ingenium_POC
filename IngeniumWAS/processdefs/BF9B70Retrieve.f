# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9B70Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP1171  CTS      INITIAL VERSION                                           *
#*  MP1669  CTS     To support APL,loan in Future/Back dated trial calculation    *
#*  Q13430  CTS     TRIAL CALC CHANGES FOR APL PROCESS                         *
#*  Q11779  CTS     TRIAL CALC CHANGES TO HANDLE FATAL MESSAGES TO STOP        *
#*  TVI15B  CTS     FA REDUCTION CHANGES FOR TVI PRODUCT                       *
#*  Q25516  CTS     PREMIUM AMT VALIDATION CHANGES                             *
#*  C20494  CTS     CHANGES FOR TVI POLICY IN RIDER SURRENDER/                 *
#*  C20494          FA REDUCTION QUOTE SCREEN                                  * 
#*  MP269A  CTS     CHANGES MADE TO CALL NEW SCREEN FOR MONTHLY                *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  UYS014  CTS     CHANGES DONE AS PART OF UNISYS                             *
#*  S20852  CTS     CHANGES DONE FOR UDSD-850 ERROR MESSAGE DISPLAY FOR UYS050 *
#*  UYS043  CTS      CHANGES MADE AS PART OF VIRTUAL QUOTE SCREEN              *
#*  S22291  CTS     CHANGES DONE AS PART OF UDSD-2291                          *
#*  S22578  CTS      CHANGES DONE AS PART OF UDSD-2578                         *
#*  S25334  CTS     CHANGES DONE AS PART OF X-CODE UDSD-5334                   *
#*  S25427  CTS     CHANGES DONE AS PART OF X-CODE UDSD-5427                   *
#*  S25428  CTS     FIX FOR FA RED VIRTUAL QUOTE                               *
#*  S25437  CTS      FIX FOR FA RED VIRTUAL QUOTE                             **
#*  S25439  CTS      FIX FOR FA RED VIRTUAL QUOTE                             **
#*  S25535  CTS      FIX FOR FA RED VIRTUAL QUOTE                             **
#*  S14932  CTS      CHANGES DONE FOR UDS3-14932 - MSGS NOT COMING UP          *
#*  29746N  CTS      CHANGES DONE AS PART OF CERBERUS ADMIN                    *
#*  CRB179  CTS      FIX TO DISPLAY ERROR MESSAGE FOR CERBERUS                 *
#*******************************************************************************

INCLUDE "BF9B70-I.s";
INCLUDE "BF9B70-P.p";
INCLUDE "BF9B74-I.s";
INCLUDE "BF9B74-P.p";
#UYS014 CHANGES STARTS
INCLUDE "BF9D74-P.p";
#UYS014 CHANGES ENDS
INCLUDE "BF9B74-O.s";
INCLUDE "BF9B71-I.s";
#MP269A CHANGES STARTS
INCLUDE "BF9B79-P.p";
INCLUDE "BF9B79-O.s";
#MP269A CHANGES ENDS
#UYS043 CHANGES STARTS
INCLUDE "BF9B70VIR-I.s";
INCLUDE "BF9B78-P.p";
INCLUDE "BF9B74VIR-O.s";
#UYS043 CHANGES ENDS
#29746N CHANGES STARTS
INCLUDE "BF9B72-I.s";
#29746N CHANGES ENDS


PROCESS BF9B70Retrieve
{

    Title = STRINGTABLE.IDS_TITLE_BF9B70Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
#MP269A CHANGES STARTS
    index = "0";
#MP269A CHANGES ENDS

    # Clear the messages before displaying the s-step for the first time
     
    MESSAGES-T[0] = "";

    STEP Input
    {
        USES S-STEP "BF9B70-I";
        STRINGTABLE.IDS_TITLE_BF9B70Input -> Title;
    }
#S25334 - CHANGES STARTS HERE
    MIR-DV-APPL-CTL-PRCES-DT = MIR-APPL-CTL-PRCES-DT;
#S25334 - CHANGES ENDS HERE
    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        EXIT;
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
    
    STEP Retrieve
    {
        USES P-STEP "BF9B70-P";
       "1" -> MIR-DV-PRCES-STATE-CD;
    }
#  S25437
    WS-MIR-VIR-BILL-MODE-CD = MIR-POL-BILL-MODE-CD;
    WS-MIR-VIR-POL-MODE-CD = MIR-POL-BILL-MODE-CD;
#  S25437

#MP1669- COMMENT BEGIN 
#        IF RETURN IS NOT OK AND UNDO PROCESS IS NOT FORCED TO ERROR 
#        IN CSOM9B70 MODULE ,THEN BRANCH TO INPUT SCREEN OTHERWISE
#        CONTINUE THE PROCESS
 #  IF LSIR-RETURN-CD != "00"
#       BRANCH Input;
#MP1669- COMMENT END
#MP1669- CODE BEGIN
    IF LSIR-RETURN-CD != "00" && MIR-DV-UNDO-VALID-CD != "N"
        BRANCH Input;
#MP1669- CODE END
    # The user starts editing the input
    
# Changes for TVI15B to call the Premium Screen    
#C20494 IF LSIR-RETURN-CD == "00" && MIR-DV-UNDO-VALID-CD == "Y" && MIR-TVI-PLAN-CD == "Y"
IF LSIR-RETURN-CD == "00" &&  MIR-TVI-PLAN-CD == "Y"
{
     STEP MpremEdit
     {
         USES S-STEP "BF9B71-I";
         "ButtonBarProj" -> ButtonBar;
         STRINGTABLE.IDS_TITLE_BF9B74Input -> Title;
     }
  
     IF action == "ACTION_BACK"
     {
          MESSAGES-T[0] = "";
          BRANCH Input;
     }
    STEP Calculate-P
    {
        USES P-STEP "BF9B70-P";
         "2" -> MIR-DV-PRCES-STATE-CD;
    }    

#Q25516 CHANGES START
#     IF action == "ACTION_CALCULATE"
#     {
#          MESSAGES-T[0] = "";
#          BRANCH Edit;
#     }
#C20494    IF LSIR-RETURN-CD != "00" && ( MIR-DV-UNDO-VALID-CD != "N" || MIR-DV-COMMIT-CD != "N" )
     IF LSIR-RETURN-CD != "00" && MIR-DV-COMMIT-CD != "N" 
     {
          BRANCH MpremEdit;
     }
#Q25516 CHANGES END
 }
 #29746N CHANGES START
 IF LSIR-RETURN-CD == "00" &&  MIR-SPWL-PLAN-VALID-IND == "Y"
{
     STEP FamtEdit
     {
         USES S-STEP "BF9B72-I";
         "ButtonBarProj" -> ButtonBar;
         STRINGTABLE.IDS_TITLE_BF9B74Input -> Title;
     }
  
     IF action == "ACTION_BACK"
     {
          MESSAGES-T[0] = "";
          BRANCH Input;
     }
    STEP Calculate-P
    {
        USES P-STEP "BF9B70-P";
         "2" -> MIR-DV-PRCES-STATE-CD;
    }    
     IF LSIR-RETURN-CD != "00" 
     {
          BRANCH FamtEdit;
     }
 }
#S14932 CHANGES BEGIN
 
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
     
#S14932 CHANGES END
#UYS014 - CHANGES BEGIN    
    STEP PerformClc-P
    {
        USES P-STEP "BF9D74-P";
    } 
     IF LSIR-RETURN-CD != "00"  
     {
          BRANCH Input;
     }    
#UYS014 - CHANGES ends
#S14932 CHANGES BEGIN 

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
    
#S14932 CHANGES END 
#UYS043 - CHANGES STARTS
     IF MIR-VIR-SCREEN-IND == "Y"
     {
 
         STEP ProcessP
         {
             USES P-STEP "BF9B78-P";
             "1" -> MIR-DV-PRCES-STATE-CD;
#S25334 - CHANGES STARTS HERE
             MIR-DV-APPL-CTL-PRCES-DT -> MIR-APPL-CTL-PRCES-DT;
#S25334 - CHANGES ENDS HERE
         }

#S25437
#        IF LSIR-RETURN-CD != "00"
         IF LSIR-RETURN-CD != "00" && MIR-DV-UNDO-VALID-CD != "N"
#S25437
         {   
             BRANCH Input;
         }
#S25427 STARTS
         temp-trad-pd-to-mo-num = MIR-VIR-TRAD-PD-TO-MO-NUM;
         temp-ci-frst-elaps-yrs-dur = MIR-VIR-CI-FRST-ELAPS-YRS-DUR;
         temp-loan-amt = MIR-VIR-LOAN-AMT;
         temp-apl-loan-amt = MIR-VIR-APL-LOAN-AMT;
         temp-bill-mode-cd = MIR-VIR-BILL-MODE-CD;
#S25427 ENDS
         STEP InputS
         {
             USES S-STEP "BF9B70VIR-I";
             "ButtonBarOKCancel" -> ButtonBar;
             STRINGTABLE.IDS_TITLE_BF9B74Input -> Title;
#S22291 CHANGES STARTS
#             "" -> MIR-INT-STR-DT;
#             "" -> MIR-POL-LOAN-EFF-DT;
#S22578 CHANGES STARTS
#             "" -> MIR-VIR-POL-LOAN-EFF-DT;
#S22578 CHANGES ENDS             
#S22291 CHANGES ENDS             
         }
#  S25437
         WS-MIR-VIR-BILL-MODE-CD = MIR-VIR-BILL-MODE-CD;
#S25535 STARTS
         WS-VIR-CI-FRST-ELAPS-YRS-DUR = MIR-VIR-CI-FRST-ELAPS-YRS-DUR;
         WS-VIR-TRAD-PD-TO-MO-NUM     = MIR-VIR-TRAD-PD-TO-MO-NUM;
#S25535 ENDS
#  S25437
    
         IF action == "ACTION_BACK"
         {
            MESSAGES-T[0] = "";
            BRANCH Input;
         }

         STEP ProcessVIR
         {
             USES P-STEP "BF9B78-P";
             "2" -> MIR-DV-PRCES-STATE-CD;
         }
         
#S25437
#        IF LSIR-RETURN-CD != "00"
         IF LSIR-RETURN-CD != "00" && MIR-DV-UNDO-VALID-CD != "N"
#S25437
         {   
             BRANCH InputS;
         }
     }
#UYS043 - CHANGES ENDS
#  S25437
     IF MIR-VIR-BILL-MODE-CD == SPACES
     {
      MIR-POL-BILL-MODE-CD  = WS-MIR-VIR-POL-MODE-CD;
     }
     ELSE
     {
      MIR-POL-BILL-MODE-CD  = WS-MIR-VIR-BILL-MODE-CD;
     }
     
     
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
#  S25437
    STEP Edit
    {
        USES S-STEP "BF9B74-I";
        "ButtonBarOKCancel" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_BF9B74Input -> Title;
    }

    # If the user clicks Cancel, take the user back to the input page
    
    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        BRANCH Input;
    }
#  S25437
     IF MIR-VIR-BILL-MODE-CD == SPACES
     {
      MIR-POL-BILL-MODE-CD  = WS-MIR-VIR-POL-MODE-CD;
     }
     ELSE
     {
      MIR-POL-BILL-MODE-CD  = WS-MIR-VIR-BILL-MODE-CD;
     }
#  S25437

    # This is where the new modal premium is calculated based on new face amount.

    STEP PerformCalculate-P
    {
        USES P-STEP "BF9B74-P";
    }

#Q13430 & Q11779 - CODE BEGIN
#   IF LSIR-RETURN-CD != "00"
#    {   
#         BRANCH Edit;
#    }

    IF LSIR-RETURN-CD != "00" && ( MIR-DV-UNDO-VALID-CD != "N" || MIR-DV-COMMIT-CD != "N" )
    {   
         BRANCH Edit;
    }    
#S20852 CHANGES BEGIN

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
    
#S20852 CHANGES END        
#Q13430 & Q11779 - CODE END

#UYS014 - CHANGES BEGIN    
    STEP PerformCalc-P
    {
        USES P-STEP "BF9D74-P";
    }    
    
    IF LSIR-RETURN-CD != "00" 
    {   
         BRANCH Edit;
    } 
#S20852 CHANGES BEGIN 

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
    
#S20852 CHANGES END     
#UYS014 - CHANGES ENDS   

#UYS043 - CHANGES STARTS
     IF MIR-VIR-SCREEN-IND == "Y"
     { 
#S25535 STARTS
      MIR-VIR-CI-FRST-ELAPS-YRS-DUR = WS-VIR-CI-FRST-ELAPS-YRS-DUR;
      MIR-VIR-TRAD-PD-TO-MO-NUM = WS-VIR-TRAD-PD-TO-MO-NUM;
#S25535 ENDS
         STEP Process-P
         {
             USES P-STEP "BF9B78-P";
             "3" -> MIR-DV-PRCES-STATE-CD;
             
         }
#S25437
#        IF LSIR-RETURN-CD != "00"
         IF LSIR-RETURN-CD != "00" && MIR-DV-UNDO-VALID-CD != "N"
#S25437
         {   
             BRANCH Input;
         }
#S25428 STARTS
         IF  MESSAGES-T[1] == " "
         {
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
          }
          ELSE 
          {
#  S25439 STARTS
          MESSAGES-T[3] = temp-MSGS-T[1];
          MESSAGES-T[4] = temp-MSGS-T[2];
          MESSAGES-T[5] = temp-MSGS-T[3];
          MESSAGES-T[6] = temp-MSGS-T[4];
          MESSAGES-T[7] = temp-MSGS-T[5];
          MESSAGES-T[8] = temp-MSGS-T[6];
          MESSAGES-T[9] = temp-MSGS-T[7];
          MESSAGES-T[10] = temp-MSGS-T[8];
          MESSAGES-T[11] = temp-MSGS-T[9];
          MESSAGES-T[12] = temp-MSGS-T[10]; 
#  S25439 ENDS
          }
#S25428 ENDS
#S25427 STARTS
        IF MIR-VIR-TRAD-PD-TO-MO-NUM == temp-trad-pd-to-mo-num
        && MIR-VIR-CI-FRST-ELAPS-YRS-DUR == temp-ci-frst-elaps-yrs-dur
        && MIR-VIR-LOAN-AMT == temp-loan-amt
        && MIR-VIR-APL-LOAN-AMT == temp-apl-loan-amt
        && MIR-VIR-BILL-MODE-CD == temp-bill-mode-cd
        && MIR-VIR-ACTV-IND == "N"
              
            OutputS  = "BF9B74-O";

        ELSE
            OutputS  = "BF9B74VIR-O";
#S25427 ENDS
     }
#S25427 START
     ELSE
        OutputS = "BF9B74-O"; 
#S25427 END
    # Display output
#S25427 START
#    
#        IF  MIR-VIR-SCREEN-IND == "Y"
#                
#            OutputS = "BF9B74VIR-O";
# 
#         ELSE
#            OutputS = "BF9B74-O"; 
#
#S25427 ENDS
#UYS043 - CHANGES ENDS
    
    STEP Output
   {
#UYS043 - CHANGES STARTS
#        USES S-STEP "BF9B74-O";
        USES S-STEP OutputS;
#UYS043 - CHANGES ENDS
       "ButtonBarOK" -> ButtonBar;
       STRINGTABLE.IDS_TITLE_BF9B74Output -> Title;
   }

    IF action == "ACTION_NEXT"
    {
        MESSAGES-T[0] = "";
        BRANCH Input;
    }
#MP269A CHANGES STARTS HERE
    IF action == "SelectAnnivDt"
       {

          MIR-MTHV-DT = MIR-ANNIV-DT-T[index];
          MIR-INSRD-AGE-MTHLY = MIR-INSRD-AGE-T[index];
          MIR-ELPSD-ISS-YR-NB = MIR-ELPSD-ISS-YR-T[index];
          MIR-TOT-ACCUM-AMT = MIR-TOT-ACCUM-AMT-T[index];

           STEP PerformCalmnthly-P
           { 
              USES P-STEP "BF9B79-P";
           }
    
          IF LSIR-RETURN-CD != "00" 
             {
                 BRANCH Output;
             }
 
           STEP Outputmnthly
              {
                   USES S-STEP "BF9B79-O";
                   "ButtonBarOK" -> ButtonBar;
                   STRINGTABLE.IDS_TITLE_BF9B79Output -> Title;
              }
    IF action == "ACTION_NEXT"
    {
        MESSAGES-T[0] = "";
        BRANCH Output;
    }

       }
#MP269A CHANGES ENDS
}
