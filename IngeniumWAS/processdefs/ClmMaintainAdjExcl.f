# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#******************************************************************************
#*  Component:   ClmMaintainAdjExcl.f                                          *                                                                              
#*  Description: Maintain Adjustments and Exclusions for a benefit.            *                                                                  
#*                                                                             * 
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* HCL106  HIN/CL   ADJUDICATORS DECISION PART A & B (HCL106A)                 *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#* M242M1  CTS      CHANGES FOR ADD ADJUSTEMNET SCREEN-SURGERY BENEFIT         *
#*******************************************************************************

INCLUDE "BF9276-I.s";
INCLUDE "BF9276-P.p";

PROCESS ClmMaintainAdjExcl
{
  VARIABLES
  {
    IN USER-SELECTION;
     
    IN MIR-DTL-STRT-DT;

    IN MIR-DTL-END-DT;

    IN MIR-DTL-REASN-CD;

    IN MIR-DTL-SEQ-NUM;

    IN MIR-DTL-EXCL-QTY;

    IN MIR-DTL-AGG-NUM;
    
    #* M242M1 CHANGES START
    IN MIR-DTL-SURG-CD;
    #* M242M1 CHANGES END
  }

    IF USER-SELECTION == "ADDA"

        # Pass fields from selected detail line (CLBE record). Remaining Key detail is taken from the
        # cache.

    {
        myTitle = STRINGTABLE.IDS_TITLE_BF9276AddAdjustment;
        MIR-DV-EXCL-ADJ-IND = "A";
        MIR-ADJ-STRT-DT = MIR-DTL-STRT-DT;
        MIR-ADJ-END-DT = MIR-DTL-END-DT;
        MIR-EVNT-SEQ-NUM = MIR-DTL-SEQ-NUM;
        MIR-CLM-AGG-NUM = MIR-DTL-AGG-NUM;
      #* M242M1 CHANGES START
        MIR-SURG-CD = MIR-DTL-SURG-CD;
      #* M242M1 CHANGES ENDS

        BRANCH ProcessAdd;

    }
    IF USER-SELECTION == "ADDE"

        # the calling process must pass a CLBE record that we are excluding against.

    {
        myTitle = STRINGTABLE.IDS_TITLE_BF9276AddExclusion;
        MIR-EVNT-SEQ-NUM = MIR-DTL-SEQ-NUM;
        MIR-DV-EXCL-ADJ-IND = "E";
        MIR-DV-EXCL-QTY = MIR-DTL-EXCL-QTY;
        MIR-ADJ-STRT-DT = " ";
        MIR-ADJ-END-DT = " ";
        MIR-ADJ-REASN-CD = " ";
        MIR-EXCL-STRT-DT = MIR-DTL-STRT-DT;
        MIR-EXCL-END-DT = MIR-DTL-END-DT;
        MIR-EXCL-REASN-CD = MIR-DTL-REASN-CD;

        BRANCH ProcessAdd;

    }
    IF USER-SELECTION == "DEL"
    {
        BRANCH ProcessDelete;

    }
    IF USER-SELECTION == "UPDT"
    {
        BRANCH ProcessUpdate;

    }


    # there is a problem because no function has been identified

    EXIT;

    #***************************************

    ProcessAdd:
    ValidateAdd:

    STEP ValidateAddStep
    {
        USES P-STEP "BF9276-P";
        "1" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
    {
        EXIT;

    }


    # pre-validation is successful display the update screen

    AddAdjExclRecord:

    STEP DisplayAddAdjExclStep
    {
        USES S-STEP "BF9276-I";
        myTitle -> Title;
        "ButtonBarOKCancel" -> ButtonBar;
    }

    IF action == "ACTION_BACK"
    {
        Lastaction = action;

        EXIT;

    }
    IF action != "ACTION_NEXT"
        BRANCH AddAdjExclRecord;



    # the user wants to perform the ADD function

    STEP AddAdjustmentRecordStep
    {
        USES P-STEP "BF9276-P";
        "2" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
    {
        BRANCH AddAdjExclRecord;

    }
    ELSE
    {
        EXIT;

    }


    #************************ 

    ProcessDelete:

    MIR-EVNT-SEQ-NUM = MIR-DTL-SEQ-NUM;

    ValidateDelete:

    STEP ValidateDeleteStep
    {
        USES P-STEP "BF9279-P";
        "1" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
    {
        EXIT;

    }

    IF MIR-DV-EXCL-ADJ-IND == "E"
    {
        myTitle = STRINGTABLE.IDS_TITLE_BF9279DeleteExclusion;

    }
    ELSE
    {
        myTitle = STRINGTABLE.IDS_TITLE_BF9279DeleteAdjustment;

    }


    # pre-validation is successful display the update screen

    DeleteAdjExclRecord:

    STEP DisplayDeleteAdjExclStep
    {
        USES S-STEP "BF9279-I";
        myTitle -> Title;
        "ButtonBarDeleteCancel" -> ButtonBar;
    }

    IF action == "ACTION_BACK"
    {
        Lastaction = action;

        EXIT;

    }


    # the user wants to perform the DELETE function

    STEP DeleteAdjustmentRecordStep
    {
        USES P-STEP "BF9279-P";
        "2" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
    {
        BRANCH DeleteAdjExclRecord;

    }
    ELSE
    {
        EXIT;

    }


    #************* 

    ProcessUpdate:

    MIR-EVNT-SEQ-NUM = MIR-DTL-SEQ-NUM;

    ValidateUpdate:

    STEP ValidateUpdateStep
    {
        USES P-STEP "BF9278-P";
        "1" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
    {
        EXIT;

    }

    IF MIR-DV-EXCL-ADJ-IND == "E"
    {
        myTitle = STRINGTABLE.IDS_TITLE_BF9278UpdateExclusion;

    }
    ELSE
    {
        myTitle = STRINGTABLE.IDS_TITLE_BF9278UpdateAdjustment;

    }


    # pre-validation is successful display the update screen

    UpdateAdjExclRecord:

    STEP DisplayUpdateAdjExclStep
    {
        USES S-STEP "BF9278-I";
        myTitle -> Title;
        "ButtonBarOKCancel" -> ButtonBar;
    }

    IF action == "ACTION_BACK"
    {
        Lastaction = action;

        EXIT;

    }
    IF action != "ACTION_NEXT"
        BRANCH UpdateAdjExclRecord;



    # the user wants to perform the UPDATE function

    STEP UpdateAdjustmentRecordStep
    {
        USES P-STEP "BF9278-P";
        "2" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
    {
        BRANCH UpdateAdjExclRecord;

    }
    ELSE
    {
        EXIT;

    }
}

