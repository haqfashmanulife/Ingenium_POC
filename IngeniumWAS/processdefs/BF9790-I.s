# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:11 PM EDT
#*******************************************************************************
#*  Component:   BF9790-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  2BAC03  01MAY02  Module created                                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF9790-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-PLAN-ID";
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

    INOUT MIR-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "PLANC";
        SType = "Selection";
        Label = "Ingenium Plan";
    }

    INOUT MIR-CVG-STAT-TYP-CD
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "DataModel";
        CodeType = "CVG-STAT-TYP-CD";
        SType = "Selection";
        Label = "Coverage Type";
    }

}

