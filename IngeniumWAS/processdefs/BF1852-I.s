# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:52 PM EDT

#*******************************************************************************
#*  Component:   BF1852-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1852-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-DV-VALN-LBL-CD-T[1]";
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

    INOUT MIR-DV-VALN-LBL-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "VLBL";
        SType = "Selection";
        Label = "Label Description";
        Index = "1";
    }

    IN MIR-VALN-LBL-ID
    {
        Key;
        DisplayOnly;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "RLBL";
        SType = "Text";
        Label = "Plan ID";
    }

}

