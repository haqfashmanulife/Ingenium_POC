# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:28 PM EDT

#*******************************************************************************
#*  Component:   BF0752-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0752-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-TXEMP-TST-AMT-T[1]";
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

    INOUT MIR-TXEMP-TST-AMT-T[12]
    {
        Length = "15";
        FieldGroup = "Table12";
        SType = "Currency";
        Label = "Sum Insured Amount";
        Index = "1";
    }

    INOUT MIR-TXEMP-TST-ANNV-DT-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        SType = "Date";
        Label = "Exemption Test Date";
        Index = "1";
    }

    IN MIR-CVG-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
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

    IN MIR-TXEMP-TST-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Coverage Sequence Number";
    }

}

