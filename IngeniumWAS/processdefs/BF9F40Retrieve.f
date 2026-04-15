# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9F40Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP310A   CTS      INITIAL VERSION - NB IMPROVEMENTS                        *
#*  MP310B   CTS      Changes done as part of MP310B - NB IMPROVEMENTS         *       
#*******************************************************************************


INCLUDE "BF9F40-P.p";
INCLUDE "BF9F40-O.s";

PROCESS BF9F40Retrieve
{

    # Set value that will be used in the flow

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

    # Retrieve the data for the key value

    STEP Retrieve
    {
       
        USES P-STEP "BF9F40-P";
        
    }
  
    IF LSIR-RETURN-CD != "00"
        EXIT;    
    
    ButtonBar = "ButtonBarOK";


    # Display the output of the update process

    STEP Output
    {
        USES S-STEP "BF9F40-O";
#  MP310B - CHANGES STARTS HERE
#       STRINGTABLE.IDS_TITLE_BF9F42Input -> Title;
        STRINGTABLE.IDS_TITLE_BF9F40Input -> Title;        
#  MP310B - CHANGES ENDS HERE
    }

}