# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF0814-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0814-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0814";
        BusinessFunctionName = "Plan Location Group Table List";
        BusinessFunctionType = "List";
        MirName = "CCWM3040";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-LOC-GR-ID
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TPLGR";
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

    OUT MIR-LOC-GR-ID-T[48]
    {
        Length = "3";
        FieldGroup = "Table48";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TPLGR";
        SType = "Text";
        Label = "Location Group";
        Index = "1";
    }

}

