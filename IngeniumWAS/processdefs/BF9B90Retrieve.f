# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9B90Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP1172  CTS      INITIAL VERSION                                           *
#*  Q13430  CTS     TRAIL CALC CHANGES FOR APL PROCESS                         *
#*  Q11627  CTS      CHANGES FOR AVOIDING COMMIT AFTER ERROR MESSAGE           *
#*  Q11779  CTS      CHANGES TO ADD DV EFFECTIVE DATE                          *
#*  TVI15B  CTS      CHANGES FOR FA REDUCTION FOR TVI POLICIES                 *
#*  Q25516  CTS      PREMIUM AMT VALIDATION CHANGES                            *
#*  R10425  CTS      CHANGES FOR TVI POLICY IN RIDER SURNDR/FA REDCTN SCREEN   *
#*  R15582  CTS      AUDIT LOG RELATED  CHANGES                                * 
#*  123659  CTS      BUG FIXED FOR AUDIT LOG RELATED CHANGES                   *
#*  123718  CTS      BUG FIX FOR AUDIT LOG RELATED CHANGES                     *
#*  UY3004 STREAM3   UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  UYS014  CTS      CHANGES DONE AS PART OF UNISYS                            *
#*  S20852  CTS      CHANGES DONE FOR UDSD-852 ERROR MESSAGES FOR UYS050       *
#*  S14932  CTS      CHANGES DONE FOR UDS3-14932 - MSGS NOT COMING UP          *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJ                         *
#*  29746N  CTS      CHANGES DONE AS PART OF CERBERUS ADMIN                    *
#*  CRB179  CTS      FIX TO DISPLAY ERROR MESSAGE FOR CERBERUS                 *
#*******************************************************************************

INCLUDE "BF9B90-I.s";
INCLUDE "BF9B90-P.p";
INCLUDE "BF9B94-I.s";
INCLUDE "BF9B94-P.p";
#UYS014 CHANGES STARTS
INCLUDE "BF9D74-P.p";
#UYS014 CHANGES ENDS
INCLUDE "BF9B94-O.s";
INCLUDE "BF9B92-I.s";
INCLUDE "BF9B92-P.p";
INCLUDE "BF9B92-O.s";
INCLUDE "BF9B91-I.s";
#R15582 CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#R15582 CHANGES END
#29746N CHANGES STARTS
INCLUDE "BF9B93-I.s";
#29746N CHANGES END

