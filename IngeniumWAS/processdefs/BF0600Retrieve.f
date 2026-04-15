# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0600Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP - chg update output step to retrieve output  *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0600-P.p";
INCLUDE "BF0600-I.s";
INCLUDE "BF0600-O.s";
# 23774A CHANGES BEGIN
#INCLUDE "GenRetrieve.f";
#INCLUDE "GenRetrieveAudCli.f";
INCLUDE "BF9G99-P.p";
# 23774A CHANGES END

PROCESS BF0600Retrieve
{
# 23774A CHANGES BEGIN
#    STEP Main
#    {
#          USES PROCESS "GenRetrieve";
#          USES PROCESS "GenRetrieveAudCli";   
#
#       ATTRIBUTES
#       {
#           GetMessages = "NO";
#       }
#
#       STRINGTABLE.IDS_TITLE_BF0600Retrieve -> Title;
#       "BF0600-I" -> InputS;
#       "BF0600-P" -> RetrieveP;
#       "BF0600-O" -> OutputS;
#   }

    
    Title = STRINGTABLE.IDS_TITLE_BF0600Retrieve;     
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
        USES S-STEP "BF0600-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF0600-P";
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
        USES S-STEP "BF0600-O";
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;

    BRANCH Input;
   
# 23774A CHANGES ENDS

}

