# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:21 PM EDT

#*******************************************************************************
#*  Component:   BF0402-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0402-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0402";
        BusinessFunctionName = "Health Plan Packaging Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM0531";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-COLA-ALLOW-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "COLA-ALLOW-CD";
        DBTableName = "TPACH";
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
        DBTableName = "TPACH";
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
        DBTableName = "TPACH";
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
        DBTableName = "TPACH";
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
        DBTableName = "TPACH";
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
        DBTableName = "TPACH";
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
        DBTableName = "TPACH";
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
        DBTableName = "TPACH";
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
        DBTableName = "TPACH";
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
        DBTableName = "TPACH";
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
        DBTableName = "TPACH";
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
        DBTableName = "TPACH";
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
        DBTableName = "TPACH";
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
        DBTableName = "TPACH";
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
        DBTableName = "TPACH";
        SType = "Selection";
        Label = "Reduced Elimination Period in Event of Hospitalization";
        Index = "1";
    }

    IN MIR-CONN-PKG-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TPACH";
        SType = "Text";
        Label = "Other Coverage - Package Number";
    }

    IN MIR-CONN-PLAN-ID
    {
        Key;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPACH";
        SType = "Selection";
        Label = "Other Coverage Plan";
    }

    IN MIR-DI-PKG-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TPACH";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Package Number";
    }

    IN MIR-LOC-GR-ID
    {
        Key;
        Mandatory;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TPACH";
        SType = "Selection";
        Label = "Location Group";
    }

    IN MIR-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPACH";
        SType = "Selection";
        Label = "Plan";
    }

    IN MIR-SBSDRY-CO-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPACH";
        SType = "Selection";
        Label = "Sub Company";
    }

}

