# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:53 PM EDT

#*******************************************************************************
#*  Component:   BF6977-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF6977-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "6977";
        BusinessFunctionName = "Policy Inquiry - Equity Indexed Annuity";
        BusinessFunctionType = "Eidtl";
        MirName = "CCWM6977";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CVG-NUM
    {
        Key;
        Length = "2";
        DBTableName = "TCVG";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-CF-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCFLW";
        SType = "Date";
        Label = "Index Date";
    }

    IN MIR-CF-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Index Sequence Number";
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

    OUT MIR-CF-FND-BAL-AMT
    {
        Signed;
        Length = "16";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Current Amount";
    }

    OUT MIR-CF-FND-BAL-AMT-2
    {
        Signed;
        Length = "16";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Current Amount";
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

    OUT MIR-DV-CRNT-FND-AMT
    {
        Signed;
        Length = "16";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Agent card";
    }

    OUT MIR-DV-INDX-GRWTH-FCT
    {
        Signed;
        Length = "6";
        Decimals = "3";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Index Growth Factor";
    }

    OUT MIR-DV-INDX-GRWTH-FCT-2
    {
        Signed;
        Length = "6";
        Decimals = "3";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Index Growth Factor";
    }

    OUT MIR-DV-INDX-INCR-AMT
    {
        Signed;
        Length = "16";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Index Increase Amount";
    }

    OUT MIR-DV-INDX-INCR-AMT-2
    {
        Signed;
        Length = "16";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Index Increase Amount";
    }

    OUT MIR-DV-INDX-INCR-PCT
    {
        Signed;
        Length = "14";
        Decimals = "5";
        DBTableName = "Derived";
        SType = "Percent";
        Label = "Index Increase Percent";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
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

    OUT MIR-PURCH-PRIC-1-AMT
    {
        Signed;
        Length = "18";
        Decimals = "9";
        DBTableName = "TFV";
        SType = "Currency";
        Label = "Buy Price";
    }

    OUT MIR-PURCH-PRIC-1-AMT-2
    {
        Signed;
        Length = "18";
        Decimals = "9";
        DBTableName = "TFV";
        SType = "Currency";
        Label = "Buy Price";
    }

    OUT MIR-PURCH-PRIC-1-AMT-3
    {
        Signed;
        Length = "18";
        Decimals = "9";
        DBTableName = "TFV";
        SType = "Currency";
        Label = "Buy Price";
    }

    OUT MIR-RTBL-1-RT
    {
        Signed;
        Length = "14";
        Decimals = "5";
        DBTableName = "TRT";
        SType = "Percent";
        Label = "Rate 1";
    }

    OUT MIR-RTBL-2-RT
    {
        Signed;
        Length = "14";
        Decimals = "5";
        DBTableName = "TRT";
        SType = "Percent";
        Label = "Rate 2";
    }

    OUT MIR-RTBL-3-RT
    {
        Signed;
        Length = "14";
        Decimals = "5";
        DBTableName = "TRT";
        SType = "Percent";
        Label = "Rate 3";
    }

    OUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
    }

}

