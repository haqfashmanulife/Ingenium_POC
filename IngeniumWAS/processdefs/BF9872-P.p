# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:02 PM EDT

#*******************************************************************************
#*  Component:   BF9872-P.p                                                    *
#*  Description: Disease/Surgery Major Code Update                             *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

P-STEP BF9872-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9872";
        BusinessFunctionName = "Major Code Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM9872";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-MEDIC-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MEDIC-CD";
        DBTableName = "TMEDC";
        SType = "Selection";
        Label = "Medical Type";
    }

    IN MIR-MEDC-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TMEDC";
        SType = "Text";
        Label = "Major Code";
    }

    IN MIR-MEDC-TYP-CD
    {
        Length = "1";
        DBTableName = "TMEDC";
        SType = "Hidden";
        Label = "Group Medical Type";
    }
    
    INOUT MIR-LANG-DESC-1-TXT
    {
        Mandatory;
        Length = "60";
        DBTableName = "TLANG";
        SType = "Text";
        Label = "Katakana Name";
    }
    
    INOUT MIR-LANG-DESC-2-TXT
    {
        Mandatory;
        Length = "60";
        DBTableName = "TLANG";
        SType = "Text";
        Label = "Kanji Name";
    }

    IN MIR-T1-MEDIC-CAT-CD-T[20]
    {
        Length = "5";
        FieldGroup = "Table1";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "MEDIC-CAT-CD";
        DBTableName = "TMCAT";
        SType = "Selection";
        Label = "Category Name";
        Index = "1";
    }    

    IN MIR-T1-MCAT-TYP-CD-T[20]
    {
        Length = "2";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "MCAT-TYP-CD";
        DBTableName = "TMCAT";
        SType = "Selection";
        Label = "Category Type";
        Index = "1";
    }    
    
    INOUT MIR-T1-SELECT-T[20]
    {
        Length = "1";
        FieldGroup = "Table1";
        SType = "Indicator";
        Label = "Select";
        Index = "1";
    }        

    IN MIR-T1-ENTRIES;
    IN MIR-T1-MAX-ENTRIES;
    
    IN MIR-T2-MEDIC-CAT-CD-T[20]
    {
        Length = "5";
        FieldGroup = "Table2";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "MEDIC-CAT-CD";
        DBTableName = "TMCAT";
        SType = "Selection";
        Label = "Category Name";
        Index = "1";
    }    

    IN MIR-T2-MCAT-TYP-CD-T[20]
    {
        Length = "2";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "MCAT-TYP-CD";
        DBTableName = "TMCAT";
        SType = "Selection";
        Label = "Category Type";
        Index = "1";
    }    
    
    INOUT MIR-T2-SELECT-T[20]
    {
        Length = "1";
        FieldGroup = "Table2";
        SType = "Indicator";
        Label = "Select";
        Index = "1";
    }            

    IN MIR-T2-ENTRIES;
    IN MIR-T2-MAX-ENTRIES;

    
    IN MIR-T3-MULTR-TYP-CD-T[20]
    {
        Length = "1";
        FieldGroup = "Table3";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "BNMLT";
        DBTableName = "TBENM";
        SType = "Selection";
        Label = "Multiplier Category";
        Index = "1";
    }    

    INOUT MIR-T3-BENM-MULTR-FCT-T[20]
    {
        Length = "5";
        FieldGroup = "Table3";
        DBTableName = "TBENM";
        SType = "Number";
        Label = "Multiplier Amount";
        Index = "1";
    }    

    IN MIR-T3-ENTRIES;
    IN MIR-T3-MAX-ENTRIES;    

}


