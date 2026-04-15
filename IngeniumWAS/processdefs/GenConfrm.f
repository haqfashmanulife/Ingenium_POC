# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   GenConfrm.f                                                   *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016825  611J     Fix Titlebar size                                         *
#*  016869  611J     Syntax fix                                                *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*  23774A  CTS      Audit Log Related Changes                                 *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  UY3049  CTS      ANNUITY PAYMENT SCREEN                                    *
#*******************************************************************************
# This is a generic process that will implement the verify process where the change function allows the user to change
# all of the fields that were input originally.  In this process, when the user is verifiying he/she has the option to
# Confirm or Cancel.  In this process Cancel is like a cancel action and a change action.

PROCESS GenConfrm
{

    # Set up the title strings. The names of the string table
    # values are parameters to the template process and must also be added to texts.bap.  
    # Title of the entire process

  VARIABLES
  {
    IN ProcessTitle;

    # Title of phase 1

    IN Phase1Title;


    # Title of phase 2

    IN Phase2Title;


    # Title of phase 3

    IN Phase3Title;


    # Name of the first S step

    IN KeyFieldsS;


    # Name of the P that gets the initial host data

    IN GetInitialHostDataP;


    # S that will change the data

    IN DataInputS;


    # P that will edit the data

    IN PerformHostEditsP;


    # S that asks for confirmation of the transaction

    IN ConfirmS;


    # P that will update the data on the host

    IN UpdateHostP;



    # the action that will be returned to the wrapper flow

    OUT action;



    # Some processes, such as PPay, start with Phase 2.
    # Set this variable to 2 if you want to skip the first phase

    IN InitialState;
    
#23774A CHANGES START    
    OUT AuditWriteInd;
#23774A CHANGES END    

  }
    Title = ProcessTitle;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    
#23774A CHANGES START    
    AuditWriteInd = "N";
#23774A CHANGES END    


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
        USES S-STEP KeyFieldsS;
        Phase1Title -> Title;
    }


    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    # Hitting Cancel from the first page takes the user
    # back to the menu.

    IF action == "ACTION_BACK"
        EXIT;

    #UY3004 CHANGES START

    IF  (InitialState == "" || InitialState == "1")
      {
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
#UY3049 CHANGES STARTS
            WS-STR3-PAYO-IND <- WS9D34-STR3-PAYO-IND;
            WS-10-POL-ID <- WS9D34-10-POL-ID;
#UY3049 CHANGES ENDS
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
#UY3049 CHANGES STARTS
        IF WS-STR3-PAYO-IND == "Y"
          {
          MIR-STR3-PAYO-IND = WS-STR3-PAYO-IND;
          MIR-10-POL-ID = WS-10-POL-ID;
          }
#UY3049 CHANGES ENDS
      }
    #UY3004 CHANGES END


    MIR-DV-PRCES-STATE-CD = "1";

    STEP GetInitialHostData-P
    {
        USES P-STEP GetInitialHostDataP;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH KeyFields-S;


    STEP DataInput-S
    {
        USES S-STEP DataInputS;
        Phase2Title -> Title;
    }

    #UY3004 CHANGES START

    IF  (InitialState != "")
      {
        UserDefinedPolicyIDBase   = MIR-POL-ID-BASE;
        UserDefinedPolicyIDSuffix = MIR-POL-ID-SFX;
        
        STEP RetrieveList1
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
            WS-STR3-PAYO-IND <- WS9D34-STR3-PAYO-IND;
            WS-10-POL-ID <- WS9D34-10-POL-ID;
        }
        
        IF  WS-CANCEL-IND == "Y" || WS-RETURN-CD !="00"
           {
            BRANCH DataInput-S;
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
        IF WS-STR3-PAYO-IND == "Y"
          {
          MIR-STR3-PAYO-IND = WS-STR3-PAYO-IND;
          MIR-10-POL-ID = WS-10-POL-ID;
          }
      }

# for cheque ref pol id below code

        IF (MIR-CHQ-REF-ID != "") 
         {
            UserDefinedPolicyIDBase   = MIR-CHQ-REF-ID;

            STEP Retrieve1
            {
                USES PROCESS "BF9D34List";
        
                UserDefinedPolicyIDBase -> MIR-POL-ID-BASE;
        
                WS-POL-ID-BASE <- WS9D34-POL-ID;
                UserDefinedPolicyIDBase <- WS9D34-POL-ID;
                WS-POL-COUNTER <- WS9D34-POL-COUNTER;
                WS-STR3-PAYO-IND <- WS9D34-STR3-PAYO-IND;
                WS-10-POL-ID <- WS9D34-10-POL-ID;
            }
            
            IF LSIR-RETURN-CD == "00"  
            {
                ButtonBar = "ButtonBarOKCancel";
                Title = STRINGTABLE.IDS_TITLE_Title;
            }
        
            IF WS-POL-COUNTER <="01"
              {
               MIR-CHQ-REF-ID = UserDefinedPolicyIDBase;
              }

            IF WS-POL-COUNTER >"01"
              {
               MIR-CHQ-REF-ID = WS-POL-ID-BASE;
              }
            IF WS-STR3-PAYO-IND == "Y"
             {
              MIR-STR3-PAYO-IND = WS-STR3-PAYO-IND;
              MIR-10-POL-ID = WS-10-POL-ID;
              }
         }
    

    #UY3004 CHANGES END

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
        USES P-STEP PerformHostEditsP;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH DataInput-S;


    STEP Confirm-S
    {
        USES S-STEP ConfirmS;

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
        USES P-STEP UpdateHostP;
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Confirm-S;
        
#23774A CHANGES START    
    AuditWriteInd = "Y";
#23774A CHANGES END    


    # The user will be returned to the first screen for input 
    # If the process was invoked from a list, return to the list

    IF DisplayInput == "FALSE"
        EXIT;

}

