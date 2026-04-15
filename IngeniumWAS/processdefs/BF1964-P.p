# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:47 PM EDT

#*******************************************************************************
#*  Component:   BF1964-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1964-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1964";
        BusinessFunctionName = "Currency Table List";
        BusinessFunctionType = "List";
        MirName = "XCWM0162";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CO-ID
    {
        Key;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "COMP";
        DBTableName = "TCRCY";
        SType = "Selection";
        Label = "Company";
    }

    INOUT MIR-CRCY-CD
    {
        Key;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TCRCY";
        SType = "Selection";
        Label = "Currency";
    }

    OUT MIR-CO-ID-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        KeyColumn;
        CodeSource = "XTAB";
        CodeType = "COMP";
        DBTableName = "TCRCY";
        SType = "Text";
        Label = "Company";
        Index = "1";
    }

    OUT MIR-CRCY-CD-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TCRCY";
        SType = "Text";
        Label = "Currency";
        Index = "1";
    }

}

