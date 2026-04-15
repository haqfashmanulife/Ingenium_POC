# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF5000Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF5000-I.s";
INCLUDE "BF5000-P.p";
INCLUDE "BF5000Ann-O.s";
INCLUDE "BF5000Dis-O.s";
INCLUDE "BF5000Life-O.s";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF5000Retrieve
{

    # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF5000Retrieve;
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
        USES S-STEP "BF5000-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF5000-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;
        
#23774A CHANGES BEGIN

    temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;   
       
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO ->MIR-TRNX-DTL-INFO;  
    "I" -> MIR-LOG-LEVL-CD;
    
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;
        
#23774A CHANGES END   

    ButtonBar = "ButtonBarOK";


    # Determine if the policy is Life or Health or Annuity/Equity and display
    # on the appropriate Output page

    IF MIR-POL-BUS-CLAS-CD == "A" || MIR-POL-BUS-CLAS-CD == "E"
        BRANCH Output-A;

    IF MIR-POL-BUS-CLAS-CD == "H"
        BRANCH Output-H;


    STEP Output-L
    {
        USES S-STEP "BF5000Life-O";
    }

    EXIT;

    STEP Output-A
    {
        USES S-STEP "BF5000Ann-O";
    }

    EXIT;

    STEP Output-H
    {
        USES S-STEP "BF5000Dis-O";
    }

}

