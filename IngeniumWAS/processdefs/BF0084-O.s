# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:13 PM EDT

#*******************************************************************************
#*  Component:   BF0084-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0084-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-MSG-REF-ID";
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

    INOUT MIR-MSG-LANG-CD
    {
        Key;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Selection";
        Label = "Language";
    }

    INOUT MIR-MSG-REF-ID
    {
        Key;
        Mandatory;
        Length = "6";
        SType = "Text";
        Label = "Source Number";
    }

    INOUT MIR-MSG-REF-NUM
    {
        Key;
        Length = "4";
        SType = "Text";
        Label = "Message Number";
    }

    INOUT MIR-MSG-SECUR-CLAS-CD
    {
        Key;
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "MSGC";
        SType = "Selection";
        Label = "Security Class Level";
    }

    IN MIR-MSG-AUD-IND-T[50]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table50";
        SType = "Indicator";
        Label = "Message is to be audited";
        Index = "1";
    }

    IN MIR-MSG-GUI-IND-T[50]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table50";
        SType = "Indicator";
        Label = "Display message to users?";
        Index = "1";
    }

    IN MIR-MSG-LANG-CD-T[50]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table50";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Text";
        Label = "Language";
        Index = "1";
    }

    IN MIR-MSG-REF-NUM-T[50]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Message Number";
        Index = "1";
    }

    IN MIR-MSG-SECUR-CLAS-CD-T[50]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table50";
        CodeSource = "XTAB";
        CodeType = "MSGC";
        SType = "Text";
        Label = "Security Class Level";
        Index = "1";
    }

    IN MIR-MSG-SEVRTY-CD-T[50]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "MSG-SEVRTY-CD";
        SType = "Text";
        Label = "Message Severity Level";
        Index = "1";
    }

    IN MIR-MSG-TXT-T[50]
    {
        DisplayOnly;
        Length = "120";
        FieldGroup = "Table50";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Message Text";
        Action = "SelectItem";
        Index = "1";
    }

}

