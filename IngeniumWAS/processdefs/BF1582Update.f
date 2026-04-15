# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1582Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1580-P.p";
INCLUDE "BF1580-I.s";
INCLUDE "BF1582-I.s";
INCLUDE "BF1580-O.s";
INCLUDE "BF1582-P.p";
# 23774A CHANGES BEGIN
#INCLUDE "GenUpdate.f";
INCLUDE "BF9G99-P.p";
# 23774A INCLUDE "GenUpdateAud.f";
# 23774A CHANGES END

PROCESS BF1582Update
{
# 23774A CHANGES BEGIN
#    STEP Main
#    {
#         USES PROCESS "GenUpdate";        
#        USES PROCESS "GenUpdateAud";
#       ATTRIBUTES
#       {
#           GetMessages = "NO";
#       }
#
#       STRINGTABLE.IDS_TITLE_BF1582Update -> Title;
#       "BF1580-I" -> InputS;
#       "BF1580-P" -> RetrieveP;
#       "BF1582-I" -> EditS;
#       "BF1582-P" -> UpdateP;
#       "BF1580-O" -> OutputS;
#   }

    Title = STRINGTABLE.IDS_TITLE_BF1582Update;     
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
        USES S-STEP "BF1580-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Input;



    # Retrieve the record 

    STEP Retrieve
    {
        USES P-STEP "BF1580-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    STEP Edit
    {
        USES S-STEP "BF1582-I";
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
        USES P-STEP "BF1582-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;

    temp-DTL-INFO  =  MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;



    STEP AudOutput
    {
        USES P-STEP "BF9G99-P";

    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO  -> MIR-TRNX-DTL-INFO;
    "C" -> MIR-LOG-LEVL-CD;
    }


    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;

    ButtonBar = "ButtonBarOK";


    # Display the output of the update process

    STEP Output
    {
        USES S-STEP "BF1580-O";
    }
        
        
    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT; 
        
    BRANCH Input;                

# 23774A CHANGES ENDS
    
}
