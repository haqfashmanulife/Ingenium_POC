# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF0824-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0824-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0824";
        BusinessFunctionName = "Plan Non-Forfeiture Option List";
        BusinessFunctionType = "List";
        MirName = "CCWM3050";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-LOC-GR-ID
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TPNFO";
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
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Plan";
    }

    INOUT MIR-PLAN-NFO-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-NFO-CD";
        DBTableName = "TPNFO";
        SType = "Selection";
        Label = "Non-Forfeiture Option";
    }

    OUT MIR-LOC-GR-ID-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TPNFO";
        SType = "Text";
        Label = "Location Group";
        Index = "1";
    }

    OUT MIR-PLAN-NFO-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "PLAN-NFO-CD";
        DBTableName = "TPNFO";
        SType = "Text";
        Label = "Non-Forfeiture Option";
        Index = "1";
    }

    OUT MIR-PLAN-NFO-DFLT-IND-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        DBTableName = "TPNFO";
        SType = "Indicator";
        Label = "Non-Forfeiture Default Indicator";
        Index = "1";
    }

}

