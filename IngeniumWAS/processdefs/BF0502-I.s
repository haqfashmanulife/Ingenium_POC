# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:23 PM EDT

#*******************************************************************************
#*  Component:   BF0502-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0502-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-USER-ID-T[1]";
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

    INOUT MIR-USER-ID-T[12]
    {
        Length = "8";
        FieldGroup = "Table12";
        KeyColumn;
        SType = "Text";
        Label = "Underwriter's Initials";
        Index = "1";
    }

    IN MIR-BR-ID
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Text";
        Label = "Servicing Branch";
    }

    IN MIR-UWAR-ALPHA-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Alphabetical Split";
    }

    IN MIR-UWAR-BUS-CLAS-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CLASS";
        SType = "Text";
        Label = "Line of Business";
    }

    IN MIR-UWAR-TCR-AMT
    {
        Key;
        DisplayOnly;
        Length = "13";
        Decimals = "0";
        SType = "Currency";
        Label = "Amount";
    }

}

