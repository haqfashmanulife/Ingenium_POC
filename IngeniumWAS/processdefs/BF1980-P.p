# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:48 PM EDT

#*******************************************************************************
#*  Component:   BF1980-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1980-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1980";
        BusinessFunctionName = "Application Security Class Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "XCWM0180";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CO-ID
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "COMP";
        DBTableName = "TAPPL";
        SType = "Selection";
        Label = "Company";
    }

    IN MIR-SECUR-CLAS-ID
    {
        Key;
        Mandatory;
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
        KeyColumn;
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DBTableName = "TAPPL";
        SType = "Text";
        Label = "Country";
        Index = "1";
    }

}

