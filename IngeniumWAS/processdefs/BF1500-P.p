# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:40 PM EDT

#*******************************************************************************
#*  Component:   BF1500-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  IPMPPA  IPMP     New field MIR-DLAY-INT-AMT added for IPMPPA               *
#*  MPCR01  14DEC07  Added new fields 'One-Time Deduction' and 'Payout Activity*
#*                   Process Date'                                             *
#*  ISLIMP  18JAN10  ADDED 2 NEW FIELDS AS PART OF INSURANCE LAW IPMP          *
#*  MP113A  CTS      Changes for New Annuity Plan and addition of new field    *
#*  UY3049  CTS      STREAM 3 ANNUITY PAYOUT                                   *
#*******************************************************************************

P-STEP BF1500-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1500";
        BusinessFunctionName = "Automatic Payout History Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM4310";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CDA-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCDSA";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Payout Date";
    }

    IN MIR-CDA-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TCDSA";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TCDSA";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TCDSA";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-POL-PAYO-NUM
    {
        Key;
        Mandatory;
        Length = "5";
        DBTableName = "TCDSA";
        DefaultConstant = "00000";
        SType = "Text";
        Label = "Payout Number";
    }

    OUT MIR-CDAD-PAYO-MTHD-CD-T[139]
    {
        Length = "1";
        FieldGroup = "Table139";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "CDI-PAYO-MTHD-CD";
        DBTableName = "TCDSD";
        SType = "Text";
        Label = "Payout Method";
        Index = "1";
    }

    OUT MIR-CDAD-TRXN-AMT-T[139]
    {
        Length = "15";
        FieldGroup = "Table139";
        DBTableName = "TCDSD";
        SType = "Currency";
        Label = "Transferred Amount";
        Index = "1";
    }

    OUT MIR-CDA-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CDA-STAT-CD";
        DBTableName = "TCDSA";
        SType = "Text";
        Label = "Status";
    }

    OUT MIR-CDA-TOT-TAXWH-AMT
    {
        Length = "13";
        DBTableName = "TCDSA";
        SType = "Currency";
        Label = "Total Amount of Tax Withheld";
    }

    OUT MIR-CDA-TOT-TRXN-AMT
    {
        Length = "15";
        DBTableName = "TCDSA";
        SType = "Currency";
        Label = "Total Payout Amount";
    }

    # New field added for MPCR01
    OUT MIR-ONE-TIME-DED-AMT
    {
        Length = "15";
        DBTableName = "TCDSA";
        SType = "Currency";
        Label = "One-Time Deduction";
    }

    # New field added for IPMPPA
    OUT MIR-DLAY-INT-AMT
    {
        Length = "13";
        Decimals="2";
        DBTableName = "TCDSA";
        SType = "Currency";
        Label = "Delay Interest:";
    }
    # Change IPMPPA Ends here

    # New field added for MPCR01
    OUT MIR-PREV-UPDT-DT
    {
        Length = "10";
        DBTableName = "TCDSA";
        SType = "Date";
        Label = "Payout Activity Process Date";
    }

    OUT MIR-CVG-NUM
    {
        Length = "2";
        DBTableName = "TCDSA";
        SType = "Text";
        Label = "Coverage Number";
    }

    OUT MIR-DEST-CHQ-ID-T[139]
    {
        Length = "16";
        FieldGroup = "Table139";
        DBTableName = "TCDSD";
        SType = "Text";
        Label = "Cheque Reference Number";
        Index = "1";
    }

    OUT MIR-DEST-CVG-NUM-T[139]
    {
        Length = "2";
        FieldGroup = "Table139";
        DBTableName = "TCDSD";
        SType = "Text";
        Label = "Destination Coverage Number";
        Index = "1";
    }

    OUT MIR-DEST-FND-ID-T[139]
    {
        Length = "5";
        FieldGroup = "Table139";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TCDSD";
        SType = "Text";
        Label = "Fund ID";
        Index = "1";
    }

    OUT MIR-DEST-POL-ID-BASE-T[139]
    {
        Length = "9";
        FieldGroup = "Table139";
        DBTableName = "TCDSD";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    OUT MIR-DEST-POL-ID-SFX-T[139]
    {
        Length = "1";
        FieldGroup = "Table139";
        DBTableName = "TCDSD";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    OUT MIR-FND-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TCDSA";
        SType = "Text";
        Label = "Fund ID";
    }

    OUT MIR-POL-PAYO-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-TYP-CD";
        DBTableName = "TPOLP";
        SType = "Selection";
        Label = "Payout Type";
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
# MP113A CTS  10NOV2010 New Payout Plan Setup Changes  

    OUT MIR-MODE-PAYO-AMT
    {
        Length = "15";
        DBTableName = "TCDSA";
        DefaultSession = "MIR-MODE-PAYO-AMT";        
        SType = "Currency";
        Label = "Modal Payout Amount";
    }
    
    OUT MIR-SPLT-INT-AMT
    {
        Length = "13";
        DBTableName = "TCDSA";
        DefaultSession = "MIR-SPLT-INT-AMT"; 
        SType = "Currency";
        Label = "Split Payment Interest";
    }
#UY3049 CHANGES STARTS HERE 
    OUT MIR-YEAR-NUM
    {
        Length = "3";
        DBTableName = "TCDSA";
        SType = "Text";
        Label = "Year Number";
        Index = "1";
    }

    OUT MIR-INSTL-NUM
    {
        Length = "3";
        DBTableName = "TCDSA";
        SType = "Text";
        Label = "Installment Number";
        Index = "1";
    }

    OUT MIR-BASIC-ANTY-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Basic Annuity Amount";
    }

    OUT MIR-ADDL-ANTY-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Additional Annuity Amount";
    }
#UY3049 CHANGES ENDS HERE
}

