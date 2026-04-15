# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:56 PM EDT

#*******************************************************************************
#*  Component:   BF2085-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2085-O
{
    ATTRIBUTES
    {
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-UPLD-FLD-STRUCT-NM";
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

    INOUT MIR-UPLD-FLD-APEX-NM
    {
        Key;
        Length = "20";
        SType = "Text";
        Label = "APEX Field";
    }

    INOUT MIR-UPLD-FLD-STRUCT-NM
    {
        Key;
        Length = "20";
        SType = "Text";
        Label = "Structure Name";
    }

    IN MIR-UPLD-FLD-APEX-NM-T[12]
    {
        DisplayOnly;
        Length = "20";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "APEX Field";
        Index = "1";
    }

    IN MIR-UPLD-FLD-FILE-CD-T[12]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "UPLD-FLD-FILE-CD";
        SType = "Text";
        Label = "Table Name";
        Index = "1";
    }

    IN MIR-UPLD-FLD-NM-T[12]
    {
        DisplayOnly;
        Length = "18";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Field Name";
        Index = "1";
    }

    IN MIR-UPLD-FLD-STRUCT-NM-T[12]
    {
        DisplayOnly;
        Length = "20";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Structure Name";
        Index = "1";
    }

    IN MIR-UPLD-FLD-TYP-CD-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "UPLD-FLD-TYP-CD";
        SType = "Text";
        Label = "Data Type";
        Index = "1";
    }

    IN MIR-UPLD-TTBL-TYP-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Translate Table";
        Index = "1";
    }

}

