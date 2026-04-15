# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF9F62Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP310A   CTS      INITIAL VERSION - NB IMPROVEMENTS                        *
#*  109606   CTS       CHANGES FOR SUB-TABLE1 FIELD                            *
#*******************************************************************************

INCLUDE "BF9F62-I.s";
INCLUDE "BF9F62-P.p";
INCLUDE "BF9F60-P.p";
INCLUDE "BF9F62-O.s";

PROCESS BF9F62Update
{
  VARIABLES
  {
    OUT temp-plan-id;
  }
    Title = STRINGTABLE.IDS_TITLE_BF9F62Update;
    TitleBar = "TitleBar";
    TitleBarSize = "70";

    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP Retrieve
    {
        USES P-STEP "BF9F60-P";
    }
    
    IF LSIR-RETURN-CD != "00"
       EXIT;    
        
    ButtonBar = "ButtonBarOKCancel";
    
    STEP INPUT-S
    {
        USES S-STEP "BF9F62-I";
    }    
    
    IF action == "ACTION_BACK"
        EXIT;
#109606 CHANGES START HERE 
    IF action == "ACTION_REFRESH"
        BRANCH INPUT-S;  
#109606 CHANGES ENDS HERE 	   
    # Edit the coverage details
    
    STEP Retrieve1
    {
        USES P-STEP "BF9F62-P";
        "1"  -> MIR-DV-PRCES-STATE-CD;
    }
    
    IF LSIR-RETURN-CD != "00"
        BRANCH INPUT-S;
    
    # Display the output of the update process
    
    STEP Output
    {
        USES S-STEP "BF9F62-O";
    }
    
    IF action == "ACTION_BACK"
       BRANCH INPUT-S;
    
    # Update the record who's date was just entered.
    
    STEP Update
    {
        USES P-STEP "BF9F62-P";
        "2"  -> MIR-DV-PRCES-STATE-CD;
    }
     temp-plan-id=MIR-PLAN-ID-T[1];
     TRACE("temp-plan-id"+temp-plan-id);
    IF LSIR-RETURN-CD != "00"
       BRANCH INPUT-S;
}
