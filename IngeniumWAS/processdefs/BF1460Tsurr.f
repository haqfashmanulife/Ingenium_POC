# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1460Tsurr.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  MP4FB1  H.L      CHANGES TO SUPPORT FIRM BANKING REMITTANCE                *
#*  U40018  BP       Only Show Firm Banking When Payout Method is Firm Banking *
#*  Q13367  CTS      CHANGES TO INCLUDE VIRTUAL UNDO PROCESS                   *
#*  MP271A  CTS      CHANGES DONE AS PART OF FRA - DOUBLE DISBURSEMENT         *
#*  R15582  CTS      AUDIT LOG RELATED CHANGES                                 *
#*  123718  CTS      BUG FIX FOR AUDIT LOG RELATED CHANGES                     *
#*  UY3004 STREAM3   UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*******************************************************************************

INCLUDE "BF1460-I.s";
INCLUDE "BF1460-O.s";
INCLUDE "BF1460Cli-I.s";
INCLUDE "BF1460-P.p";
INCLUDE "BF1460FB-O.s";
INCLUDE "BF9G99-P.p";

PROCESS BF1460Tsurr
{

    Title = STRINGTABLE.IDS_TITLE_BF1460Process;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    MIR-DV-TRNXT-PAYO-MTHD-CD = "F";

    STEP KeyFields-S
    {
        USES S-STEP "BF1460Cli-I";
        STRINGTABLE.IDS_TITLE_BF1460Phase1 -> Title;
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
        USES P-STEP "BF1460-P";
    }

	# FOR VIRTUAL UNDO
	IF LSIR-RETURN-CD != "00" && (MIR-DV-UNDO-VALID-CD != "N" || MIR-DV-COMMIT-CD != "N")
        BRANCH KeyFields-S;


    # If the Payout Method is Firm Banking Then We have a different  
    # set of screens.                                                

    # MP271A CHANGES STARTS HERE
    
    BankEditI = "BF1460-I";
    BankconfirmO = "BF1460FB-O";
    
    IF MIR-DBL-DISB-IND == "Y"
      {
       BankEditI = "BF1460Dbl-I";
       BankconfirmO = "BF1460FBDbl-O";
      }
    # MP271A CHANGES ENDS HERE
    IF MIR-DV-TRNXT-PAYO-MTHD-CD == "F"
        BRANCH DataInput-S;

    STEP Confirm-S
    {
        USES S-STEP "BF1460-O";

        # The "ButtonBarConfirmCancel" buttonbar returns:
        # ACTION_BACK for Cancel;
        # ACTION_CONFIRM   for Confirm;

        "ButtonBarConfirmCancel" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_BF1460Phase3 -> Title;
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
        USES P-STEP "BF1460-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Confirm-S;

    BRANCH KeyFields-S;

    # Screens For Firm Banking                                           

    STEP DataInput-S
    {
    
 #MP271A CHANGES STARTS HERE
       #USES S-STEP "BF1460-I";
       USES S-STEP BankEditI;
        STRINGTABLE.IDS_TITLE_BF1460Phase2 -> Title;
 #MP271A CHANGES ENDS HERE
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
	MIR-DV-UNDO-VALID-CD = "Y";
    STEP PerformHostEdits-P
    {
        USES P-STEP "BF1460-P";
    }

	IF LSIR-RETURN-CD != "00" && (MIR-DV-UNDO-VALID-CD != "N" || MIR-DV-COMMIT-CD != "N")
        BRANCH DataInput-S;

    STEP ConfirmFB-S
    {
   #MP271A CHANGES STARTS HERE    
        #USES S-STEP "BF1460FB-O";
         USES S-STEP BankconfirmO;         

        # The "ButtonBarConfirmCancel" buttonbar returns:
        # ACTION_BACK for Cancel;
        # ACTION_CONFIRM   for Confirm;

        "ButtonBarConfirmCancelBack" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_BF1460Phase3 -> Title;
 #MP271A ENDS STARTS HERE 		        
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
        USES P-STEP "BF1460-P";
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
#R15582 CHANGES BEGIN
  
              temp-DTL-INFO = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX + " " + MIR-CVG-NUM + " " + MIR-APPL-CTL-PRCES-DT + " " + MIR-DV-SURR-TAX-CD + " " + MIR-DV-TRNXT-PAYO-MTHD-CD + " " + MIR-DV-SURR-REASN-CD + " " + MIR-JRNL-DT + " " + MIR-DV-TAX-OVRID-IND + " " + MIR-SUPRES-CNFRM-IND + " " + MIR-CO-RECV-DT + " " + MIR-DV-HO-RECV-DT + " " + MIR-CLMT-CAT-CD + " " + MIR-DT-OF-DTH + " " + MIR-CLMT-CLI-ID + " " + MIR-DV-PAYO-JPY-BNFT-CD;              
              
              STEP AUTROutput
                 {
                   USES P-STEP "BF9G99-P";
    
                   SESSION.MIR-USER-ID -> MIR-USER-ID;
                   SESSION.LSIR-BPF-ID -> MIR-BFCN-ID;      
 
                   temp-DTL-INFO ->MIR-TRNX-DTL-INFO; 
    
                 }
      

    IF LSIR-RETURN-CD != "00"
        BRANCH ConfirmFB-S;   
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
    BRANCH KeyFields-S;
}

