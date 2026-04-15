# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:43 PM EDT

#*******************************************************************************
#*  Component:   BF1652-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1652-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1652";
        BusinessFunctionName = "Policy Replacement Update";
        BusinessFunctionType = "Update";
        MirName = "NCWM3200";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-REPL-OVRID-IND
    {
        Length = "10";
        DBTableName = "TREPL";
        SType = "Indicator";
        Label = "Override Notification";
    }

    INOUT MIR-POL-REPL-PRT-DT
    {
        Length = "10";
        DBTableName = "TREPL";
        SType = "Date";
        Label = "Last Replacement Print Date";
    }

    INOUT MIR-POL-REPL-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-REPL-STAT-CD";
        DBTableName = "TREPL";
        SType = "Text";
        Label = "Record Status";
    }

    INOUT MIR-POL-REPL-TYP-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-REPL-TYP-CD";
        DBTableName = "TREPL";
        SType = "Selection";
        Label = "Replacement Type";
    }

    INOUT MIR-REPL-CO-CLI-ID
    {
        Length = "10";
        DBTableName = "TREPL";
        SType = "Text";
        Label = "Replaced Company Client Number";
    }

    INOUT MIR-REPL-POL-ID
    {
        Mandatory;
        Length = "20";
        DBTableName = "TREPL";
        SType = "Text";
        Label = "Replaced Policy Number";
    }

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

}

