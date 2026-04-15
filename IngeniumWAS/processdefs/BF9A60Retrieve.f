# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9A60Retrieve.f                                              *
#*  Description: Death Claim Adjudicator Decision Retrieve function            *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAMC  CTS      Intial Version                                            *                                                                            
#*  23774A  CTS      Audit Log Related Changes                                 *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9A60-P.p";
INCLUDE "BF9A60-I.s";
INCLUDE "BF9A60-O.s";

#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF9A60Retrieve
{
#   STEP Main
#   {
#       USES PROCESS "GenRetrieve";
#       ATTRIBUTES
#       {
#           GetMessages = "NO";
#       }
#
#       STRINGTABLE.IDS_TITLE_BF9A60Retrieve -> Title;
#       "BF9A60-I" -> InputS;
#       "BF9A60-P" -> RetrieveP;
#       "BF9A60-O" -> OutputS;
#   }
#   
## 23774A CHANGES STARTS
#
#  IF AuditWriteInd == "Y"
#  {
#        
#       STEP AudOutput
#       {
#         USES P-STEP "BF9G99-P";
#       
#       SESSION.MIR-USER-ID -> MIR-USER-ID;
#       SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;
#       SESSION.MIR-CLM-ID  ->MIR-TRNX-DTL-INFO;
#       "I" -> MIR-LOG-LEVL-CD;    
#       }
#    
#       IF LSIR-RETURN-CD != "00"
#           BRANCH Main;
#   }        
#  
## 23774A CHANGES ENDS
# 
#   IF DisplayInput == "FALSE"
#       EXIT;
#
#   IF action == "ACTION_BACK"
#       EXIT;
#
#
#   BRANCH Main;
    Title = STRINGTABLE.IDS_TITLE_BF9A60Retrieve;
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
        USES S-STEP "BF9A60-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF9A60-P";
        "1" -> MIR-DV-PRCES-STAT-CD ;        
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

# 23774A CHANGES BEGIN
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    MIR-CLM-ID -> MIR-TRNX-DTL-INFO;    
    "I" -> MIR-LOG-LEVL-CD;    
    }
      
    IF LSIR-RETURN-CD != "00"
    {
        IF DisplayInput != "FALSE"
        {
            BRANCH Input;
        }
        ELSE
            EXIT;   
    }
        
# 23774A CHANGES END

     ButtonBar = "ButtonBarOK";
    # Display the record retrieved

MIR-POL-ID = SUBSTRING (MIR-POL-ID,1,7);

    STEP Output
    {

        USES S-STEP "BF9A60-O";
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;
        
     ButtonBar = "ButtonBarOKCancel";
     BRANCH Input;

}