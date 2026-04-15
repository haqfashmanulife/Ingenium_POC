# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:18 PM EDT

#*******************************************************************************
#*  Component:   BF0262-I.s                                                    *
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

S-STEP BF0262-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-BEG-YR-ACUM-AMT";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    INOUT MIR-AVG-LOAN-BAL-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Average Loan Balance";
    }

    INOUT MIR-BEG-YR-ACUM-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Begin Year Fund";
    }

    INOUT MIR-DCLR-COI-RT
    {
        Signed;
        Length = "9";
        Decimals = "5";
        SType = "Percent";
        Label = "Declared Cost of Insurance Rate";
    }

    INOUT MIR-DCLR-INT-RT
    {
        Signed;
        Length = "5";
        Decimals = "5";
        SType = "Percent";
        Label = "Declared Interest Rate";
    }

    INOUT MIR-GUAR-INT-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Guaranteed Interest";
    }

    INOUT MIR-ISWL-ANNV-COI-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Cost of Insurance";
    }

    INOUT MIR-ISWL-ANNV-DB-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Death Benefit";
    }

    INOUT MIR-ISWL-ANNV-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ISWL-ANNV-STAT-CD";
        SType = "Selection";
        Label = "Status";
    }

    INOUT MIR-NET-APREM-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Net Annual Premium";
    }

    INOUT MIR-NET-CV-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Net Cash Value";
    }

    INOUT MIR-POL-GRS-APREM-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Gross Annual Premium";
    }

    INOUT MIR-XCES-INT-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Excess Interest";
    }

    INOUT MIR-YR-END-ACUM-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Year End Fund";
    }

    IN MIR-ISWL-ANNV-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Anniversary Date";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-ISWL-ANNV-MANL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Record updated manually";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-ISWL-ANNV-UPDT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Change Date";
    }

}

