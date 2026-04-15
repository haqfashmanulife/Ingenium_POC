# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   GenConfrmChgBack.f                                            *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP4FB1  H.L      New for Firm banking                                      *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*  4-0001  SUG      Change to make "Firm Banking" the default payout method   *
#*                                                                             *
#*******************************************************************************
#  This is a generic process that will implement the confirm process where the change function does not allow the user to #  change all of the fields that were input originally.
#  This process will enable user to either go back to datainput screen or jump back to first keyfield input screen.  
#  This process is cloned from GenConfrmChg with only change of buttonbar.                                           

PROCESS GenConfrmChgBack
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

    MIR-DV-TRNXT-PAYO-MTHD-CD = "F";

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

        # The "ButtonBarConfirmBack" buttonbar returns:
        # ACTION_CHANGE for Change (the default);
        # ACTION_BACK for Cancel
        # ACTION_CONFIRM   for Confirm;
        # ACTION_PREVIOUS   for Back;

        "ButtonBarConfirmBack" -> ButtonBar;
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

            BRANCH KeyFields-S;

        }
        ELSE
        {
            IF InitialState == "1"
                BRANCH KeyFields-S;

            ELSE
                EXIT;


        }
    }


    # If the user selects Back on the Confirm page, return to the DataInput page.

    IF action == "ACTION_PREVIOUS"
    {
        MESSAGES-T[0] = "";

        BRANCH DataInput-S;

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

        # The "ButtonBarConfirmBack" buttonbar returns:
        # ACTION_CHANGE for Change (the default);
        # ACTION_BACK for Cancel
        # ACTION_CONFIRM   for Confirm;

        "ButtonBarConfirmBack" -> ButtonBar;
        Phase3Title -> Title;
    }


    # Choosing a different language from the title bar takes the user
    # back to the same page with the new language.

    # If the user selects Cancel on the Confirm page, return to the DataInput page.

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

