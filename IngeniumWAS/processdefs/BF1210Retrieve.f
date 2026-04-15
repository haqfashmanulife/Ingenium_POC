# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1210Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  MP214B  CTS      CHANGED GenRetrieve.f TO GenRetrieveMore.f                *
#*  23774A  CTS      AUDIT LOG RELATED CHANGES                                 *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1210-P.p";
INCLUDE "BF1210-I.s";
INCLUDE "BF1210-O.s";
#23774A CHANGE STARTS
#INCLUDE "GenRetrieveMore.f";
INCLUDE "BF9G99-P.p";
#23774A CHANGE ENDS

PROCESS BF1210Retrieve
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
#       STRINGTABLE.IDS_TITLE_BF1210Retrieve -> Title;
#       "BF1210-I" -> InputS;
#       "000" -> MIR-RTBL-AGE-DUR;
#       "999" -> MIR-DV-END-RTBL-AGE-DUR;
#       "BF1210-P" -> RetrieveP;
#       "BF1210-O" -> OutputS;
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

    MIR-RTBL-AGE-DUR = 000;
    MIR-DV-END-RTBL-AGE-DUR = 999;
    Title = STRINGTABLE.IDS_TITLE_BF1210Retrieve;
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
        USES S-STEP "BF1210-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF1210-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    temp-DTL-INFO  = MIR-RTBL-ID + " " + MIR-RTBL-IDT-NUM + " " + MIR-RTBL-RT-TYP-CD + " " + MIR-DPOS-TRM-MO-DUR + " " + MIR-DPOS-TRM-DY-DUR;   
 

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

    ButtonBar = "ButtonBarOKCancelMore";


    # Display the record retrieved

    STEP Output
    {
        USES S-STEP "BF1210-O";
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

