# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:33 PM EDT

#*******************************************************************************
#*  Component:   BF1022-O.s                                                    *
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

S-STEP BF1022-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Polxfer";
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

    IN MIR-CF-DPOS-TRM-DY-DUR-T[7]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table7";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Deposit Term - Days";
        Index = "1";
    }

    IN MIR-CF-DPOS-TRM-MO-DUR-T[7]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table7";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Deposit Term - Months";
        Index = "1";
    }

    IN MIR-CF-EFF-DT-T[7]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table7";
        SType = "Date";
        Label = "Deposit Date";
        Index = "1";
    }

    IN MIR-CF-REG-FND-SRC-CD-T[7]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table7";
        CodeSource = "DataModel";
        CodeType = "CF-REG-FND-SRC-CD";
        SType = "Text";
        Label = "Source of Deposit";
        Index = "1";
    }

    IN MIR-CF-SEQ-NUM-T[7]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table7";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    IN MIR-CF-TAX-YR-T[7]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table7";
        SType = "Year";
        Label = "Tax Year";
        Index = "1";
    }

    IN MIR-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-CVG-NUM-T[7]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table7";
        DefaultConstant = "00";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-DV-ACCT-CD-T[7]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table7";
        CodeSource = "DataModel";
        CodeType = "DV-ACCT-CD";
        SType = "Text";
        Label = "Account to Credit / Debit";
        Index = "1";
    }

    IN MIR-BNK-ID-T[7]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table7";
        SType = "Text";
        Label = "Bank ID";
        Index = "1";
    }

    IN MIR-BNK-BR-ID-T[7]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table7";
        SType = "Text";
        Label = "Branch ID";
        Index = "1";
    }

    IN MIR-BNK-ACCT-ID-T[7]
    {
        DisplayOnly;
        Length = "17";
        FieldGroup = "Table7";
        SType = "Text";
        Label = "Bank Account Number";
        Index = "1";
    }

    IN MIR-BNK-ACCT-TYP-CD-T[7]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table7";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        SType = "Text";
        Label = "Account Type";
        Index = "1";
    }

    IN MIR-BNK-ACCT-HLDR-NM-T[7]
    {
        DisplayOnly;
        Length = "50";
        FieldGroup = "Table7";
        SType = "Text";
        Label = "Account Holder Name";
        Index = "1";
    }

    IN MIR-DV-ACCT-TRXN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Amount";
    }

    IN MIR-DV-ACCT-TRXN-AMT-T[7]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table7";
        SType = "Currency";
        Label = "Amount";
        Index = "1";
    }

    IN MIR-DV-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-DV-TAX-OVRID-IND-T[7]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table7";
        SType = "Indicator";
        Label = "Tax Override";
        Index = "1";
    }

    IN MIR-POL-ID-BASE-T[7]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table7";
        KeyColumn;
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    IN MIR-POL-ID-SFX-T[7]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table7";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
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

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-OWN-CLI-NM-T[7]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table7";
        SType = "Text";
        Label = "Owner Name";
        Index = "1";
    }

    IN MIR-DV-TAX-VERIF-AMT-T[7]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table7";
        SType = "Currency";
        Label = "Total Amount of Tax";
        Index = "1";
    }

#  P00891 YC      26MAY2003  Add 8 lines for Adding Journal Date
    IN MIR-JRNL-DT 
    {
      DisplayOnly;
      Length = "10";
      SType = "Date";
      Label = "Journal Date";
    }
 
}

