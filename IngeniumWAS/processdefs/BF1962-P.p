# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:47 PM EDT

#*******************************************************************************
#*  Component:   BF1962-P.p                                                    *
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

P-STEP BF1962-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1962";
        BusinessFunctionName = "Currency Table Update";
        BusinessFunctionType = "Update";
        MirName = "XCWM0162";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CRCY-DCML-SPRT-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "DECSP";
        DBTableName = "TCRCY";
        SType = "Selection";
        Label = "Decimal Separator";
    }

    INOUT MIR-CRCY-NEG-PLACE-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CRCY-NEG-PLACE-CD";
        DBTableName = "TCRCY";
        SType = "Selection";
        Label = "Negative Placement";
    }

    INOUT MIR-CRCY-PLACE-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CRCY-PLACE-CD";
        DBTableName = "TCRCY";
        SType = "Selection";
        Label = "Currency Placement";
    }

    INOUT MIR-CRCY-SYMBL-CD
    {
        Mandatory;
        Length = "3";
        CodeSource = "XTAB";
        CodeType = "CSYMB";
        DBTableName = "TCRCY";
        SType = "Selection";
        Label = "Currency Symbol";
    }

    INOUT MIR-CRCY-THOU-SPRT-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "THSSP";
        DBTableName = "TCRCY";
        SType = "Selection";
        Label = "1,000 Separator";
    }

    INOUT MIR-CRCY-SCALE-QTY
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CRCY-SCALE-QTY";
        DBTableName = "TCRCY";
        SType = "Selection";
        Label = "Currency Scale";
    }

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

}

