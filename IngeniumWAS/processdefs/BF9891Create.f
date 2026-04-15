# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9891Create.f                                                *
#*  Description: Disease/Surgery Create function                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*  23774A  CTS      AUDIT LOG RELATED CHANGES                                 *
#*                                                                             *
#*******************************************************************************
# Input screen 

INCLUDE "BF9891-I.s";

# Create and Retrieve processes

INCLUDE "BF9891-P.p";
INCLUDE "BF9890-P.p";

# Edit screens for Disease or Surgery

INCLUDE "BF9892D-I.s";
INCLUDE "BF9892S-I.s";

# Update process

INCLUDE "BF9892-P.p";

# Output screens for Disease or Surgery

INCLUDE "BF9890D-O.s";
INCLUDE "BF9890S-O.s";

#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF9891Create
{
    Title = STRINGTABLE.IDS_TITLE_BF9891Create;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Enter the key(s) for the value that you'd like to create

    STEP Input
    {
        USES S-STEP "BF9891-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Input;



    # Create the new record

    MIR-MEDC-ID = " ";

    STEP Create
    {
        USES P-STEP "BF9891-P";
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
       BRANCH Input;
        
# 23774A CHANGES END

    # Retrieve the newly created record to ensure that we've got
    # the default values, if any.

    STEP Retrieve
    {
        USES P-STEP "BF9890-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    # Determine if the record is Disease or Surgery and use the 
    # appropriate Edit and Output pages

    IF MIR-MEDIC-CD == "D"
    {
        EditS = "BF9892D-I";
        OutputS = "BF9890D-O";
        Title = STRINGTABLE.IDS_TITLE_BF9891CreateD;

    }
    IF MIR-MEDIC-CD == "S"
    {
        EditS = "BF9892S-I";
        OutputS = "BF9890S-O";
        Title = STRINGTABLE.IDS_TITLE_BF9891CreateS;

    }

    STEP Edit
    {
        USES S-STEP EditS;
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



    # Perform Update

    STEP Update
    {
        USES P-STEP "BF9892-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;


    ButtonBar = "ButtonBarOK";


    # Display the output of the update process

    STEP Output
    {
        USES S-STEP OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;



    # Reset title and button bar and return to input step

    Title = STRINGTABLE.IDS_TITLE_BF9891Create;
    ButtonBar = "ButtonBarOKCancel";

    BRANCH Input;
}

