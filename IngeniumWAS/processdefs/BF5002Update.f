# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF5002Update.f                                                *
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
INCLUDE "BF5002Ann-I.s";
INCLUDE "BF5002Life-I.s";
INCLUDE "BF5002Dis-I.s";
INCLUDE "BF5002-P.p";
INCLUDE "BF5003-P.p";
INCLUDE "BF5000Ann-O.s";
INCLUDE "BF5000Life-O.s";
INCLUDE "BF5000Dis-O.s";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF5002Update
{
    Title = STRINGTABLE.IDS_TITLE_BF5002Update;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Enter the Policy ID of the policy to be updated 

    STEP Input
    {
        USES S-STEP "BF5000-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Retrieve the policy record

    STEP BF5000-P
    {
        USES P-STEP "BF5000-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    UpdatePrcesI = "BF5002Life-I";
    UpdatePrcesO = "BF5000Life-O";


    # Determine if the policy is Life or Health or Annuity/Equity and display
    # the appropriate Input page

    IF MIR-POL-BUS-CLAS-CD == "A" || MIR-POL-BUS-CLAS-CD == "E"
    {
        UpdatePrcesI = "BF5002Ann-I";
        UpdatePrcesO = "BF5000Ann-O";

    }
    IF MIR-POL-BUS-CLAS-CD == "H"
    {
        UpdatePrcesI = "BF5002Dis-I";
        UpdatePrcesO = "BF5000Dis-O";

    }


    # Display the retrieved record

    STEP Update-I
    {
        USES S-STEP UpdatePrcesI;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Update-I;



    # Process Update

    STEP Update-P
    {
        USES P-STEP "BF5002-P";
    }


    IF LSIR-RETURN-CD != "00"
        BRANCH Update-I;
        
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
        BRANCH Update-I;
        
#23774A CHANGES END

    IF MIR-POL-CSTAT-CD != "C"
        BRANCH Output;



    # Display output from update

    STEP Update-O
    {
        USES S-STEP UpdatePrcesO;
        "ButtonBarSettleCancel" -> ButtonBar;
    }

    IF action == "ACTION_BACK"
        EXIT;



    # Process Settle	

    STEP Settle-P
    {
        USES P-STEP "BF5003-P";
    }


    # Display output from settle

    STEP Output
    {
        USES S-STEP UpdatePrcesO;
        "ButtonBarOK" -> ButtonBar;
    }

}

