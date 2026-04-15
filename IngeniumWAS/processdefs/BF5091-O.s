# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:59 PM EDT

#*******************************************************************************
#*  Component:   BF5091-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF5091-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Create";
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
        SType = "Date";
        Label = "PAC Withdrawal Date";
    }

    IN MIR-PAC-DRW-SEQ-NUM
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }

}

