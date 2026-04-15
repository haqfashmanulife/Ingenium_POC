# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1212Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  23774A  CTS      AUDIT LOG RELATED CHANGES                                 *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1210-P.p";
INCLUDE "BF1210-I.s";
INCLUDE "BF1212-I.s";
INCLUDE "BF1210-O.s";
INCLUDE "BF1212-P.p";
#23774A CHANGE STARTS
#INCLUDE "GenUpdate.f";
INCLUDE "BF9G99-P.p";
#23774A CHANGE ENDS

PROCESS BF1212Update
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
#        STRINGTABLE.IDS_TITLE_BF1212Update -> Title;
#        "000" -> MIR-RTBL-AGE-DUR;
#        "999" -> MIR-DV-END-RTBL-AGE-DUR;
#        "BF1210-I" -> InputS;
#        "BF1210-P" -> RetrieveP;
#        "BF1212-I" -> EditS;
#        "BF1212-P" -> UpdateP;
#        "BF1210-O" -> OutputS;
#    }
#
#    IF DisplayInput == "FALSE"
#        EXIT;
#
#    IF action == "ACTION_BACK"
#        EXIT;
#
#
#   BRANCH Main;

     MIR-RTBL-AGE-DUR = 000;
     MIR-DV-END-RTBL-AGE-DUR = 999;
     Title = STRINGTABLE.IDS_TITLE_BF1212Update;     
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
         USES S-STEP "BF1210-I";
     }

     IF action == "ACTION_BACK"
         EXIT;

     IF action == "ACTION_REFRESH"
         BRANCH Input;



     # Retrieve the record 

     STEP Retrieve
     {
         USES P-STEP "BF1210-P";
     }

     IF LSIR-RETURN-CD != "00"
         BRANCH Input;


     STEP Edit
     {
         USES S-STEP "BF1212-I";
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
         USES P-STEP "BF1212-P";
     }

     IF LSIR-RETURN-CD != "00"
         BRANCH Edit;

     STEP AudOutput
     {
         USES P-STEP "BF9G99-P";

     SESSION.MIR-USER-ID -> MIR-USER-ID;
     SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;
     MIR-RTBL-ID  -> MIR-TRNX-DTL-INFO;
     "C" -> MIR-LOG-LEVL-CD;
     }


     IF LSIR-RETURN-CD != "00"
         BRANCH Edit;

     ButtonBar = "ButtonBarOK";


     # Display the output of the update process

     STEP Output
     {
         USES S-STEP "BF1210-O";
     }
         
         
     IF DisplayInput == "FALSE"
         EXIT;

     IF action == "ACTION_BACK"
         EXIT; 
         
     BRANCH Input;        
         
 #23774A CHANGE ENDS

 }