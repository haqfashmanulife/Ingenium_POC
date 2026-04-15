# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:25 PM EDT

#*******************************************************************************
#*  Component:   BF0621-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  P00065  KRW      ADD OPERATION CATEGORY                                    *
#*                                                                             *
#*******************************************************************************

S-STEP BF0621-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Payment";
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

    INOUT MIR-AGT-1-ID-T[3]
    {
        Length = "6";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Agent ID";
        Index = "1";
    }

    INOUT MIR-CFAGT-SHR-1-PCT-T[3]
    {
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table3";
        SType = "Percent";
        Label = "Share of Commissions";
        Index = "1";
    }

    INOUT MIR-CF-CPREM-1-AMT-T[3]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Commissionable Premium Payable";
        Index = "1";
    }

    INOUT MIR-CF-DPOS-TRM-DY-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Deposit Term - Days";
    }

    INOUT MIR-CF-DPOS-TRM-MO-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Deposit Term - Months";
    }

    INOUT MIR-CF-FND-TRXN-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Net Deposit Amount";
    }

    INOUT MIR-CF-INT-PCT
    {
        Signed;
        Length = "7";
        Decimals = "4";
        SType = "Percent";
        Label = "Interest Rate / Unit Cost";
    }

    INOUT MIR-COMM-RT-TBAC-1-ID-T[3]
    {
        Length = "5";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Commission Rates Payable";
        Index = "1";
    }

    INOUT MIR-OVRID-1-ID-T[3]
    {
        Length = "2";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Override Situation";
        Index = "1";
    }

    INOUT MIR-ROLOVR-CF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "GIA - Rollover Date";
    }

    INOUT MIR-CF-REG-FND-SRC-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CF-REG-FND-SRC-CD";
        SType = "Selection";
        Label = "Source of Deposit";
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

    INOUT MIR-DPOS-OVRID-EFF-DT
    {
        Key;
        Length = "10";
        SType = "Date";
        Label = "Override Payment Effective Date";
    }

    INOUT MIR-DV-CF-CLI-TRXN-AMT
    {
        Key;
        Mandatory;
        Length = "15";
        SType = "Currency";
        Label = "Gross Amount";
    }

    INOUT MIR-DV-CF-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-DV-CF-REASN-CD
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CF-REASN-CD";
        SType = "Selection";
        Label = "Transaction Reason";
    }

    INOUT MIR-DV-CF-TAX-YR
    {
        Key;
        Length = "4";
        DefaultConstant = "0000";
        SType = "Year";
        Label = "Tax Year";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "process code";
    }

    INOUT MIR-OPER-CAT-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "OPNC";
        SType = "Selection";
        Label = "Operation Category";
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

}

