# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:26 PM EDT

#*******************************************************************************
#*  Component:   BF0645-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0645-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0645";
        BusinessFunctionName = "Annuity Processing MCV Adjustment";
        BusinessFunctionType = "Mcvadj";
        MirName = "CCWM0771";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CF-MCV-INT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "MCV Interest to Next Cash Flow Amount";
    }

    INOUT MIR-CF-MCV-TRXN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "MCV Net Amount";
    }

    INOUT MIR-MCV-ACUM-INT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "MCV Accumulated Interest Amount";
    }

    INOUT MIR-MCV-GUAR-INT-PCT
    {
        Signed;
        Length = "7";
        Decimals = "5";
        DBTableName = "TCFLW";
        SType = "Percent";
        Label = "MCV Guaranteed Interest Rate";
    }

    IN MIR-CF-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TCFLW";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TCVG";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-DV-CF-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCFLW";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "process code";
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

    IN MIR-SUPRES-CNFRM-IND
    {
        Key;
        Length = "1";
        DBTableName = "TPOLP";
        SType = "Indicator";
        Label = "Suppress Confirm";
    }

    OUT MIR-ACUM-INT-LTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Accumulated Cash Flow Interest Paid Amount";
    }

    OUT MIR-CF-CLI-TRXN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Cash Flow Amount";
    }

    OUT MIR-CF-MCV-FND-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "MCV Current Fund Amount";
    }

    OUT MIR-CF-MCV-INT-LTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Accumulated MCV Interest Amount";
    }

    OUT MIR-CF-REASN-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CF-REASN-CD";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Transaction Reason";
    }

    OUT MIR-CF-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CF-STAT-CD";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Cash Flow Status";
    }

    OUT MIR-CF-TRXN-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CF-TRXN-CD";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Transaction Type";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

}

