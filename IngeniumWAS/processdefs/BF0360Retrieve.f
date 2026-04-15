# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0360Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  23774A  CTS      AUDIT LOG RELATED CHANGES                                 *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0360-P.p";
INCLUDE "BF0360-I.s";
INCLUDE "BF0360-O.s";
#23774A CHANGE STARTS
#INCLUDE "GenRetrieve.f";
INCLUDE "BF9G99-P.p";
#23774A CHANGE ENDS
PROCESS BF0360Retrieve
{
#23774A CHANGE STARTS
#   STEP Main
#   {
#       USES PROCESS "GenRetrieve";
#       ATTRIBUTES
#       {
#           GetMessages = "NO";
#       }
#
#       STRINGTABLE.IDS_TITLE_BF0360Retrieve -> Title;
#       "BF0360-I" -> InputS;
#       "BF0360-P" -> RetrieveP;
#       "BF0360-O" -> OutputS;
#   }
#
#   IF DisplayInput == "FALSE"
#       EXIT;
#
#   IF action == "ACTION_BACK"
#       EXIT;
#
#
#   BRANCH Main;

    Title = STRINGTABLE.IDS_TITLE_BF0360Retrieve;     
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
        USES S-STEP "BF0360-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF0360-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    STEP AudOutput
    {
        USES P-STEP "BF9G99-P";
        SESSION.MIR-USER-ID -> MIR-USER-ID;
        SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;
        MIR-CCAS-TST-ID    ->MIR-TRNX-DTL-INFO;
        "C" -> MIR-LOG-LEVL-CD;        
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    ButtonBar = "ButtonBarOK";


    # Display the record retrieved

    STEP Output
    {
        USES S-STEP "BF0360-O";
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;

    BRANCH Input;

#23774A CHANGE ENDS    

}

