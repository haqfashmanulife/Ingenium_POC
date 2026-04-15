# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   DthPayeeInquiry.f                                             *
#*  Description: Payee Information Inquiry            .                        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPCAPM  CTS      INITIAL VERSION                                           *
#*******************************************************************************

INCLUDE "BF9A94-O.s";
INCLUDE "BF9A92-O.s";
INCLUDE "BF9A94-P.p";
INCLUDE "BF9A90-P.p";

PROCESS DthPayeeInquiry
{
  VARIABLES
  {
    INOUT MIR-CLM-ID;

    INOUT MIR-DCRL-SEQ-NUM;
  }

    Title = STRINGTABLE.IDS_TITLE_ClmPayeeList;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarInquireCancel";
    ButtonBarSize = "50";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    RecordIsNew = "N";
    

    STEP ClmpayeelistStep
    {
        USES P-STEP "BF9A94-P";
    }

    IF LSIR-RETURN-CD != "00"
    {
        EXIT;

    }
    
    STEP DisplayClmPayeeList
     {
         USES S-STEP "BF9A94-O";
         STRINGTABLE.IDS_TITLE_BF9A94List -> Title;
         "ButtonBarInquireCancel" -> ButtonBar;   
     }

    IF action == "ACTION_BACK"
       {
    
          EXIT;
       }
        
    IF action == "ACTION_INQUIRE"
    {
        STEP ClmPayeeRetrieveStep
        {
            USES P-STEP "BF9A90-P";
            MIR-CLM-ID -> MIR-CLM-ID;
            MIR-DCRL-SEQ-NUM-T[index] -> MIR-DCRL-SEQ-NUM;
            "P" -> MIR-DCRL-TYP-CD;
        }
    
        IF LSIR-RETURN-CD != "00"
            BRANCH ClmpayeelistStep;
       
        ELSE
        {
            BRANCH ClmPayeeInquiry;

        }
    }
    
        STEP ClmPayeeInquiry
        {
            USES S-STEP "BF9A92-O";
            STRINGTABLE.IDS_TITLE_BF9A90Retrieve -> Title;
            "ButtonBarOK" -> ButtonBar;
        }
 
    IF action == "ACTION_NEXT"
       BRANCH ClmpayeelistStep;
}