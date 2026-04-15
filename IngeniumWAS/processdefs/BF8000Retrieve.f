# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF8000Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*  UY3049  CTS      ANNUITY PAYMENT SCREEN                                    *
#*******************************************************************************

INCLUDE "BF8000-I.s";
INCLUDE "BF8000-P.p";
INCLUDE "BF8000AD-O.s";
INCLUDE "BF8000NB-O.s";
# 23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
# 23774A CHANGES END

PROCESS BF8000Retrieve
{

    # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF8000Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;



    # Collect the key value 

    STEP Input
    {
        USES S-STEP "BF8000-I";
    }

    IF action == "ACTION_BACK"
        EXIT;
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
# UY3049 CHANGES STARTS
        WS-STR3-PAYO-IND <- WS9D34-STR3-PAYO-IND;
        WS-10-POL-ID <- WS9D34-10-POL-ID;
# UY3049 CHANGES ENDS
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
# UY3049 CHANGES STARTS
    IF WS-STR3-PAYO-IND == "Y"
      {
          MIR-STR3-PAYO-IND = WS-STR3-PAYO-IND;
          MIR-10-POL-ID = WS-10-POL-ID;
      }
# UY3049 CHANGES ENDS
    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF8000-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

#* 23774A CHANGES BEGIN

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
    
    temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;    
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;  

    temp-DTL-INFO  ->MIR-TRNX-DTL-INFO;
    "I" -> MIR-LOG-LEVL-CD;
    
    }

      
    IF LSIR-RETURN-CD != "00"
        BRANCH Input; 

    
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
      
#* 23774A CHANGES END 

    ButtonBar = "ButtonBarOK";


    # Determine if the record retrieved is NB or AD and display
    # on the appropriate Output page

    IF MIR-POL-APPL-CTL-CD == "NB"
        BRANCH Output-NB;


    STEP Output-AD
    {
        USES S-STEP "BF8000AD-O";
    }

    EXIT;

    STEP Output-NB
    {
        USES S-STEP "BF8000NB-O";
    }

}

