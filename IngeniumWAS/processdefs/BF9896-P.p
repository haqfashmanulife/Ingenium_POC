# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:03 PM EDT

#*******************************************************************************
#*  Component:   BF9896-P.p                                                    *
#*  Description: Insured Claim Inquiry                                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* HAC002  HIN/CL   HEAD AND BRANCH OFFICE CLAIM INQ (HAC002C)                 *
#* EN0212  RAJU     ADD A NEW FIELD ASSOCIATED MASTER CLAIM ID                 *
#* EN000224   GW  ADD DECISION CODE                                            *
#* RP2CLA   CTS   CHANGES FOR CANCER LUMPSUM AUTOMATION                        *
#* S23321   CTS   FIX TO POPULATE CANCR DIAGNOSED DATE-INSURED CLAIM INQ SCREEN*
#* ASD812   CTS   CHANGES DONE FOR PAYMENT LIMIT CHECK AS PART OF ASD812 PROJ  *
#* AS0044   CTS   ASD-812 CHANGES DONE TO FIX THE EOF PAGE ISSUE               *
#*******************************************************************************

P-STEP BF9896-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9896";
        BusinessFunctionName = "Insured Claim Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9896";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        SType = "Text";
        Label = "Insured Client ID";
    }

    INOUT MIR-POL-ID
    {
        Key;
        Mandatory;
        Length = "10";
        SType = "Text";
        Label = "Policy ID";
    }

    INOUT MIR-CLM-ID
    {
        Length = "8";
        SType = "Hidden";
        Label = "Claim ID";
    }

    INOUT MIR-CVG-NUM
    {
        Length = "2";
        SType = "Hidden";
        Label = "Coverage Number";
    }

    INOUT MIR-BNFT-NM-ID
    {
        Length = "5";
        SType = "Hidden";
        Label = "Benefit Name";
    }

    INOUT MIR-CLM-AGG-NUM
    {
        Length = "3";
        SType = "Hidden";
        Label = "Aggregation Number";
    }
     
#*----- EN000224 Changes begin here
    INOUT MIR-BNFT-DECSN-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Decision Code";
    }
