# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:43 PM EDT

#*******************************************************************************
#*  Component:   BF1650-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1650-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1650";
        BusinessFunctionName = "Policy Replacement Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM3200";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-POL-REPL-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TREPL";
        SType = "Text";
        Label = "Sequence Number";
    }

    OUT MIR-POL-REPL-OVRID-IND
    {
        Length = "10";
        DBTableName = "TREPL";
        SType = "Indicator";
        Label = "Override Notification";
    }

    OUT MIR-POL-REPL-PRT-DT
    {
        Length = "10";
        DBTableName = "TREPL";
        SType = "Date";
        Label = "Last Replacement Print Date";
    }

    OUT MIR-POL-REPL-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-REPL-STAT-CD";
        DBTableName = "TREPL";
        SType = "Text";
        Label = "Record Status";
    }

    OUT MIR-POL-REPL-TYP-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-REPL-TYP-CD";
        DBTableName = "TREPL";
        SType = "Text";
        Label = "Replacement Type";
    }

    OUT MIR-REPL-CO-CLI-ID
    {
        Length = "10";
        DBTableName = "TREPL";
        SType = "Text";
        Label = "Replaced Company Client Number";
    }

    OUT MIR-REPL-POL-ID
    {
        Length = "20";
        DBTableName = "TREPL";
        SType = "Text";
        Label = "Replaced Policy Number";
    }

}

