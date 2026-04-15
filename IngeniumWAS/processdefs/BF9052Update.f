# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9052Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB05  CSS      New for MCL                                               *
#*  HNB403  HIN/AI   LINC UPLOAD CHANGES                                       *
#*  23774A  CTS      Audit Log Related Changes                                 *
#*******************************************************************************

INCLUDE "BF9050-P.p";
INCLUDE "BF9050-I.s";
INCLUDE "BF9052-I.s";

#* HNB403 - will now display BF9050-O upon completion
#* INCLUDE "BF9052-O.s";

INCLUDE "BF9050-O.s";
INCLUDE "BF9052-P.p";
INCLUDE "GenUpdate.f";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF9052Update
{
    STEP Main
    {
        USES PROCESS "GenUpdate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9052Update -> Title;
        "BF9050-I" -> InputS;
        "BF9050-P" -> RetrieveP;
        "BF9052-I" -> EditS;
        "BF9052-P" -> UpdateP;

        #* HNB403 - will now display BF9050-O upon completion
        #*       "BF9052-O" -> OutputS;

        "BF9050-O" -> OutputS;
    }

# 23774A CHANGES STARTS

   IF AuditWriteInd == "Y"
   {
            
        temp-DTL-INFO  = SESSION.MIR-CLI-ID + " " + SESSION.MIR-POL-ID-BASE + " " + SESSION.MIR-POL-ID-SFX;
      
        STEP AudOutput
        {
          USES P-STEP "BF9G99-P";
        
        SESSION.MIR-USER-ID -> MIR-USER-ID;
        SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;
        temp-DTL-INFO  ->MIR-TRNX-DTL-INFO;
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

