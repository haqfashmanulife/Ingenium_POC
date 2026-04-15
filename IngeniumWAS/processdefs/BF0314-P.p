# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:19 PM EDT

#*******************************************************************************
#*  Component:   BF0314-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0314-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0314";
        BusinessFunctionName = "User Exit Table List";
        BusinessFunctionType = "List";
        MirName = "XCWM0310";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-USER-EXIT-ID
    {
        Key;
        Length = "4";
        CodeSource = "DataModel";
        CodeType = "USER-EXIT-ID";
        DBTableName = "TUXIT";
        SType = "Selection";
        Label = "User Exit Pointer";
    }

    OUT MIR-BTCH-PGM-ID-T[12]
    {
        Length = "8";
        FieldGroup = "Table12";
        DBTableName = "TUXIT";
        SType = "Text";
        Label = "Batch Program";
        Index = "1";
    }

    OUT MIR-ONLN-PGM-ID-T[12]
    {
        Length = "8";
        FieldGroup = "Table12";
        DBTableName = "TUXIT";
        SType = "Text";
        Label = "Online Program";
        Index = "1";
    }

    OUT MIR-USER-EXIT-ID-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "USER-EXIT-ID";
        DBTableName = "TUXIT";
        SType = "Text";
        Label = "User Exit Pointer";
        Index = "1";
    }

    OUT MIR-USER-EXIT-INVOK-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "USER-EXIT-INVOK-CD";
        DBTableName = "TUXIT";
        SType = "Text";
        Label = "Invocation Type";
        Index = "1";
    }

}

