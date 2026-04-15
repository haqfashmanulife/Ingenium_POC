# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1364Waiver.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  M319A3  CTS      FXWL 3DD WAIVER CHANGES                                   *
#*  Q91588  CTS      FIX FOR FXWL WAIVER CHANGES                               *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*******************************************************************************

INCLUDE "BF1364-I.s";
INCLUDE "BF1364-O.s";
INCLUDE "BF1364-P.p";
#M319A3 CHANGES START HERE
#INCLUDE "GenConfrm.f";
INCLUDE "BF1364FB-I.s";
INCLUDE "BF1364FB-O.s";


#PROCESS BF1364Waiver
#{
#    STEP Main
#    {
#        USES PROCESS "GenConfrm";
#
#        # Set up the title strings. 
#
#        STRINGTABLE.IDS_TITLE_BF1364Process -> ProcessTitle;
#        STRINGTABLE.IDS_TITLE_BF1364Phase1 -> Phase1Title;
#        STRINGTABLE.IDS_TITLE_BF1364Phase2 -> Phase2Title;
#        STRINGTABLE.IDS_TITLE_BF1364Phase3 -> Phase3Title;

        # SERV-Waiver starts with Phase 2.

#        "2" -> InitialState;

        # Set the names of the S and P steps to be used

#        "Not Applicable" -> KeyFieldsS;
#        "BF1364-P" -> GetInitialHostDataP;
#        "BF1364-I" -> DataInputS;
#        "BF1364-P" -> PerformHostEditsP;
#        "BF1364-O" -> ConfirmS;
#        "BF1364-P" -> UpdateHostP;
#    }

#    IF action == "ACTION_BACK"
#        EXIT;


#    BRANCH Main;
#}
PROCESS BF1364Waiver
{

    Title = STRINGTABLE.IDS_TITLE_BF1364Process;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # Clear the messages before displaying the s-step for the first time
     
    MESSAGES-T[0] = "";
#Q91588 CHANGES START HERE    
    #MIR-DV-TRNXT-PAYO-MTHD-CD = "F";
    MIR-DV-TRNXT-PAYO-MTHD-CD = " ";
#Q91588 CHANGES END HERE    
    
    STEP KeyFields-S
        {
            USES S-STEP "BF1364-I";
            STRINGTABLE.IDS_TITLE_BF1364Phase1 -> Title;
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
            USES P-STEP "BF1364-P";
        }
        
            # FOR VIRTUAL UNDO
            IF LSIR-RETURN-CD != "00" && (MIR-DV-UNDO-VALID-CD != "N" || MIR-DV-COMMIT-CD != "N")
            BRANCH KeyFields-S;
            
    # If the Payout Method is Firm Banking Then We have a different  
    # set of screens.                               
    
    IF MIR-DV-TRNXT-PAYO-MTHD-CD == "F"
        BRANCH DataInput-S;
    
        STEP Confirm-S
        {
            USES S-STEP "BF1364-O";
    
            # The "ButtonBarConfirmCancel" buttonbar returns:
            # ACTION_BACK for Cancel;
            # ACTION_CONFIRM   for Confirm;
    
            "ButtonBarConfirmCancel" -> ButtonBar;
            STRINGTABLE.IDS_TITLE_BF1364Phase3 -> Title;
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
            USES P-STEP "BF1364-P";
            "3" -> MIR-DV-PRCES-STATE-CD;
        }
    
        IF LSIR-RETURN-CD != "00"
            BRANCH Confirm-S;
    
        BRANCH KeyFields-S;
    
        # Screens For Firm Banking                                           
    
        STEP DataInput-S
        {
           USES S-STEP "BF1364FB-I";
           STRINGTABLE.IDS_TITLE_BF1364Phase2 -> Title;
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
            USES P-STEP "BF1364-P";
        }
    
        IF LSIR-RETURN-CD != "00" && (MIR-DV-UNDO-VALID-CD != "N" || MIR-DV-COMMIT-CD != "N")
            BRANCH DataInput-S;
    
        STEP ConfirmFB-S
        {  
            USES S-STEP "BF1364FB-O";        
    
            # The "ButtonBarConfirmCancel" buttonbar returns:
            # ACTION_BACK for Cancel;
            # ACTION_CONFIRM   for Confirm;
    
            "ButtonBarConfirmCancelBack" -> ButtonBar;
            STRINGTABLE.IDS_TITLE_BF1364Phase3 -> Title;
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
            USES P-STEP "BF1364-P";
            "3" -> MIR-DV-PRCES-STATE-CD;
        }
    
        IF LSIR-RETURN-CD != "00"
            BRANCH ConfirmFB-S;
    
        BRANCH KeyFields-S;
    }
    #M319A3 CHANGES END HERE


