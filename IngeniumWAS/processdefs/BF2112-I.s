# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:56 PM EDT

#*******************************************************************************
#*  Component:   BF2112-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2112-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-OVRID-AGT-ID-T[1]";
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

    INOUT MIR-OVRID-AGT-ID-T[10]
    {
        Length = "6";
        FieldGroup = "Table10";
        KeyColumn;
        SType = "Text";
        Label = "Override Agent ID";
        Index = "1";
    }

    INOUT MIR-OVRID-CALC-CD-T[10]
    {
        Length = "1";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "OVRID-CALC-CD";
        SType = "Selection";
        Label = "Override Calculation Type";
        Index = "1";
    }

    INOUT MIR-OVRID-MAX-AMT-PCT
    {
        Mandatory;
        Length = "11";
        Decimals = "2";
        SType = "Text";
        Label = "Override Maximum";
    }

    INOUT MIR-OVRID-MAX-TYP-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "OVRID-MAX-TYP-CD";
        SType = "Selection";
        Label = "Override Maximum Type";
    }

    INOUT MIR-OVRID-TBAC-ID-T[10]
    {
        Length = "5";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Commission Pattern";
        Index = "1";
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

}

