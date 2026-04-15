# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:33 PM EDT

#*******************************************************************************
#*  Component:   BF1021-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1021-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Reversal";
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

    IN MIR-CLI-ID-T[13]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table13";
        KeyColumn;
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    IN MIR-DV-ACCT-TRXN-AMT-T[13]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table13";
        SType = "Currency";
        Label = "Amount";
        Index = "1";
    }

    IN MIR-DV-TRNXT-PAYO-MTHD-CD-T[13]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table13";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        SType = "Text";
        Label = "Pay Out Method";
        Index = "1";
    }

    IN MIR-SBSDRY-CO-ID-T[13]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

    IN MIR-BNK-ID-T[13]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table13";
        SType = "Text";
        Label = "Bank ID";
        Index = "1";
    }

    IN MIR-BNK-BR-ID-T[13]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table13";
        SType = "Text";
        Label = "Branch ID";
        Index = "1";
    }

    IN MIR-BNK-ACCT-ID-T[13]
    {
        DisplayOnly;
        Length = "17";
        FieldGroup = "Table13";
        SType = "Text";
        Label = "Bank Account Number";
        Index = "1";
    }

    IN MIR-BNK-ACCT-TYP-CD-T[13]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        SType = "Text";
        Label = "Account Type";
        Index = "1";
    }

    IN MIR-BNK-ACCT-HLDR-NM-T[13]
    {
        DisplayOnly;
        Length = "50";
        FieldGroup = "Table13";
        SType = "Text";
        Label = "Account Holder Name";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM-T[13]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table13";
        SType = "Text";
        Label = "Owner Name";
        Index = "1";
    }

}

