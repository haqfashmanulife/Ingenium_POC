# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:25 PM EDT

#*******************************************************************************
#*  Component:   BF0610-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0610-O
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

    IN MIR-CVG-ENHC-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Policy Anniversary Date";
    }

    IN MIR-CVG-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
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

    IN MIR-CRNT-FACE-AMT-T[10]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Current Face Amount";
        Index = "1";
    }

    IN MIR-CVG-ENHC-AMT-T[10]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Change in Face Amount";
        Index = "1";
    }

    IN MIR-ORIG-FACE-AMT-T[10]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Original Face Amount";
        Index = "1";
    }

    IN MIR-PREV-FACE-AMT-T[10]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Last Face Amount";
        Index = "1";
    }

}

