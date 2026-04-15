# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF8002Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016161  602J     pol/covg update to loop back to input                     *
#*  016168  602J     have more link show if > 5 messages                       *
#*  HIS017  HIN/LJ   Refresh additional fields after Policy Diagnostics        *
#*  MP334C  CTS      ADDDED CHANGES FOR PREVIOUS OWNER DEATH DATE              *
#*  R15582  CTS      CHANGES FOR AUTR FUNTIONALITY                             *
#*  123718  CTS      BUG FIX FOR AUDIT LOG RELATED CHANGES                     *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*  UY3049  CTS      ANNUITY TRANSITION PROCESSING STREAM 3                    *
#*******************************************************************************

INCLUDE "BF8000-I.s";
INCLUDE "BF8000-P.p";
INCLUDE "BF8002AD-I.s";
INCLUDE "BF8002ADI-I.s";
INCLUDE "BF8000AD-O.s";
INCLUDE "BF8002NB-I.s";
INCLUDE "BF8000NB-O.s";
INCLUDE "BF8002Update-P.p";
# R15582 CHANGES BEGIN
INCLUDE "BF9G99-P.p";
# R15582 CHANGES END

PROCESS BF8002Update
{
    Title = STRINGTABLE.IDS_TITLE_BF8002Update;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;



    # Enter the key(s) for the value that you'd like to update

    STEP Input
    {
        USES S-STEP "BF8000-I";
    }

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
#UY3049 CHANGES START HERE
        WS-STR3-PAYO-IND <- WS9D34-STR3-PAYO-IND;
        WS-10-POL-ID <- WS9D34-10-POL-ID;
#UY3049 CHANGES END HERE
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
#UY3049 CHANGES START HERE
    IF WS-STR3-PAYO-IND == "Y"
      {
          MIR-STR3-PAYO-IND = WS-STR3-PAYO-IND;
          MIR-10-POL-ID = WS-10-POL-ID;
      }
#UY3049 CHANGES END HERE
    # Retrieve the record 

    STEP Retrieve
    {
        USES P-STEP "BF8000-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    UpdatePrcesI = "BF8002AD-I";
    UpdatePrcesO = "BF8000AD-O";


    # Determine if policy is AD Pending or AD Inforce or NB and branch to 
    # the appropraite input and output screens

    IF MIR-POL-APPL-CTL-CD == "NB"
    {
        UpdatePrcesI = "BF8002NB-I";
        UpdatePrcesO = "BF8000NB-O";

    }
    IF MIR-POL-CSTAT-CD == "1" || MIR-POL-CSTAT-CD == "2" || MIR-POL-CSTAT-CD == "3" || MIR-POL-CSTAT-CD == "4"
    {
        UpdatePrcesI = "BF8002ADI-I";
        UpdatePrcesO = "BF8000AD-O";

    }

    STEP Edit-I
    {
        USES S-STEP UpdatePrcesI;
    }

    IF action == "ACTION_REFRESH"
        BRANCH Edit-I;

    IF action == "ACTION_BACK"
        EXIT;

    # Update the record who's data was just entered.

    STEP Update-P
    {
        USES P-STEP "BF8002Update-P";
    }

    # The value of SESSION.LSIR-MORE-MESSAGES-IND that has been produced
    # by the Update P-Step needs to be retained to properly display the 'MORE' link
    # on the message box, but the next P-Step will overwrite this value before the 
    # page is displayed. To fix this, the value will be stored in the variable
    # LSIR-MORE-MESSAGES-IND which is defined as an 'IN' field on the S-Step
    # for the page display.  When the page is displayed, the value of 
    # LSIR-MORE-MESSAGES-IND will override the value of 
    # SESSION.LSIR-MORE-MESSAGES-IND.
    # Explicitly retrieve values which may have been updated by the
    # Diagnostics process before branching 

    STEP DiagnosticsOutput
    {
        USES P-STEP "BF8000-P";
        ATTRIBUTES
        {
            Explicit;
            GetMessages = "NO";
        }

        MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
        MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
        MIR-POL-CSTAT-CD <- MIR-POL-CSTAT-CD;
        MIR-POL-NXT-ACTV-DT <- MIR-POL-NXT-ACTV-DT;
        MIR-NXT-ACTV-TYP-CD <- MIR-NXT-ACTV-TYP-CD;
        MIR-POL-APP-CMPLT-DT <- MIR-POL-APP-CMPLT-DT;
        MIR-DV-OWN-CLI-NM <- MIR-DV-OWN-CLI-NM;
        MIR-POL-MPREM-AMT <- MIR-POL-MPREM-AMT;
        MIR-POL-PD-TO-DT-NUM <- MIR-POL-PD-TO-DT-NUM;
        MIR-POL-CVG-REC-CTR <- MIR-POL-CVG-REC-CTR;
        MIR-POL-GRS-APREM-AMT <- MIR-POL-GRS-APREM-AMT;
        MIR-MPREM-DSCNT-AMT <- MIR-MPREM-DSCNT-AMT;
#MP334C CHANGES START HERE    
        MIR-CLI-DTH-DT-T <- MIR-CLI-DTH-DT-T;
#MP334C CHANGES ENDS HERE    
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Edit-I;


    ButtonBar = "ButtonBarOK";


    # Display the output of the update process

    STEP Output
    {
        USES S-STEP UpdatePrcesO;
    }

    MESSAGES-T[0] = "";
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
#* R15582 CHANGES BEGIN
    temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;    
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;  

    temp-DTL-INFO  ->MIR-TRNX-DTL-INFO; 
    
# 23774A CHANGES BEGIN

    "I" -> MIR-LOG-LEVL-CD;
    
# 23774A CHANGES END
    
    }

      
    IF LSIR-RETURN-CD != "00"
        BRANCH Edit-I;
#* R15582 CHANGES END 
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
}

