# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:44 PM EDT

#*******************************************************************************
#*  Component:   BF1724-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1724-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1724";
        BusinessFunctionName = "Fund Plan Extension Record List";
        BusinessFunctionType = "List";
        MirName = "SCWM0010";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-PLAN-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TFX";
        SType = "Selection";
        Label = "Plan";
    }

    OUT MIR-MIN-ADDL-DPOS-AMT-T[12]
    {
        Length = "15";
        FieldGroup = "Table12";
        DBTableName = "TFX";
        SType = "Currency";
        Label = "Minimum Additional Payment";
        Index = "1";
    }

    OUT MIR-MIN-INIT-DPOS-AMT-T[12]
    {
        Length = "15";
        FieldGroup = "Table12";
        DBTableName = "TFX";
        SType = "Currency";
        Label = "Minimum Initial Payment";
        Index = "1";
    }

    OUT MIR-PLAN-ID-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    OUT MIR-PLAN-MAX-FND-QTY-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Maximum Number of Funds";
        Index = "1";
    }

    OUT MIR-PLAN-REQIR-FND-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "PLAN-REQIR-FND-CD";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Fund Required";
        Index = "1";
    }

}

