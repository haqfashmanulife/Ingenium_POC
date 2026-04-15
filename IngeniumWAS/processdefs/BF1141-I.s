# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:34 PM EDT

#*******************************************************************************
#*  Component:   BF1141-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1141-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-CIA-SRC-DEST-CD";
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

    INOUT MIR-CIA-SRC-DEST-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-SRC-DEST-CD";
        SType = "Selection";
        Label = "Destination of Surrender Amount";
    }

    INOUT MIR-CIA-TAXWH-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Bypass the tax withholding process";
    }

    INOUT MIR-DV-CIA-REASN-CD
    {
        Mandatory;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "DV-CIA-REASN-CD";
        SType = "Selection";
        Label = "DV_CIA_REASN_CD";
    }

    INOUT MIR-SUPRES-CNFRM-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

    INOUT MIR-CIA-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Effective Date";
    }

    INOUT MIR-DV-FROM-FND-AMT-T[139]
    {
        Mandatory;
        Length = "15";
        FieldGroup = "Table30";
        SType = "Currency";
        Label = "From fund";
        Index = "1";
    }

    INOUT MIR-DV-POL-SURR-AMT
    {
        Mandatory;
        Length = "15";
        SType = "Currency";
        Label = "Surrender Amount";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Process code";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

}

