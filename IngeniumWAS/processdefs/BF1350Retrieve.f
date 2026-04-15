# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1350Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  01AD25  BMB      Change flow to handle more than 20 coverages              *
#*                   GenRetrieve removed in favour of explicit coding          *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1350-P.p";
INCLUDE "BF1350-I.s";
INCLUDE "BF1350-O.s";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF1350Retrieve
{
    Title = STRINGTABLE.IDS_TITLE_BF1350Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBar";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;



    # Collect the key value 

    STEP Input
    {
        USES S-STEP "BF1350-I";
        "ButtonBarOKCancel" -> ButtonBar;
    }


    # If the user hit Cancel, return to menu.

    IF action == "ACTION_BACK"
        EXIT;

    # set start value for coverage display

    MIR-CVG-NUM = "01";


    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF1350-P";
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

    ButtonBar = "ButtonBarOKCancelMore";


    # Display the record retrieved

    STEP Output
    {
        USES S-STEP "BF1350-O";
    }

    IF DisplayInput == "FALSE"
        EXIT;


    # If the user hit Cancel, return to menu.

    IF action == "ACTION_BACK"
        EXIT;


    # If the user hit More, refresh the screen with more data

    IF action == "ACTION_MORE"
    {
        BRANCH Retrieve;

    }

    # If the user hits Ok or enter, go get more key data for another policy

    IF action == "ACTION_NEXT"
    {
        BRANCH Input;

    }
}

