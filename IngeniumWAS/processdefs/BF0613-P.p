# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:23 PM EDT

#*******************************************************************************
#*  Component:   BF0613-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0613-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0613";
        BusinessFunctionName = "Coverage Enhancement History Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM0741";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CVG-ENHC-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TEHST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Policy Anniversary Date";
    }

    IN MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TEHST";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TEHST";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TEHST";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-CRNT-FACE-AMT-T[10]
    {
        Length = "15";
        FieldGroup = "Table10";
        DBTableName = "TEHST";
        SType = "Currency";
        Label = "Current Face Amount";
        Index = "1";
    }

    OUT MIR-CVG-ENHC-AMT-T[10]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table10";
        DBTableName = "TEHST";
        SType = "Currency";
        Label = "Change in Face Amount";
        Index = "1";
    }

    OUT MIR-ORIG-FACE-AMT-T[10]
    {
        Length = "15";
        FieldGroup = "Table10";
        DBTableName = "TEHST";
        SType = "Currency";
        Label = "Original Face Amount";
        Index = "1";
    }

    OUT MIR-PREV-FACE-AMT-T[10]
    {
        Length = "15";
        FieldGroup = "Table10";
        DBTableName = "TEHST";
        SType = "Currency";
        Label = "Last Face Amount";
        Index = "1";
    }

}

