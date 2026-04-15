# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:43 PM EDT

#*******************************************************************************
#*  Component:   BF1664-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1664-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1664";
        BusinessFunctionName = "Company Client Relationship List";
        BusinessFunctionType = "List";
        MirName = "NCWM3300";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CO-CLI-LANG-CD
    {
        Key;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TCOCL";
        SType = "Selection";
        Label = "Language";
    }

    INOUT MIR-CO-ID
    {
        Key;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "COMP";
        DBTableName = "TPCOM";
        SType = "Text";
        Label = "Company";
    }

    OUT MIR-CLI-ID-T[11]
    {
        Length = "10";
        FieldGroup = "Table11";
        KeyColumn;
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    OUT MIR-CO-CLI-LANG-CD-T[11]
    {
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TCOCL";
        SType = "Text";
        Label = "Language";
        Index = "1";
    }

}

