# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9410Retrieve.f                                              *
#*  Description: Inquiry function for Daily MCL GL Account Balance             *
#*                                                                             *
#*******************************************************************************
#*  Date    Author  Description                                                *
#*                                                                             *
#*  12DEC93 CLB     NEW FOR M26                                                *
#*  23774A  CTS      AUDIT LOG RELATED CHANGES                                 *
#*******************************************************************************

INCLUDE "BF9410-P.p";
INCLUDE "BF9410-I.s";
INCLUDE "BF9410-O.s";
#23774A CHANGE STARTS
#INCLUDE "GenRetrieve.f";
INCLUDE "BF9G99-P.p";
#23774A CHANGE ENDS

PROCESS BF9410Retrieve
{
#23774A CHANGE STARTS
#    STEP Main
#    {
#        USES PROCESS "GenRetrieve";
#        ATTRIBUTES
#        {
#            GetMessages = "NO";
#        }
#
#        STRINGTABLE.IDS_TITLE_BF9410Retrieve -> Title;
#        "BF9410-I" -> InputS;
#        "BF9410-P" -> RetrieveP;
#        "BF9410-O" -> OutputS;
#    }
#
#    IF DisplayInput == "FALSE"
#        EXIT;
#
#    IF action == "ACTION_BACK"
#        EXIT;
#
#
#    BRANCH Main;

    Title = STRINGTABLE.IDS_TITLE_BF9410Retrieve;     
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
        USES S-STEP "BF9410-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF9410-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    
    STEP AudOutput
    {
        USES P-STEP "BF9G99-P";
        SESSION.MIR-USER-ID -> MIR-USER-ID;
        SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;
        MIR-MCL-ACCT-BASE-ID ->MIR-TRNX-DTL-INFO;
        "I" -> MIR-LOG-LEVL-CD;        
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    ButtonBar = "ButtonBarOK";


    # Display the record retrieved

    STEP Output
    {
        USES S-STEP "BF9410-O";
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;

    BRANCH Input;

#23774A CHANGE ENDS 

}

