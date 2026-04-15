# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:51 PM EDT

#*******************************************************************************
#*  Component:   BF1801Key-I.s                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1801Key-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-POL-ID-BASE";
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

    INOUT MIR-CF-TAX-YR
    {
        Length = "4";
        SType = "Year";
        Label = "Tax Year";
    }

    INOUT MIR-CIA-COMM-PRCES-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Override Default Commissions";
    }

    INOUT MIR-CIA-EFF-DT
    {
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Effective Date";
    }

    INOUT MIR-CIA-LOAD-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Front-end Load Charges";
    }

    INOUT MIR-CIA-LOAD-FORCE-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Load Force Indicator";
    }

    INOUT MIR-CIA-REG-FND-SRC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-REG-FND-SRC-CD";
        SType = "Selection";
        Label = "Registered Fund Source";
    }

    INOUT MIR-CIA-SRC-DEST-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-SRC-DEST-CD";
        DefaultConstant = "C";
        SType = "Selection";
        Label = "Deposit Amount Source";
    }

    INOUT MIR-CVG-NUM
    {
        Mandatory;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-DPOS-OVRID-EFF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Override Payment Effective Date";
    }

    INOUT MIR-DV-CIA-DPOS-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "DV-CIA-DPOS-CD";
        DefaultConstant = "EXC";
        SType = "Selection";
        Label = "Nature of Deposit";
    }

    INOUT MIR-FIA-FND-TRXN-AMT
    {
        Mandatory;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Amount";
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

    INOUT MIR-SUPRES-CNFRM-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "process code";
    }

}

