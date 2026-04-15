# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9440TPlaps                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01PR01  TMC      New for MCL                                               *
#*  MP4FB1  H.L      CHANGES TO SUPPORT FIRM BANKING   12AUG04                 *
#*  U40018  BP       Only Show Firm Banking When Payout Method is Firm Banking *
#*  M271AA  CTS      FRA CHANGES FOR POST LAPSE SURRENDER  01SEP2015           *
#*  R15582  CTS      AUTR FUNCTIONALITY CHANGES                                *
#*  123718  CTS      BUG FIX FOR AUDIT LOG RELATED CHANGES                     *
#*  UY3004 STREAM3   UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9440Cli-I.s";
INCLUDE "BF9440-I.s";
INCLUDE "BF9440-O.s";
INCLUDE "BF9440FB-O.s";
INCLUDE "BF9440-P.p";
#R15582 CHANGE START
INCLUDE "BF9G99-P.p";
#R15582 CHANGE END

PROCESS BF9440TPlaps
{
    Title = STRINGTABLE.IDS_TITLE_BF9440Process;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    MIR-DV-TRNXT-PAYO-MTHD-CD = "F";

    STEP KeyFields-S
    {
        USES S-STEP "BF9440Cli-I";
        STRINGTABLE.IDS_TITLE_BF9440Phase1 -> Title;
    }

    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    IF action == "ACTION_LANGCHANGE"
        BRANCH KeyFields-S;

    # Hitting Cancel from the first page leaves the flow

    IF action == "ACTION_BACK"
        EXIT;

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
        BRANCH KeyFields-S;
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

    STEP GetInitialHostData-P
    {
        USES P-STEP "BF9440-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH KeyFields-S;

    # If the Payout Method is Firm Banking Then We have a different  
    # set of screens.                                                

    # M271AA CHANGES STARTS HERE
    
    BankEditI = "BF9440-I";
    BankconfirmO = "BF9440FB-O";
    
    IF MIR-DBL-DISB-IND == "Y"
      {
       BankEditI = "BF9440Dbl-I";
       BankconfirmO = "BF9440FBDbl-O";
      }
    # M271AA CHANGES ENDS HERE
    IF MIR-DV-TRNXT-PAYO-MTHD-CD == "F"
        BRANCH DataInput-S;

    STEP Confirm-S
    {
        USES S-STEP "BF9440-O";

        # The "ButtonBarConfirmCancel" buttonbar returns:
        # ACTION_BACK for Cancel;
        # ACTION_CONFIRM   for Confirm;

        "ButtonBarConfirmCancel" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_BF9440Phase3 -> Title;
    }

    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    IF action == "ACTION_LANGCHANGE"
        BRANCH Confirm-S;

    # If the user selects Cancel on the Confirm page, return to the KeyFields page.

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        BRANCH KeyFields-S;
    }

    # If action is not Cancel, it is assumed that the User is confirming
    # the changes; update the host  

    STEP UpdateHost-P
    {
        USES P-STEP "BF9440-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Confirm-S;

    BRANCH KeyFields-S;

    # Screens For Firm Banking                                           

    STEP DataInput-S
    {
 #M271AA CHANGES STARTS HERE
       # USES S-STEP "BF9440-I";
       USES S-STEP BankEditI;
        STRINGTABLE.IDS_TITLE_BF9440Phase2 -> Title;
 #M271AA CHANGES ENDS HERE
    }

    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    IF action == "ACTION_LANGCHANGE"
        BRANCH DataInput-S;

    # If the user hit Cancel, return to the key input screen.

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        BRANCH KeyFields-S;
    }

    MIR-DV-PRCES-STATE-CD = "2";

    STEP PerformHostEdits-P
    {
        USES P-STEP "BF9440-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH DataInput-S;

    STEP ConfirmFB-S
    {
   #M271AA CHANGES STARTS HERE    
        #USES S-STEP "BF9440FB-O";
         USES S-STEP BankconfirmO;         

        # The "ButtonBarConfirmCancel" buttonbar returns:
        # ACTION_BACK for Cancel;
        # ACTION_CONFIRM   for Confirm;

        "ButtonBarConfirmCancelBack" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_BF9440Phase3 -> Title;
 #M271AA ENDS STARTS HERE 		        
    }

    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    IF action == "ACTION_LANGCHANGE"
        BRANCH ConfirmFB-S;

    # If the user selects Cancel on the Confirm page, return to the KeyFields page.

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        BRANCH KeyFields-S;
    }

    # If the user selects Back on the Confirm page, return to the DataInput page.

    IF action == "ACTION_PREVIOUS"
    {
        MESSAGES-T[0] = "";
        BRANCH DataInput-S;
    }

    # If action is not Cancel, it is assumed that the User is confirming
    # the changes; update the host  

    STEP UpdateHostFB-P
    {
        USES P-STEP "BF9440-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ConfirmFB-S;
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

              temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX + " " + MIR-APPL-CTL-PRCES-DT + " " + MIR-JRNL-DT + " " + MIR-DV-TRNXT-PAYO-MTHD-CD + " " + MIR-DV-PAYO-JPY-BNFT-CD + " " + MIR-CO-RECV-DT + " " + MIR-DV-HO-RECV-DT + " " + MIR-CLMT-CAT-CD + " " + MIR-DT-OF-DTH + " " + MIR-CLMT-CLI-ID;                   
              
              STEP AUTROutput
                 {
                   USES P-STEP "BF9G99-P";
    
                   SESSION.MIR-USER-ID -> MIR-USER-ID;
                   SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;      
 
                   temp-DTL-INFO ->MIR-TRNX-DTL-INFO; 
    
                 }
      
    IF LSIR-RETURN-CD != "00"
         BRANCH ConfirmFB-S; 
#R15582 CHANGE END
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
     
    BRANCH KeyFields-S;
}

