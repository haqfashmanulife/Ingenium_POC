# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:46 PM EDT

#*******************************************************************************
#*  Component:   BF1930-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1930-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1930";
        BusinessFunctionName = "Application ID Record Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "XCWM0150";
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

    OUT MIR-APPL-ASCL-REL-CTR
    {
        Length = "5";
        DBTableName = "TAPPL";
        SType = "Text";
        Label = "Number of Security Classes";
    }

    OUT MIR-APPL-CRCY-1-1-CD-T[5]
    {
        Length = "2";
        FieldGroup = "Table5";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TAPPL";
        SType = "Text";
        Label = "Currency";
        Index = "1";
    }

    OUT MIR-APPL-CRCY-2-1-CD-T[5]
    {
        Length = "2";
        FieldGroup = "Table5";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TAPPL";
        SType = "Text";
        Label = "Currency";
        Index = "1";
    }

    OUT MIR-APPL-CRCY-3-1-CD-T[5]
    {
        Length = "2";
        FieldGroup = "Table5";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TAPPL";
        SType = "Text";
        Label = "Currency";
        Index = "1";
    }

    OUT MIR-APPL-CRCY-4-1-CD-T[5]
    {
        Length = "2";
        FieldGroup = "Table5";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TAPPL";
        SType = "Text";
        Label = "Currency";
        Index = "1";
    }

    OUT MIR-APPL-CRCY-5-1-CD-T[5]
    {
        Length = "2";
        FieldGroup = "Table5";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TAPPL";
        SType = "Text";
        Label = "Currency";
        Index = "1";
    }

    OUT MIR-APPL-CTRY-1-CD-T[5]
    {
        Length = "2";
        FieldGroup = "Table5";
        KeyColumn;
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DBTableName = "TAPPL";
        SType = "Text";
        Label = "Country";
        Index = "1";
    }

    OUT MIR-APPL-EDIT-LANG-CD
    {
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "ELANG";
        DBTableName = "TAPPL";
        SType = "Text";
        Label = "Edit Language";
    }

}

