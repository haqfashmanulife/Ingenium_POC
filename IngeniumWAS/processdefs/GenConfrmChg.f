# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   GenConfrmChg.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016825  611J     Fix Titlebar size                                         *
#*  016869  611J     Syntax fix                                                *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*                                                                             *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*******************************************************************************
#  This is a generic process that will implement the confirm process where the change function does not allow the user to #  change all of the fields that were input originally.

PROCESS GenConfrmChg
{

    # Set up the title strings. The names of the string table
    # values may become parameters to the template process. 
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


    # Title of change

    IN ChangeTitle;


    # Name of the first S step

    IN KeyFieldsS;


    # Name of the P that gets the initial host data

    IN GetInitialHostDataP;


    # S that will change the data

    IN DataInputS;


    # P that will edit the data

    IN PerformHostEditsP;


    # S that asks for verification

    IN ConfirmS;


    # P that will update the data on the host

    IN UpdateHostP;


    # S that will change a limited amount of data and display the rest

    IN ChangeS;



    # the action that will be returned to the wrapper flow

    OUT action;



    # Some processes, such as PPay, start with Phase 2.
    # Set this variable to 2 if you want to skip the first phase

    IN InitialState;

  }
    Title = ProcessTitle;
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
    #    4 = Change limited number of fields (not the same fields as on the original input pages)
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
        
      }
    #UY3004 CHANGES END

    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    # Hitting Cancel from the first page takes the user
    # back to the menu.

    IF action == "ACTION_BACK"
        EXIT;


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
          {
        
      }

    #UY3004 CHANGES END



    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    # If the user hits Cancel, return to menu if this is the first screen.
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

        # The "ButtonBarConfirm" buttonbar returns:
        # ACTION_CHANGE for Change (the default);
        # ACTION_BACK for Cancel
        # ACTION_CONFIRM   for Confirm;

        "ButtonBarConfirm" -> ButtonBar;
        Phase3Title -> Title;
    }


    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    IF action == "ACTION_CONFIRM"
        BRANCH UpdateHost-P;


    # If the user came from a list, return to the list 
    # if the initial state = 2, otherwise return to the 
    # DataInput page.

    IF action == "ACTION_BACK"
    {
        IF DisplayInput != "FALSE"
        {
            MESSAGES-T[0] = "";

            BRANCH DataInput-S;

        }
        ELSE
        {
            IF InitialState == "1"
                BRANCH DataInput-S;

            ELSE
                EXIT;


        }

    }


    # The user has neither confirmed nor aborted the transaction -
    # assume "CHANGE" and redo the input, edit and confirm phases.
    # First, the messages are blanked out so that extraneous messages
    # are not carried forward to the change step.

    MESSAGES-T[0] = "";

    STEP Change-S
    {
        USES S-STEP ChangeS;
        "ButtonBarOK" -> ButtonBar;
        ChangeTitle -> Title;
    }


    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    # if the user presses CANCEL on the change screen, go back to the confirm screen.

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";

        BRANCH Confirm-S;

    }

    STEP PerformHostEditsOnChange-P
    {
        USES P-STEP PerformHostEditsP;
        "4" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Change-S;


    STEP ConfirmAfterChange-S
    {
        USES S-STEP ConfirmS;

        # The "ButtonBarConfirm" buttonbar returns:
        # ACTION_CHANGE for Change (the default);
        # ACTION_BACK for Cancel
        # ACTION_CONFIRM   for Confirm;

        "ButtonBarConfirm" -> ButtonBar;
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
    IF action == "ACTION_CHANGE"
        BRANCH Change-S;



    # We want to know where we should return if the updateHost call fails.  If
    # DataWasChanged is TRUE then we'll return to the ConfirmAfterChange-S

    DataWasChanged = "TRUE";


    # User confirmed the changes, update the host 

    STEP UpdateHost-P
    {
        USES P-STEP UpdateHostP;
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
    {

        # If the user went through the change flow, then we go back to a different
        # S screen.

        IF DataWasChanged == "TRUE"
            BRANCH ConfirmAfterChange-S;


        BRANCH Confirm-S;

    }

    # The user will be returned to the first screen for input 
    # If the process was invoked from a list, return to the list

    IF DisplayInput == "FALSE"
        EXIT;

}

