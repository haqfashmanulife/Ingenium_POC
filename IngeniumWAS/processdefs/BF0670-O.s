# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:27 PM EDT

#*******************************************************************************
#*  Component:   BF0670-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016073  6.0      Fix unit value as a number                                *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0670-O
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

    IN MIR-UVAL-AGE
    {
        Key;
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Age";
    }

    IN MIR-UVAL-ID
    {
        Key;
        DisplayOnly;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "UVAL";
        SType = "Text";
        Label = "Plan";
    }

    IN MIR-UVAL-PAR-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UVAL-PAR-CD";
        SType = "Text";
        Label = "Dividend Option";
    }

    IN MIR-UVAL-SEX-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UVAL-SEX-CD";
        SType = "Text";
        Label = "Sex";
    }

    IN MIR-UVAL-SMKR-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UVAL-SMKR-CD";
        SType = "Text";
        Label = "Smoker";
    }

    IN MIR-UVAL-STBL-1-CD
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB1";
        SType = "Text";
        Label = "Sub-table 1";
    }

    IN MIR-UVAL-STBL-2-CD
    {
        Key;
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Text";
        Label = "Sub-table 2";
    }

    IN MIR-UVAL-STBL-3-CD
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "STB3";
        SType = "Text";
        Label = "Sub-table 3";
    }

    IN MIR-UVAL-STBL-4-CD
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        SType = "Text";
        Label = "Sub-table 4";
    }

    IN MIR-UVAL-TYP-CD
    {
        Key;
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "UVREC";
        SType = "Text";
        Label = "Unit Value Type";
    }

    IN MIR-DV-UVAL-RT-DUR-T[121]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table121";
        SType = "Text";
        Label = "Duration";
        Index = "1";
    }

    IN MIR-DV-UVAL-RT-T[121]
    {
        DisplayOnly;
        Length = "13";
        Decimals = "5";
        FieldGroup = "Table121";
        SType = "Number";
        Label = "Value Per Unit";
        Index = "1";
    }

    IN MIR-UVAL-HIGH-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "High Duration Limit";
    }

    IN MIR-UVAL-LOW-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Low Duration Limit";
    }

}

