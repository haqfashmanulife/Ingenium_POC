# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:48 PM EDT

#*******************************************************************************
#*  Component:   BF2032-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2032-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2032";
        BusinessFunctionName = "Life Plan Packaging Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM0521";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-PLAN-PKG-ADB-CD-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "PLAN-PKG-ADB-CD";
        DBTableName = "TPACK";
        SType = "Selection";
        Label = "Embedded ADB";
        Index = "1";
    }

    INOUT MIR-PLAN-PKG-TYP-CD-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "PLAN-PKG-TYP-CD";
        DBTableName = "TPACK";
        SType = "Selection";
        Label = "List Type";
        Index = "1";
    }

    INOUT MIR-PLAN-PKG-WP-CD-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "PLAN-PKG-WP-CD";
        DBTableName = "TPACK";
        SType = "Selection";
        Label = "Embedded WP";
        Index = "1";
    }

    IN MIR-ADDL-PLAN-ID
    {
        Key;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPACK";
        SType = "Selection";
        Label = "Additional Plan";
    }

    IN MIR-ADDL-PLAN-MAND-IND
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ADDL-PLAN-MAND-IND";
        DBTableName = "TPACK";
        SType = "Selection";
        Label = "Additional Plan Type";
    }

    IN MIR-BASIC-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPACK";
        SType = "Selection";
        Label = "Basic Plan";
    }

    IN MIR-LOC-GR-ID
    {
        Key;
        Mandatory;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TPACK";
        SType = "Selection";
        Label = "Location Group";
    }

    IN MIR-SBSDRY-CO-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPACK";
        SType = "Selection";
        Label = "Sub Company";
    }

}

