# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:02 PM EDT

#*******************************************************************************
#*  Component:   BF9874-P.p                                                    *
#*  Description: Disease/Surgery Major Code List                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

P-STEP BF9874-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9874";
        BusinessFunctionName = "Major Code List";
        BusinessFunctionType = "List";
        MirName = "CCWM9874";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-MEDIC-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MEDIC-CD";
        DBTableName = "MEDC";
        SType = "Selection";
        Label = "Medical Type";
    }

    INOUT MIR-MEDC-ID
    {
        Key;
        Length = "10";
        DBTableName = "MEDC";
        SType = "Text";
        Label = "Major Code";
    }
    
    INOUT MIR-LANG-DESC-1-TXT
    {
        Key;
        Length = "60";
        DBTableName = "LANG";
        SType = "Text";
        Label = "Katakana Name";
    }

    OUT MIR-MEDC-TYP-CD
    {
        Length = "1";
        DBTableName = "MEDC";
        SType = "Hidden";
        Label = "Group Medical Type";
    }
    
    OUT MIR-MEDIC-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "MEDIC-CD";
        DBTableName = "MEDC";
        SType = "Selection";
        Label = "Medical Table";
        Index = "1";
    }

    OUT MIR-MEDC-ID-T[100]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "MEDC";
        SType = "Text";
        Label = "Major Code";
        Index = "1";
    }
    
    OUT MIR-LANG-DESC-1-TXT-T[100]
    {
        Length = "60";
        FieldGroup = "Table1";
        DBTableName = "LANG";
        SType = "Text";
        Label = "Katakana Name";
        Index = "1";
    }

    OUT MIR-LANG-DESC-2-TXT-T[100]
    {
        Length = "60";
        FieldGroup = "Table1";
        DBTableName = "LANG";
        SType = "Text";
        Label = "Kanji Name";
        Index = "1";
    }

}

