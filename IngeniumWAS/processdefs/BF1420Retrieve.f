# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1420Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  23774A  CTS      Audit Log Related Changes                                 *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1420-P.p";
INCLUDE "BF1420-I.s";
INCLUDE "BF1420-O.s";
#23774A CHANGES BEGIN
#INCLUDE "GenRetrieve.f";
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF1420Retrieve
{
#23774A CHANGES BEGIN
#   STEP Main
#   {
#       USES PROCESS "GenRetrieve";
#       ATTRIBUTES
#       {
#           GetMessages = "NO";
#       }
#
#       STRINGTABLE.IDS_TITLE_BF1420Retrieve -> Title;
#       "BF1420-I" -> InputS;
#       "BF1420-P" -> RetrieveP;
#       "BF1420-O" -> OutputS;        
#   }
#
#    IF DisplayInput == "FALSE"
#        EXIT;
#
#    IF action == "ACTION_BACK"
#        EXIT;
#
#
#    BRANCH Main;

    Title = STRINGTABLE.IDS_TITLE_BF1420Retrieve;     
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
               
    IF DisplayInput == "FALSE"
        BRANCH Retrieve;

    # Collect the key value 

    STEP Input
    {
        USES S-STEP "BF1420-I";
    }
    
    IF action == "ACTION_BACK"
        EXIT;

    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF1420-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;
    
    STEP AudOutput
    {
        USES P-STEP "BF9G99-P";      
        SESSION.MIR-USER-ID -> MIR-USER-ID;
        SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;
        MIR-AGT-ID  ->MIR-TRNX-DTL-INFO;
        "I" -> MIR-LOG-LEVL-CD;    
    }
     
    IF LSIR-RETURN-CD != "00"
        BRANCH Main;
            
        
    ButtonBar = "ButtonBarOK";

    # Display the record retrieved

    STEP Output
    {
        USES S-STEP "BF1420-O";
    }
  
    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Input;
    
#23774A CHANGES END
    
}

