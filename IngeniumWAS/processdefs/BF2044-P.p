# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:49 PM EDT

#*******************************************************************************
#*  Component:   BF2044-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2044-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2044";
        BusinessFunctionName = "Text Language Table List";
        BusinessFunctionType = "List";
        MirName = "XCWM2950";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-TXT-LANG-CD
    {
        Key;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TTEXT";
        SType = "Selection";
        Label = "Text Description Language";
    }

    INOUT MIR-TXT-SRC-ID
    {
        Key;
        Mandatory;
        Length = "8";
        DBTableName = "TTEXT";
        SType = "Text";
        Label = "Source Module";
    }

    INOUT MIR-TXT-SRC-REF-ID
    {
        Key;
        Length = "5";
        DBTableName = "TTEXT";
        SType = "Text";
        Label = "Text Reference Identifier";
    }

    OUT MIR-TXT-LANG-CD-T[6]
    {
        Length = "25";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TTEXT";
        SType = "Text";
        Label = "Text Description Language";
        Index = "1";
    }

    OUT MIR-TXT-SRC-REF-ID-T[6]
    {
        Length = "5";
        FieldGroup = "Table6";
        DBTableName = "TTEXT";
        SType = "Text";
        Label = "Text Reference Identifier";
        Index = "1";
    }

    OUT MIR-TXT-STR-TXT-T[6]
    {
        Length = "132";
        FieldGroup = "Table6";
        DBTableName = "TTEXT";
        SType = "Text";
        Label = "Text Description";
        Index = "1";
    }

}

