#*******************************************************************************
#*  Component:   BF9304Retrieve.f                                              *
#*  Description: Flowfile for Advance Payment Management Screen                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* M271B8   22SEP15  NEW ADVANCE PAYMENT MANAGEMENT SCREEN                     *
#*  23774A  CTS      Audit Log Related Changes                                 *
#*******************************************************************************
INCLUDE "BF9304-P.p";
INCLUDE "BF9304-I.s";
INCLUDE "BF9304-O.s";
INCLUDE "GenRetrieveMore.f";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF9304Retrieve
{
    STEP Main
    {
        USES PROCESS "GenRetrieveMore";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9304Retrieve -> Title;
        "BF9304-I" -> InputS;
        "BF9304-P" -> RetrieveP;
        "BF9304-O" -> OutputS;
    }

# 23774A CHANGES STARTS

   IF AuditWriteInd == "Y"
   {
            
        temp-DTL-INFO  = SESSION.MIR-POL-ID-BASE + " " + SESSION.MIR-POL-ID-SFX;
      
        STEP AudOutput
        {
        USES P-STEP "BF9G99-P";
        
        SESSION.MIR-USER-ID -> MIR-USER-ID;
        SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;
        temp-DTL-INFO  ->MIR-TRNX-DTL-INFO;
        "I" -> MIR-LOG-LEVL-CD;    
        }
    
        IF LSIR-RETURN-CD != "00"
            BRANCH Main;
   }         
      
# 23774A CHANGES ENDS
    
    IF action == "ACTION_BACK"
        EXIT;

    BRANCH Main;
}
