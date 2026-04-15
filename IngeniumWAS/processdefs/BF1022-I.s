# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:33 PM EDT

#*******************************************************************************
#*  Component:   BF1022-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  P00891  YC       Add Journal Date with no limitation   26MAY2003           *
#*                                                                             *
#*******************************************************************************

S-STEP BF1022-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Polxfer";
        Type = "Input";
        FocusField = "MIR-CLI-ID";
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

    INOUT MIR-CF-DPOS-TRM-DY-DUR-T[7]
    {
        Length = "3";
        FieldGroup = "Table7";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Deposit Term - Days";
        Index = "1";
    }

    INOUT MIR-CF-DPOS-TRM-MO-DUR-T[7]
    {
        Length = "3";
        FieldGroup = "Table7";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Deposit Term - Months";
        Index = "1";
    }

    INOUT MIR-CF-EFF-DT-T[7]
    {
        Length = "10";
        FieldGroup = "Table7";
        SType = "Date";
        Label = "Deposit Date";
        Index = "1";
    }

    INOUT MIR-CF-REG-FND-SRC-CD-T[7]
    {
        Length = "1";
        FieldGroup = "Table7";
        CodeSource = "DataModel";
        CodeType = "CF-REG-FND-SRC-CD";
        SType = "Selection";
        Label = "Source of Deposit";
        Index = "1";
    }

    INOUT MIR-CF-SEQ-NUM-T[7]
    {
        Length = "3";
        FieldGroup = "Table7";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    INOUT MIR-CF-TAX-YR-T[7]
    {
        Length = "4";
        FieldGroup = "Table7";
        SType = "Year";
        Label = "Tax Year";
        Index = "1";
    }

    INOUT MIR-CLI-ID
    {
        Length = "10";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-CVG-NUM-T[7]
    {
        Length = "2";
        FieldGroup = "Table7";
        DefaultConstant = "00";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    INOUT MIR-DV-ACCT-CD-T[7]
    {
        Length = "4";
        FieldGroup = "Table7";
        CodeSource = "DataModel";
        CodeType = "DV-ACCT-CD";
        SType = "Selection";
        Label = "Account to Credit / Debit";
        Index = "1";
    }

    INOUT MIR-BNK-ID-T[7]
    {
        Length = "4";
        FieldGroup = "Table7";
        SType = "Text";
        Label = "Bank ID";
        Index = "1";
    }

    INOUT MIR-BNK-BR-ID-T[7]
    {
        Length = "5";
        FieldGroup = "Table7";
        SType = "Text";
        Label = "Branch ID";
        Index = "1";
    }

    INOUT MIR-BNK-ACCT-ID-T[7]
    {
        Length = "17";
        FieldGroup = "Table7";
        SType = "Text";
        Label = "Bank Account Number";
        Index = "1";
    }

    INOUT MIR-BNK-ACCT-TYP-CD-T[7]
    {
        Length = "3";
        FieldGroup = "Table7";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        SType = "Selection";
        Label = "Account Type";
        Index = "1";
    }

    INOUT MIR-BNK-ACCT-HLDR-NM-T[7]
    {
        Length = "50";
        FieldGroup = "Table7";
        SType = "Text";
        Label = "Account Holder Name";
        Index = "1";
    }

    INOUT MIR-DV-ACCT-TRXN-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Amount";
    }

    INOUT MIR-DV-ACCT-TRXN-AMT-T[7]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table7";
        SType = "Currency";
        Label = "Amount";
        Index = "1";
    }

    INOUT MIR-DV-PRCES-DT
    {
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-DV-TAX-OVRID-IND-T[7]
    {
        Length = "1";
        FieldGroup = "Table7";
        SType = "Indicator";
        Label = "Tax Override";
        Index = "1";
    }

    INOUT MIR-POL-ID-BASE-T[7]
    {
        Length = "9";
        FieldGroup = "Table7";
        KeyColumn;
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    INOUT MIR-POL-ID-SFX-T[7]
    {
        Length = "1";
        FieldGroup = "Table7";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Sub Company";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Process code";
    }

#  P00891 YC      26MAY2003  Add 8 lines for Adding Journal Date
    INOUT MIR-JRNL-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
    }
 
}

