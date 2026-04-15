# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:22 PM EDT

#*******************************************************************************
#*  Component:   BF0405-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0405-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Summary";
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

    INOUT MIR-DI-PKG-NUM
    {
        Key;
        Length = "3";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Package Number";
    }

    INOUT MIR-LOC-GR-ID
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Selection";
        Label = "Location Group";
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

    IN MIR-DI-PKG-BP-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "DI-PKG-BP-CD";
        SType = "Text";
        Label = "Benefit Period";
        Index = "1";
    }

    IN MIR-DI-PKG-BP-DUR-T[100]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "STB3";
        SType = "Text";
        Label = "Benefit Period Qualifier";
        Index = "1";
    }

    IN MIR-DI-PKG-EP-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "DI-PKG-EP-CD";
        SType = "Text";
        Label = "Elimination Period";
        Index = "1";
    }

    IN MIR-DI-PKG-EP-DUR-T[100]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Text";
        Label = "Elimination Period Qualifier";
        Index = "1";
    }

    IN MIR-DI-PKG-LIST-TYP-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "DI-PKG-LIST-TYP-CD";
        SType = "Text";
        Label = "List Type";
        Index = "1";
    }

    IN MIR-DI-PKG-NUM-T[100]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Package Number";
        Index = "1";
    }

    IN MIR-DI-PKG-QP-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "DI-PKG-QP-CD";
        SType = "Text";
        Label = "Qualification Period";
        Index = "1";
    }

    IN MIR-DI-PKG-QP-DUR-T[100]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "STB1";
        SType = "Text";
        Label = "Qualification Period Qualifier";
        Index = "1";
    }

    IN MIR-LOC-GR-ID-T[100]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Text";
        Label = "Location Group";
        Index = "1";
    }

    IN MIR-OCCP-CLAS-CD-T[100]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "STB4";
        SType = "Text";
        Label = "Occupation Class";
        Index = "1";
    }

    IN MIR-OCCP-CLAS-QUALF-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "OCCP-CLAS-QUALF-CD";
        SType = "Text";
        Label = "Occupation Class Qualifier";
        Index = "1";
    }

    IN MIR-PLAN-ID-T[100]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    IN MIR-SBSDRY-CO-ID-T[100]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

}

