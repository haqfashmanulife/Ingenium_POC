# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:32 PM EDT

#*******************************************************************************
#*  Component:   BF0945-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  MPCR01  14DEC07  Added Delay Interest Override fields                      *
#*  MPCR18  05MAR08  Added Withholding Tax and One time Deduction fields       *
#*  ISLIMP  18JAN10  ADDED 2 NEW FIELDS AS PART OF INSURANCE LAW IPMP          *
#*  Q05003  08MAR11  MP113A - Added Annuity Fund Amount field                  *
#*  UY3049  CTS      ANNUITY PAYMENT SCREEN                                    *
#*******************************************************************************

P-STEP BF0945-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0945";
        BusinessFunctionName = "Automatic Payout Processing Payment";
        BusinessFunctionType = "Payment";
        MirName = "CCWM4300";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-POL-PAYO-NUM
    {
        Key;
        Mandatory;
        Length = "5";
        DBTableName = "TPOLP";
        DefaultConstant = "00000";
        SType = "Text";
        Label = "Payout Number";
    }

    IN MIR-SUPRES-CNFRM-IND
    {
        Length = "1";
        DBTableName = "TPOLP";
        SType = "Indicator";
        Label = "Suppress Confirm Indicator";
    }

# MPCR01 Changes start here

    IN MIR-BPSS-DLAY-INT-IND
    {
        Length = "1";
        DBTableName = "TPOLP";
        SType = "Indicator";
        Label = "Bypass Delay Interest Computation";
    }

    IN MIR-DLAY-INT-OVRID-AMT
    {
        Length = "15";
        DBTableName = "TPOLP";
        SType = "Currency";
        Label = "Delay Interest Override Amount";
    }

# MPCR01 Changes end here

# MPCR18 Changes starts here
    OUT MIR-POL-PAYO-TAXWH-AMT
    {
        Length = "15";
        DBTableName = "TPOLP";
        SType = "Currency";
        Label = "Withholding Tax";
    }

    OUT MIR-ONE-TIME-DED-AMT
    {
        Length = "15";
        DBTableName = "TPOLP";
        SType = "Currency";
        Label = "One Time Deduction";
    }

# MPCR18 Changes End here

    OUT MIR-CDA-EFF-DT
    {
        Length = "10";
        DBTableName = "TCDSD";
        SType = "Date";
        Label = "Last Payment Date";
    }

    OUT MIR-CDI-ALLOC-AMT-T[139]
    {
        Length = "15";
        FieldGroup = "Table139";
        DBTableName = "TCDSI";
        SType = "Currency";
        Label = "Amount / Percent / No. of Units";
        Index = "1";
    }

    OUT MIR-CDI-ALLOC-CD-T[139]
    {
        Length = "1";
        FieldGroup = "Table139";
        CodeSource = "DataModel";
        CodeType = "CDI-ALLOC-CD";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Allocation Basis";
        Index = "1";
    }

    OUT MIR-CDI-PAYO-MTHD-CD-T[139]
    {
        Length = "1";
        FieldGroup = "Table139";
        CodeSource = "DataModel";
        CodeType = "CDI-PAYO-MTHD-CD";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Payout Method";
        Index = "1";
    }

    OUT MIR-CVG-NUM
    {
        Length = "2";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Coverage Number";
    }

    OUT MIR-DEST-CVG-NUM-T[139]
    {
        Length = "2";
        FieldGroup = "Table139";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Destination Coverage Number";
        Index = "1";
    }

    OUT MIR-DEST-FND-ID-T[139]
    {
        Length = "40";
        FieldGroup = "Table139";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Fund Receiving Money";
        Index = "1";
    }

    OUT MIR-DEST-POL-ID-BASE-T[139]
    {
        Length = "9";
        FieldGroup = "Table139";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Policy Id Receiving Money";
        Index = "1";
    }

    OUT MIR-DEST-POL-ID-SFX-T[139]
    {
        Length = "1";
        FieldGroup = "Table139";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    OUT MIR-DV-FND-DESC-TXT-T[139]
    {
        Length = "40";
        FieldGroup = "Table139";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Fund Description";
        Index = "1";
    }

    OUT MIR-FND-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Fund";
    }

    OUT MIR-PAYO-LEAD-TIME-DUR
    {
        Length = "3";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Lead Time";
    }

    OUT MIR-POL-PAYO-AMT
    {
        Length = "15";
        DBTableName = "TPOLP";
        SType = "Currency";
        Label = "Total Payout Amount";
    }

    OUT MIR-POL-PAYO-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOLP";
        SType = "Date";
        Label = "Efffective Date";
    }

    OUT MIR-POL-PAYO-END-DT
    {
        Length = "10";
        DBTableName = "TPOLP";
        SType = "Date";
        Label = "End Date";
    }

    OUT MIR-POL-PAYO-MODE-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-MODE-CD";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Payout Mode";
    }

    OUT MIR-POL-PAYO-NXT-DT
    {
        Length = "10";
        DBTableName = "TPOLP";
        SType = "Date";
        Label = "Next Payout Date";
    }

    OUT MIR-POL-PAYO-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-STAT-CD";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Status";
    }

    OUT MIR-POL-PAYO-TAXWH-IND
    {
        Length = "1";
        DBTableName = "TPOLP";
        SType = "Indicator";
        Label = "Bypass Tax Withholding Calculations";
    }

    OUT MIR-POL-PAYO-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-TYP-CD";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Payout Type";
    }

    OUT MIR-POL-PAYO-UNIT-QTY
    {
        Length = "18";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Total Payout Units";
    }

# ISLIMP - Changes start here

    OUT MIR-CLM-DYS-BFR-PMT-DUE
    {
        Length = "03";
        DefaultConstant = "005";
        CodeSource = "DataModel";
        CodeType = "DYS-BFR-PMT-DUE";
        DBTableName = "TPOLP";
        SType = "Selection";
        Label = "Days before Claim Payment Due";
    }

    OUT MIR-DLY-INT-STRT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Delay Interest Start Date";
    }

# ISLIMP - Changes end here

# MP113A - Q05003 Changes

    OUT MIR-ANTY-FND-AMT
    {
        Signed;
        Length = "15";
        Decimals = "2";
        DBTableName = "TPOLP";
        SType = "Number";
        Label = "Annuity Fund Amount";
    }        
#UY3049 CHANGES STARTS
    IN MIR-10-POL-ID
    {
        Length = "10";
        SType = "Hidden";
        Label = "Policy Id";
    }     
    IN MIR-STR3-PAYO-IND
    {
        Length = "1";
        SType = "Hidden";
    }
#UY3049 CHANGES ENDS
}

