# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1991Force.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  23774A  CTS      Audit Log Related Changes                                 *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1991-I.s";
INCLUDE "BF1991-O.s";
INCLUDE "BF1991-P.p";
#23774A CHANGES BEGIN
#INCLUDE "GenConfrm.f";
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF1991Force
{
#23774A CHANGES BEGIN
#STEP Main
#   {
#       USES PROCESS "GenConfrm";
#
#       # Set up the title strings. 
#
#       STRINGTABLE.IDS_TITLE_BF1991Force -> Title;
#       STRINGTABLE.IDS_TITLE_BF1991Phase1 -> Phase1Title;
#       STRINGTABLE.IDS_TITLE_BF1991Phase2 -> Phase2Title;
#       STRINGTABLE.IDS_TITLE_BF1991Phase3 -> Phase3Title;
#
#       # USES starts with Phase 2.
#
#       "2" -> InitialState;
#
#       # Set the names of the S and P steps to be used
#
#       "Not Applicable" -> KeyFieldsS;
#       "BF1991-P" -> GetInitialHostDataP;
#       "BF1991-I" -> DataInputS;
#       "BF1991-P" -> PerformHostEditsP;
#       "BF1991-O" -> ConfirmS;
#       "BF1991-P" -> UpdateHostP;
#       
#   }
#
#
#   IF action == "ACTION_BACK"
#       EXIT;
#
#
#   BRANCH Main;
       

    Title = STRINGTABLE.IDS_TITLE_BF1991Force;
    Phase1Title = STRINGTABLE.IDS_TITLE_BF1991Phase1;
    Phase2Title = STRINGTABLE.IDS_TITLE_BF1991Phase2;
    Phase3Title = STRINGTABLE.IDS_TITLE_BF1991Phase3;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
   

    # The confirm flow has three phases, controlled by the
    # value of MIR-DV-PRCES-STATE-CD. 
    # The P performs different functions based on this value:
    #        P State
    #    1 = Get system options
    #    2 = Perform edits, generate informational messages
    #    3 = Update server
    # Determine if the process was invoked from a list.
    # If yes, skip directly to the P step.
    # Skip keyfields step for two step confirm:

 
    STEP DataInput-S
    {
        USES S-STEP "BF1991-I";
        Phase2Title -> Title;
    }


    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    # If the user hit Cancel, return to menu if this is the first screen.
    # Otherwise, return to the key input screen.
    # If the user came from a list, return to the list

    IF action == "ACTION_BACK"
    {       
        EXIT;
    }

    MIR-DV-PRCES-STATE-CD = "2";

    STEP PerformHostEdits-P
    {
        USES P-STEP "BF1991-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH DataInput-S;


    STEP Confirm-S
    {
        USES S-STEP "BF1991-O";

        # The "ButtonBarConfirmCancel" buttonbar returns:
        # ACTION_BACK for Cancel;
        # ACTION_CONFIRM   for Confirm;

        "ButtonBarConfirmCancel" -> ButtonBar;
        Phase3Title -> Title;
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
    
    temp-DTL-INFO  = SESSION.MIR-CO-ID + " " + SESSION.MIR-USER-ID;
   
    STEP AudOutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;    
    temp-DTL-INFO  ->MIR-TRNX-DTL-INFO; 
    "C" -> MIR-LOG-LEVL-CD;    
    }
    
    IF LSIR-RETURN-CD != "00"
    {
        BRANCH Confirm-S;
    }    

    STEP UpdateHost-P
    {
        USES P-STEP "BF1991-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

 

    IF LSIR-RETURN-CD != "00"
    {
        BRANCH Confirm-S;
    }    
        

    # The user will be returned to the first screen for input 
    # If the process was invoked from a list, return to the list

    IF DisplayInput == "FALSE"
        EXIT;
        
    IF action == "ACTION_BACK"
        EXIT;    
        
    BRANCH DataInput-S;
    
#23774A CHANGES END
}

