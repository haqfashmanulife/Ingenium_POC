# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9890Retrieve.f                                              *
#*  Description: Disease/Surgery Retrieve function                             *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*  23774A  CTS      AUDIT LOG RELATED CHANGES                                 *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9890-P.p";
INCLUDE "BF9890-I.s";

# Output screens for Disease or Surgery

INCLUDE "BF9890D-O.s";
INCLUDE "BF9890S-O.s";

#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF9890Retrieve
{
    Title = STRINGTABLE.IDS_TITLE_BF9890Retrieve;
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
        USES S-STEP "BF9890-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF9890-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


# 23774A CHANGES BEGIN
    temp-DTL-INFO  = MIR-MEDIC-CD + " " + MIR-GRP-MEDC-ID;
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO -> MIR-TRNX-DTL-INFO;    
    "I" -> MIR-LOG-LEVL-CD;    
    }
      
    IF LSIR-RETURN-CD != "00"
        IF DisplayInput != "FALSE"
        {
            BRANCH Input;
        }
        ELSE
            EXIT;
        
# 23774A CHANGES END

    ButtonBar = "ButtonBarOK";


    # Determine if the record retrieved is Disease or Surgery and 
    # display on the appropriate Output page

    IF MIR-MEDIC-CD == "D"
    {
        OutputS = "BF9890D-O";
        Title = STRINGTABLE.IDS_TITLE_BF9890RetrieveD;

    }
    IF MIR-MEDIC-CD == "S"
    {
        OutputS = "BF9890S-O";
        Title = STRINGTABLE.IDS_TITLE_BF9890RetrieveS;

    }

    STEP Output
    {
        USES S-STEP OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;



    # Reset title and button bar and return to input step

    Title = STRINGTABLE.IDS_TITLE_BF9890Retrieve;
    ButtonBar = "ButtonBarOKCancel";

    BRANCH Input;
}

