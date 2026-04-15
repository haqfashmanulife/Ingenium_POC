# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT
#*******************************************************************************
#*  Component:   BF9F10Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP310A   CTS      INITIAL VERSION - NB IMPROVEMENTS                        *
#*******************************************************************************
INCLUDE "BF1580-P.p";
INCLUDE "BF1580-O.s";


PROCESS BF9F10Retrieve
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



    STEP Retrieve
    {
        USES P-STEP "BF1580-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH EXIT;

    ButtonBar = "ButtonBarOK";


    # Display the output of the update process

    STEP Output
    {
        USES S-STEP "BF1580-O";
STRINGTABLE.IDS_TITLE_BF1581Create -> Title;
    }

}

