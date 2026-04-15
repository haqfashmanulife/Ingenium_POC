# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1190Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1190-P.p";
INCLUDE "BF1190-I.s";
INCLUDE "BF1190-O.s";
# 23774A CHANGES BEGIN
#INCLUDE "GenRetrieve.f";
#INCLUDE "GenRetrieveAudCli.f";
INCLUDE "BF9G99-P.p";
# 23774A CHANGES END

PROCESS BF1190Retrieve
{
# 23774A CHANGES BEGIN
    IF DisplayInput == "FALSE"
        BRANCH Input;



    # Set One of the Radio Buttons As Default
    # Underwriting Requirements = 1
    # Issue Requirements = 2

    ReqtType = 1;

#    STEP Main
#    {
#           USES PROCESS "GenRetrieve";
#           USES PROCESS "GenRetrieveAudCli";   
#
#       ATTRIBUTES
#       {
#           GetMessages = "NO";
#       }
#
#       STRINGTABLE.IDS_TITLE_BF1190Retrieve -> Title;
#       "BF1190-I" -> InputS;
#       "BF1190-P" -> RetrieveP;
#       "BF1190-O" -> OutputS;
#   }

    
    Title = STRINGTABLE.IDS_TITLE_BF1190Retrieve;     
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
        USES S-STEP "BF1190-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF1190-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    STEP AudOutput
    {
        USES P-STEP "BF9G99-P";
        SESSION.MIR-USER-ID -> MIR-USER-ID;
        SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;
        MIR-CLI-ID  ->MIR-TRNX-DTL-INFO;
        "I" -> MIR-LOG-LEVL-CD;        
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    ButtonBar = "ButtonBarOK";


    # Display the record retrieved

    STEP Output
    {
        USES S-STEP "BF1190-O";
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;

    BRANCH Input;
   
# 23774A CHANGES ENDS

}

