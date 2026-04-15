# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9662-P.p                                                    *
#*  Description: Benefit Support Table (BENS) Update step                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HPR102  HIN/CL   CLAIM REQUIREMENTS                                        *
#*  RP211d  RP2      ADDED SUBTABLE 4 CODE RIDER VERSION CODE                  *
#*  MP143E  CTS      CHANGES TO DISPLAY ALTERNATE MAXIMUM CLAIM UNITS          *
#*  Q06528  CTS      RIDER MAX AND CLAIM MAX FIELDS ARE INCREASED TO           *
#*  Q06528           THEIR ACTUL LENGTH MENTIONED IN DB                        * 
#*******************************************************************************

P-STEP BF9662-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9662";
        BusinessFunctionName = "Benefit Support Table Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM9662";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;


    IN MIR-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TBENS";
        SType = "Selection";
        Label = "Plan Name";
    }

    IN MIR-BNFT-NM-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "BENNM";
        DBTableName = "TBENS";
        SType = "Selection";
        Label = "Benefit Name";
    }
    
    IN MIR-STBL-2-CD
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TBENS";
        SType = "Selection";
        Label = "Sub-table 2";
    }

    IN MIR-STBL-4-CD
    {
        Key;
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TBENS";
        SType = "Selection";
        Label = "Sub-table 4";
    }
     
    INOUT MIR-EFF-DT
    {
        Length = "10";
        DBTableName = "TBENS";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-BNFT-AMT-CALC-CD
    {
        Length = "30";
        CodeSource = "DataModel";
        CodeType = "BNFT-AMT-CALC-CD";
        DBTableName = "TBENS";
        SType = "Selection";
        Label = "Benefit Amount Calculation Code";
    }

    INOUT MIR-MULTR-TYPE-CD
    {
        Length = "30";
        CodeSource = "EDIT";
        CodeType = "BNMLT";
        DBTableName = "TBENS";
        SType = "Selection";
        Label = "Multiplier Type";
    }
    INOUT MIR-BENS-BNFT-FCT
    {
        Length = "6";
        Decimals = "2";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "Benefit Factor";
    }

    INOUT MIR-BENS-DPND-FCT
    {
        Length = "3";
        Decimals = "2";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "Dependant Factor";
    }

    INOUT MIR-BENS-PMT-TYP-CD
    {
        Length = "30";
        CodeSource = "DataModel";
        CodeType = "BENS-PMT-TYP-CD";
        DBTableName = "TBENS";
        SType = "Selection";
        Label = "Payment Type Indicator";
    }

    INOUT MIR-INIT-DEDBL-UNITS
    {
        Length = "4";
        Decimals = "0";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "BNFT-AMT-CALC-CD";
    }

    INOUT MIR-MIN-HOSP-UNITS
    {
        Length = "4";
        Decimals = "0";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "Minimum Hospitalisation Units";
    }

    INOUT MIR-MAX-CLM-UNITS
    {
        Length = "5";
        Decimals = "0";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "Maximum Claim Units";
    }

    INOUT MIR-MAX-RIDER-UNITS
    {
        Length = "5";
        Decimals = "0";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "Maximum Rider Units";
    }

    INOUT MIR-SUBSEQ-HOSP-UNITS
    {
        Length = "4";
        Decimals = "0";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "Subsequent Hospitalisation Units";
    }

    INOUT MIR-CONTNU-HOSP-UNITS
    {
        Length = "4";
        Decimals = "0";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "Continuous Hospitalisation Units";
    }
    
    INOUT MIR-VALID-PERI-UNITS
    {
        Length = "4";
        Decimals = "0";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "Valid Benefit Period Units";
    }
    
    INOUT MIR-WAITING-PERI-UNITS
    {
        Length = "4";
        Decimals = "0";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "Waiting Period (Years)";
    }

    INOUT MIR-CANCER-BNFT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Discharge Benefit Eligibility";
    }

    INOUT MIR-DSCHRG-ELIG-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Discharge Benefit Eligibility";
    }

    INOUT MIR-INCID-TYP-CD
    {
        Length = "5";
        DBTableName = "TBENS";
        CodeSource = "DataModel";
        CodeType = "INCID-TYP-CD";        
        SType = "Selection";
        Label = "Incident Type";
    }

    INOUT MIR-BNFT-CAT-CD
    {
        Length = "5";
        DBTableName = "TBENS";
        CodeSource = "DataModel";
        CodeType = "BNFT-CAT-CD";        
        SType = "Selection";
        Label = "Benefit Category";
    }

    INOUT MIR-BENS-CLM-TYP-CD
    {
        Length = "5";
        DBTableName = "TBENS";
        CodeSource = "DataModel";
        CodeType = "BENS-CLM-TYP-CD";        
        SType = "Selection";
        Label = "Benefit Claim Type";
    }

    INOUT MIR-BNFT-ID-CD
    {
        Length = "5";
        DBTableName = "TBENS";
        CodeSource = "DataModel";
        CodeType = "BNFT-ID-CD";        
        SType = "Selection";
        Label = "Benefit Identifier Code";
    }

    INOUT MIR-VALID-PERI-DPND-CD
    {
        Length = "1";
        DBTableName = "TBENS";
        CodeSource = "DataModel";
        CodeType = "VALID-PERI-DPND-CD";        
        SType = "Selection";
        Label = "Valid Benefit Period Dependency";
    }

    INOUT MIR-VALID-PERI-TYP-CD
    {
        Length = "1";
        DBTableName = "TBENS";
        CodeSource = "DataModel";
        CodeType = "VALID-PERI-TYP-CD";        
        SType = "Selection";
        Label = "Valid Benefit Period Type";
    }

    INOUT MIR-AGG-RULE-CD
    {
        Length = "1";
        DBTableName = "TBENS";
        CodeSource = "DataModel";
        CodeType = "AGG-RULE-CD";        
        SType = "Selection";
        Label = "Aggregation Type";
    }
    
    INOUT MIR-FORCE-NEW-AGG-DUR
    {
        Length = "4";
        Decimals = "0";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "Force New Aggregation For Accident";
    }

    INOUT MIR-RDR-VERS-GR-CD
    {
        Key;
        Length = "02";
        CodeSource = "DataModel";
        CodeType = "RDR-VERS-GR-CD";
        DBTableName = "TBENS";
        SType = "Selection";
        Label = "Rider Version Group Code";
    }
#* MP143E CHANGES START    
    INOUT MIR-ALT-MAX-CLM-UNITS
    {
            Length = "5";
            Decimals = "0";
            DBTableName = "TBENS";
            SType = "Number";
            Label = "Alternate Maximum Claim Units";
    }
#* MP143F CHANGES END
 
}
