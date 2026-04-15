# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1302Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  23774A  CTS      Audit Log Related Changes                                 *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1300-P.p";
INCLUDE "BF1300-I.s";
INCLUDE "BF1302-I.s";
INCLUDE "BF1302-O.s";
INCLUDE "BF1302-P.p";
INCLUDE "GenConfrm.f";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF1302Update
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1302Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1302Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1302Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1302Phase3 -> Phase3Title;

        # MVMT starts with Phase 1.

        "1" -> InitialState;

        # Set the names of the S and P steps to be used

        "BF1300-I" -> KeyFieldsS;
        "BF1300-P" -> GetInitialHostDataP;
        "BF1302-I" -> DataInputS;
        "BF1302-P" -> PerformHostEditsP;
        "BF1302-O" -> ConfirmS;
        "BF1302-P" -> UpdateHostP;
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
     
    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

