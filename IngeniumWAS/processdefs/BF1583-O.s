# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:46 PM EDT

#*******************************************************************************
#*  Component:   BF1583-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00477   SRO     ADD INSURED CLIENT ID TO AMEX TABLE KEY                   *
#*                                                                             *
#*******************************************************************************

S-STEP BF1583-O
{
    ATTRIBUTES
    {
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

    IN MIR-AMEX-REC-TYP-CD
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "AMEX-REC-TYP-CD";
        SType = "Text";
        Label = "Record Type";
    }

    IN MIR-AMEX-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-INSRD-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Insured Client Id";
    }

}

