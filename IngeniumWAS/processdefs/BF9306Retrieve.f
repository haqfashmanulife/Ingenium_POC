
#*******************************************************************************
#*  Component:   BF9306Retrieve.f                                              *
#*  Description: Created for Advance Payment Quote Screen                                                              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  NWLPP1  CTS      INITIAL VERSION                                           *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9306-P.p";
INCLUDE "BF9306-I.s";
INCLUDE "BF9306-O.s";
INCLUDE "GenRetrieve.f";

PROCESS BF9306Retrieve
{

    Title = STRINGTABLE.IDS_TITLE_BF9306Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    
    
    STEP Main
    {
        USES PROCESS "GenRetrieve";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9306Retrieve -> Title;
        "BF9306-I" -> InputS;
        "BF9306-P" -> RetrieveP;
        "BF9306-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

