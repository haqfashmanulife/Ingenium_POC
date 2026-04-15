# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9250Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL104  HIN/CL   INQUIRY AND UPDATE MASTER CLAIM  (HCL104A)                *
#*  EN0395  CTS      11-4 TASK (ADD THE QUESTIONS BUTTON BAR)                  *
#*  AFF027  CTS      CHANGES FOR INPUT DISPLAY                                 *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*  S25765  CTS      TO POPULATE INFORMATION MESSAGE FOR MIGRATED CLM          *
#*******************************************************************************

INCLUDE "BF9250-P.p";
INCLUDE "BF9250-I.s";
INCLUDE "BF9250-O.s";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

#* EN0395 CHANGES START
INCLUDE "BF9000Inquiry.f";
#INCLUDE "GenRetrieve.f";
#PROCESS BF9250Retrieve
#{
#    STEP Main
#    {
#        USES PROCESS "GenRetrieve";
#        ATTRIBUTES
#        {
#            GetMessages = "NO";
#        }

#        STRINGTABLE.IDS_TITLE_BF9250Retrieve -> Title;
#        "BF9250-I" -> InputS;
#        "BF9250-P" -> RetrieveP;
#        "BF9250-O" -> OutputS;
#    }

#    IF DisplayInput == "FALSE"
#        EXIT;

#    IF action == "ACTION_BACK"
#        EXIT;


#    BRANCH Main;
#}


PROCESS BF9250Retrieve
{
    Title = STRINGTABLE.IDS_TITLE_BF9250Retrieve;
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
        USES S-STEP "BF9250-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF9250-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

# 23774A CHANGES BEGIN
# S25765 CHANGES BEGIN

    temp-MSGS-T[1] = MESSAGES-T[1];

# S25765 CHANGES END
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    MIR-CLM-ID -> MIR-TRNX-DTL-INFO;    
    "I" -> MIR-LOG-LEVL-CD;    
    }
      
    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

# S25765 CHANGES BEGIN
		
      MESSAGES-T[1] = temp-MSGS-T[1];

# S25765 CHANGES END
        
# 23774A CHANGES END

     ButtonBar = "ButtonBarOKQuestions";
    # Display the record retrieved

    STEP Output
    {

        USES S-STEP "BF9250-O";
    }

    IF action == "ACTION_QUESTIONS"
    {
       LSIR-RETURN-CD = "00";
       MESSAGES-T[0] = "";
      
       STEP Questions
       {
           USES PROCESS "BF9000Inquiry"; 
#AFF027 CHANGES START 
           "FALSE" -> DisplayInput;
#AFF027 CHANGES END
       }

       BRANCH Retrieve;
    }

     ButtonBar = "ButtonBarOKCancel";
     BRANCH Input;

#* EN0395 CHANGES END

}
