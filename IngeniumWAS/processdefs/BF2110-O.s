# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:56 PM EDT

#*******************************************************************************
#*  Component:   BF2110-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2110-O
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

    IN MIR-OVRID-BASE-AGT-ID
    {
        Key;
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Override";
    }

    IN MIR-OVRID-ID
    {
        Key;
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Agent Situation";
    }

    IN MIR-OVRID-AGT-ID-T[10]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table10";
        KeyColumn;
        SType = "Text";
        Label = "Override Agent ID";
        Index = "1";
    }

    IN MIR-OVRID-CALC-CD-T[10]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "OVRID-CALC-CD";
        SType = "Text";
        Label = "Override Calculation Type";
        Index = "1";
    }

    IN MIR-OVRID-MAX-AMT-PCT
    {
        DisplayOnly;
        Length = "11";
        Decimals = "2";
        SType = "Text";
        Label = "Override Maximum";
    }

    IN MIR-OVRID-MAX-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "OVRID-MAX-TYP-CD";
        SType = "Text";
        Label = "Override Maximum Type";
    }

    IN MIR-OVRID-TBAC-ID-T[10]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Commission Pattern";
        Index = "1";
    }

}

