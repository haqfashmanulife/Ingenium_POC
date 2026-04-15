# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9514-P.p                                                    *
#*  Description: This module perform the table list function for the           *
#*               PAXT table                                                    *
#*******************************************************************************
#*  Date     Author  Description                                               *
#*                                                                             *
#*  01AUG01  SRO     Created for 01PR11                                        *
#*                                                                             *
#*******************************************************************************

P-STEP BF9514-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9514";
        BusinessFunctionName = "Packaging List";
        BusinessFunctionType = "List";
        MirName = "CCWM9514";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPAXT";
        SType = "Selection";
        Label = "Sub Company";
    }

    INOUT MIR-LOC-GR-ID
    {
        Key;
        Mandatory;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TPAXT";
        SType = "Selection";
        Label = "Location Group";
    }

    INOUT MIR-PAXT-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPAXT";
        SType = "Selection";
        Label = "Plan Name";
    }

    INOUT MIR-PAXT-ADDL-PLAN-ID
    {
        Key;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPAXT";
        SType = "Selection";
        Label = "Additional Plan Name";
    }

    INOUT MIR-PAXT-RULE-TYP-CD
    {
        Key;
        Length = "6";
        CodeSource = "DataModel";
        CodeType = "PAXT-RULE-TYP-CD";
        DBTableName = "TPAXT";
        SType = "Selection";
        Label = "Rule";
    }

    INOUT MIR-PAXT-CVG-TYP-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAXT-CVG-TYP-CD";
        DBTableName = "TPAXT";
        SType = "Selection";
        Label = "Coverage Type";
    }

    INOUT MIR-PAXT-SEX-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAXT-SEX-CD";
        DBTableName = "TPAXT";
        SType = "Selection";
        Label = "Sex";
    }

    INOUT MIR-PLAN-DPND-PLAN-ID
    {
        Key;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPAXT";
        SType = "Selection";
        Label = "Plan Dependence";
    }

    OUT MIR-SBSDRY-CO-ID-T[30]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPAXT";
        SType = "Selection";
        Label = "Sub Company";
        Index = "1";
    }

    OUT MIR-LOC-GR-ID-T[30]
    {
        Length = "3";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TPAXT";
        SType = "Selection";
        Label = "Location Group";
        Index = "1";
    }

    OUT MIR-PAXT-PLAN-ID-T[30]
    {
        Length = "6";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPAXT";
        SType = "Selection";
        Label = "Plan Name";
        Index = "1";
    }

    OUT MIR-PAXT-ADDL-PLAN-ID-T[30]
    {
        Length = "6";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPAXT";
        SType = "Selection";
        Label = "Additional Plan Name";
        Index = "1";
    }

    OUT MIR-PAXT-RULE-TYP-CD-T[30]
    {
        Length = "6";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "PAXT-TYP-VALUE";
        DBTableName = "TPAXT";
        SType = "Selection";
        Label = "Rule";
        Index = "1";
    }

    OUT MIR-PAXT-CVG-TYP-CD-T[30]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "PAXT-CVG-TYP";
        DBTableName = "TPAXT";
        SType = "Selection";
        Label = "Coverage Type";
        Index = "1";
    }

    OUT MIR-PAXT-SEX-CD-T[30]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "PAXT-SEX-CD";
        DBTableName = "TPAXT";
        SType = "Selection";
        Label = "Sex";
        Index = "1";
    }

    OUT MIR-PLAN-DPND-PLAN-ID-T[30]
    {
        Length = "6";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPAXT";
        SType = "Selection";
        Label = "Plan Dependence";
        Index = "1";
    }

}

