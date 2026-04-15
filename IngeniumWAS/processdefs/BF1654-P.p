# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:43 PM EDT

#*******************************************************************************
#*  Component:   BF1654-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1654-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1654";
        BusinessFunctionName = "Policy Replacement List";
        BusinessFunctionType = "List";
        MirName = "NCWM3200";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-POL-REPL-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TREPL";
        SType = "Text";
        Label = "Sequence Number";
    }

    OUT MIR-POL-REPL-OVRID-IND-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TREPL";
        SType = "Indicator";
        Label = "Override Notification";
        Index = "1";
    }

    OUT MIR-POL-REPL-SEQ-NUM-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        DBTableName = "TREPL";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-POL-REPL-TYP-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "POL-REPL-TYP-CD";
        DBTableName = "TREPL";
        SType = "Text";
        Label = "Replacement Type";
        Index = "1";
    }

    OUT MIR-REPL-CO-CLI-ID-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TREPL";
        SType = "Text";
        Label = "Replaced Company Client Number";
        Index = "1";
    }

    OUT MIR-REPL-POL-ID-T[12]
    {
        Length = "20";
        FieldGroup = "Table12";
        DBTableName = "TREPL";
        SType = "Text";
        Label = "Replaced Policy Number";
        Index = "1";
    }

}

