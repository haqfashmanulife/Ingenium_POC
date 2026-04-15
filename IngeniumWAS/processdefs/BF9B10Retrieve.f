#*******************************************************************************
#*  Component:   BF9B10Retrieve.f                                              *
#*  Description: Created for Tax Payment Record Information Screen             *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M142S2   CTS     INITIAL VERSION                                           *
#*  23774A  CTS      Audit Log Related Changes                                 *
#*******************************************************************************

INCLUDE "BF9B10-I.s";
INCLUDE "BF9B10-P.p";
INCLUDE "BF9B10-O.s";
INCLUDE "GenRetrieveMore.f";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END


PROCESS BF9B10Retrieve
{

    STEP Main
        {
            USES PROCESS "GenRetrieveMore";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }
    
            STRINGTABLE.IDS_TITLE_BF9B10Retrieve -> Title;
            "01" -> MIR-CVG-NUM;
            "BF9B10-I" -> InputS;
            "BF9B10-P" -> RetrieveP;
            "BF9B10-O" -> OutputS;
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

        IF DisplayInput == "FALSE"
            EXIT;
    
        IF action == "ACTION_BACK"
            EXIT;
    
    
    BRANCH Main;
 
}
