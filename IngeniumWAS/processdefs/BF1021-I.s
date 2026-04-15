# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:33 PM EDT

#*******************************************************************************
#*  Component:   BF1021-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1021-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Reversal";
        Type = "Input";
        FocusField = "MIR-CLI-ID-T[1]";
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

    INOUT MIR-CLI-ID-T[13]
    {
        Length = "10";
        FieldGroup = "Table13";
        KeyColumn;
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    INOUT MIR-DV-ACCT-TRXN-AMT-T[13]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table13";
        SType = "Currency";
        Label = "Amount";
        Index = "1";
    }

    INOUT MIR-DV-TRNXT-PAYO-MTHD-CD-T[13]
    {
        Length = "1";
        FieldGroup = "Table13";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        SType = "Selection";
        Label = "Pay Out Method";
        Index = "1";
    }

    INOUT MIR-SBSDRY-CO-ID-T[13]
    {
        Length = "40";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Sub Company";
        Index = "1";
    }

    INOUT MIR-BNK-ID-T[13]
    {
        Length = "4";
        FieldGroup = "Table13";
        SType = "Text";
        Label = "Bank ID";
        Index = "1";
    }

    INOUT MIR-BNK-BR-ID-T[13]
    {
        Length = "5";
        FieldGroup = "Table13";
        SType = "Text";
        Label = "Branch ID";
        Index = "1";
    }

    INOUT MIR-BNK-ACCT-ID-T[13]
    {
        Length = "17";
        FieldGroup = "Table13";
        SType = "Text";
        Label = "Bank Account Number";
        Index = "1";
    }

    INOUT MIR-BNK-ACCT-TYP-CD-T[13]
    {
        Length = "3";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        SType = "Selection";
        Label = "Account Type";
        Index = "1";
    }

    INOUT MIR-BNK-ACCT-HLDR-NM-T[13]
    {
        Length = "50";
        FieldGroup = "Table13";
        SType = "Text";
        Label = "Account Holder Name";
        Index = "1";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Process code";
    }

}

