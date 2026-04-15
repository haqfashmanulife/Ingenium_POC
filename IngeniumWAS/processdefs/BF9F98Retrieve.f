# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF9F98RETRIEVE.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  CA0002  CTS      CWA REFUND/REJECTION REQUEST INQUIRY SCREEN               *
#*  105530  CTS      FIX DONE FOR CWA REFUND/REJECTION REQUEST INQUIRY SCREEN  *
#*  105532  CTS      FIX DONE FOR CWA REFUND/REJECTION REQUEST INQUIRY SCREEN  *
#*                   PREVIOUS BUTTON FIX                                       *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*******************************************************************************

INCLUDE "BF9F98-I.s";
INCLUDE "BF9F98-P.p";
INCLUDE "BF9F98-O.s";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF9F98Retrieve
{
 # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF9F98Retrieve;
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
        USES S-STEP "BF9F98-I";
        STRINGTABLE.IDS_TITLE_BF9F98Input -> Title;
    }

    IF action == "ACTION_BACK"
        EXIT;
    
    # 105532 CHANGES STARTS
    # MIR-RECORD-CTR ="000";
      FLOW-PAGE = 1;
    # 105532 CHANGES ENDS
    # Retrieve the data for the key value
    
    STEP Retrieve
    {
        USES P-STEP "BF9F98-P";
    }
    
    IF LSIR-RETURN-CD != "00"
    BRANCH Input;

    
    STEP Output
    {
    USES S-STEP "BF9F98-O";
    STRINGTABLE.IDS_TITLE_BF9F98Output -> Title;
    "ButtonBarOkBackNext" -> ButtonBar;
    }
    
    IF action == "ACTION_NEXT" 
    {
#105530 CHANGES STARTS HERE
        MESSAGES-T[0] = "";
#105530 CHANGES ENDS HERE  
        
# 23774A CHANGES BEGIN

    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    MIR-POL-APP-FORM-ID -> MIR-TRNX-DTL-INFO;    
    "I" -> MIR-LOG-LEVL-CD;    
    }
# 23774A CHANGES END
          
    BRANCH Input;       
    }

    IF action == "ACTION_PREV"
    {
    # 105532 CHANGES STARTS
    #  MIR-RECORD-CTR-N = MIR-RECORD-CTR-N - 010 ;
    #  IF  MIR-RECORD-CTR-N < 0 
    #      MIR-RECORD-CTR-N = 0;
       FLOW-PAGE = FLOW-PAGE - 1;
       MIR-RECORD-CTR-N = SAVE-RECORD-CTR[FLOW-PAGE];
    # 105532 CHANGES ENDS
       BRANCH Retrieve;
    }    
        
    IF action == "ACTION_MORE" 
    # 105532 CHANGES STARTS
    #   BRANCH Retrieve;
    {
        FLOW-PAGE = FLOW-PAGE + 1;
        SAVE-RECORD-CTR[FLOW-PAGE] = MIR-RECORD-CTR-N;
        BRANCH Retrieve;
    }
    # 105532 CHANGES ENDS
}
    

