# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9A80Retrive.f                                               *
#*  Description: Death Master Claim Payment                                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPCAPM  CTS      INITIAL VERSION                                           *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9A80-I.s";
INCLUDE "BF9A80-O.s";
INCLUDE "BF9A80-P.p";
INCLUDE "DthPayeeInquiry.f";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF9A80Retrieve
{
    Title = STRINGTABLE.IDS_TITLE_BF9A80Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP KeyFields-S
    {
        USES S-STEP "BF9A80-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH KeyFields-S;



    # Retrieve Claim Details  
    # Uses PRCES-STATE-CD to indicate it is being called
    # as part of the payment flow...

    STEP Retrieve
    {
        USES P-STEP "BF9A80-P";       
    }

    IF LSIR-RETURN-CD != "00" && LSIR-RETURN-CD != "03"
        BRANCH KeyFields-S;

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
        BRANCH KeyFields-S;
        
# 23774A CHANGES END
        
    ButtonBar = "ButtonBarPayeeListOk";       

    STEP Output
    {
        USES S-STEP "BF9A80-O";
    }
        
   IF action == "ACTION_PAYEELIST"
       {
           STEP PayeeList
           {
               USES PROCESS "DthPayeeInquiry";
               
               ATTRIBUTES
               {
                   GetMessages = "NO";
                
               }
                  
               # Send Master Claim ID.
                MIR-CLM-ID -> MIR-CLM-ID;
          } 
          
           BRANCH Retrieve;
        }    
  
  IF action == "ACTION_NEXT"
     {
        ButtonBar = "ButtonBarOKCancel";    
        BRANCH KeyFields-S;
     }
}

