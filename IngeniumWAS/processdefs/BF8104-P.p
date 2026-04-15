# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:55 PM EDT

#*******************************************************************************
#*  Component:   BF8104-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016071  602J     make language a selection box                             *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF8104-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8104";
        BusinessFunctionName = "Data Model Allowed Value Desc. List";
        BusinessFunctionType = "List";
        MirName = "XCWM8104";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DM-AV-CD
    {
        Key;
        Length = "15";
        DBTableName = "TDMAD";
        SType = "Text";
        Label = "Allowed Value";
    }

    INOUT MIR-DM-AV-DESC-LANG-CD
    {
        Key;
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "LANG";
        DBTableName = "TDMAD";
        SType = "Selection";
        Label = "Language";
    }

    INOUT MIR-DM-AV-TBL-CD
    {
        Key;
        Length = "30";
        DBTableName = "TDMAD";
        SType = "Text";
        Label = "Allowed Value Table Name";
    }

    OUT MIR-DM-AV-CD-T[50]
    {
        Length = "15";
        FieldGroup = "Table50";
        DBTableName = "TDMAD";
        SType = "Text";
        Label = "Allowed Value";
        Index = "1";
    }

    OUT MIR-DM-AV-DESC-LANG-CD-T[50]
    {
        Length = "1";
        FieldGroup = "Table50";
        CodeSource = "XTAB";
        CodeType = "LANG";
        DBTableName = "TDMAD";
        SType = "Selection";
        Label = "Language";
        Index = "1";
    }

    OUT MIR-DM-AV-DESC-TXT-T[50]
    {
        Length = "80";
        FieldGroup = "Table50";
        DBTableName = "TDMAD";
        SType = "Text";
        Label = "Allowed Value Description";
        Index = "1";
    }

    OUT MIR-DM-AV-TBL-CD-T[50]
    {
        Length = "30";
        FieldGroup = "Table50";
        DBTableName = "TDMAD";
        SType = "Text";
        Label = "Allowed Value Table Name";
        Index = "1";
    }

}

