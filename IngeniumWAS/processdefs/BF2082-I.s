# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:55 PM EDT

#*******************************************************************************
#*  Component:   BF2082-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2082-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-UPLD-FLD-FILE-CD-T[1]";
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

    INOUT MIR-UPLD-FLD-FILE-CD-T[1]
    {
        Length = "4";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "UPLD-FLD-FILE-CD";
        SType = "Selection";
        Label = "Table Name";
        Index = "1";
    }

    INOUT MIR-UPLD-FLD-NM-T[1]
    {
        Mandatory;
        Length = "18";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Field Name";
        Index = "1";
    }

    INOUT MIR-UPLD-FLD-TYP-CD-T[1]
    {
        Mandatory;
        Length = "1";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "UPLD-FLD-TYP-CD";
        SType = "Selection";
        Label = "Data Type";
        Index = "1";
    }

    INOUT MIR-UPLD-TTBL-TYP-ID-T[1]
    {
        Length = "5";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Translate Table";
        Index = "1";
    }

    IN MIR-UPLD-FLD-APEX-NM
    {
        Key;
        DisplayOnly;
        Length = "20";
        SType = "Text";
        Label = "APEX Field";
    }

    IN MIR-UPLD-FLD-STRUCT-NM
    {
        Key;
        DisplayOnly;
        Length = "20";
        SType = "Text";
        Label = "Structure Name";
    }

}

