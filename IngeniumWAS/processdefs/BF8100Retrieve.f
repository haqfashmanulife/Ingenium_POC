# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF8100Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF8100-P.p";
INCLUDE "BF8100-I.s";
INCLUDE "BF8100-O.s";
# 23774A CHANGES BEGIN
# INCLUDE "GenRetrieve.f";
#INCLUDE "BFRetrieveAudDat.f";
INCLUDE "BF9G99-P.p";
# 23774A CHANGES END

PROCESS BF8100Retrieve
{
#* 23774A CHANGES START
#    STEP Main
#    {
#* 23774A CHANGES START
#* 23774A   USES PROCESS "GenRetrieve";
#           USES PROCESS "BFRetrieveAudDat";   
#* 23774A CHANGES END
#
#       ATTRIBUTES
#       {
#           GetMessages = "NO";
#       }
#
#       STRINGTABLE.IDS_TITLE_BF8100Retrieve -> Title;
#       "BF8100-I" -> InputS;
#       "BF8100-P" -> RetrieveP;
#       "BF8100-O" -> OutputS;
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

    Title = STRINGTABLE.IDS_TITLE_BF8100Retrieve;     
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
        USES S-STEP "BF8100-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF8100-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    temp-DTL-INFO  = MIR-DM-AV-TBL-CD + " " + MIR-DM-AV-CD + " " + MIR-DM-AV-DESC-LANG-CD;   


    STEP AudOutput
    {
        USES P-STEP "BF9G99-P";
        SESSION.MIR-USER-ID -> MIR-USER-ID;
        SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;
        temp-DTL-INFO  ->MIR-TRNX-DTL-INFO;
        "I" -> MIR-LOG-LEVL-CD;        
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    ButtonBar = "ButtonBarOK";


    # Display the record retrieved

    STEP Output
    {
        USES S-STEP "BF8100-O";
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;

    BRANCH Input;

#* 23774A CHANGES END

}

