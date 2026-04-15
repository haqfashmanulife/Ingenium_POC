# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:33 PM EDT

#*******************************************************************************
#*  Component:   BF1023-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1023-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Clixfer";
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

