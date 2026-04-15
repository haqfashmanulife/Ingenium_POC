# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9321Create.f                                                *
#*  Description: Firm Banking Disbursement Create-Flowfile                     *                                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M245K2  CTS      INITIAL VERSION                                           *
#*  Q53267  CTS      MP245 CHANGES TO CLEAR SCREEN VALUES                      *
#*  R15582  CTS      AUTR FUNCTIONALITY CHANGES                                *
#*  123718  CTS      BUG FIX FOR AUDIT LOG RELATED CHANGES                     *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*******************************************************************************

INCLUDE "BF9321-I.s";
INCLUDE "BF9321-P.p";
INCLUDE "BF9321-O.s";
#R15582 CHANGES START
INCLUDE "BF9G99-P.p";
#R15582 CHANGES END

PROCESS BF9321Create
{

    Title = STRINGTABLE.IDS_TITLE_BF9321Create;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    
    MIR-ORIG-PMT-CRCY-CD ="JP";
    MIR-REMIT-CRCY-CD   ="JP";
    
    STEP Input
        {
            USES S-STEP "BF9321-I";
            STRINGTABLE.IDS_TITLE_BF9321Input -> Title;
        }
    
        IF action == "ACTION_BACK"
        {
            MESSAGES-T[0] = "";
            EXIT;
        }

#UY3004 CHANGES START

    UserDefinedPolicyIDBase   = MIR-POL-ID;

    STEP RetrieveList
    {
        USES PROCESS "BF9D34List";

        UserDefinedPolicyIDBase -> MIR-POL-ID-BASE;

        WS-POL-ID-BASE <- WS9D34-POL-ID;

        WS-POL-COUNTER <-WS9D34-POL-COUNTER;
        WS-CANCEL-IND  <- WS9D34-CANCEL-IND;
        WS-RETURN-CD   <- WS9D34-RETURN-CD;
        UserDefinedPolicyIDBase <- WS9D34-POL-ID;
    }

    IF  WS-CANCEL-IND == "Y" || WS-RETURN-CD !="00"
       {
        BRANCH Input;
       }

    IF WS-POL-COUNTER <="01"
      {
       MIR-POL-ID = UserDefinedPolicyIDBase;
      }

    IF WS-POL-COUNTER >"01"
      {
       MIR-POL-ID = WS-POL-ID-BASE;
      }

#UY3004 CHANGES END
   
    STEP Retrieve
        {
        USES P-STEP "BF9321-P";
        
        "1" -> MIR-DV-PRCES-STATE-CD;
       
         }

   
    IF LSIR-RETURN-CD != "00" 
        {
        BRANCH Input;
        }


# Display output
    
    STEP Output
        {
        USES S-STEP "BF9321-O";
        "ButtonBarConfirmCancel" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_BF9321Output -> Title;
        }

    IF action == "ACTION_BACK"
        {
        MESSAGES-T[0] = "";
        BRANCH Input;
        }

    IF action == "ACTION_CONFIRM"
        {
        STEP BankUpdate
            {
            USES P-STEP "BF9321-P";
            "2" -> MIR-DV-PRCES-STATE-CD;
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
#R15582 CHANGES START        
  temp-DTL-INFO  = MIR-POL-ID + " " + MIR-FBNK-CAT-CD + " " + MIR-ORIG-PMT-CRCY-CD + " " + MIR-JRNL-DT + " " + MIR-BNFT-PMT-AMT + " " + MIR-REMIT-CRCY-CD + " " + MIR-XCHG-EFF-DT + " " + MIR-DLAY-INT-CALC-DT + " " + MIR-BNK-ID + " " + MIR-BNK-NM + " " + MIR-BNK-BR-NM + " " + MIR-ACCT-TYP-CD + " " + MIR-BNK-ACCT-ID + " " + MIR-ACCT-HLDR-NM;                   
   
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;
    
    temp-DTL-INFO ->MIR-TRNX-DTL-INFO; 
    
    }

    IF LSIR-RETURN-CD != "00"
          BRANCH Input; 
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

    IF LSIR-RETURN-CD != "00"
        {
        BRANCH Output;
        }
#Q53267 CHANGES START HERE
#    ELSE
#        {
#        BRANCH Input;
#	}
#Q53267 CHANGES END HERE
        }
  }        
          

        