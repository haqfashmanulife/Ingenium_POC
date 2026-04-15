# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1368Prcesrpu.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  RPU002  CTS      CHANGES HAS BEEN MADE FOR RPU PROCESSING SCREEN           *
#*  132524  CTS      CHANGES HAS BEEN MADE FOR RPU PROCESSING SCREEN           *
#*  132560  CTS      CHANGES HAS BEEN MADE FOR RPU PROCESSING SCREEN           *
#*******************************************************************************

# RPU002 CHANGES STARTS HERE
#INCLUDE "BF1367-I.s";
#INCLUDE "BF1367-P.p";
INCLUDE "BF1368-I.s";
INCLUDE "BF1368-O.s";
INCLUDE "BF1368Cli-I.s";
INCLUDE "BF1368FB-O.s"; 
INCLUDE "BF1368-P.p";
#INCLUDE "GenConfrm.f";

PROCESS BF1368Prcesrpu
 #{
 #   STEP Main
 #   {
 #       USES PROCESS "GenConfrm";
 #
 #       # Set up the title strings. 
 #
 #       STRINGTABLE.IDS_TITLE_BF1368Process -> ProcessTitle;
 #       STRINGTABLE.IDS_TITLE_BF1368Phase1 -> Phase1Title;
 #       STRINGTABLE.IDS_TITLE_BF1368Phase2 -> Phase2Title;
 #       STRINGTABLE.IDS_TITLE_BF1368Phase3 -> Phase3Title;
 #
 #       # Prcesrpu starts with Phase 1.
 #
 #       "1" -> InitialState;
 #
 #       # Set the names of the S and P steps to be used
 #
 #       "BF1367-I" -> KeyFieldsS;
 #       "BF1367-P" -> GetInitialHostDataP;
 #       "BF1368-I" -> DataInputS;
 #       "BF1368-P" -> PerformHostEditsP;
 #       "BF1368-O" -> ConfirmS;
 #       "BF1368-P" -> UpdateHostP;
 #
 #   }
#
 #   IF action == "ACTION_BACK"
 #       EXIT;

 #
 #   BRANCH Main;

{

    # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF1368Process;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    MESSAGES-T[0] = "";
    MIR-DV-TRNXT-PAYO-MTHD-CD = "F";

#1st screen
    STEP KeyFields-S
    {
        USES S-STEP "BF1368-I";
        STRINGTABLE.IDS_TITLE_BF1368Phase1 -> Title;
        
    }
    
    # Hitting Cancel from the first page leaves the flow

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

    # UY3004 CHANGES END

    #132524 CHANGES STARTS
    MIR-DV-UNDO-VALID-CD = "Y";
    #132524 CHANGES ENDS
    STEP GetInitialHostData-P
    {
        USES P-STEP "BF1368-P";
        "1" -> MIR-DV-PRCES-STATE-CD;
    }
    
    	# FOR VIRTUAL UNDO
    	IF LSIR-RETURN-CD != "00" && (MIR-DV-UNDO-VALID-CD != "N" || MIR-DV-COMMIT-CD != "N")
        BRANCH KeyFields-S;

    IF MIR-DV-TRNXT-PAYO-MTHD-CD == "F"  &&  MIR-CSV-RFND-IND == "Y" 
       BRANCH DataInput-S;
        

# 3RD Screen for Non-Firm Banking Option        

    STEP  ConfirmS  
      
    {
        USES S-STEP "BF1368-O";
        
        # The "ButtonBarConfirmCancel" buttonbar returns:
        # ACTION_BACK for Cancel;
        # ACTION_CONFIRM   for Confirm;
        
        "ButtonBarConfirmCancel" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_BF1368Phase3 -> Title;
    } 
                      
    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    IF action == "ACTION_LANGCHANGE"
        BRANCH ConfirmS;
   
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
        USES P-STEP "BF1368-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    } 
    
    IF LSIR-RETURN-CD != "00"
        BRANCH ConfirmS;

    BRANCH KeyFields-S;    

   

    # Screens For Firm Banking                                           

    STEP DataInput-S
    {   
       USES S-STEP "BF1368Cli-I";
        STRINGTABLE.IDS_TITLE_BF1368Phase2 -> Title;
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

    #132560 CHANGES STARTS
    MIR-DV-UNDO-VALID-CD = "Y";
    #132560 CHANGES ENDS
    STEP PerformHostEdits-P
    {
        USES P-STEP "BF1368-P";
        "2" -> MIR-DV-PRCES-STATE-CD;
    #132560 CHANGES STARTS
    #   "Y" -> MIR-DV-UNDO-VALID-CD;
    #132560 CHANGES ENDS
    }

	IF LSIR-RETURN-CD != "00" && (MIR-DV-UNDO-VALID-CD != "N" || MIR-DV-COMMIT-CD != "N")
        BRANCH DataInput-S;

    STEP ConfirmFB-S
    {
         USES S-STEP "BF1368FB-O";

        # The "ButtonBarConfirmCancelBack" buttonbar returns:
        # ACTION_BACK for Cancel;
        # ACTION_CONFIRM   for Confirm;

        "ButtonBarConfirmCancelBack" -> ButtonBar;
        STRINGTABLE.IDS_TITLE_BF1368Phase3 -> Title;
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
        USES P-STEP "BF1368-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ConfirmFB-S;

    BRANCH KeyFields-S;
        
#RPU002 CHANGE ENDS HERE        
  
}

