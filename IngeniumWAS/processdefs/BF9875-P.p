# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:02 PM EDT

#*******************************************************************************
#*  Component:   BF9875-P.p                                                    *
#*  Description: Associated Disease/Surgery List                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

P-STEP BF9875-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9875";
        BusinessFunctionName = "Associated Disease/Surgery List";
        BusinessFunctionType = "List";
        MirName = "CCWM9875";
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
        DBTableName = "MEDG";
        SType = "Selection";
        Label = "Medical Type";
    }

    INOUT MIR-GRP-MEDC-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "MEDG";
        SType = "Text";
        Label = "Major Code";
    }
    
    INOUT MIR-MEDIC-CAT-CD
    {
        Key;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "DV-SURG-BNFT-CAT-CD";
        DBTableName = "MEDG";
        SType = "Selection";
        Label = "Category Name";
    }

    INOUT MIR-MEDC-ID
    {
        Length = "10";
        SType = "Hidden";
        Label = "Medical ID";
    }
    
    OUT MIR-GRP-LANG-DESC-1-TXT
    {
        Length = "60";
        DBTableName = "LANG";
        SType = "Text";
        Label = "Katakana Name";
    }
    
    OUT MIR-MEDC-TYP-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Code Medical Type";
    }
    
    OUT MIR-GRP-MEDC-TYP-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Group Medical Type";
    }
    
    OUT MIR-MEDIC-CAT-CD-T[100]
    {
        Length = "5";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "MEDIC-CAT-CD";
        CodeSubType = "SUBC";
        DBTableName = "MEDG";
        SType = "Selection";
        Label = "Category Name";
        Index = "1";
    }
    
    OUT MIR-MEDC-ID-T[100]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "MEDG";
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
        Label = "Kanji Name";
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

