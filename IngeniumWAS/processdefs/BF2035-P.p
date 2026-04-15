# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:49 PM EDT

#*******************************************************************************
#*  Component:   BF2035-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2035-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2035";
        BusinessFunctionName = "Life Plan Packaging Summary";
        BusinessFunctionType = "Summary";
        MirName = "CCWM0521";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-BASIC-PLAN-ID
    {
        Key;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPACK";
        SType = "Selection";
        Label = "Basic Plan";
    }

    INOUT MIR-LOC-GR-ID
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TPACK";
        SType = "Selection";
        Label = "Location Group";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPACK";
        SType = "Selection";
        Label = "Sub Company";
    }

    OUT MIR-BASIC-PLAN-ID-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPACK";
        SType = "Text";
        Label = "Basic Plan";
        Index = "1";
    }

    OUT MIR-LOC-GR-ID-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TPACK";
        SType = "Text";
        Label = "Location Group";
        Index = "1";
    }

    OUT MIR-PLAN-PKG-ADB-CD-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "PLAN-PKG-ADB-CD";
        DBTableName = "TPACK";
        SType = "Text";
        Label = "Embedded ADB";
        Index = "1";
    }

    OUT MIR-PLAN-PKG-TYP-CD-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "PLAN-PKG-TYP-CD";
        DBTableName = "TPACK";
        SType = "Text";
        Label = "List Type";
        Index = "1";
    }

    OUT MIR-PLAN-PKG-WP-CD-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "PLAN-PKG-WP-CD";
        DBTableName = "TPACK";
        SType = "Text";
        Label = "Embedded WP";
        Index = "1";
    }

    OUT MIR-SBSDRY-CO-ID-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPACK";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

}

