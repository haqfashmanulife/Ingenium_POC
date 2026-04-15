# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:22 PM EDT

#*******************************************************************************
#*  Component:   BF0402-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0402-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-COLA-ALLOW-CD-T[1]";
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

    INOUT MIR-COLA-ALLOW-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "COLA-ALLOW-CD";
        SType = "Selection";
        Label = "Cost of Living Adjustments";
        Index = "1";
    }

    INOUT MIR-DI-PKG-BP-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "DI-PKG-BP-CD";
        SType = "Selection";
        Label = "Benefit Period";
        Index = "1";
    }

    INOUT MIR-DI-PKG-BP-DUR-T[100]
    {
        Length = "5";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "STB3";
        SType = "Selection";
        Label = "Benefit Period Qualifier";
        Index = "1";
    }

    INOUT MIR-DI-PKG-EP-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "DI-PKG-EP-CD";
        SType = "Selection";
        Label = "Elimination Period";
        Index = "1";
    }

    INOUT MIR-DI-PKG-EP-DUR-T[100]
    {
        Length = "3";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Selection";
        Label = "Elimination Period Qualifier";
        Index = "1";
    }

    INOUT MIR-DI-PKG-LIST-TYP-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "DI-PKG-LIST-TYP-CD";
        SType = "Selection";
        Label = "List Type";
        Index = "1";
    }

    INOUT MIR-DI-PKG-QP-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "DI-PKG-QP-CD";
        SType = "Selection";
        Label = "Qualification Period";
        Index = "1";
    }

    INOUT MIR-DI-PKG-QP-DUR-T[100]
    {
        Length = "2";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "STB1";
        SType = "Selection";
        Label = "Qualification Period Qualifier";
        Index = "1";
    }

    INOUT MIR-LTA-ALLOW-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "LTA-ALLOW-CD";
        SType = "Selection";
        Label = "Life Time Accident Benefit";
        Index = "1";
    }

    INOUT MIR-LTB-ALLOW-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "LTB-ALLOW-CD";
        SType = "Selection";
        Label = "Lifetime Benefits";
        Index = "1";
    }

    INOUT MIR-OCCP-CLAS-CD-T[100]
    {
        Length = "2";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "STB4";
        SType = "Selection";
        Label = "Occupation Class";
        Index = "1";
    }

    INOUT MIR-OCCP-CLAS-QUALF-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "OCCP-CLAS-QUALF-CD";
        SType = "Selection";
        Label = "Occupation Class Qualifier";
        Index = "1";
    }

    INOUT MIR-OWN-OCCP-ALLOW-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "OWN-OCCP-ALLOW-CD";
        SType = "Selection";
        Label = "Own Occupation Definition of Disability";
        Index = "1";
    }

    INOUT MIR-PDISAB-ALLOW-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "PDISAB-ALLOW-CD";
        SType = "Selection";
        Label = "Partial Disability Benefit";
        Index = "1";
    }

    INOUT MIR-REDC-EP-ALLOW-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "REDC-EP-ALLOW-CD";
        SType = "Selection";
        Label = "Reduced Elimination Period in Event of Hospitalization";
        Index = "1";
    }

    IN MIR-CONN-PKG-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Other Coverage - Package Number";
    }

    IN MIR-CONN-PLAN-ID
    {
        Key;
        DisplayOnly;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Other Coverage Plan";
    }

    IN MIR-DI-PKG-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Package Number";
    }

    IN MIR-LOC-GR-ID
    {
        Key;
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Text";
        Label = "Location Group";
    }

    IN MIR-PLAN-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
    }

    IN MIR-SBSDRY-CO-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

}

