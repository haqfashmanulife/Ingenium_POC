# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT
#*******************************************************************************
#*  Component:   BF9F11Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP310A   CTS      INITIAL VERSION - NB IMPROVEMENTS                        *
#*******************************************************************************
INCLUDE "BF1580-P.p";
INCLUDE "BF1581-P.p";
INCLUDE "BF1582-I.s";
INCLUDE "BF1580-O.s";
INCLUDE "BF1582-P.p";


PROCESS BF9F11Create
{

    # Title of the process


  VARIABLES
  {
      
    # Name of S Step where user enters the record key

    OUT action;

  }
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Enter the key(s) for the value that you'd like to create


    # Create the new record

    STEP Create
    {
        USES P-STEP "BF1581-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;



    # Retrieve the newly created record to ensure that we've got the default
    # values, if any.

    STEP Retrieve
    {
        USES P-STEP "BF1580-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;



    # Edit the new record

    STEP Edit
    {
        USES S-STEP "BF1582-I";
STRINGTABLE.IDS_TITLE_BF1581Create -> Title;
    }


    # If user selects Cancel and did not come from a list, then clear messages 
    # and branch back 1 step;
    # otherwise, exit to list.

    IF action == "ACTION_BACK"
    {
        IF DisplayInput != "FALSE"
        {
            ButtonBar = "ButtonBarOKCancel";
            MESSAGES-T[0] = "";

            BRANCH Input;

        }
        ELSE
            EXIT;


    }
    IF action == "ACTION_REFRESH"
        BRANCH Edit;



    # Update the record who's data was just entered.

    STEP Update
    {
        USES P-STEP "BF1582-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;


    ButtonBar = "ButtonBarOK";


    # Display the output of the update process

    STEP Output
    {
        USES S-STEP "BF1580-O";
STRINGTABLE.IDS_TITLE_BF1581Create -> Title;
    }

}

