# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF0804-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0804-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0804";
        BusinessFunctionName = "Plan Billing Option List";
        BusinessFunctionType = "List";
        MirName = "CCWM3030";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-LOC-GR-ID
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TPBTM";
        SType = "Selection";
        Label = "Location Group";
    }

    INOUT MIR-PLAN-BILL-MODE-CD
    {
        Key;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "PLAN-BILL-MODE-CD";
        DBTableName = "TPBTM";
        SType = "Selection";
        Label = "Billing Mode";
    }

    INOUT MIR-PLAN-BILL-TYP-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-BILL-TYP-CD";
        DBTableName = "TPBTM";
        SType = "Selection";
        Label = "Billing Type";
    }

    IN MIR-PLAN-ID
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
        DBTableName = "TPBTM";
        SType = "Text";
        Label = "Location Group";
        Index = "1";
    }

    OUT MIR-PLAN-BILL-DFLT-IND-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        DBTableName = "TPBTM";
        SType = "Indicator";
        Label = "Default";
        Index = "1";
    }

    OUT MIR-PLAN-BILL-MODE-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "PLAN-BILL-MODE-CD";
        DBTableName = "TPBTM";
        SType = "Text";
        Label = "Billing Mode";
        Index = "1";
    }

    OUT MIR-PLAN-BILL-TYP-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "PLAN-BILL-TYP-CD";
        DBTableName = "TPBTM";
        SType = "Text";
        Label = "Billing Type";
        Index = "1";
    }

}

