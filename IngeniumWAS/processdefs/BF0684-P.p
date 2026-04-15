# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:27 PM EDT

#*******************************************************************************
#*  Component:   BF0684-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0684-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0684";
        BusinessFunctionName = "Edit Table List";
        BusinessFunctionType = "List";
        MirName = "CCWM0821";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-ETBL-LANG-CD
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TEDIT";
        SType = "Selection";
        Label = "Language";
    }

    INOUT MIR-ETBL-TYP-ID
    {
        Key;
        Mandatory;
        Length = "5";
        DBTableName = "TEDIT";
        SType = "Text";
        Label = "Table Name";
    }

    INOUT MIR-ETBL-DESC-TXT
    {
        Key;
        Length = "40";
        DBTableName = "TEDIT";
        SType = "Text";
        Label = "Description";
        MixedCase;
    }

    INOUT MIR-ETBL-VALU-ID
    {
        Key;
        Length = "15";
        DBTableName = "TEDIT";
        SType = "Text";
        Label = "Value";
    }

    OUT MIR-ETBL-DESC-TXT-T[250]
    {
        Length = "40";
        FieldGroup = "Table250";
        DBTableName = "TEDIT";
        SType = "Text";
        Label = "Description";
        Index = "1";
    }

    OUT MIR-ETBL-LANG-CD-T[250]
    {
        Length = "40";
        FieldGroup = "Table250";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TEDIT";
        SType = "Text";
        Label = "Language";
        Index = "1";
    }

    OUT MIR-ETBL-TYP-ID-T[250]
    {
        Length = "5";
        FieldGroup = "Table250";
        DBTableName = "TEDIT";
        SType = "Text";
        Label = "Table Name";
        Index = "1";
    }

    OUT MIR-ETBL-VALU-ID-T[250]
    {
        Length = "15";
        FieldGroup = "Table250";
        DBTableName = "TEDIT";
        SType = "Text";
        Label = "Value";
        Index = "1";
    }

}

