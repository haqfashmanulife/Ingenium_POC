# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9E90Inquiry.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  MP1668  CTS      Initial Version                                           *  
#*  23774A  CTS      Audit Log Related Changes                                 *
#*******************************************************************************

INCLUDE "BF9E90-P.p";
INCLUDE "BF9E90-I.s";
INCLUDE "BF9E90-O.s";
INCLUDE "GenRetrieve.f";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF9E90Inquiry
{
    STEP Main
    {
        USES PROCESS "GenRetrieve";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9E90Inquiry -> Title;
        "BF9E90-I" -> InputS;
        "BF9E90-P" -> RetrieveP;
        "BF9E90-O" -> OutputS;
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

