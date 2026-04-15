# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:28 PM EDT

#*******************************************************************************
#*  Component:   BF0741-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0741-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
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

    IN MIR-TXEMP-TST-ANNV-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Exemption Test Date";
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

    IN MIR-CVG-SUM-INS-AMT-T[12]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table12";
        SType = "Currency";
        Label = "Sum Insured Amount";
        Index = "1";
    }

    IN MIR-DV-FND-PUA-AMT-T[12]
    {
        DisplayOnly;
        Length = "17";
        FieldGroup = "Table12";
        SType = "Currency";
        Label = "Paid-up Additions Amount (Accumulating Fund)";
        Index = "1";
    }

    IN MIR-DV-FND-SUM-INS-AMT-T[12]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table12";
        SType = "Currency";
        Label = "Sum Insured Amount (Accumulating Fund)";
        Index = "1";
    }

    IN MIR-DV-MISC-HDG-TXT-T[12]
    {
        DisplayOnly;
        Length = "79";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Key Is";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-POL-DUR-T[12]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Policy Duration";
        Index = "1";
    }

    IN MIR-PUA-LTD-FACE-AMT-T[12]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table12";
        SType = "Currency";
        Label = "Total Paid-up Additions";
        Index = "1";
    }

}

