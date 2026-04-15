# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   GenCopy.f                                                     *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*                                                                             *
#*******************************************************************************

PROCESS GenCopy
{

    # Title for the process

  VARIABLES
  {
      IN Title;

    # Name of the S that will collect the key information

    IN InputS;


    # Name of the P that will perform the copy

    IN CopyP;



    # the action that will be returned to the wrapper flow

    OUT action;

  }
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user which record they want to change

    STEP Input
    {
        USES S-STEP InputS;
    }


    # The user has indicated that they want to get out.

    IF action == "ACTION_BACK"
        EXIT;

    # Invoke the function that will perform the copy

    STEP Copy
    {
        USES P-STEP CopyP;
    }


    # Go back to the input screen to start another copy

    BRANCH Input;
}

