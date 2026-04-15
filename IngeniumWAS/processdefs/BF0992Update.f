# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0992Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*  23774A  CTS      AUDIT LOG RELATED CHANGES                                 *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0990-P.p";
INCLUDE "BF0990-I.s";
INCLUDE "BF0992-I.s";
INCLUDE "BF0990-O.s";
INCLUDE "BF0992-P.p";
#23774A CHANGE STARTS
#INCLUDE "GenUpdate.f";
INCLUDE "BF9G99-P.p";
#23774A CHANGE ENDS

PROCESS BF0992Update
{
#23774A CHANGE STARTS
#    STEP Main
#    {
#        USES PROCESS "GenUpdate";
#        ATTRIBUTES
#        {
#            GetMessages = "NO";
#        }
#
#        STRINGTABLE.IDS_TITLE_BF0992Update -> Title;
#        "BF0990-I" -> InputS;
#        "BF0990-P" -> RetrieveP;
#        "BF0992-I" -> EditS;
#        "BF0992-P" -> UpdateP;
#        "BF0990-O" -> OutputS;
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

     Title = STRINGTABLE.IDS_TITLE_BF0992Update;     
     TitleBar = "TitleBar";
     TitleBarSize = "70";
     ButtonBar = "ButtonBarOKCancel";
     ButtonBarSize = "40";
     MessageFrame = "MessagesDisp";
     MessageFrameSize = "70";

     IF DisplayInput == "FALSE"
         BRANCH Retrieve;



     # Enter the key(s) for the value that you'd like to create

     STEP Input
     {
         USES S-STEP "BF0990-I";
     }

     IF action == "ACTION_BACK"
         EXIT;

     IF action == "ACTION_REFRESH"
         BRANCH Input;



     # Retrieve the record 

     STEP Retrieve
     {
         USES P-STEP "BF0990-P";
     }

     IF LSIR-RETURN-CD != "00"
         BRANCH Input;


     STEP Edit
     {
         USES S-STEP "BF0992-I";
     }


     # If user selects Cancel and did not come from a list, then clear messages 
     # and branch back 1 step;
     # otherwise, exit to list.

     IF action == "ACTION_BACK"
     {
         IF DisplayInput != "FALSE"
         {
             ButtonBar = "ButtonBarOKCancel";
             MESSAGES-T[0] = "";

             BRANCH Input;

         }
         ELSE
             EXIT;


     }
     IF action == "ACTION_REFRESH"
         BRANCH Edit;



     # Update the record who's data was just entered.

     STEP Update
     {
         USES P-STEP "BF0992-P";
     }

     IF LSIR-RETURN-CD != "00"
         BRANCH Edit;

     STEP AudOutput
     {
         USES P-STEP "BF9G99-P";

     SESSION.MIR-USER-ID -> MIR-USER-ID;
     SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

     MIR-BR-ID  -> MIR-TRNX-DTL-INFO;
     "I" -> MIR-LOG-LEVL-CD;
     }


     IF LSIR-RETURN-CD != "00"
         BRANCH Edit;

     ButtonBar = "ButtonBarOK";


     # Display the output of the update process

     STEP Output
     {
         USES S-STEP "BF0990-O";
     }
         
         
     IF DisplayInput == "FALSE"
         EXIT;

     IF action == "ACTION_BACK"
         EXIT; 
         
     BRANCH Input;        
         
 #23774A CHANGE ENDS

 }