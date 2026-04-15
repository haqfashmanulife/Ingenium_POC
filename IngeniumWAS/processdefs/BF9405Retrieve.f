# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9405Retrieve.f                                              *
#*  Description: Bulk Application Inquiry Screen Retrieve function             *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  MP176B  CTS      Intial Version                                            *
#*  23774A  CTS      AUDIT LOG RELATED CHANGES                                 *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9405-I.s";
INCLUDE "BF9405-P.p";
INCLUDE "BF9405-O.s";
#23774A CHANGE STARTS
#INCLUDE "GenRetrieveMore.f";
INCLUDE "BF9G99-P.p";
#23774A CHANGE ENDS

PROCESS BF9405Retrieve
{
#23774A CHANGE STARTS
#   STEP Main
#   {
#       USES PROCESS "GenRetrieveMore";
#       ATTRIBUTES
#       {
#           GetMessages = "NO";
#       }
#
#       STRINGTABLE.IDS_TITLE_BF9405Retrieve -> Title;
#       "BF9405-I" -> InputS;
#       "BF9405-P" -> RetrieveP;
#       "BF9405-O" -> OutputS;
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

    Title = STRINGTABLE.IDS_TITLE_BF9405Retrieve;     
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
        USES S-STEP "BF9405-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF9405-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    STEP AudOutput
    {
        USES P-STEP "BF9G99-P";

    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    MIR-POL-BULK-APP-ID  -> MIR-TRNX-DTL-INFO;
    "I" -> MIR-LOG-LEVL-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    ButtonBar = "ButtonBarOKCancelMore";


    # Display the record retrieved

    STEP Output
    {
        USES S-STEP "BF9405-O";
    }

    # This action signifies the users request to view more elements 

    IF action == "ACTION_MORE"
        BRANCH Retrieve;


    # This action signifies the users request to exit from this routine 

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;

    BRANCH Input;
        

#23774A CHANGE ENDS


}