#*----- EN000224 Changes end here
 
    OUT MIR-USER-BRANCH-CODE
    {
        Length = "5";
        SType = "Hidden";
        Label = "Branch Code";
    }
    
    OUT MIR-CLI-NM
    {
        Length = "60";
        SType = "Text";
        Label = "Insured Name";
    }

    OUT MIR-CLI-BTH-DT
    {
        Length = "10";
        SType = "Text";
        Label = "Birth Date";
    }

    OUT MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
    }

    OUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
    }

    OUT MIR-T1-CVG-NUM-T[15]
    {
        Length = "2";
        FieldGroup = "Table1";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-T1-BNFT-NM-ID-T[15]
    {
        Length = "40";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "BENNM";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Benefit Name";
        Index = "1";
    }

    OUT MIR-MAX-RIDER-UNITS-T[15]
    {
        Length = "5";
        FieldGroup = "Table1";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "Max Rider Units";
        Index = "1";
    }

    OUT MIR-MAX-CLM-UNITS-T[15]
    {
        Length = "5";
        FieldGroup = "Table1";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "Max Claim Units";
        Index = "1";
    }

    OUT MIR-T1-MULT-AMT-T[15]
    {
#*RP2CLA-Changed Decimals ="1"        
        Length = "6";
        Decimals = "1";
        FieldGroup = "Table1";
        SType = "Number";
        Label = "Multiplier";
        Index = "1";
    }

    OUT MIR-CLM-ID-T[30]
    {
        Length = "8";
        FieldGroup = "Table2";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Master Claim ID";
        Index = "1";
    }

#*----- EN000212 Changes begin here
    OUT MIR-ASSOC-CLM-ID-T[30]
    {
        Length = "8";
        FieldGroup = "Table2";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Associated Master Claim ID";
        Index = "1";
    }

#*----- EN000212 Changes end here
    OUT MIR-T2-CVG-NUM-T[30]
    {
        Length = "2";
        FieldGroup = "Table2";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-T2-BNFT-NM-ID-T[30]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "BENNM";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Benefit Name";
        Index = "1";
    }

    OUT MIR-CLM-AGG-NUM-T[30]
    {
        Length = "3";
        FieldGroup = "Table2";
        DBTableName = "TCLBE";
        SType = "Number";
        Label = "Aggregation Number";
        Index = "1";
    }

    OUT MIR-CLBN-BNFT-DECSN-CD-T[30]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "CLBN-BNFT-DECSN-CD";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Decision";
        Index = "1";
    }

    OUT MIR-FBNK-REMIT-DT-T[30]
    {
        Length = "10";
        FieldGroup = "Table2";
        DBTableName = "TCLBN";
        SType = "Date";
        Label = "Deposit Date";
        Index = "1";
    }

    OUT MIR-CLMA-INCID-DT-T[30]
    {
        Length = "10";
        FieldGroup = "Table2";
        DBTableName = "TCLMA";
        SType = "Date";
        Label = "Incident Date";
        Index = "1";
    }

    OUT MIR-EVNT-STRT-DT-T[30]
    {
        Length = "10";
        FieldGroup = "Table2";
        SType = "Date";
        Label = "Start Date";
        Index = "1";
    }

    OUT MIR-EVNT-END-DT-T[30]
    {
        Length = "10";
        FieldGroup = "Table2";
        SType = "Date";
        Label = "End Date";
        Index = "1";
    }

    OUT MIR-PAID-CLM-END-DT-T[30]
    {
        Length = "10";
        FieldGroup = "Table2";
        SType = "Date";
        Label = "Paid Claim End Date";
        Index = "1";
    }
    
    OUT MIR-T2-MULT-AMT-T[30]
    {
#*RP2CLA-Changed Decimals ="1"        
        Length = "6";
        Decimals = "1";
        FieldGroup = "Table2";
        SType = "Number";
        Label = "Multiplier";
        Index = "1";
    }

    OUT MIR-PAY-AMT-T[30]
    {
        Length = "15";
        FieldGroup = "Table2";
        SType = "Number";
        Label = "Payable/Paid Amount";
        Index = "1";
    }    

    OUT MIR-CLBN-FINAL-MAJ-CD-T[30]
    {
        Length = "10";
        FieldGroup = "Table2";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Final Major Disease Code";
        Index = "1";
    }

    OUT MIR-DIS-MAJ-CD-NM-T[30]
    {
        Length = "60";
        FieldGroup = "Table2";
        DBTableName = "TLANG";
        SType = "Text";
        Label = "Final Major Disease Code Kanji Description";
        Index = "1";
    }
    
    OUT MIR-CLBN-SURG-CD-T[30]
    {
        Length = "10";
        FieldGroup = "Table2";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Surgery Major Code";
        Index = "1";
    }

    OUT MIR-SURG-MAJ-CD-NM-T[30]
    {
        Length = "60";
        FieldGroup = "Table2";
        DBTableName = "TLANG";
        SType = "Text";
        Label = "Surgery Major Code Kanji Description";
        Index = "1";
    }
    
# S23321 CHANGES START
    OUT MIR-CLMA-CANCR-DIAG-DT-T[30]
    {
        Length = "10";
        FieldGroup = "Table2";
        DBTableName = "TCLMA";
        SType = "Date";
        Label = "Cancer Diagnosed Date";
        Index = "1";
    }   
# S23321 CHANGES END

#*----- EN000225 Changes begin here
    OUT MIR-DV-JS-LOAD-CD-T[30]
    {
        Length = "1";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Java Script Load Code";
        Index = "1";
    }
#*----- EN000225 Changes end here

#*-----ASD812 CHANGES START
    
    INOUT MIR-PAGE-CTR
    {
      Length = "2";
      SType = "Hidden";
      Label = "Action";
    }
#*-----ASD812 CHANGES END
#*-----AS0044 CHANGES START
    
    INOUT MIR-PAGE-END-IND
    {
      Length = "1";
      SType = "Hidden";
      Label = "Action";
    }
    
    INOUT MIR-TOT-PAGE-CTR
    {
      Length = "2";
      SType = "Hidden";
      Label = "Action";
    }    
   
#*-----AS0044 CHANGES END
}
