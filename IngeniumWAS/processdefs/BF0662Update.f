# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0662Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  EN001527  GW     Change  GenConfrm.f for GenConfrmMore.f                   *
#*                                                                             *
#*  MP253N  CTS      CHANGES DONE TO DISPLAY THE COMPLETE PLAN-NAMES OR FILTER *
#*                   PLAN-NAMES AS PART OF ULE-II                              *
#*  R15582  CTS      AUDIT LOG RELATED CHANGES                                 *
#*  23774A  CTS      Audit Log Related Changes                                 *
#*******************************************************************************

INCLUDE "BF0660-I.s";
INCLUDE "BF0660-P.p";
INCLUDE "BF0662-I.s";
INCLUDE "BF0662-O.s";
INCLUDE "BF0662-P.p";
#23774A CHANGES BEGIN
#R15582 CHANGES BEGIN
INCLUDE "GenConfrmMore.f";
INCLUDE "BF9G99-P.p";
#INCLUDE "GenConfrmMoreAud.f";
#R15582 CHANGES END
#23774A CHANGES END

PROCESS BF0662Update
{
#MP253N CHANGES STARTS HERE
   MIR-PLAN-LIST-CD = "F";
#MP253N CHANGES ENDS HERE 
    STEP Main
    {
#R15582 CHANGES BEGIN    
#23774A CHANGES BEGIN
        USES PROCESS "GenConfrmMore";    
#       USES PROCESS "GenConfrmMoreAud";
#23774A CHANGES END
#R15582 CHANGES END         

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0662Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0662Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0662Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0662Phase3 -> Phase3Title;

        # Update starts with Phase 1.

        "1" -> InitialState;

        # Set the names of the S and P steps to be used

        "BF0660-I" -> KeyFieldsS;
        "BF0660-P" -> GetInitialHostDataP;
        "BF0662-I" -> DataInputS;
        "BF0662-P" -> PerformHostEditsP;
        "BF0662-O" -> ConfirmS;
        "BF0662-P" -> UpdateHostP;
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

