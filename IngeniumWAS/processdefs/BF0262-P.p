# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:18 PM EDT

#*******************************************************************************
#*  Component:   BF0262-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  611J     Code cleanup					       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0262-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0262";
        BusinessFunctionName = "Interest Sensitive History Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM0311";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-AVG-LOAN-BAL-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TIH";
        SType = "Currency";
        Label = "Average Loan Balance";
    }

    INOUT MIR-BEG-YR-ACUM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TIH";
        SType = "Currency";
        Label = "Begin Year Fund";
    }

    INOUT MIR-DCLR-COI-RT
    {
        Signed;
        Length = "9";
        Decimals = "5";
        DBTableName = "TIH";
        SType = "Percent";
        Label = "Declared Cost of Insurance Rate";
    }

    INOUT MIR-DCLR-INT-RT
    {
        Signed;
        Length = "5";
        Decimals = "5";
        DBTableName = "TIH";
        SType = "Percent";
        Label = "Declared Interest Rate";
    }

    INOUT MIR-GUAR-INT-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TIH";
        SType = "Currency";
        Label = "Guaranteed Interest";
    }

    INOUT MIR-ISWL-ANNV-COI-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TIH";
        SType = "Currency";
        Label = "Cost of Insurance";
    }

    INOUT MIR-ISWL-ANNV-DB-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TIH";
        SType = "Currency";
        Label = "Death Benefit";
    }

    INOUT MIR-ISWL-ANNV-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ISWL-ANNV-STAT-CD";
        DBTableName = "TIH";
        SType = "Selection";
        Label = "Status";
    }

    INOUT MIR-NET-APREM-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TIH";
        SType = "Currency";
        Label = "Net Annual Premium";
    }

    INOUT MIR-NET-CV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TIH";
        SType = "Currency";
        Label = "Net Cash Value";
    }

    INOUT MIR-POL-GRS-APREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TIH";
        SType = "Currency";
        Label = "Gross Annual Premium";
    }

    INOUT MIR-XCES-INT-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TIH";
        SType = "Currency";
        Label = "Excess Interest";
    }

    INOUT MIR-YR-END-ACUM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TIH";
        SType = "Currency";
        Label = "Year End Fund";
    }

    IN MIR-ISWL-ANNV-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TIH";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Anniversary Date";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TIH";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TIH";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    INOUT MIR-ISWL-ANNV-MANL-IND
    {
        Length = "1";
        DBTableName = "TIH";
        SType = "Indicator";
        Label = "Record updated manually";
    }

    IN MIR-ISWL-ANNV-UPDT-DT
    {
        Length = "10";
        DBTableName = "TIH";
        SType = "Date";
        Label = "Last Change Date";
    }

}

