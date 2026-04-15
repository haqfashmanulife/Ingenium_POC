# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9511-P.p                                                    *
#*  Description: This module perform the table create function for the         *
#*               PAXT table                                                    *
#*******************************************************************************
#*  Date     Author  Description                                               *
#*                                                                             *
#*  01AUG01  SRO     Created for 01PR11                                        *
#*                                                                             *
#*******************************************************************************

P-STEP BF9511-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9511";
        BusinessFunctionName = "Packaging Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM9511";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-SBSDRY-CO-ID
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

    IN MIR-LOC-GR-ID
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

    IN MIR-PAXT-PLAN-ID
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

    IN MIR-PAXT-ADDL-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPAXT";
        SType = "Selection";
        Label = "Additional Plan Name";
    }

    IN MIR-PAXT-RULE-TYP-CD
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "DataModel";
        CodeType = "PAXT-RULE-TYP-CD";
        DBTableName = "TPAXT";
        SType = "Selection";
        Label = "Rule";
    }

    IN MIR-PAXT-CVG-TYP-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAXT-CVG-TYP-CD";
        DBTableName = "TPAXT";
        SType = "Selection";
        Label = "Coverage Type";
    }

    IN MIR-PAXT-SEX-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAXT-SEX-CD";
        DBTableName = "TPAXT";
        SType = "Selection";
        Label = "Sex";
    }

    IN MIR-PLAN-DPND-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPAXT";
        SType = "Selection";
        Label = "Plan Dependence";
    }

}

