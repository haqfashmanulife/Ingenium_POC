#*******************************************************************************
#*  Component:   BF9930Inquiry.f                                               *
#*  Description:   Adjudicator ID Inquiry                                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN000388  CTS   INITIAL VERSION                                            *
#*  23774A  CTS      AUDIT LOG RELATED CHANGES                                 *
#*                                                                             *
#*******************************************************************************



INCLUDE "BF9930-P.p";
INCLUDE "BF9930-I.s";
INCLUDE "BF9930-O.s";
#23774A CHANGE STARTS
#INCLUDE "GenRetrieve.f";
INCLUDE "BF9G99-P.p";
#23774A CHANGE ENDS

PROCESS BF9930Inquiry
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
#        STRINGTABLE.IDS_TITLE_BF9930Inquiry -> Title;
#        "BF9930-I" -> InputS;
#        "BF9930-P" -> RetrieveP;
#        "BF9930-O" -> OutputS;
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

    Title = STRINGTABLE.IDS_TITLE_BF9930Inquiry;     
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
        USES S-STEP "BF9930-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF9930-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    temp-DTL-INFO  = MIR-BR-ID + " " + MIR-SO-ID;   


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
        USES S-STEP "BF9930-O";
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;

    BRANCH Input;

#23774A CHANGE ENDS    

}
