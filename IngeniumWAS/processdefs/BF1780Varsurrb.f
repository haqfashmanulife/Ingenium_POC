# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1780Varsurrb.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  MFPFU7  AC       Add Firm Banking                                          *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1780Key-I.s";
INCLUDE "BF1780-O.s";
INCLUDE "BF1780-P.p";
INCLUDE "BF1780FB-I.s";
INCLUDE "BF1780FB-O.s";
#INCLUDE "GenConfrm.f";

PROCESS BF1780Varsurrb
{
#   STEP Main
#   {
#       USES PROCESS "GenConfrm";
#
#       # Set up the title strings.
#
#       STRINGTABLE.IDS_TITLE_BF1780Process -> ProcessTitle;
#       STRINGTABLE.IDS_TITLE_BF1780Phase1 -> Phase1Title;
#       STRINGTABLE.IDS_TITLE_BF1780Phase2 -> Phase2Title;
#       STRINGTABLE.IDS_TITLE_BF1780Phase3 -> Phase3Title;
#
#       # FADM starts with Phase 1.
#
#       "2" -> InitialState;
#
#       # Set the names of the S and P steps to be used
#
#       "Not Applicable" -> KeyFieldsS;
#       "BF1780Key-I" -> DataInputS;
#       "BF1780-P" -> PerformHostEditsP;
#       "BF1780-O" -> ConfirmS;
#       "BF1780-P" -> UpdateHostP;
#   }
#
#   IF action == "ACTION_BACK"
#       EXIT;
#
#
#   BRANCH Main;
 
    Title = STRINGTABLE.IDS_TITLE_BF1780Process;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    MIR-CIA-SRC-DEST-CD = "F";

    STEP KeyFields-S
    {
        USES S-STEP "BF1780Key-I";
        STRINGTABLE.IDS_TITLE_BF1780Phase1 -> Title;
    }

    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    IF action == "ACTION_LANGCHANGE"
        BRANCH KeyFields-S;

    # Hitting Cancel from the first page leaves the flow

    IF action == "ACTION_BACK"
        EXIT;

    MIR-DV-PRCES-STATE-CD = "1";
     
    IF MIR-CIA-SRC-DEST-CD != "F"
        MIR-DV-PRCES-STATE-CD = "2";
      
    STEP GetInitialHostData-P
    {
        USES P-STEP "BF1780-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH KeyFields-S;

    # If the Payout Method is Firm Banking Then We have a different  
    # set of screens.                                                

    IF MIR-CIA-SRC-DEST-CD == "F"
        BRANCH DataInput-S;

    STEP Confirm-S
    {
        USES S-STEP "BF1780-O";

        # The "ButtonBarConfirmCancel" buttonbar returns:
        # ACTION_BACK for Cancel;
        # ACTION_CONFIRM   for Confirm;

        "ButtonBarConfirmCancel" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_BF1780Phase3 -> Title;
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
        USES P-STEP "BF1780-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Confirm-S;

    BRANCH KeyFields-S;

    # Screens For Firm Banking                                           
    MIR-BNK-NM = "";
    MIR-BNK-BR-NM = "";
    MIR-CLI-PSTL-CD = "";
    MIR-DV-CLI-ADDR = "";
     
    STEP DataInput-S
    {
        USES S-STEP "BF1780FB-I";
        STRINGTABLE.IDS_TITLE_BF1780Phase2 -> Title;
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
        USES P-STEP "BF1780-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH DataInput-S;

    STEP ConfirmFB-S
    {
        USES S-STEP "BF1780FB-O";

        # The "ButtonBarConfirmCancel" buttonbar returns:
        # ACTION_BACK for Cancel;
        # ACTION_CONFIRM   for Confirm;

        "ButtonBarConfirmCancel" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_BF1780Phase3 -> Title;
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
        USES P-STEP "BF1780-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ConfirmFB-S;

    MIR-CIA-SRC-DEST-CD = "F";
    BRANCH KeyFields-S;
}

