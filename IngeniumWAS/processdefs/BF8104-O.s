# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:05 PM EDT

#*******************************************************************************
#*  Component:   BF8104-O.s                                                    *
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

S-STEP BF8104-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
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

    INOUT MIR-DM-AV-CD
    {
        Key;
        Length = "15";
        SType = "Text";
        Label = "Allowed Value";
    }

    INOUT MIR-DM-AV-DESC-LANG-CD
    {
        Key;
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "LANG";
        SType = "Selection";
        Label = "Language";
    }

    INOUT MIR-DM-AV-TBL-CD
    {
        Key;
        Length = "30";
        SType = "Text";
        Label = "Allowed Value Table Name";
    }

    IN MIR-DM-AV-CD-T[50]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Allowed Value";
        Index = "1";
    }

    IN MIR-DM-AV-DESC-LANG-CD-T[50]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table50";
        CodeSource = "XTAB";
        CodeType = "LANG";
        SType = "Text";
        Label = "Language";
        Index = "1";
    }

    IN MIR-DM-AV-DESC-TXT-T[50]
    {
        DisplayOnly;
        Length = "80";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Allowed Value Description";
        Index = "1";
    }

    IN MIR-DM-AV-TBL-CD-T[50]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Allowed Value Table Name";
        Index = "1";
    }

}