PROCESS BF9B90Retrieve
{

    Title = STRINGTABLE.IDS_TITLE_BF9B90Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # Clear the messages before displaying the s-step for the first time
     
    MESSAGES-T[0] = "";

    MIR-DV-TRNXT-PAYO-MTHD-CD = "F";

    STEP Input
    {
        USES S-STEP "BF9B90-I";
        STRINGTABLE.IDS_TITLE_BF9B90Input -> Title;
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

#UY3004 CHANGES END

    STEP Retrieve
    {
        USES P-STEP "BF9B90-P";
#TVI15B - Changes Start        
        "1" -> MIR-DV-PRCES-STATE-CD;
#TVI15B - Changes Ends        
    }
# Q13430 - Q11779 - CODE BEGIN
    #IF LSIR-RETURN-CD != "00"
    IF LSIR-RETURN-CD != "00" && ( MIR-DV-UNDO-VALID-CD != "N" || MIR-DV-COMMIT-CD != "N")
        {
        BRANCH Input;
        }

#Q13430 - Q11779 - CODE END
    # The user starts editing the input
#TVI15B - Changes Start            
    IF LSIR-RETURN-CD == "00" && MIR-TVI-PLAN-CD == "Y"
    {
       STEP MpremEdit
       {
          USES S-STEP "BF9B91-I";
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
          USES P-STEP "BF9B90-P";
          "2" -> MIR-DV-PRCES-STATE-CD;        
     }
#Q25516  CHANGES START 
#R10425  CHANGES START
     #IF LSIR-RETURN-CD != "00" && ( MIR-DV-UNDO-VALID-CD != "N" || MIR-DV-COMMIT-CD != "N" )
     IF LSIR-RETURN-CD != "00" &&  MIR-DV-COMMIT-CD != "N" 
     {
              BRANCH MpremEdit;
     }
#R10425  CHANGES END
#     IF action == "ACTION_CALCULATE"
#     {
#          MESSAGES-T[0] = "";
#          BRANCH Edit;
#     }
#Q25516 CHANGES END
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
 #29746N - Changes Start
     IF LSIR-RETURN-CD == "00" && MIR-SPWL-PLAN-VALID-IND == "Y"
    {
       STEP FamtEdit
       {
          USES S-STEP "BF9B93-I";
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
          USES P-STEP "BF9B90-P";
          "2" -> MIR-DV-PRCES-STATE-CD;        
     }
     IF LSIR-RETURN-CD != "00" 
     {
              BRANCH FamtEdit;
     }
 }
#29746N  CHANGES END
#UYS014 - CHANGES BEGIN    
    STEP PerformClc-P
    {
        USES P-STEP "BF9D74-P";
    }
     IF LSIR-RETURN-CD != "00"  
     {
          BRANCH Input;
     } 	
#UYS014 - CHANGES ENDS
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
#TVI15B - Changes Ends 
    STEP Edit
    {
        USES S-STEP "BF9B94-I";
        "ButtonBarOKCancel" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_BF9B94Input -> Title;
    }

    # If the user clicks Cancel, take the user back to the input page
    
    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        BRANCH Input;
    }

    # This is where the new modal premium is calculated based on new face amount.

    STEP PerformCalculate-P
    {
        USES P-STEP "BF9B94-P";
    }
# Q13430 & Q11779 - changes

    #IF LSIR-RETURN-CD != "00"
    IF LSIR-RETURN-CD != "00" && ( MIR-DV-UNDO-VALID-CD != "N" || MIR-DV-COMMIT-CD != "N")
# Q13430 & Q11779- changes - end
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
    
    # Display output
    
    STEP Output
    {
        USES S-STEP "BF9B94-O";
        "ButtonBarConfirmCancel" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_BF9B94Output -> Title;
    }

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";

        STEP Retrieve1
         {
            USES P-STEP "BF9B90-P";
         }

        IF LSIR-RETURN-CD != "00"

           BRANCH Input;

        ELSE

           BRANCH Edit;
    }

    IF action == "ACTION_CONFIRM"
    {
        MESSAGES-T[0] = "";

        IF MIR-DV-TRNXT-PAYO-MTHD-CD != "F"
          {
              STEP CashDisbUpdate
                 {
                   USES P-STEP "BF9B92-P";
                   "3" -> MIR-DV-PRCES-STATE-CD;
                 }

                 IF LSIR-RETURN-CD != "00"
                     BRANCH Output;

                 ELSE
                     BRANCH Input;
          }

        ELSE

          {
              STEP FBRetrieve
                 {
                   USES P-STEP "BF9B92-P";
                   "1" -> MIR-DV-PRCES-STATE-CD;
                 }

                 IF LSIR-RETURN-CD != "00"
                     BRANCH Output;

              STEP FBInput-S
                {
                   USES S-STEP "BF9B92-I";
                   "ButtonBarOKCancel" -> ButtonBar;
                   STRINGTABLE.IDS_TITLE_BF9B92Input -> Title;
                }

              IF action == "ACTION_BACK"
                {
                   MESSAGES-T[0] = "";
                   BRANCH Input;
                }

              STEP FBEdit
                 {
                   USES P-STEP "BF9B92-P";
                   "2" -> MIR-DV-PRCES-STATE-CD;
                 }

                 IF LSIR-RETURN-CD != "00"
                     BRANCH FBInput-S;

              STEP FBOutput-S
                {
                   USES S-STEP "BF9B92-O";
                   "ButtonBarConfirmCancelBack" -> ButtonBar;
                   STRINGTABLE.IDS_TITLE_BF9B92Output -> Title;
                }

              IF action == "ACTION_BACK"
                {
                   MESSAGES-T[0] = "";
                   BRANCH Input;
                }

              IF action == "ACTION_PREVIOUS"
                {
                   MESSAGES-T[0] = "";
                   BRANCH FBInput-S;
                }

              STEP FBUpdate
                 {
                   USES P-STEP "BF9B92-P";
                   "3" -> MIR-DV-PRCES-STATE-CD;
                 }

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
#123659 CHANGES BEGIN
 
#27549A - CHANGES START HERE
    #temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX + " " + MIR-APPL-CTL-PRCES-DT + " " + MIR-MLJ-ACPT-DT + " " + MIR-DV-HO-RECV-DT + " " + MIR-DV-PAYO-JPY-BNFT-CD + " " + MIR-DV-TRNXT-PAYO-MTHD-CD + " " + MIR-JRNL-DT;     
              
    temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX + " " + MIR-APPL-CTL-PRCES-DT + " " + MIR-MLJ-ACPT-DT + " " + MIR-DV-HO-RECV-DT + " " + MIR-DV-PAYO-JPY-BNFT-CD + " " + MIR-DV-TRNXT-PAYO-MTHD-CD + " " + MIR-JRNL-DT + " " + MIR-ATO-NOT-APPL-IND;      
              
#27549A - CHANGES ENDS HERE
              STEP AUTROutput
                 {
                   USES P-STEP "BF9G99-P";  
                   
                   SESSION.MIR-USER-ID -> MIR-USER-ID;
                   SESSION.LSIR-BPF-ID -> MIR-BFCN-ID; 
                   
                   temp-DTL-INFO -> MIR-TRNX-DTL-INFO; 
    
                 }
                 
                 
          IF LSIR-RETURN-CD != "00"
             BRANCH FBInput-S;
#123659 CHNAGES END 
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

                 IF LSIR-RETURN-CD != "00"
                     BRANCH FBOutput-S;
                 ELSE
                     BRANCH Input;
#123659                     
#R15582 CHANGES BEGIN
#123659 
#123659       temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX + " " + MIR-APPL-CTL-PRCES-DT + " " + MIR-MLJ-ACPT-DT + " " + MIR-DV-HO-RECV-DT + " " + MIR-DV-PAYO-JPY-BNFT-CD + " " + MIR-DV-TRNXT-PAYO-MTHD-CD + " " + MIR-JRNL-DT;      
#123659              
#123659              STEP AUTROutput
#123659                 {
#123659                   USES P-STEP "BF9G99-P";  
#123659                   
#123659                   SESSION.MIR-USER-ID -> MIR-USER-ID;
#123659                   SESSION.LSIR-BPF-ID -> MIR-BFCN-ID; 
#123659                   
#123659                   temp-DTL-INFO -> MIR-TRNX-DTL-INFO; 
#123659    
#123659                 }
#123659                 
#123659                 
#123659          IF LSIR-RETURN-CD != "00"
#123659             BRANCH FBOutput-S;
#123659             
#R15582 CHANGES END 
#123659
          }
    }
}
