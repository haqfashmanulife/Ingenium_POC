# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:54 PM EDT

#*******************************************************************************
#*  Component:   BF2004-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  R10440  CTS      VM MIGRATION PLAN - REGARDING DUMMY DEPLOYMENT FOR        *  
#*                   INGENIUM PRODUCTION                                       *
#*                                                                             *
#*******************************************************************************

S-STEP BF2004-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-ETBL-TYP-ID";
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

    INOUT MIR-ETBL-LANG-CD
    {
        Key;
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "LANG";
        SType = "Selection";
        Label = "Language";
    }

    INOUT MIR-ETBL-TYP-ID
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "XTAB";
        SType = "Selection";
        Label = "Edit Table Name";
    }

    INOUT MIR-ETBL-VALU-ID
    {
        Key;
        Length = "15";
        SType = "Text";
        Label = "Valid Value";
    }

    INOUT MIR-ETBL-DESC-TXT
    {
        Key;
        Length = "40";
        SType = "Text";
        Label = "Edit Table Value Description";
    }

    IN MIR-ETBL-DESC-TXT-T[250]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table250";
        SType = "Text";
        Label = "Edit Table Value Description";
        Index = "1";
    }

    IN MIR-ETBL-LANG-CD-T[250]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table250";
        CodeSource = "XTAB";
        CodeType = "LANG";
        SType = "Text";
        Label = "Language";
        Index = "1";
    }

    IN MIR-ETBL-TYP-ID-T[250]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table250";
        CodeSource = "XTAB";
        CodeType = "XTAB";
        SType = "Text";
        Label = "Edit Table Name";
        Index = "1";
    }

    IN MIR-ETBL-VALU-ID-T[250]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table250";
        SType = "Text";
        Label = "Valid Value";
        Index = "1";
    }

}

