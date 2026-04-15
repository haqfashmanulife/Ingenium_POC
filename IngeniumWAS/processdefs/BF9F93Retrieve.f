# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9F93Retrieve.f                                              *
#*  Description: Health congratulatory benefit Quote                           *
#*                                                                             *
#*******************************************************************************
#*                                                                             *
#*  UY3071  CTS      INGENIUM HEALTH CONGRATULATORY BENEFIT                    *
#*******************************************************************************

INCLUDE "BF9D22-I.s";
INCLUDE "BF9F93-P.p";
INCLUDE "BF9D22-O.s";
INCLUDE "GenRetrieve.f";

PROCESS BF9F93Retrieve
{
    Title = STRINGTABLE.IDS_TITLE_BF9F93Retrieve;
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
   
           STRINGTABLE.IDS_TITLE_BF9F93Retrieve -> Title;
           "BF9D22-I" -> InputS;
           "BF9F93-P" -> RetrieveP;
           "BF9D22-O" -> OutputS;
       }
   
       IF DisplayInput == "FALSE"
           EXIT;
   
       IF action == "ACTION_BACK"
           EXIT;
   
   
       BRANCH Main;
   }
   
