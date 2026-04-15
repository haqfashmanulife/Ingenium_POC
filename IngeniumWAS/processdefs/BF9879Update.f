# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9879Update.f                                                *
#*  Description: Claim Payment Protected Update                                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL104  HIN/CL   HIN/EC CLAIM PAYMENT PROTECTED UPDATE                     *
#*  23774A  CTS      Audit Log Related Changes                                 *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9887-I.s";
INCLUDE "BF9330-P.p";
INCLUDE "BF9879-I.s";
INCLUDE "BF9879-P.p";
INCLUDE "BF9879-O.s";
INCLUDE "GenUpdate.f";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF9879Update
{
    STEP Main
    {
        USES PROCESS "GenUpdate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9879Update -> Title;
        "BF9887-I" -> InputS;
        "BF9330-P" -> RetrieveP;
        "BF9879-I" -> EditS;
        "BF9879-P" -> UpdateP;
        "BF9879-O" -> OutputS;
    }
    
 # 23774A CHANGES STARTS
 
   IF AuditWriteInd == "Y"
   {
         
        STEP AudOutput
        {
          USES P-STEP "BF9G99-P";
        
        SESSION.MIR-USER-ID -> MIR-USER-ID;
        SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;
        SESSION.MIR-CLM-ID  ->MIR-TRNX-DTL-INFO;
        "C" -> MIR-LOG-LEVL-CD;    
        }
     
        IF LSIR-RETURN-CD != "00"
            BRANCH Main;
    }        
   
 # 23774A CHANGES ENDS
  
    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

