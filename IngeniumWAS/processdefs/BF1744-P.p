# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:44 PM EDT

#*******************************************************************************
#*  Component:   BF1744-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1744-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1744";
        BusinessFunctionName = "Fund Plan Relationship Record List";
        BusinessFunctionType = "List";
        MirName = "SCWM0040";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-FND-ID
    {
        Key;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TFR";
        SType = "Selection";
        Label = "Fund";
    }

    INOUT MIR-LOC-GR-ID
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TFR";
        SType = "Selection";
        Label = "Location Group";
    }

    INOUT MIR-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TFR";
        SType = "Selection";
        Label = "Plan";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TFR";
        SType = "Selection";
        Label = "Sub Company";
    }

    OUT MIR-FND-ID-T[100]
    {
        Length = "5";
        FieldGroup = "Table100";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TFR";
        SType = "Text";
        Label = "Fund";
        Index = "1";
    }

    OUT MIR-LOC-GR-ID-T[100]
    {
        Length = "3";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TFR";
        SType = "Text";
        Label = "Location Group";
        Index = "1";
    }

    OUT MIR-SBSDRY-CO-ID-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TFR";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

}

