
#*******************************************************************************
#*  Component:   BF9C44Retrieve.f                                              *
#*  Description: Created for Annuity Transfer Quote Screen                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP113C  CTS      INITIAL VERSION                                           *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9C44-P.p";
INCLUDE "BF9C44-I.s";
INCLUDE "BF9C44-O.s";
INCLUDE "GenRetrieve.f";

PROCESS BF9C44Retrieve
{

    Title = STRINGTABLE.IDS_TITLE_BF9C44Retrieve;
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

        STRINGTABLE.IDS_TITLE_BF9C44Retrieve -> Title;
        "BF9C44-I" -> InputS;
        "BF9C44-P" -> RetrieveP;
        "BF9C44-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

