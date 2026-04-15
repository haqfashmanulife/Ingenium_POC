# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:51 PM EDT

#*******************************************************************************
#*  Component:   BF1785-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1785-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Varsurrg";
        Type = "Input";
        FocusField = "MIR-CIA-LOAD-AMT";
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

    INOUT MIR-CIA-LOAD-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Transfer Charges";
    }

    INOUT MIR-CIA-LOAD-FORCE-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Loads have been forced";
    }

    INOUT MIR-CIA-REASN-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-REASN-CD";
        DefaultConstant = "GRS";
        SType = "Selection";
        Label = "Reason Code";
    }

    INOUT MIR-CIA-SRC-DEST-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-SRC-DEST-CD";
        DefaultConstant = "D";
        SType = "Selection";
        Label = "Destination of Surrender Amount";
    }

    INOUT MIR-CIA-TAXWH-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Bypass the tax withholding process";
    }

    INOUT MIR-FIA-SURR-UNIT-QTY-T[25]
    {
        Length = "18";
        FieldGroup = "Table25";
        SType = "Text";
        Label = "Number of Units to Surrender";
        Index = "1";
    }

    INOUT MIR-FND-ID-T[25]
    {
        Length = "5";
        FieldGroup = "Table25";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        SType = "Text";
        Label = "Fund";
        Index = "1";
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

    INOUT MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Process State";
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

