# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF9510Lumpsum.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPMPFA  CTS      Initial version for partial/full Lumpsum Payment          *
#*  R15582  CTS      AUDIT LOG RELATED CHANGES                                 *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9510E1-I.s";
INCLUDE "BF9510-P.p";
INCLUDE "BF9510E2-I.s";
INCLUDE "BF9510O1-O.s";
INCLUDE "BF9510O2-O.s";
#R15582 CHANGES START
#INCLUDE "GenConfrmXT.f";
INCLUDE "GenConfrmXTAud.f";
#R15582 CHANGES END

PROCESS BF9510Lumpsum
{
    STEP Main
    {
       #R15582 CHANGES START
        #USES PROCESS "GenConfrmXT";
        USES PROCESS "GenConfrmXTAud";
       #R15582 CHANGES END

        # Set up the title strings.


        STRINGTABLE.IDS_TITLE_BF9510Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF9510Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF9510Phase3 -> Phase3Title;
        STRINGTABLE.IDS_TITLE_BF9510Phase4 -> Phase4Title;

        # Prcesrpu starts with Phase 1.

        "1" -> InitialState;

        # Set the names of the S and P steps to be used

        "BF9510E1-I" -> KeyFieldsS;
        "BF9510-P" -> GetInitialHostDataP;
        "BF9510E2-I" -> DataInputS;
        "BF9510-P" -> PerformHostEditsP;
        "BF9510O1-O" -> ConfirmS;
        "BF9510-P" -> UpdateHostP;
        "BF9510O2-O" -> InquiryS;
    }
}

