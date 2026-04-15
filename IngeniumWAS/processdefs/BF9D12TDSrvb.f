# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9D12TDsrvb.f                                                *
#*  Description: Survival Benefit Payout Process                               *
#*                                                                             *
#*******************************************************************************
#*                                                                             *
#*  MP302A  CTS      INITIAL VERSION                                           *
#*  Q76550  CTS      ADDED NEW VARIABLE INTEREST CALC TYPE                     *
#*  R15582  CTS      AUTR FUNCTIONALITY CHANGES                                *
#*  123718  CTS      BUG FIX FOR AUDIT LOG RELATED CHANGES                     *
#*  UY3004 STREAM3   UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                      *
#*  CD3001  CTS      CHANGES DONE AS PART OF CERBERUS DAY 3.0                  *
#*******************************************************************************

INCLUDE "BF9D12-I.s";
INCLUDE "BF9D12-P.p";
INCLUDE "BF9D12-O.s";
INCLUDE "BF9D12FB-I.s";
INCLUDE "BF9D12FB-O.s";
#R15582 CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#R15582 CHANGES END
#CD3001 CHANGES BEGIN
INCLUDE "BF9D12RDV-O.s";
#CD3001 CHANGES END

PROCESS BF9D12TDSrvb
{

    Title = STRINGTABLE.IDS_TITLE_BF9D12TDSrvb;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # Clear the messages before displaying the s-step for the first time
     
    MESSAGES-T[0] = "";

    MIR-DV-TRNXT-PAYO-MTHD-CD = "F";

 #Q76550 CHANGES STARTS
    MIR-DV-INT-CALC-DT-TYP-CD = "E";
 #Q76550 CHANGES ENDS

    STEP Input
    {
        USES S-STEP "BF9D12-I";
        STRINGTABLE.IDS_TITLE_BF9D12Input -> Title;
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

    MIR-DV-PRCES-STATE-CD = "1";
    
    STEP Quote
    {
        USES P-STEP "BF9D12-P";
    }

    IF LSIR-RETURN-CD != "00"
       BRANCH Input;
    # Display output
	
#CD3001 CHANGES START
    IF LSIR-RETURN-CD == "00" &&  MIR-SPWL-PLAN-IND == "N"
    {
       STEP Output
       {
           USES S-STEP "BF9D12-O";
           "ButtonBarConfirmCancel" -> ButtonBar;
           STRINGTABLE.IDS_TITLE_BF9D12Output -> Title;
       }
       
       # If the user selects Cancel on the Confirm page, return to the Input page.
       
       IF action == "ACTION_BACK"
       {
           MESSAGES-T[0] = "";
           BRANCH Input;
       }   
    }

    IF LSIR-RETURN-CD == "00" &&  MIR-SPWL-PLAN-IND == "Y"
    {
       STEP Rider
       {
           USES S-STEP "BF9D12RDV-O";
           "ButtonBarConfirmCancel" -> ButtonBar;
           STRINGTABLE.IDS_TITLE_BF9D12RDVOutput -> Title;
       }

       IF action == "ACTION_BACK"
       {
        MESSAGES-T[0] = "";
        BRANCH Input;
       }
    }
#CD3001 CHANGES ENDS
            IF MIR-DV-TRNXT-PAYO-MTHD-CD != "F"
          {
              STEP CashDisbUpdate
                 {
                   USES P-STEP "BF9D12-P";
                   "4" -> MIR-DV-PRCES-STATE-CD;
                 }

                 IF LSIR-RETURN-CD != "00" 
#CD3001 CHANGES START
                    {
                      IF MIR-SPWL-PLAN-IND == "N"
                          BRANCH Output;

                      ELSE
                          BRANCH Rider;
                    }
#CD3001 CHANGES ENDS

                 ELSE
                     BRANCH Input;
          }
          
        ELSE
          {
              STEP FBRetrieve
                 {
                   USES P-STEP "BF9D12-P";
                   "2" -> MIR-DV-PRCES-STATE-CD;
                 }

                 IF LSIR-RETURN-CD != "00" 
#CD3001 CHANGES START
                    {
                      IF MIR-SPWL-PLAN-IND == "N"
                          BRANCH Output;

                      ELSE
                          BRANCH Rider;
                    }
#CD3001 CHANGES ENDS

              STEP FBInput-S
                {
                   USES S-STEP "BF9D12FB-I";
                   "ButtonBarOKCancel" -> ButtonBar;
                   STRINGTABLE.IDS_TITLE_BF9D12FBInput -> Title;
                }

              IF action == "ACTION_BACK"
                {
                   MESSAGES-T[0] = "";
                   BRANCH Input;
                }

              STEP FBEdit
                 {
                   USES P-STEP "BF9D12-P";
                   "3" -> MIR-DV-PRCES-STATE-CD;
                 }

                 IF LSIR-RETURN-CD != "00"
                     BRANCH FBInput-S;

              STEP FBOutput-S
                {
                   USES S-STEP "BF9D12FB-O";
                   "ButtonBarConfirmCancelBack" -> ButtonBar;
                   STRINGTABLE.IDS_TITLE_BF9D12FBOutput -> Title;
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
                   USES P-STEP "BF9D12-P";
                   "4" -> MIR-DV-PRCES-STATE-CD;
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
                     #BRANCH Input; 
#27549A - CHANGES START HERE
              #temp-DTL-INFO = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX + " " + MIR-APPL-CTL-PRCES-DT + " " + MIR-CO-RECV-DT + " " + MIR-DV-TRNXT-PAYO-MTHD-CD + " " + MIR-JRNL-DT;    
               temp-DTL-INFO = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX + " " + MIR-APPL-CTL-PRCES-DT + " " + MIR-CO-RECV-DT + " " + MIR-DV-TRNXT-PAYO-MTHD-CD + " " + MIR-JRNL-DT + " " + MIR-ATO-NOT-APPL-IND;
#27549A - CHANGES ENDS HERE
               STEP AUTROutput
               {
                  USES P-STEP "BF9G99-P";
              
               SESSION.MIR-USER-ID -> MIR-USER-ID;
               SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;
           
               temp-DTL-INFO ->MIR-TRNX-DTL-INFO; 
              
               }
            
              IF LSIR-RETURN-CD != "00"
                  BRANCH FBOutput-S;
#CD3001 CHANGES START
#              BRANCH Input;
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
              BRANCH Input; 
#CD3001 CHANGES ENDS
          }
    }

