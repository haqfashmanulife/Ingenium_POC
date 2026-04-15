# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9677Update.f                                                *
#*  Description: Client Moral Risk Table (CLIM) Update function                *
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
INCLUDE "BF9677Update-I.s";
INCLUDE "BF9675Retrieve-O.s";
INCLUDE "BF9677Update-P.p";
# 23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
# 23774A CHANGES END

PROCESS BF9677Update
{
    Title = STRINGTABLE.IDS_TITLE_BF9677Update;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH RetrieveSetUp;



    # Enter the key(s) for the value that you'd like to create

    STEP Input
    {
        USES S-STEP "BF9675Retrieve-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Input;


    RetrieveSetUp:

    MIR-FTXT-TEXT-KEY = MIR-CLI-ID;
    MIR-FTXT-TEXT-TYP-CD = "MR";
    MIR-FTXT-TEXT-SEQ-NBR = "0001";


    # Retrieve the record 

    STEP Retrieve
    {
        USES P-STEP "BF9675Retrieve-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    STEP Edit
    {
        USES S-STEP "BF9677Update-I";
    }


    # If user selects Cancel and did not come from a list, then clear messages 
    # and branch back 1 step;
    # otherwise, exit to list.

    IF action == "ACTION_BACK"
    {
        IF DisplayInput != "FALSE"
        {
            ButtonBar = "ButtonBarOKCancel";
            MESSAGES-T[0] = "";

            BRANCH Input;

        }
        ELSE
            EXIT;


    }
    IF action == "ACTION_REFRESH"
        BRANCH Edit;



    # Update the record who's data was just entered.

    STEP Update
    {
        USES P-STEP "BF9677Update-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;

# 23774A CHANGES BEGIN
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    MIR-CLI-ID -> MIR-TRNX-DTL-INFO;    
    "C" -> MIR-LOG-LEVL-CD;    
    }
      
    IF LSIR-RETURN-CD != "00"
       BRANCH Edit;
        
# 23774A CHANGES END

    ButtonBar = "ButtonBarOK";


    # Display the output of the update process

    STEP Output
    {
        USES S-STEP "BF9675Retrieve-O";
    }

}

