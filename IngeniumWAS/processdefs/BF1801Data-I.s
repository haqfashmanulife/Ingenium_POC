# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:51 PM EDT

#*******************************************************************************
#*  Component:   BF1801Data-I.s                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1801Data-I
{
    ATTRIBUTES
    {
        Type = "Input";
        DelEmptyRows;
        FocusField = "MIR-DV-IN-ALLOC-PCT-T[1]";
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

    IN MIR-CF-TAX-YR
    {
        DisplayOnly;
        Length = "4";
        SType = "Year";
        Label = "Tax Year";
    }

    IN MIR-CIA-COMM-PRCES-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Override Default Commissions";
    }

    IN MIR-CIA-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Effective Date";
    }

    IN MIR-CIA-LOAD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Front-end Load Charges";
    }

    IN MIR-CIA-LOAD-FORCE-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Load Force Indicator";
    }

    IN MIR-CIA-REG-FND-SRC-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-REG-FND-SRC-CD";
        SType = "Text";
        Label = "Registered Fund Source";
    }

    IN MIR-CIA-SRC-DEST-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-SRC-DEST-CD";
        DefaultConstant = "C";
        SType = "Text";
        Label = "Deposit Amount Source";
    }

    IN MIR-CVG-NUM
    {
        DisplayOnly;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-DPOS-OVRID-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Override Payment Effective Date";
    }

    IN MIR-DV-CIA-DPOS-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "DV-CIA-DPOS-CD";
        DefaultConstant = "EXC";
        SType = "Text";
        Label = "Nature of Deposit";
    }

    IN MIR-FIA-FND-TRXN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Amount";
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

    IN MIR-SUPRES-CNFRM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

    IN MIR-DV-CFN-APROX-AMT-T[25]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table25";
        SType = "Currency";
        Label = "Approximate Fund Value";
        Index = "1";
    }

    IN MIR-DV-FND-CTR-T[25]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table25";
        SType = "Text";
        Label = "Fund Number";
        Index = "1";
    }

    IN MIR-FIA-FND-TRXN-AMT-T[25]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table25";
        SType = "Currency";
        Label = "Net Amount";
        Index = "1";
    }

    IN MIR-FND-ID-T[25]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table25";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        SType = "Text";
        Label = "Fund ID";
        Index = "1";
    }

    INOUT MIR-DV-IN-ALLOC-PCT-T[25]
    {
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table25";
        SType = "Percent";
        Label = "Percentage to Allocate";
        Index = "1";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "process code";
    }

}

