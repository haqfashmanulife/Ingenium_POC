# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF6980Valuecov.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  01AD25  BMB      Use new flow to control display of more than 20 cvgs      *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF6980-P.p";
INCLUDE "BF6980-I.s";
INCLUDE "BF6980-O.s";
#* 23774A CHANGES BEGIN
INCLUDE "GenRetrieveMore.f";
#* INCLUDE "GenRetrieveMoreAud.f";
INCLUDE "BF9G99-P.p";
#* 23774A CHANGES END

PROCESS BF6980Valuecov
{
    STEP Main
    {
#* 23774A CHANGES BEGIN
           USES PROCESS "GenRetrieveMore";
#          USES PROCESS "GenRetrieveMoreAud";
#* 23774A CHANGES END

        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF6980Valuecov -> Title;
        "01" -> MIR-CVG-NUM;
        "BF6980-I" -> InputS;
        "BF6980-P" -> RetrieveP;
        "BF6980-O" -> OutputS;
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

