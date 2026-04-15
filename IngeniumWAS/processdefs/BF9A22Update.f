# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF9A22Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  EN001527  GW     Change  GenConfrm.f for GenConfrmMore.f                   *
#*  23774A  CTS      Audit Log Related Changes                                 *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9A22-I.s";
INCLUDE "BF9A22-P.p";
INCLUDE "BF9A22-O.s";
INCLUDE "BF9A20-O.s";
#23774A CHANGES BEGIN
#INCLUDE "GenUWConfrmMore.f";
INCLUDE "BF9G99-P.p";
#23774A CHANGES END


PROCESS BF9A22Update
{
#23774A CHANGES BEGIN
#   STEP Main
#   {
#       USES PROCESS "GenUWConfrmMore";
#
#       # Set up the title strings. 
#
#       STRINGTABLE.IDS_TITLE_BF9A22Process -> ProcessTitle;
#       STRINGTABLE.IDS_TITLE_BF9A22Phase1 -> Phase1Title;
#       STRINGTABLE.IDS_TITLE_BF9A22Phase2 -> Phase2Title;
#       STRINGTABLE.IDS_TITLE_BF9A22Phase3 -> Phase3Title;
#
#       # Update starts with Phase 1.
#
#       "1" -> InitialState;
#
#       # Set the names of the S and P steps to be used
#
#       "BF9A22-I" -> KeyFieldsS;
#       "BF9A22-P" -> GetInitialHostDataP;
#       "BF9A22-O" -> DataInputS;
#       "BF9A22-P" -> PerformHostEditsP;
#       "BF9A20-O" -> ConfirmS;
#       "BF9A22-P" -> UpdateHostP;
#   }
#
#    IF action == "ACTION_BACK"
#        EXIT;
#
#   BRANCH Main;

    Title = STRINGTABLE.IDS_TITLE_BF9A22Process;
    Phase1Title = STRINGTABLE.IDS_TITLE_BF9A22Phase1;
    Phase2Title = STRINGTABLE.IDS_TITLE_BF9A22Phase2;
    Phase3Title = STRINGTABLE.IDS_TITLE_BF9A22Phase3;
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

    STEP KeyFields-S
    {
        USES S-STEP "BF9A22-I";
        Phase1Title -> Title;
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
        USES P-STEP "BF9A22-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH KeyFields-S;


    STEP DataInput-S
    {
        USES S-STEP "BF9A22-O";
        Phase2Title -> Title;
        "ButtonBarUpdateCancelFinal" -> ButtonBar;
    }

       MIR-UPDT-DECD-CD = " ";
       
    IF action == "ACTION_FINAL"
     {
       MIR-UPDT-DECD-CD = "F" ;
     }

    IF action == "ACTION_MNGR"
    {
       MIR-UPDT-DECD-CD = "M" ;
     }


    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    # If the user hit Cancel, return to menu if this is the first screen.
    # Otherwise, return to the key input screen.
    # If the user came from a list, return to the list

    IF action == "ACTION_BACK"
    {
        IF DisplayInput != "FALSE"
        {
            IF InitialState == "2"
                EXIT;

            ELSE
            {
                MESSAGES-T[0] = "";

                BRANCH KeyFields-S;

            }

        }
        ELSE
            EXIT;


    }

    MIR-DV-PRCES-STATE-CD = "2";

    STEP PerformHostEdits-P
    {
        USES P-STEP "BF9A22-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH DataInput-S;


    STEP Confirm-S
    {
        USES S-STEP "BF9A20-O";

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

    STEP UpdateHost-P
    {
        USES P-STEP "BF9A22-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Confirm-S;

    temp-DTL-INFO  =  MIR-POL-ID + " " + MIR-CLI-ID;


   STEP AudOutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;    
    temp-DTL-INFO  -> MIR-TRNX-DTL-INFO;
    "C" -> MIR-LOG-LEVL-CD;    
    }

      
    IF LSIR-RETURN-CD != "00"
        BRANCH Confirm-S;

    IF DisplayInput == "FALSE"
        EXIT;
        
    IF action == "ACTION_BACK"
        EXIT;    
        
    BRANCH KeyFields-S;

# 23774A CHANGES ENDS

}

