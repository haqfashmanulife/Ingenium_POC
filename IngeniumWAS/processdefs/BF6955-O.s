# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:00 PM EDT

#*******************************************************************************
#*  Component:   BF6955-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF6955-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "ISWL";
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
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

    IN MIR-APPL-CTL-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
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

    IN MIR-BEG-YR-ACUM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Begin Year Fund";
    }

    IN MIR-DCLR-COI-RT
    {
        DisplayOnly;
        Signed;
        Length = "9";
        Decimals = "5";
        SType = "Percent";
        Label = "Declared Cost of Insurance Rate";
    }

    IN MIR-DCLR-INT-RT
    {
        DisplayOnly;
        Signed;
        Length = "5";
        Decimals = "5";
        SType = "Percent";
        Label = "Declared Interest Rate";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-GUAR-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Guaranteed Interest";
    }

    IN MIR-ISWL-ANNV-COI-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Cost of Insurance";
    }

    IN MIR-ISWL-ANNV-DB-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Death Benefit";
    }

    IN MIR-ISWL-ANNV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Anniversary Date";
    }

    IN MIR-ISWL-ANNV-MANL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Record updated manually";
    }

    IN MIR-ISWL-ANNV-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ISWL-ANNV-STAT-CD";
        SType = "Text";
        Label = "Status";
    }

    IN MIR-ISWL-ANNV-UPDT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Change Date";
    }

    IN MIR-NET-APREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Net Annual Premium";
    }

    IN MIR-NET-CV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Net Cash Value";
    }

    IN MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
    }

    IN MIR-POL-GRS-APREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Gross Annual Premium";
    }

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

    IN MIR-XCES-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Excess Interest";
    }

    IN MIR-YR-END-ACUM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Year End Fund";
    }

}

