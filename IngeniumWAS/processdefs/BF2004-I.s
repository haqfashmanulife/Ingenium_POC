# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:54 PM EDT

#*******************************************************************************
#*  Component:   BF2004-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2004-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Input";
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

}

