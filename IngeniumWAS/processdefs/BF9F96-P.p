# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:32 PM EDT

#*******************************************************************************
#*  Component:   BF9F96-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  CA0002  CTS     BANK SEARCH SCREEN                                         *
#*******************************************************************************

P-STEP BF9F96-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9F96";
        BusinessFunctionName = "Bank Search List";
        BusinessFunctionType = "List";
        MirName = "CCWM9F96";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-BNK-ID
    {
        Key;
        Length = "4";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Code";
    }
    
    INOUT MIR-BNK-BR-ID
    {
        Key;
        Length = "3";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch Code";
    }
    
    INOUT MIR-BNK-NM
    {
        Length = "36";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Name";
    }
        
    INOUT MIR-BNK-BR-NM
    {
        Length = "36";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch Name";
     }

    OUT MIR-BNK-ID-T[10]
    {
        Length = "4";
        FieldGroup = "Table10";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Code";
        Index = "1";
    }
    
    OUT MIR-BNK-BR-ID-T[10]
    {
        Length = "5";
        FieldGroup = "Table10";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch Code";
        Index = "1";
    }    

    OUT MIR-BNK-NM-T[10]
    {
        Length = "36";
        FieldGroup = "Table10";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Name (Kanji)";
        Index = "1";
    }

    OUT MIR-BNK-BR-NM-T[10]
    {
        Length = "36";
        FieldGroup = "Table10";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch Name (Kanji)";
        Index = "1";
    }

    OUT MIR-BNK-NM-KA-DBL-T[10]
    {
        Length = "30";
        FieldGroup = "Table10";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Name (Kana)";
        Index = "1";
    }

    OUT MIR-BNK-BR-NM-KA-DBL-T[10]
    {
        Length = "30";
        FieldGroup = "Table10";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch Name (Kana)";
        Index = "1";
    }
    INOUT MIR-RECORD-CTR
    {
        Length = "3";
        SType = "Hidden";
        Label = "Rec Count";
    }
    INOUT MIR-RECORD-CTR-N
    {
        Length = "3";
        SType = "Hidden";
        Label = "Rec Count";
    }              
}

