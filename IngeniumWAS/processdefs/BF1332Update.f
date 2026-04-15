# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1332Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  23774A  CTS      Audit Log Related Changes                                 *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1330-P.p";
INCLUDE "BF1330-I.s";
INCLUDE "BF1332-I.s";
INCLUDE "BF1330-O.s";
INCLUDE "BF1332-P.p";
INCLUDE "GenUpdate.f";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF1332Update
{
    STEP Main
    {
        USES PROCESS "GenUpdate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1332Update -> Title;
        "BF1330-I" -> InputS;
        "BF1330-P" -> RetrieveP;
        "BF1332-I" -> EditS;
        "BF1332-P" -> UpdateP;
        "BF1330-O" -> OutputS;
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

