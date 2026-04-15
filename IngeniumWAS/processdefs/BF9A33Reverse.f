# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9A32Approve.f                                               *
#*  Description: Death Claim Final Approval                                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAFA  CTS      Intial Version                                            *
#*  ABU205  CTS      AFTER THE REVERSAL ALSO CONTROL GOES TO THE INPUT SCREEN  *
#*                   AND MESSAGE WILL BE DISPLAYED                             *
#*  R15582  CTS      AUTR FUNCTIONALITY CHANGES                                *
#*  123718  CTS      BUG FIX FOR AUDIT LOG RELATED CHANGES                     *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9A30-I.s";
INCLUDE "BF9A30-O.s";
INCLUDE "BF9A30-P.p";
INCLUDE "BF9A33-P.p";
#R15582 CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#R15582 CHANGES END


PROCESS BF9A33Reverse
{
    Title = STRINGTABLE.IDS_TITLE_BF9A33Reverse;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;

    STEP KeyFields-S
    {
        USES S-STEP "BF9A30-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH KeyFields-S;



    # Retrieve Claim Details
    ButtonBar = "ButtonBarConfirmCancel";
    STEP Retrieve
    {

        USES P-STEP "BF9A30-P";
         "3" -> MIR-DV-PRCES-STATE-CD;
    }



    IF LSIR-RETURN-CD != "00" && LSIR-RETURN-CD != "03"
      {
        ButtonBar = "ButtonBarOKCancel";
        BRANCH KeyFields-S;

      }


    # Default update..


    STEP Update-S
    {
       USES S-STEP "BF9A33-O";

    }


    IF action == "ACTION_BACK"
    {
       IF DisplayInput != "FALSE"
       {
           MESSAGES-T[0] = "";
           ButtonBar = "ButtonBarOKCancel";
           BRANCH KeyFields-S;
       }
       ELSE
           EXIT;

    }

    # Update the Claim

    STEP UpdateHost-P
    {
        USES P-STEP "BF9A33-P";
    }

    IF LSIR-RETURN-CD != "00"
       BRANCH Update-S ;
#ABU205
    ELSE
        ButtonBar = "ButtonBarOKCancel";
        
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
 
  
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID -> MIR-BFCN-ID;

    MIR-CLM-ID ->MIR-TRNX-DTL-INFO; 
    
    }

    IF LSIR-RETURN-CD != "00"
       BRANCH Update-S ;
       
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

    # Go and ask for another Claim to update


    EXIT;

}

