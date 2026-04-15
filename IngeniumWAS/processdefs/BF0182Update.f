# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0182Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*  23774A  CTS      Audit Log Related Changes                                 *
#*******************************************************************************

INCLUDE "BF0180-P.p";
INCLUDE "BF0180-I.s";
INCLUDE "BF0182-I.s";
INCLUDE "BF0180-O.s";
INCLUDE "BF0182-P.p";
INCLUDE "GenUpdate.f";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END


PROCESS BF0182Update
{
    STEP Main
    {
        USES PROCESS "GenUpdate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0182Update -> Title;
        "BF0180-I" -> InputS;
        "BF0180-P" -> RetrieveP;
        "BF0182-I" -> EditS;
        "BF0182-P" -> UpdateP;
        "BF0180-O" -> OutputS;
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

