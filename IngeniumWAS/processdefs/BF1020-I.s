# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:33 PM EDT

#*******************************************************************************
#*  Component:   BF1020-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1020-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Clipymt";
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

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Process code";
    }

}

