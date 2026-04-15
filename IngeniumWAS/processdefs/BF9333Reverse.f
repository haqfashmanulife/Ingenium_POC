# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9333Reverse.f                                               *
#*  Description:   Final Approval Reversal                                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL109  HIN/CL   CLAIM PAYMENT                                             *
#*  PF13    PF 1.3   correct array processing from Pathfinder conversion       *
#*  BU3283  CTS      Commented the usage of variable MessageFrom9339[0]        *
#*                   MessageFrom9333[0] for initialization purpose since it is *         
#*                   taken care by MESSAGES-T[0] variable                      * 
#*  R15582  CTS      AUTR FUNCTIONALITY CHANGES                                *
#*  123718  CTS      BUG FIX FOR AUDIT LOG RELATED CHANGES                     *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9339-I.s";
INCLUDE "BF9330-O.s";
INCLUDE "BF9339-O.s";
INCLUDE "BF9330-P.p";
INCLUDE "BF9333-P.p";
INCLUDE "BF9339-P.p";
INCLUDE "BF9270Retrieve.f";
INCLUDE "BF9271Retrieve.f";
#R15582 CHANGES START
INCLUDE "BF9G99-P.p";
#R15582 CHANGES END

PROCESS BF9333Reverse
{
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    StartPoint:

    DisplayList = "";
    Title = STRINGTABLE.IDS_TITLE_ClaimFinalReverse;
    ButtonBar = "ButtonBarOKCancel";

    STEP ListStart
    {
        USES S-STEP "BF9339-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH ListStart;



    # Initialise the message variables

    #Changes for BU3283 begin
    #MessageFrom9333[0] = "";
    #MessageFrom9339[0] = "";
    #Changes for BU3283 end
    MESSAGES-T[0] = "";


    # Search for all records that match the search criteria

    STEP FinalApprovalSearch
    {
        USES P-STEP "BF9339-P";
    }


    # Store the messages returned from 9339 p-step
    # The reason for all this message juggling is that when we 
    # are processing the approvals from the list screen, we 
    # need to display both the messages from the reversal (9333)
    # and also the messages from the list process (9339)

    COUNTER = 10;

    WHILE (COUNTER > 0)
    {
        MessageFrom9339[COUNTER] = MESSAGES-T[COUNTER];
        COUNTER = COUNTER - 1;

    }


    # Clear the messages and then reload the 9339 and 9333 messages

    MESSAGES-T[0] = "";
    COUNTER = 1;

    WHILE (MessageFrom9333[COUNTER] != "")
    {
        MESSAGES-T[COUNTER] = MessageFrom9333[COUNTER];
        COUNTER = COUNTER + 1;

    }

    COUNTER2 = 1;

    WHILE (MessageFrom9339[COUNTER2] != "")
    {
        MESSAGES-T[COUNTER] = MessageFrom9339[COUNTER2];
        COUNTER = COUNTER + 1;
        COUNTER2 = COUNTER2 + 1;

    }

    #Changes for BU3283 begin
    #MessageFrom9333[0] = "";
    #MessageFrom9339[0] = "";
    #Changes for BU3283 end

    IF LSIR-RETURN-CD != "00"
    {
        IF DisplayList == "YES"
            BRANCH DisplayList;

        ELSE
            BRANCH StartPoint;


    }


    # If there is only one approval to reverse and we have not
    # entered the list screen before, then bypass the list
    # screen and display the approval detail screen.

    IF MIR-CLM-CTR == "01" && DisplayList == ""
    {
        DisplayList = "NO";
        MIR-APROV-SEQ-NUM = MIR-APROV-SEQ-NUM-T[1];

        BRANCH Retrieve;

    }
    ELSE
        DisplayList = "YES";


    ButtonBar = "ButtonBarDetCancMore";

    STEP DisplayList
    {
        USES S-STEP "BF9339-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
    {
        DisplayList = "";

        BRANCH FinalApprovalSearch;

    }

    # If the user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # Build the key ID from the row that the user selected
    # Build all of the key variables that will be required
    # by the following steps and pass them to each step. 

    MIR-APROV-SEQ-NUM = MIR-APROV-SEQ-NUM-T[index];


    # Retrieve Claim Details                

    STEP Retrieve
    {
        USES P-STEP "BF9330-P";
    }

    IF LSIR-RETURN-CD != "00" && LSIR-RETURN-CD != "03"
        BRANCH StartPoint;


    ButtonBar = "ButtonBarRevCancel";

MIR-POL-ID-2-T[1] = SUBSTRING (MIR-POL-ID-2-T[1],1,7);
MIR-POL-ID-3-T[1] = SUBSTRING (MIR-POL-ID-3-T[1],1,7);
MIR-POL-ID-4-T[1] = SUBSTRING (MIR-POL-ID-4-T[1],1,7);

    STEP Update-S
    {
        USES S-STEP "BF9330-O";
    }

    # If user hit cancel and there was only one approval found
    # go back to the beginning, otherwise resume the search

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";

        IF DisplayList == "NO"
            BRANCH StartPoint;

        ELSE
            BRANCH FinalApprovalSearch;


    }


    # Reverse the Approval  

    STEP UpdateHost-P
    {
        USES P-STEP "BF9333-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Update-S;



    # Store the messages returned from the 9333 p-step

    COUNTER = 10;

    WHILE (COUNTER > 0)
    {
        MessageFrom9333[COUNTER] = MESSAGES-T[COUNTER];
        COUNTER = COUNTER - 1;

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
  
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    MIR-CLM-ID ->MIR-TRNX-DTL-INFO; 
    
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

    # Go and ask for another Claim to Approve

    IF DisplayList == "NO"
        BRANCH StartPoint;

    ELSE
        BRANCH FinalApprovalSearch;

}

