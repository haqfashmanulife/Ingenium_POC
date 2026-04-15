# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0472Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  R15582  CTS      AUDIT LOG RELATED CHANGES                                 *
#*  23774A  CTS      Audit Log Related Changes                                 *
#*  S50650  CTS      UDS3-50650 JIRA FIX (10/7 DIGIT POLICY)                   *
#*******************************************************************************

INCLUDE "BF0470-I.s";
INCLUDE "BF0470-P.p";
INCLUDE "BF0472-I.s";
INCLUDE "BF0472-O.s";
INCLUDE "BF0472-P.p";
#R15582 CHANGES BEGIN
#23774A CHANGES BEGIN
#INCLUDE "GenConfrm.f";
#INCLUDE "GenConfrmAud.f";
INCLUDE "BF9G99-P.p";
#23774A CHANGES END
#R15582 CHANGES END
# UY3004 CHANGES START
INCLUDE "BF9D34List.f";
# UY3004 CHANGES END


PROCESS BF0472Update
{
#23774A CHANGES BEGIN 
#   STEP Main
#   {
#R15582 CHANGES BEGIN    
#       USES PROCESS "GenConfrm";       
#        USES PROCESS "GenConfrmAud";
#R15582 CHANGES END        
#
#       # Set up the title strings. 
#
#       STRINGTABLE.IDS_TITLE_BF0472Process -> ProcessTitle;
#       STRINGTABLE.IDS_TITLE_BF0472Phase1 -> Phase1Title;
#       STRINGTABLE.IDS_TITLE_BF0472Phase2 -> Phase2Title;
#       STRINGTABLE.IDS_TITLE_BF0472Phase3 -> Phase3Title;
#
#       # Update starts with Phase 1.
#
#       "1" -> InitialState;
#
#       # Set the names of the S and P steps to be used
#
#       "BF0470-I" -> KeyFieldsS;
#       "BF0470-P" -> GetInitialHostDataP;
#       "BF0472-I" -> DataInputS;
#       "BF0472-P" -> PerformHostEditsP;
#       "BF0472-O" -> ConfirmS;
#       "BF0472-P" -> UpdateHostP;
#   }
#   IF action == "ACTION_BACK"
#        EXIT;
#
#
#    BRANCH Main;

    Title = STRINGTABLE.IDS_TITLE_BF0472Process;
    Phase1Title = STRINGTABLE.IDS_TITLE_BF0472Phase1;
    Phase2Title = STRINGTABLE.IDS_TITLE_BF0472Phase2;
    Phase3Title = STRINGTABLE.IDS_TITLE_BF0472Phase3;
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

    IF InitialState == "2"
        BRANCH DataInput-S;


    STEP KeyFields-S
    {
        USES S-STEP "BF0470-I";
        Phase1Title -> Title;
    }

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
# S50650 CHANGES STARTS
        WS-STR3-PAYO-IND <- WS9D34-STR3-PAYO-IND;
        WS-10-POL-ID <- WS9D34-10-POL-ID;
# S50650 CHANGES ENDS        
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
# S50650 CHANGES STARTS
    IF WS-STR3-PAYO-IND == "Y"
      {
          MIR-STR3-PAYO-IND = WS-STR3-PAYO-IND;
          MIR-10-POL-ID = WS-10-POL-ID;
      }
# S50650 CHANGES ENDS

    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    # Hitting Cancel from the first page takes the user
    # back to the menu.

    IF action == "ACTION_BACK"
        EXIT;


    MIR-DV-PRCES-STATE-CD = "1";

    STEP GetInitialHostData-P
    {
        USES P-STEP "BF0470-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH KeyFields-S;

# S50650 CHANGES STARTS
    IF WS-STR3-PAYO-IND == "Y"
      {
          MIR-STR3-PAYO-IND = WS-STR3-PAYO-IND;
          MIR-10-POL-ID = WS-10-POL-ID;
      }
# S50650 CHANGES ENDS

    STEP DataInput-S
    {
        USES S-STEP "BF0472-I";
        Phase2Title -> Title;
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
        USES P-STEP "BF0472-P";
    }
  

    IF LSIR-RETURN-CD != "00"
        BRANCH DataInput-S;


    STEP Confirm-S
    {
        USES S-STEP "BF0472-O";

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
        USES P-STEP "BF0472-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Confirm-S;

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
    
   STEP AudOutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;    
    temp-DTL-INFO  ->MIR-TRNX-DTL-INFO; 
    "C" -> MIR-LOG-LEVL-CD;    
    }

      
    IF LSIR-RETURN-CD != "00"
        BRANCH Confirm-S;
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

    # The user will be returned to the first screen for input 
    # If the process was invoked from a list, return to the list

    IF DisplayInput == "FALSE"
        EXIT;
        
    IF action == "ACTION_BACK"
        EXIT;    
        
    BRANCH KeyFields-S;        

#23774A CHANGES END                    
}

