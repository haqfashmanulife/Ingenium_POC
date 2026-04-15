# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:59 PM EDT

#*******************************************************************************
#*  Component:   BF5094-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF5094-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-BNK-ID";
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

    INOUT MIR-BNK-ACCT-ID
    {
        Key;
        Mandatory;
        Length = "17";
        SType = "Text";
        Label = "Account Number";
    }

    INOUT MIR-BNK-BR-ID
    {
        Key;
        Mandatory;
        Length = "5";
        SType = "Text";
        Label = "Branch Number";
    }

    INOUT MIR-BNK-ID
    {
        Key;
        Mandatory;
        Length = "4";
        SType = "Text";
        Label = "Bank Number";
    }

    INOUT MIR-PAC-DRW-IDT-NUM
    {
        Key;
        Length = "10";
        SType = "Date";
        Label = "PAC Withdrawal Date";
    }

    INOUT MIR-PAC-DRW-SEQ-NUM
    {
        Key;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Sub Company";
    }

    IN MIR-PAC-DRW-CREAT-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-CREAT-CD";
        SType = "Text";
        Label = "Type of PAC Draw";
        Index = "1";
    }

    IN MIR-PAC-DRW-IDT-NUM-T[100]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table100";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "PAC Withdrawal Date";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-PAC-DRW-RETRN-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-RETRN-CD";
        SType = "Text";
        Label = "PAC Draw Reversal Reason";
        Index = "1";
    }

    IN MIR-PAC-DRW-SEQ-NUM-T[100]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    IN MIR-PAC-DRW-STAT-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-STAT-CD";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    IN MIR-PAC-DRW-TOT-AMT-T[100]
    {
        DisplayOnly;
        Signed;
        Length = "11";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "PAC Amount";
        Index = "1";
    }

    IN MIR-SBSDRY-CO-ID-T[100]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

}

