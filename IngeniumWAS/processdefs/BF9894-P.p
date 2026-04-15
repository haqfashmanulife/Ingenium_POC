# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:02 PM EDT

#*******************************************************************************
#*  Component:   BF9894-P.p                                                    *
#*  Description: Disease/Surgery List                                          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*  MP143R           CHANGES FOR KANJI NAME SEARCH                             *
#*******************************************************************************

P-STEP BF9894-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9894";
        BusinessFunctionName = "Disease/Surgery List";
        BusinessFunctionType = "List";
        MirName = "CCWM9894";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-ORIG-DESC-1-TXT
    {
        SType = "Hidden";
    }

    INOUT MIR-END-DESC-1-TXT
    {
        SType = "Hidden";
    }

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
        Label = "Minor Code";
    }
    
    INOUT MIR-LANG-DESC-1-TXT
    {
        Key;
        Length = "60";
        DBTableName = "LANG";
        SType = "Text";
        Label = "Katakana Name";
    }
    
#MP143R Changes Starts here    
    INOUT MIR-LANG-DESC-2-TXT
    {
        Key;
        Length = "60";
        DBTableName = "LANG";
        SType = "Text";
        Label = "Kanji Name";
    }
#MP143R Changes Ends here    


    OUT MIR-MEDC-TYP-CD
    {
        Length = "1";
        DBTableName = "MEDC";
        SType = "Hidden";
        Label = "Code Medical Type";
    }
    
    OUT MIR-GRP-MEDC-ID-T[100]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "MEDG";
        SType = "Text";
        Label = "Major Code";
        Index = "1";
    }
    
    OUT MIR-GRP-LANG-DESC-1-TXT-T[100]
    {
        Length = "60";
        FieldGroup = "Table1";
        DBTableName = "LANG";
        SType = "Text";
        Label = "Major Code Kanji Descriptions";
        Index = "1";
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
        Label = "Medical ID";
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
        Label = "Katakana Name";
        Index = "1";
    }
    
    OUT MIR-MEDC-SUBTYP-CD-T[100]
    {
        Length = "2";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "SUBTY";
        DBTableName = "MEDC";
        SType = "Selection";
        Label = "Subtype";
        Index = "1";
    }

}

