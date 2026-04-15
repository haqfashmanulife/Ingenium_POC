# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:59 PM EDT

#*******************************************************************************
#*  Component:   BF5090-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF5090-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
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

    IN MIR-BNK-ACCT-ID
    {
        Key;
        DisplayOnly;
        Length = "17";
        SType = "Text";
        Label = "Account Number";
    }

    IN MIR-BNK-BR-ID
    {
        Key;
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Branch Number";
    }

    IN MIR-BNK-ID
    {
        Key;
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank Number";
    }

    IN MIR-PAC-DRW-IDT-NUM
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "PAC Withdrawal Date";
    }

    IN MIR-PAC-DRW-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-PAC-DRW-CREAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-CREAT-CD";
        SType = "Text";
        Label = "Type of PAC Draw";
    }

    IN MIR-PAC-DRW-RETRN-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-RETRN-CD";
        SType = "Text";
        Label = "PAC Draw Reversal Reason";
    }

    IN MIR-PAC-DRW-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-STAT-CD";
        SType = "Text";
        Label = "Status";
    }

    IN MIR-PAC-DRW-TOT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "PAC Amount";
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

}

