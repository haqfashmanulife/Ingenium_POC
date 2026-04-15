# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:50 PM EDT

#*******************************************************************************
#*  Component:   BF2114-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2114-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2114";
        BusinessFunctionName = "Agent Override Profile List";
        BusinessFunctionType = "List";
        MirName = "CCWM0071";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-OVRID-BASE-AGT-ID
    {
        Key;
        Length = "6";
        DBTableName = "TAS";
        SType = "Text";
        Label = "Override";
    }

    INOUT MIR-OVRID-ID
    {
        Key;
        Length = "2";
        DBTableName = "TAS";
        SType = "Text";
        Label = "Agent Situation";
    }

    OUT MIR-OVRID-BASE-AGT-ID-T[100]
    {
        Length = "6";
        FieldGroup = "Table100";
        DBTableName = "TAS";
        SType = "Text";
        Label = "Override";
        Index = "1";
    }

    OUT MIR-OVRID-ID-T[100]
    {
        Length = "2";
        FieldGroup = "Table100";
        DBTableName = "TAS";
        SType = "Text";
        Label = "Agent Situation";
        Index = "1";
    }

}

