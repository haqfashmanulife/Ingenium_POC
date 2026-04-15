# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9675Retrieve.f                                              *
#*  Description: Client Moral Risk Table (CLIM) Retrieve function              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL110  HIN/CL   CLAIM REQUIREMENTS                                        *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9675Retrieve-P.p";
INCLUDE "BF9675Retrieve-I.s";
INCLUDE "BF9675Retrieve-O.s";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF9675Retrieve
{
    Title = STRINGTABLE.IDS_TITLE_BF9675Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH RetrieveSetUp;



    # Collect the key value 

    STEP Input
    {
        USES S-STEP "BF9675Retrieve-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    RetrieveSetUp:

    MIR-FTXT-TEXT-KEY = MIR-CLI-ID;
    MIR-FTXT-TEXT-TYP-CD = "MR";
    MIR-FTXT-TEXT-SEQ-NBR = "0001";


    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF9675Retrieve-P";
    }
    
    IF LSIR-RETURN-CD != "00"
        BRANCH Input;
        
#23774A CHANGES BEGIN

       
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    MIR-CLI-ID -> MIR-TRNX-DTL-INFO;  
    "I" -> MIR-LOG-LEVL-CD;
    
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;
        
#23774A CHANGES END   



    ButtonBar = "ButtonBarOK";


    # Display the record retrieved

    STEP Output
    {
        USES S-STEP "BF9675Retrieve-O";
    }

}

