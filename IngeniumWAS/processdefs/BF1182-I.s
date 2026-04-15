# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:35 PM EDT

#*******************************************************************************
#*  Component:   BF1182-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1182-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-POL-ASIGN-STRT-ID";
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

    INOUT MIR-POL-ASIGN-END-ID
    {
        Mandatory;
        Length = "9";
        SType = "Text";
        Label = "Policy Number Range - End";
    }

    INOUT MIR-POL-ASIGN-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Automatic policy number assignment is enabled";
    }

    INOUT MIR-POL-ASIGN-STRT-ID
    {
        Mandatory;
        Length = "9";
        SType = "Text";
        Label = "Policy Number Range - Start";
    }

    IN MIR-BUS-CLAS-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CLASS";
        SType = "Text";
        Label = "Business Class";
    }

    IN MIR-CO-ID
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "COMP";
        SType = "Text";
        Label = "Company";
    }

}

