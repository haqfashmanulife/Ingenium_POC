# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   BF0711Quote.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  611J     Code cleanup                                              *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*                                                                             *
#*******************************************************************************

PROCESS BF0711Quote
{

    # the action that will be returned to the wrapper flow

  VARIABLES
  {
      OUT action;
      OUT DisplayInput;
  }

    Title = STRINGTABLE.IDS_TITLE_BF0711Create;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # This separate flow was created because there was a need to return the user to
    # the input screen without the variables carrying the last entered data (due to
    # the Implicit command in the input step).
    # Enter the key(s) for the value that you'd like to create

    STEP Input
    {
        USES S-STEP "BF0711-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Input;


    # Step 1: Loop within Input Screen until 'Save File' has been requested.
    #         If 'Save File' has not been successful stay within Input Loop.
    # If 'Save File' has not been requested do:
    #    1) Call to Server
    #    2) Return back to BF0711-I

    IF MIR-DV-FILE-RQST-CD != "Y"
    {

        # Call to Server to Process Data.

        STEP BF0711-P-N
        {
            USES P-STEP "BF0711-P";
        }

        IF LSIR-RETURN-CD != "00"
            BRANCH Input;

        IF action == "ACTION_BACK"
            EXIT;

        IF action == "ACTION_REFRESH"
            BRANCH Input;



        # Go back to Create Input Screen.

        BRANCH Input;

    }


    # If 'Save File' has been requested do:
    #    1) Call to Server
    #    2) Check Result
    #    3) if OK, go to Step 2, if not OK return to BF0711-I
    # Call to Server to Process Data.

    STEP BF0711-P-Y
    {
        USES P-STEP "BF0711-P";
    }


    # Go back to Input Screen if Return Code is not 0.

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Input;



    # Display the output of the update process

    STEP Output
    {
        USES S-STEP "BF0711-O";
    }

    IF action == "ACTION_BACK"
        EXIT;

}

