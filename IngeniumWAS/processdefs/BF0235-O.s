# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:18 PM EDT

#*******************************************************************************
#*  Component:   BF0235-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0235-O
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

    IN MIR-CHQ-ID
    {
        Key;
        DisplayOnly;
        Length = "16";
        SType = "Text";
        Label = "Reference Number";
    }

    IN MIR-SBSDRY-CO-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

    IN MIR-CHQ-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Amount";
    }

    IN MIR-CHQ-CRCY-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Text";
        Label = "Currency";
    }

    IN MIR-CHQ-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date";
    }

    IN MIR-CHQ-MICR-NUM
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "MICR Number";
    }

    IN MIR-CHQ-PAYE-1-TXT
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Payee (1)";
    }

    IN MIR-CHQ-PAYE-2-TXT
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Payee (2)";
    }

    IN MIR-CHQ-PD-OR-CNCL-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date Cheque was Paid/Cancelled";
    }

    IN MIR-CHQ-SRC-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CHQ-SRC-CD";
        SType = "Text";
        Label = "Origin of Cheque";
    }

    IN MIR-CHQ-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CHQ-STAT-CD";
        SType = "Text";
        Label = "Status";
    }

}

