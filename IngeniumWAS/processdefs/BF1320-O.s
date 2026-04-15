# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:38 PM EDT

#*******************************************************************************
#*  Component:   BF1320-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  P01844  BP       Increase size of MIR-CLI-CNTCT-SUB-CD                     *
#*                                                                             *
#*******************************************************************************

S-STEP BF1320-O
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

    IN MIR-CLI-CNTCT-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Date";
    }

    IN MIR-CLI-CNTCT-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Sequence Number";
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

    IN MIR-USER-ID
    {
        Key;
        DisplayOnly;
        Length = "8";
        DefaultSession = "MIR-USER-ID";
        SType = "Text";
        Label = "User ID";
    }

    IN MIR-CLI-CNTCT-RETEN-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-CNTCT-RETEN-CD";
        SType = "Text";
        Label = "Retention Period";
    }

    IN MIR-CLI-CNTCT-SUB-CD
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Activity Type";
    }

    IN MIR-CLI-CNTCT-TYP-CD
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "CHACT";
        SType = "Text";
        Label = "Activity";
    }

    IN MIR-FOLWUP-ACT-CD
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "CHFUA";
        SType = "Text";
        Label = "Action";
    }

    IN MIR-FOLWUP-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date";
    }

    IN MIR-FOLWUP-NOTE-TXT
    {
        DisplayOnly;
        Length = "150";
        SType = "Text";
        Label = "Comments";
    }

    IN MIR-FOLWUP-USER-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "User ID";
    }

    IN MIR-POL-ID-BASE
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

}

