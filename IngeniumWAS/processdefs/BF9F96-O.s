# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:32 PM EDT

#*******************************************************************************
#*  Component:   BF9F96-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  CA0002  CTS     BANK SEARCH SCREEN                                         *
#*******************************************************************************

S-STEP BF9F96-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-BNK-ID";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    INOUT MIR-BNK-ID
    {
        Key;
        Length = "4";
        SType = "Text";
        Label = "Bank Code";
    }
    
    INOUT MIR-BNK-BR-ID
    {
        Key;
        Length = "3";
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

    IN MIR-BNK-ID-T[10]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table10";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Code";
        Index = "1";
    }
    
    IN MIR-BNK-BR-ID-T[10]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table10";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch Code";
        Index = "1";
    }    

    IN MIR-BNK-NM-T[10]
    {
        DisplayOnly;
        Length = "36";
        FieldGroup = "Table10";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Name (Kanji)";
        Index = "1";
    }

    IN MIR-BNK-BR-NM-T[10]
    {
        DisplayOnly;
        Length = "36";
        FieldGroup = "Table10";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch Name (Kanji)";
        Index = "1";
    }

    IN MIR-BNK-NM-KA-DBL-T[10]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table10";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Name (Kana)";
        Index = "1";
    }

    IN MIR-BNK-BR-NM-KA-DBL-T[10]
    {
        DisplayOnly;
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
}

 