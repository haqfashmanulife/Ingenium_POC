# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9A51Create.f                                                *
#*  Description: Death Master Medical Claim Create                             *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPCAMC  CTS      INITIAL VERSION                                           *
#*  ABF359  CTS      FIX FOR CANCEL BUTTTON                                    *
#*  R15582  CTS      AUDIT LOG RELATED CHANGES                                 *
#*  123718  CTS      BUG FIX FOR AUDIT LOG RELATED CHANGES                     *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*******************************************************************************

INCLUDE "BF9A50-O.s";
INCLUDE "BF9A51-I.s";
INCLUDE "BF9A52-I.s";
INCLUDE "BF9A50-P.p";
INCLUDE "BF9A51-P.p";
INCLUDE "BF9A52-P.p";
#R15582 CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#R15582 CHANGES END

PROCESS BF9A51Create
{
    Title = STRINGTABLE.IDS_TITLE_BF9A51Phase1;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP KeyFields-S
    {
        USES S-STEP "BF9A51-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

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
        BRANCH KeyFields-S;
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

    IF action == "ACTION_REFRESH"
        BRANCH KeyFields-S;



    # Initial Create will set up "skeleton" DCLM recs.

    STEP PerformCreatePart1-P
    {
        USES P-STEP "BF9A51-P";
    }

    IF LSIR-RETURN-CD != "00" && LSIR-RETURN-CD != "03"
        BRANCH KeyFields-S;

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
    
    SESSION.MIR-CLM-ID = MIR-CLM-ID;


    # Retrieve "skeleton" DCLM recs.

    STEP Retrieve
    {
        USES P-STEP "BF9A50-P";
    }

    IF LSIR-RETURN-CD != "00" && LSIR-RETURN-CD != "03"
        BRANCH KeyFields-S;

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

    STEP Update-S
    {
        USES S-STEP "BF9A52-I";
    }
    # ABF359
    
    IF action == "ACTION_BACK"
    {
        IF DisplayInput != "FALSE"
        {
            MESSAGES-T[0] = "";
            BRANCH KeyFields-S;
            ButtonBar = "ButtonBarOKCancel"; 
        }
        ELSE
            EXIT;
    }
    # ABF359
    
      IF action == "ACTION_REFRESH"
    {
        MIR-CAUSE-DESC-TXT = "";
        BRANCH Update-S;
    }

    STEP PerformHostEdits-P
    {
        USES P-STEP "BF9A52-P";
        "2" -> MIR-DV-PRCES-STATE-CD;
    }
    
    IF LSIR-RETURN-CD != "00"
        BRANCH Update-S;
    
    STEP Confirm-S
    {
        USES S-STEP "BF9A50-O";

        # The "ButtonBarConfirmCancel" buttonbar returns:
        #       ACTION_BACK      for Cancel;
        #       ACTION_CONFIRM   for Confirm;

        "ButtonBarConfirmCancel" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_BF9A51Phase2 -> Title;
    }

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";

        BRANCH Update-S;

    }


    # User confirmed the changes, update the host

    STEP UpdateHost-P
    {
        USES P-STEP "BF9A52-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Update-S;
        
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
     temp-DTL-INFO = MIR-POL-ID + " " + MIR-CLI-ID;

   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID -> MIR-BFCN-ID;  

    temp-DTL-INFO ->MIR-TRNX-DTL-INFO; 
    
    }

     
    IF LSIR-RETURN-CD != "00"
       BRANCH Update-S; 
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
       
       
}
           