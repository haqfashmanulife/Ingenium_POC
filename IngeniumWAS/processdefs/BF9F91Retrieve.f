# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9F91Retrieve.f                                              *
#*  Description: Survival Benefit Quote screen                                 *
#*                                                                             *
#*******************************************************************************
#*                                                                             *
#*  UY3037  CTS      INGENIUM SURVIVAL BENEFIT                                 *
#*******************************************************************************

INCLUDE "BF9D12-I.s";
INCLUDE "BF9F91-P.p";
INCLUDE "BF9D12-O.s";
INCLUDE "GenRetrieve.f";

PROCESS BF9F91Retrieve
{
    Title = STRINGTABLE.IDS_TITLE_BF9F91Retrieve;
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
   
           STRINGTABLE.IDS_TITLE_BF9F91Retrieve -> Title;
           "BF9D12-I" -> InputS;
           "BF9F91-P" -> RetrieveP;
           "BF9D12-O" -> OutputS;
       }
   
       IF DisplayInput == "FALSE"
           EXIT;
   
       IF action == "ACTION_BACK"
           EXIT;
   
   
       BRANCH Main;
   }
   
