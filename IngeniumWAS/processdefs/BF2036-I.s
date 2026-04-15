# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:55 PM EDT

#*******************************************************************************
#*  Component:   BF2036-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2036-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-BASIC-PLAN-ID";
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

    INOUT MIR-BASIC-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Selection";
        Label = "Basic Plan";
    }

    INOUT MIR-BASIC-PLAN-ID-2
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Selection";
        Label = "Basic Plan";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Sub Company";
    }

    INOUT MIR-SBSDRY-CO-ID-2
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Sub Company";
    }

}

