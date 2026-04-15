# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF0794-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0794-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0794";
        BusinessFunctionName = "Policy Dividend List";
        BusinessFunctionType = "List";
        MirName = "CCWM3020";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-LOC-GR-ID
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TPDIV";
        SType = "Selection";
        Label = "Location Group";
    }

    INOUT MIR-PLAN-DIV-OPT-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-DIV-OPT-CD";
        DBTableName = "TPDIV";
        SType = "Selection";
        Label = "Dividend Option";
    }

    INOUT MIR-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Plan";
    }

    OUT MIR-LOC-GR-ID-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TPDIV";
        SType = "Text";
        Label = "Location Group";
        Index = "1";
    }

    OUT MIR-PLAN-DIV-DFLT-IND-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        DBTableName = "TPDIV";
        SType = "Indicator";
        Label = "Default Dividend Option";
        Index = "1";
    }

    OUT MIR-PLAN-DIV-OPT-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "PLAN-DIV-OPT-CD";
        DBTableName = "TPDIV";
        SType = "Text";
        Label = "Dividend Option";
        Index = "1";
    }

}

