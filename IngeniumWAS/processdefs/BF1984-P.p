# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:48 PM EDT

#*******************************************************************************
#*  Component:   BF1984-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1984-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1984";
        BusinessFunctionName = "Application Security Class List";
        BusinessFunctionType = "List";
        MirName = "XCWM0180";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CO-ID
    {
        Key;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "COMP";
        DBTableName = "TAPPL";
        SType = "Selection";
        Label = "Company";
    }

    INOUT MIR-SECUR-CLAS-ID
    {
        Key;
        Length = "10";
        CodeSource = "XTAB";
        CodeType = "USCL";
        DBTableName = "TASCL";
        SType = "Selection";
        Label = "Security Class";
    }

    OUT MIR-ASCL-CRCY-1-1-CD-T[10]
    {
        Length = "2";
        FieldGroup = "Table10";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TAPPL";
        SType = "Text";
        Label = "Currency";
        Index = "1";
    }

    OUT MIR-ASCL-CRCY-2-1-CD-T[10]
    {
        Length = "2";
        FieldGroup = "Table10";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TAPPL";
        SType = "Text";
        Label = "Currency";
        Index = "1";
    }

    OUT MIR-ASCL-CRCY-3-1-CD-T[10]
    {
        Length = "2";
        FieldGroup = "Table10";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TAPPL";
        SType = "Text";
        Label = "Currency";
        Index = "1";
    }

    OUT MIR-ASCL-CRCY-4-1-CD-T[10]
    {
        Length = "2";
        FieldGroup = "Table10";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TAPPL";
        SType = "Text";
        Label = "Currency";
        Index = "1";
    }

    OUT MIR-ASCL-CRCY-5-1-CD-T[10]
    {
        Length = "2";
        FieldGroup = "Table10";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TAPPL";
        SType = "Text";
        Label = "Currency";
        Index = "1";
    }

    OUT MIR-ASCL-CTRY-1-CD-T[10]
    {
        Length = "2";
        FieldGroup = "Table10";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DBTableName = "TAPPL";
        SType = "Text";
        Label = "Country";
        Index = "1";
    }

    OUT MIR-CO-ID-T[10]
    {
        Length = "2";
        FieldGroup = "Table10";
        CodeSource = "XTAB";
        CodeType = "COMP";
        DBTableName = "TAPPL";
        SType = "Text";
        Label = "Company";
        Index = "1";
    }

    OUT MIR-SECUR-CLAS-ID-T[10]
    {
        Length = "10";
        FieldGroup = "Table10";
        CodeSource = "XTAB";
        CodeType = "USCL";
        DBTableName = "TASCL";
        SType = "Text";
        Label = "Security Class";
        Index = "1";
    }

}

