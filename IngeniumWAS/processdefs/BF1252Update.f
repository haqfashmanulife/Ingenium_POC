# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1252Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  P00205  EKM      Use Process "GenUpdateMore" instead of "GenUpdate"        *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*******************************************************************************

INCLUDE "BF1250-P.p";
INCLUDE "BF1250-I.s";
INCLUDE "BF1252-I.s";
INCLUDE "BF1250-O.s";
INCLUDE "BF1252-P.p";
# 23774A CHANGES BEGIN
INCLUDE "GenUpdateMore.f";
# 23774A INCLUDE "BFUpdateMoreAud.f";
INCLUDE "BF9G99-P.p";
# 23774A CHANGES END

PROCESS BF1252Update
{

#M245B2 CHANGES STARTS HERE
    MIR-GLOB-CRCY-CD= "JP";
#M245B2 CHANGES STARTS HERE 
    STEP Main
    {
# 23774A CHANGES BEGIN
         USES PROCESS "GenUpdateMore";        
# 23774A USES PROCESS "BFUpdateMoreAud";
# 23774A CHANGES END
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1252Update -> Title;
        "BF1250-I" -> InputS;
        "BF1250-P" -> RetrieveP;
        "BF1252-I" -> EditS;
        "BF1252-P" -> UpdateP;
        "BF1250-O" -> OutputS;
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

