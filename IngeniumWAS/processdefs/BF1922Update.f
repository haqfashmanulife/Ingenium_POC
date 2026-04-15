# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1922Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1920-I.s";
INCLUDE "BF1920-P.p";
INCLUDE "BF1922-I.s";
INCLUDE "BF1922-P.p";
INCLUDE "BF1920-O.s";
# 23774A CHANGES BEGIN
#INCLUDE "GenUpdate.f";
# 23774A INCLUDE "GenUpdateAudCli.f";
INCLUDE "BF9G99-P.p";
# 23774A CHANGES END

PROCESS BF1922Update
{
# 23774A CHANGES BEGIN
#    STEP Main
#    {
#         USES PROCESS "GenUpdate";        
# 23774A USES PROCESS "GenUpdateAudCli";
#       ATTRIBUTES
#       {
#           GetMessages = "NO";
#       }
#
#       STRINGTABLE.IDS_TITLE_BF1922Update -> Title;
#       "BF1920-I" -> InputS;
#       "BF1920-P" -> RetrieveP;
#       "BF1922-I" -> EditS;
#       "BF1922-P" -> UpdateP;
#       "BF1920-O" -> OutputS;
#   }


    Title = STRINGTABLE.IDS_TITLE_BF1922Update;     
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
        USES S-STEP "BF1920-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Input;



    # Retrieve the record 

    STEP Retrieve
    {
        USES P-STEP "BF1920-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    STEP Edit
    {
        USES S-STEP "BF1922-I";
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
        USES P-STEP "BF1922-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;

   
    STEP AudOutput
    {
        USES P-STEP "BF9G99-P";

    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    MIR-CLI-ID  -> MIR-TRNX-DTL-INFO;
    "I" -> MIR-LOG-LEVL-CD;
    }


    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;

    ButtonBar = "ButtonBarOK";


    # Display the output of the update process

    STEP Output
    {
        USES S-STEP "BF1920-O";
    }
        
        
    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT; 
        
    BRANCH Input;                

# 23774A CHANGES ENDS
    
}
