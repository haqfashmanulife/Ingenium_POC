# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:38 PM EDT

#*******************************************************************************
#*  Component:   BF1344-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1344-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-PLAN-ID";
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

    INOUT MIR-PLAN-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Selection";
        Label = "Plan";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Sub Company";
    }

    INOUT MIR-TRTY-ASSUM-CO-ID
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "REIN";
        SType = "Selection";
        Label = "Company";
    }

    INOUT MIR-TRTY-SMKR-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TRTY-SMKR-CD";
        SType = "Selection";
        Label = "Smoker";
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

    IN MIR-SBSDRY-CO-ID-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

    IN MIR-TRTY-ASSUM-CO-ID-T[12]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REIN";
        SType = "Text";
        Label = "Company";
        Index = "1";
    }

    IN MIR-TRTY-CSN-PLAN-ID-T[12]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Reinsurance Plan";
        Index = "1";
    }

    IN MIR-TRTY-REINS-TYP-CD-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "TRTY-REINS-TYP-CD";
        SType = "Text";
        Label = "Reinsurance Type";
        Index = "1";
    }

    IN MIR-TRTY-SMKR-CD-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "TRTY-SMKR-CD";
        SType = "Text";
        Label = "Smoker";
        Index = "1";
    }

    IN MIR-TRTY-TYP-CD-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "TRTY-TYP-CD";
        SType = "Text";
        Label = "Treaty Type";
        Index = "1";
    }

}

