# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1972Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*  23774A  CTS      Audit Log Related Changes                                 *
#*  ARMM09  CTS      ARM Webservice changes                                    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1970-P.p";
INCLUDE "BF1970-I.s";
INCLUDE "BF1972-I.s";
INCLUDE "BF1970-O.s";
INCLUDE "BF1972-P.p";
INCLUDE "GenUpdate.f";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF1972Update
{
# initialize the error bypass code to avoid skipping of webservices flow
   MIR-ERROR-BYPASS-IND = "N";

    STEP Main
    {
        USES PROCESS "GenUpdate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1972Update -> Title;
        "BF1970-I" -> InputS;
        "BF1970-P" -> RetrieveP;
        "BF1972-I" -> EditS;
        "BF1972-P" -> UpdateP;
        "BF1970-O" -> OutputS;
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

