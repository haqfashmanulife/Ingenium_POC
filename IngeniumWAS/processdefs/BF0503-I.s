# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:23 PM EDT

#*******************************************************************************
#*  Component:   BF0503-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0503-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-BR-ID";
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

    INOUT MIR-BR-ID
    {
        Key;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Selection";
        Label = "Servicing Branch";
    }

    INOUT MIR-UWAR-ALPHA-CD
    {
        Key;
        Length = "1";
        SType = "Text";
        Label = "Alphabetical Split";
    }

    INOUT MIR-UWAR-BUS-CLAS-CD
    {
        Key;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CLASS";
        SType = "Selection";
        Label = "Line of Business";
    }

    INOUT MIR-UWAR-TCR-AMT
    {
        Key;
        Length = "13";
        Decimals = "0";
        SType = "Currency";
        Label = "Amount";
    }

}

