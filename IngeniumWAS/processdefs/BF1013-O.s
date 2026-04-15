# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:33 PM EDT

#*******************************************************************************
#*  Component:   BF1013-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1013-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Crgsum";
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

    IN MIR-DV-CDN-TAX-INFC-AMT-T[11]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table11";
        SType = "Currency";
        Label = "Inforce Amt";
        Index = "1";
    }

    IN MIR-DV-CDN-TAX-PEND-AMT-T[11]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table11";
        SType = "Currency";
        Label = "Pending Amt";
        Index = "1";
    }

    IN MIR-DV-CDN-TAX-SPND-AMT-T[11]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table11";
        SType = "Currency";
        Label = "Suspended Amt";
        Index = "1";
    }

    IN MIR-DV-CDN-TAX-TOT-AMT-T[11]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table11";
        SType = "Currency";
        Label = "Total Amt";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

}

