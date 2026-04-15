# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:49 PM EDT

#*******************************************************************************
#*  Component:   BF2043-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2043-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2043";
        BusinessFunctionName = "Text Language Table Delete";
        BusinessFunctionType = "Delete";
        MirName = "XCWM2950";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-TXT-LANG-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TTEXT";
        SType = "Selection";
        Label = "Text Description Language";
    }

    IN MIR-TXT-SRC-ID
    {
        Key;
        Mandatory;
        Length = "8";
        DBTableName = "TTEXT";
        SType = "Text";
        Label = "Source Module";
    }

    IN MIR-TXT-SRC-REF-ID
    {
        Key;
        Mandatory;
        Length = "5";
        DBTableName = "TTEXT";
        SType = "Text";
        Label = "Text Reference Identifier";
    }

}

