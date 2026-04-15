# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF6981Valuepol.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*  S21929  CTS      CHANGES TO DISPLAY MESSAGES                               *
#*  UY3004  CTS      CHANGES DONE AS PART OF STREAM3                           *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF6981-P.p";
INCLUDE "BF6981-I.s";
INCLUDE "BF6981-O.s";
# 23774A CHANGES BEGIN
#INCLUDE "GenRetrieve.f";
#INCLUDE "GenRetrieveAud.f";
INCLUDE "BF9G99-P.p";
# 23774A CHANGES END
# UY3004 CHANGES START
INCLUDE "BF9D34List.f";
# UY3004 CHANGES END

PROCESS BF6981Valuepol
{
# 23774A CHANGES BEGIN
#    STEP Main
#    {
#           USES PROCESS "GenRetrieve";
#           USES PROCESS "GenRetrieveAud";   
#
#        ATTRIBUTES
#        {
#            GetMessages = "NO";
#        }
#
#        STRINGTABLE.IDS_TITLE_BF6981Valuepol -> Title;
#        "BF6981-I" -> InputS;
#        "BF6981-P" -> RetrieveP;
#        "BF6981-O" -> OutputS;
#    }

    
    Title = STRINGTABLE.IDS_TITLE_BF6981Valuepol;     
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
        USES S-STEP "BF6981-I";
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
        BRANCH KeyInput;
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

    IF action == "ACTION_BACK"
        EXIT;

    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF6981-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

# S21929 CHANGES BEGIN
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
# S21929 CHANGES ENDS
    temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;   


    STEP AudOutput
    {
        USES P-STEP "BF9G99-P";
        SESSION.MIR-USER-ID -> MIR-USER-ID;
        SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;
        temp-DTL-INFO  ->MIR-TRNX-DTL-INFO;
        "I" -> MIR-LOG-LEVL-CD;        
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;
# S21929 CHANGES BEGIN
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
# S21929 CHANGES ENDS
    ButtonBar = "ButtonBarOK";


    # Display the record retrieved

    STEP Output
    {
        USES S-STEP "BF6981-O";
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;

    BRANCH Input;
   
# 23774A CHANGES ENDS

}
