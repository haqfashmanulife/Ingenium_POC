# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9892Update.f                                                *
#*  Description: Disease/Surgery Update function                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*  23774A  CTS      AUDIT LOG RELATED CHANGES                                 *
#*                                                                             *
#*******************************************************************************
# Input screen 

INCLUDE "BF9890-I.s";

# Retrieve process

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

PROCESS BF9892Update
{
    Title = STRINGTABLE.IDS_TITLE_BF9892Update;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;



    # Enter the key(s) for the value that you'd like to create

    STEP Input
    {
        USES S-STEP "BF9890-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Input;



    # Retrieve the record 

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
        Title = STRINGTABLE.IDS_TITLE_BF9892UpdateD;

    }
    IF MIR-MEDIC-CD == "S"
    {
        EditS = "BF9892S-I";
        OutputS = "BF9890S-O";
        Title = STRINGTABLE.IDS_TITLE_BF9892UpdateS;

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



    # Perform update

    STEP Update
    {
        USES P-STEP "BF9892-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;


# 23774A CHANGES BEGIN
    temp-DTL-INFO  = MIR-MEDIC-CD + " " + MIR-GRP-MEDC-ID;
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO -> MIR-TRNX-DTL-INFO;    
    "C" -> MIR-LOG-LEVL-CD;    
    }
      
    IF LSIR-RETURN-CD != "00"
       BRANCH ListStart;
        
# 23774A CHANGES END


    ButtonBar = "ButtonBarOK";


    # Display the output of the update process

    STEP Output
    {
        USES S-STEP OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;



    # Reset title and button bar and return to input step

    Title = STRINGTABLE.IDS_TITLE_BF9892Update;
    ButtonBar = "ButtonBarOKCancel";

    # BRANCH Input;

}

