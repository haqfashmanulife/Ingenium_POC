# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:33 PM EDT

#*******************************************************************************
#*  Component:   BF1003-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1003-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Inssum";
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

    IN MIR-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-DV-CLI-INSRD-INFC-AMT-T[7]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table7";
        SType = "Currency";
        Label = "Inforce Amt";
        Index = "1";
    }

    IN MIR-DV-CLI-INSRD-PEND-AMT-T[7]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table7";
        SType = "Currency";
        Label = "Pending Amt";
        Index = "1";
    }

    IN MIR-DV-CLI-INSRD-SPND-AMT-T[7]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table7";
        SType = "Currency";
        Label = "Suspended Amt";
        Index = "1";
    }

    IN MIR-DV-CLI-INSRD-TOT-AMT-T[7]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table7";
        SType = "Currency";
        Label = "Total Amt";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }

}

