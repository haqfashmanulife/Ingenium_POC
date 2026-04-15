# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0940Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016301  602J     Add IMPLICIT to fix cancel problem                        *
#*  016736  611J     Code cleanup                                              *
#*  23774A  CTS      Audit Log Related Changes                                 *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0940-P.p";
INCLUDE "BF0940-I.s";
INCLUDE "BF0940-O.s";
INCLUDE "GenRetrieve.f";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF0940Retrieve
{
    STEP Main
    {
        USES PROCESS "GenRetrieve";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0940Retrieve -> Title;
        "BF0940-I" -> InputS;
        "BF0940-P" -> RetrieveP;
        "BF0940-O" -> OutputS;
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
    
    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

