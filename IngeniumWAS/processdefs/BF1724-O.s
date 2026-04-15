# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:49 PM EDT

#*******************************************************************************
#*  Component:   BF1724-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1724-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
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

    INOUT MIR-PLAN-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Selection";
        Label = "Plan";
    }

    IN MIR-MIN-ADDL-DPOS-AMT-T[12]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table12";
        SType = "Currency";
        Label = "Minimum Additional Payment";
        Index = "1";
    }

    IN MIR-MIN-INIT-DPOS-AMT-T[12]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table12";
        SType = "Currency";
        Label = "Minimum Initial Payment";
        Index = "1";
    }

    IN MIR-PLAN-ID-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    IN MIR-PLAN-MAX-FND-QTY-T[12]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Maximum Number of Funds";
        Index = "1";
    }

    IN MIR-PLAN-REQIR-FND-CD-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "PLAN-REQIR-FND-CD";
        SType = "Text";
        Label = "Fund Required";
        Index = "1";
    }

}

