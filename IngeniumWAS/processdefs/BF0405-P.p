# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:21 PM EDT

#*******************************************************************************
#*  Component:   BF0405-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0405-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0405";
        BusinessFunctionName = "Health Plan Packaging Summary";
        BusinessFunctionType = "Summary";
        MirName = "CCWM0531";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DI-PKG-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TPACH";
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
        DBTableName = "TPACH";
        SType = "Selection";
        Label = "Location Group";
    }

    INOUT MIR-PLAN-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPACH";
        SType = "Selection";
        Label = "Plan";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPACH";
        SType = "Selection";
        Label = "Sub Company";
    }

    OUT MIR-DI-PKG-BP-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "DI-PKG-BP-CD";
        DBTableName = "TPACH";
        SType = "Text";
        Label = "Benefit Period";
        Index = "1";
    }

    OUT MIR-DI-PKG-BP-DUR-T[100]
    {
        Length = "5";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "STB3";
        DBTableName = "TPACH";
        SType = "Text";
        Label = "Benefit Period Qualifier";
        Index = "1";
    }

    OUT MIR-DI-PKG-EP-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "DI-PKG-EP-CD";
        DBTableName = "TPACH";
        SType = "Text";
        Label = "Elimination Period";
        Index = "1";
    }

    OUT MIR-DI-PKG-EP-DUR-T[100]
    {
        Length = "3";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TPACH";
        SType = "Text";
        Label = "Elimination Period Qualifier";
        Index = "1";
    }

    OUT MIR-DI-PKG-LIST-TYP-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "DI-PKG-LIST-TYP-CD";
        DBTableName = "TPACH";
        SType = "Text";
        Label = "List Type";
        Index = "1";
    }

    OUT MIR-DI-PKG-NUM-T[100]
    {
        Length = "3";
        FieldGroup = "Table100";
        DBTableName = "TPACH";
        SType = "Text";
        Label = "Package Number";
        Index = "1";
    }

    OUT MIR-DI-PKG-QP-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "DI-PKG-QP-CD";
        DBTableName = "TPACH";
        SType = "Text";
        Label = "Qualification Period";
        Index = "1";
    }

    OUT MIR-DI-PKG-QP-DUR-T[100]
    {
        Length = "2";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "STB1";
        DBTableName = "TPACH";
        SType = "Text";
        Label = "Qualification Period Qualifier";
        Index = "1";
    }

    OUT MIR-LOC-GR-ID-T[100]
    {
        Length = "3";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TPACH";
        SType = "Text";
        Label = "Location Group";
        Index = "1";
    }

    OUT MIR-OCCP-CLAS-CD-T[100]
    {
        Length = "2";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TPACH";
        SType = "Text";
        Label = "Occupation Class";
        Index = "1";
    }

    OUT MIR-OCCP-CLAS-QUALF-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "OCCP-CLAS-QUALF-CD";
        DBTableName = "TPACH";
        SType = "Text";
        Label = "Occupation Class Qualifier";
        Index = "1";
    }

    OUT MIR-PLAN-ID-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPACH";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    OUT MIR-SBSDRY-CO-ID-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPACH";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

}

