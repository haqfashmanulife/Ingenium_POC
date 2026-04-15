# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9B84Valuecov.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* NWLCAR   29OCT09  NEW DEPOSIT HISTORY SCREEN FOR NWL POLICIES               *
#*  23774A  CTS      Audit Log Related Changes                                 *
#*******************************************************************************

INCLUDE "BF9B84-P.p";
INCLUDE "BF9B84-I.s";
INCLUDE "BF9B84-O.s";
INCLUDE "GenRetrieveMore.f";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END


PROCESS BF9B84List
{
    STEP Main
    {
        USES PROCESS "GenRetrieveMore";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9B84List -> Title;
        "01" -> MIR-CVG-NUM;
        "BF9B84-I" -> InputS;
        "BF9B84-P" -> RetrieveP;
        "BF9B84-O" -> OutputS;
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

