# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1030Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1030-P.p";
INCLUDE "BF1030-I.s";
INCLUDE "BF1030-O.s";
# 23774A CHANGES BEGIN
# INCLUDE "GenRetrieve.f";
# INCLUDE "BFRetrieveAudBnk.f";
INCLUDE "BF9G99-P.p";
# 23774A CHANGES END

PROCESS BF1030Retrieve
{
#* 23774A CHANGES START
#    STEP Main
#    {
#* 23774A   USES PROCESS "GenRetrieve";
#           USES PROCESS "BFRetrieveAudBnk";   
#* 23774A CHANGES END
#
#       ATTRIBUTES
#       {
#           GetMessages = "NO";
#       }
#
#       STRINGTABLE.IDS_TITLE_BF1030Retrieve -> Title;
#       "BF1030-I" -> InputS;
#       "BF1030-P" -> RetrieveP;
#       "BF1030-O" -> OutputS;
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

    Title = STRINGTABLE.IDS_TITLE_BF1030Retrieve;     
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
        USES S-STEP "BF1030-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF1030-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    temp-DTL-INFO  = MIR-BNK-ID + " " + MIR-BNK-BR-ID + " " + MIR-BNK-ACCT-ID;   


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
        USES S-STEP "BF1030-O";
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;

    BRANCH Input;

#* 23774A CHANGES END

}

