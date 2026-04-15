# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9F42Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP310A   CTS      INITIAL VERSION - NB IMPROVEMENTS                        *
#*******************************************************************************


INCLUDE "BF9F40-P.p";
INCLUDE "BF9F42-P.p";
INCLUDE "BF9F40-O.s";
INCLUDE "BF9F42-I.s";
     
PROCESS BF9F42Update
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
    
    ButtonBar = "ButtonBarOKCancel";
   
    STEP Input
    {
       
        USES S-STEP "BF9F42-I";
        STRINGTABLE.IDS_TITLE_BF9F42Input -> Title;
    }
    
    IF action == "ACTION_BACK"
      EXIT;
    
    # Process recalculate.
    
    MIR-DV-PRCES-STATE-CD = "0";
    IF action == "SelectItem"
    {
    STEP Recalculate
    {
        USES P-STEP "BF9F42-P";
        "1" -> MIR-DV-PRCES-STATE-CD;
    }
     BRANCH Input;
    }
    IF LSIR-RETURN-CD != "00"
        BRANCH Input;
    
    # Update the record .

    STEP Update
    {
        USES P-STEP "BF9F42-P";
    }
    
    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    STEP Output
    {
        USES S-STEP "BF9F40-O";      
        STRINGTABLE.IDS_TITLE_BF9F42Input -> Title;
    }
    IF action == "ACTION_BACK"
       BRANCH Input;
       
}