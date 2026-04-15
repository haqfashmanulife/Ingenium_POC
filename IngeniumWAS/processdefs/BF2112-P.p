# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:50 PM EDT

#*******************************************************************************
#*  Component:   BF2112-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2112-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2112";
        BusinessFunctionName = "Agent Override Profile Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM0071";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-OVRID-AGT-ID-T[10]
    {
        Length = "6";
        FieldGroup = "Table10";
        KeyColumn;
        DBTableName = "TASAG";
        SType = "Text";
        Label = "Override Agent ID";
        Index = "1";
    }

    INOUT MIR-OVRID-CALC-CD-T[10]
    {
        Length = "1";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "OVRID-CALC-CD";
        DBTableName = "TASAG";
        SType = "Selection";
        Label = "Override Calculation Type";
        Index = "1";
    }

    INOUT MIR-OVRID-MAX-AMT-PCT
    {
        Mandatory;
        Length = "11";
        Decimals = "2";
        DBTableName = "TAS";
        SType = "Text";
        Label = "Override Maximum";
    }

    INOUT MIR-OVRID-MAX-TYP-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "OVRID-MAX-TYP-CD";
        DBTableName = "TAS";
        SType = "Selection";
        Label = "Override Maximum Type";
    }

    INOUT MIR-OVRID-TBAC-ID-T[10]
    {
        Length = "5";
        FieldGroup = "Table10";
        DBTableName = "TASAG";
        SType = "Text";
        Label = "Commission Pattern";
        Index = "1";
    }

    IN MIR-OVRID-BASE-AGT-ID
    {
        Key;
        Mandatory;
        Length = "6";
        DBTableName = "TAS";
        SType = "Text";
        Label = "Override";
    }

    IN MIR-OVRID-ID
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TAS";
        SType = "Text";
        Label = "Agent Situation";
    }

}

