# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:47 PM EDT

#*******************************************************************************
#*  Component:   BF1960-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  6.1.2 J  Currency Scaling                                          *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1960-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1960";
        BusinessFunctionName = "Currency Table Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "XCWM0162";
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
        DBTableName = "TCRCY";
        SType = "Selection";
        Label = "Company";
    }

    IN MIR-CRCY-CD
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TCRCY";
        SType = "Selection";
        Label = "Currency";
    }

    OUT MIR-CRCY-DCML-SPRT-CD
    {
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "DECSP";
        DBTableName = "TCRCY";
        SType = "Text";
        Label = "Decimal Separator";
    }

    OUT MIR-CRCY-NEG-PLACE-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CRCY-NEG-PLACE-CD";
        DBTableName = "TCRCY";
        SType = "Text";
        Label = "Negative Placement";
    }

    OUT MIR-CRCY-PLACE-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CRCY-PLACE-CD";
        DBTableName = "TCRCY";
        SType = "Text";
        Label = "Currency Placement";
    }

    OUT MIR-CRCY-SYMBL-CD
    {
        Length = "3";
        CodeSource = "XTAB";
        CodeType = "CSYMB";
        DBTableName = "TCRCY";
        SType = "Text";
        Label = "Currency Symbol";
    }

    OUT MIR-CRCY-THOU-SPRT-CD
    {
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "THSSP";
        DBTableName = "TCRCY";
        SType = "Text";
        Label = "1,000 Separator";
    }

    OUT MIR-CRCY-SCALE-QTY
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CRCY-SCALE-QTY";
        DBTableName = "TCRCY";
        SType = "Text";
        Label = "Currency Scale";
    }

}

