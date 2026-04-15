# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:48 PM EDT

#*******************************************************************************
#*  Component:   BF2004-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  R10440  CTS      VM MIGRATION PLAN - REGARDING DUMMY DEPLOYMENT FOR        *  
#*                   INGENIUM PRODUCTION                                       *
#*                                                                             *
#*******************************************************************************

P-STEP BF2004-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2004";
        BusinessFunctionName = "Security Edit List";
        BusinessFunctionType = "List";
        MirName = "XCWM0200";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-ETBL-LANG-CD
    {
        Key;
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "LANG";
        DBTableName = "TXTAB";
        SType = "Selection";
        Label = "Language";
    }

    INOUT MIR-ETBL-TYP-ID
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "XTAB";
        DBTableName = "TXTAB";
        SType = "Selection";
        Label = "Edit Table Name";
    }

    INOUT MIR-ETBL-VALU-ID
    {
        Key;
        Length = "15";
        DBTableName = "TXTAB";
        SType = "Text";
        Label = "Valid Value";
    }

    INOUT MIR-ETBL-DESC-TXT
    {
        Key;
        Length = "40";
        DBTableName = "TXTAB";
        SType = "Text";
        Label = "Edit Table Value Description";
        MixedCase;
    }

    OUT MIR-ETBL-DESC-TXT-T[250]
    {
        Length = "40";
        FieldGroup = "Table250";
        DBTableName = "TXTAB";
        SType = "Text";
        Label = "Edit Table Value Description";
        Index = "1";
    }

    OUT MIR-ETBL-LANG-CD-T[250]
    {
        Length = "40";
        FieldGroup = "Table250";
        CodeSource = "XTAB";
        CodeType = "LANG";
        DBTableName = "TXTAB";
        SType = "Text";
        Label = "Language";
        Index = "1";
    }

    OUT MIR-ETBL-TYP-ID-T[250]
    {
        Length = "5";
        FieldGroup = "Table250";
        CodeSource = "XTAB";
        CodeType = "XTAB";
        DBTableName = "TXTAB";
        SType = "Text";
        Label = "Edit Table Name";
        Index = "1";
    }

    OUT MIR-ETBL-VALU-ID-T[250]
    {
        Length = "15";
        FieldGroup = "Table250";
        DBTableName = "TXTAB";
        SType = "Text";
        Label = "Valid Value";
        Index = "1";
    }

}

