# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9276-P.p                                                    *
#*  Description: Adjudicator Decision- Add Exclusion/Adjustment                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* HCL106  HIN/CL   ADJUDICATORS DECISION PART A & B (HCL106A)                 *
#* RP2CLA  CTS      ADD MULTIPLIER AS PART OF CANCER LUMPSUM                   *
#*                                                                             *
#* MP143F  CTS     CHANGES TO ADD ADVANCED MEDICAL BENEFIT AMOUNT FIELD        * 
#* M242M1  CTS     CHANGES FOR ADD ADJUSTEMNET SCREEN-SURGERY BENEFIT          *
#* UY3023  CTS     MEDICAL CLAIM                                               *
#*******************************************************************************

P-STEP BF9276-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9276";
        BusinessFunctionName = "Add/Update Adjustment";
        BusinessFunctionType = "Update";
        MirName = "CCWM9276";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "process code";
     }


    IN MIR-CLM-ID
    {
        Key;
        Length = "8";
        DBTableName = "TCLMA";
        DefaultSession = "MIR-CLM-ID";
        SType = "Text";
        Label = "Master Claim ID";
    }

    IN MIR-CLMA-ASSOC-CLM-ID
    {
        Key;
        Length = "8";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Associated Master Claim";
    }

    IN MIR-BNFT-NM-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "BENNM";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Benefit Name";
    }

    IN MIR-BNFT-STAT-CD
    {
        Key;
        Length = "4";
        CodeSource = "DataModel";
        CodeType = "CLBN-BNFT-STAT-CD";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Benefit Claim Status";
    }

    IN MIR-POL-ID
    {
        Key;
        Length = "10";
        Type = "Text";
        Label = "Policy ID";
    }

       IN  MIR-CVG-NUM
       {
        Key;
        Length = "2";
        SType = "Text";
        Label = "Coverage Number";
    }

      IN MIR-DV-EXCL-ADJ-IND
      {
          DefaultConstant = "E";
          SType = "YesNo";
          Label = "Exclusion/Adjustment Indicator";
      }


      IN MIR-EXCL-STRT-DT
      {
          Length = "10";
          SType = "Date";
          Label = "Start Date";
      }

      IN MIR-EXCL-END-DT
      {
          Length = "10";
          SType = "Date";
          Label = "Start Date";
      }


      IN MIR-ADJ-STRT-DT
      {
          Length = "10";
          SType = "Date";
          Label = "Start Date";
      }

      IN MIR-ADJ-END-DT
      {
          Length = "10";
          SType = "Date";
          Label = "Start Date";
      }

    IN MIR-EXCL-REASN-CD
    {
        Length = "40";
        SType = "Text";
        Label = "Exclusion Reason";
    }

    IN MIR-ADJ-REASN-CD
    {
        Length = "40";
        SType = "Text";
        Label = "Adjustment Reason";
    }

    IN MIR-EVNT-SEQ-NUM
   {
        Key;
        Length = "3";
  SType = "Text";
      Label = "Sequence Number";
   }

    IN MIR-CLM-AGG-NUM
   {
        Length = "3";
  SType = "Text";
      Label = "Aggregation Number";
   }
#*RP2CLA CHANGES START
    IN MIR-CLBD-MULTR-FCT
   {
        Length = "7";
        CodeSource = "EDIT";
        CodeType = "MULTR";
        DBTableName = "TCLBD";
        SType = "Selection";
        Label = "Multiplier ";
    }
#*RP2CLA CHANGES END

#*UY3023 CHANGES STARTS
    IN MIR-DISAB-ADJ-RAT
    {
        Length = "5";
        SType = "Text";
        Label = "(For Disability Benefit) Adjustment Ratio";
    }
     
    IN MIR-DISAB-MULTR-FCT
    {
        Length = "3";
        SType = "Text";
        Label = "(For Disability Benefit) Adjustment Multiplier";
    } 
    
#*UY3023 CHANGES ENDS

#* MP143F CHANGES START
    IN MIR-ADV-MEDIC-BNFT-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Advanced Medical Benefit Amount";
    }
#* MP143F CHANGES END

#* M242M1 CHANGES START
   IN MIR-SURG-CD
    {
        Length = "10";
        SType = "Text";
        Label = "Surgery Code";
     }
#* M242M1 CHANGES END

}
