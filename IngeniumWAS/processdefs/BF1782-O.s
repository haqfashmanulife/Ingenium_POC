# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:51 PM EDT

#*******************************************************************************
#*  Component:   BF1782-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016107  602J     Automatic Face Reduction for Variable Products            *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1782-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Varsurrd";
        Type = "Output";
        DelEmptyRows;
        FocusField = "confirmButton";
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

    IN MIR-CIA-ALLOC-SURR-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Surrender Amount";
    }

    IN MIR-CIA-LOAD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Transfer Charges";
    }

    IN MIR-CIA-LOAD-FORCE-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Loads have been forced";
    }

    IN MIR-CIA-REASN-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CIA-REASN-CD";
        DefaultConstant = "GRS";
        SType = "Text";
        Label = "Surrender Reason";
    }

    IN MIR-CIA-SRC-DEST-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-SRC-DEST-CD";
        DefaultConstant = "D";
        SType = "Text";
        Label = "Destination of Surrender Amount";
    }

    IN MIR-BNK-ID
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank ID";
    }

    IN MIR-BNK-BR-ID
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Branch ID";
    }

    IN MIR-BNK-ACCT-ID
    {
        DisplayOnly;
        Length = "17";
        SType = "Text";
        Label = "Bank Account Number";
    }

    IN MIR-BNK-ACCT-HLDR-NM
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Account Holder Name";
    }

    IN MIR-BNK-ACCT-TYP-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        SType = "Text";
        Label = "Account Type";
    }

    IN MIR-CIA-TAXWH-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Bypass the tax withholding process";
    }

    IN MIR-FIA-OUT-ALLOC-PCT-T[25]
    {
        DisplayOnly;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table25";
        SType = "Percent";
        Label = "Percentage Out";
        Index = "1";
    }

    IN MIR-FND-ID-T[25]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table25";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        SType = "Text";
        Label = "Fund";
        Index = "1";
    }

    IN MIR-SUPRES-CNFRM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

    IN MIR-DV-REDC-FACE-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Override automatic face reduction";
    }

    IN MIR-CIA-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Effective Date";
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

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
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

}

