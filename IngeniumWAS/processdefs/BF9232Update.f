# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9232Update.f                                                *
#*  Description: Pending policy bank detail revision flow.                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HNB001  HIN/AI   NEW BUSINESS SCREENS                                      *
#*  HIS068  HIN/AI   DO NOT TRAP ERRORS RETURNED FROM UPDATE-REQT-P            *
#*                   BLANK OUT MESSAGES WHEN CANCEL FROM DATAINPUT SCREEN      *
#*  B10889  HIN/AI   ADD MIR-BNK-BR-NM                                         *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*******************************************************************************

INCLUDE "BF9230-I.s";
INCLUDE "BF9230-P.p";
INCLUDE "BF9232-I.s";
INCLUDE "BF9230-O.s";
INCLUDE "BF9232-P.p";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF9232Update
{
    Title = STRINGTABLE.IDS_TITLE_BF9232Process;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # This flow has three phases, controlled by the
    # value of MIR-DV-PRCES-STATE-CD. 
    # The P performs different functions based on this value:
    #        P State
    #    1 = Get system options
    #    2 = Perform edits, generate informational messages
    #    3 = Update server

    STEP KeyFields-S
    {
        USES S-STEP "BF9230-I";
        STRINGTABLE.IDS_TITLE_BF9232Phase1 -> Title;
    }


    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    # Hitting Cancel from the first page takes the user
    # back to the menu.

    IF action == "ACTION_BACK"
        EXIT;


    MIR-DV-PRCES-STATE-CD = "1";

    STEP GetInitialHostData-P
    {
        USES P-STEP "BF9230-P";
    }


    IF LSIR-RETURN-CD != "00"
        BRANCH KeyFields-S;



    # put the current bank fields in temp variables

    MIR-BNK-ID-temp = MIR-BNK-ID;
    MIR-BNK-BR-ID-temp = MIR-BNK-BR-ID;
    MIR-BNK-ACCT-ID-temp = MIR-BNK-ACCT-ID;
    MIR-BNK-NM-temp = MIR-BNK-NM;
    MIR-BNK-BR-NM-temp = MIR-BNK-BR-NM;
    MIR-BNK-ACCT-TYP-CD-temp = MIR-BNK-ACCT-TYP-CD;
    MIR-BNK-ACCT-HLDR-NM-temp = MIR-BNK-ACCT-HLDR-NM;
    MIR-ACCT-HLDR-TYP-CD-temp = MIR-ACCT-HLDR-TYP-CD;
    MIR-COMB-BILL-IND-temp = MIR-COMB-BILL-IND;

    # clear out the variables for the user to enter new values

    MIR-BNK-ID = "";
    MIR-BNK-BR-ID = "";
    MIR-BNK-ACCT-ID = "";
    MIR-BNK-ACCT-TYP-CD = "";
    MIR-BNK-ACCT-HLDR-NM = "";
    MIR-ACCT-HLDR-TYP-CD = "";
    MIR-COMB-BILL-IND = "";

    STEP DataInput-S
    {
        USES S-STEP "BF9232-I";
        STRINGTABLE.IDS_TITLE_BF9232Phase2 -> Title;
    }


    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    # If the user hit Cancel, return to menu if this is the first screen.
    # Otherwise, return to the key input screen.
    # If the user came from a list, return to the list

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";

        BRANCH KeyFields-S;

    }

    MIR-DV-PRCES-STATE-CD = "2";

    STEP PerformHostEdits-P
    {
        USES P-STEP "BF9232-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH DataInput-S;
#23774A CHANGES BEGIN

      
    temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;   
  
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO ->MIR-TRNX-DTL-INFO; 
    "I" -> MIR-LOG-LEVL-CD;
    
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH DataInput-S;
        
#23774A CHANGES END

    STEP Confirm-S
    {
        USES S-STEP "BF9230-O";

        # The "ButtonBarConfirmCancel" buttonbar returns:
        # ACTION_BACK for Cancel;
        # ACTION_CONFIRM   for Confirm;

        "ButtonBarConfirmCancel" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_BF9232Phase3 -> Title;
    }


    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    # If the user selects Cancel on the Confirm page, return to the DataInput page.

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";

        BRANCH DataInput-S;

    }


    # If action is not Cancel, it is assumed that the User is confirming
    # the changes; update the host  

    STEP UpdateHost-P
    {
        USES P-STEP "BF9232-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Confirm-S;


    STEP UpdateReqt-P
    {
        USES P-STEP "BF9232-P";
        "4" -> MIR-DV-PRCES-STATE-CD;
    }


    #HISXXX IF LSIR-RETURN-CD != "00"
    #HISXXX     BRANCH Confirm-S;
    # The user will be returned to the first screen for input 
    # If the process was invoked from a list, return to the list

    IF DisplayInput == "FALSE"
        EXIT;


    MESSAGES-T[0] = "";

    BRANCH KeyFields-S;
}

