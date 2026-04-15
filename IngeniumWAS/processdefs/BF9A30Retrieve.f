# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9A30Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPCAFA  CTS      Death Claim Final Approval Inquiry                        *
#*  23774A  CTS      Audit Log Related Changes                                 *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9A30-P.p";
INCLUDE "BF9A30-I.s";
INCLUDE "BF9A30-O.s";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF9A30Retrieve
{
#    STEP Main
#   {
#       USES PROCESS "GenRetrieve";
#       ATTRIBUTES
#       {
#           GetMessages = "NO";
#       }
#
#       STRINGTABLE.IDS_TITLE_BF9A30Retrieve -> Title;
#       MIR-CLM-ID -> MIR-CLM-ID;
#       "BF9A30-I" -> InputS;
#       "BF9A30-P" -> RetrieveP;
#       "BF9A30-O" -> OutputS;
#   }
#
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
#
#   IF DisplayInput == "FALSE"
#       EXIT;
#
#   IF action == "ACTION_BACK"
#       EXIT;
#
#
#   BRANCH Main;
    Title = STRINGTABLE.IDS_TITLE_BF9A30Retrieve;
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
        USES S-STEP "BF9A30-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF9A30-P";
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

MIR-POL-ID-2-T[1] = SUBSTRING (MIR-POL-ID-2-T[1],1,7);
MIR-POL-ID-2-T[2] = SUBSTRING (MIR-POL-ID-2-T[2],1,7);
MIR-POL-ID-2-T[3] = SUBSTRING (MIR-POL-ID-2-T[3],1,7);
MIR-POL-ID-2-T[4] = SUBSTRING (MIR-POL-ID-2-T[4],1,7);
MIR-POL-ID-2-T[5] = SUBSTRING (MIR-POL-ID-2-T[5],1,7);
MIR-POL-ID-2-T[6] = SUBSTRING (MIR-POL-ID-2-T[6],1,7);
MIR-POL-ID-2-T[7] = SUBSTRING (MIR-POL-ID-2-T[7],1,7);
MIR-POL-ID-2-T[8] = SUBSTRING (MIR-POL-ID-2-T[8],1,7);
MIR-POL-ID-2-T[9] = SUBSTRING (MIR-POL-ID-2-T[9],1,7);
MIR-POL-ID-2-T[10] = SUBSTRING (MIR-POL-ID-2-T[10],1,7);
MIR-POL-ID-2-T[11] = SUBSTRING (MIR-POL-ID-2-T[11],1,7);
MIR-POL-ID-2-T[12] = SUBSTRING (MIR-POL-ID-2-T[12],1,7);
MIR-POL-ID-2-T[13] = SUBSTRING (MIR-POL-ID-2-T[13],1,7);
MIR-POL-ID-2-T[14] = SUBSTRING (MIR-POL-ID-2-T[14],1,7);
MIR-POL-ID-2-T[15] = SUBSTRING (MIR-POL-ID-2-T[15],1,7);
MIR-POL-ID-2-T[16] = SUBSTRING (MIR-POL-ID-2-T[16],1,7);
MIR-POL-ID-2-T[17] = SUBSTRING (MIR-POL-ID-2-T[17],1,7);
MIR-POL-ID-2-T[18] = SUBSTRING (MIR-POL-ID-2-T[18],1,7);
MIR-POL-ID-2-T[19] = SUBSTRING (MIR-POL-ID-2-T[19],1,7);
MIR-POL-ID-2-T[20] = SUBSTRING (MIR-POL-ID-2-T[20],1,7);
MIR-POL-ID-2-T[21] = SUBSTRING (MIR-POL-ID-2-T[21],1,7);
MIR-POL-ID-2-T[22] = SUBSTRING (MIR-POL-ID-2-T[22],1,7);
MIR-POL-ID-2-T[23] = SUBSTRING (MIR-POL-ID-2-T[23],1,7);
MIR-POL-ID-2-T[24] = SUBSTRING (MIR-POL-ID-2-T[24],1,7);
MIR-POL-ID-2-T[25] = SUBSTRING (MIR-POL-ID-2-T[25],1,7);
MIR-POL-ID-2-T[26] = SUBSTRING (MIR-POL-ID-2-T[26],1,7);
MIR-POL-ID-2-T[27] = SUBSTRING (MIR-POL-ID-2-T[27],1,7);
MIR-POL-ID-2-T[28] = SUBSTRING (MIR-POL-ID-2-T[28],1,7);
MIR-POL-ID-2-T[29] = SUBSTRING (MIR-POL-ID-2-T[29],1,7);
MIR-POL-ID-2-T[30] = SUBSTRING (MIR-POL-ID-2-T[30],1,7);


    STEP Output
    {

        USES S-STEP "BF9A30-O";
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;
        
     ButtonBar = "ButtonBarOKCancel";
     BRANCH Input;
}