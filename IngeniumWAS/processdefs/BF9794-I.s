# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:11 PM EDT

#*******************************************************************************
#*  Component:   BF9794-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  2BAC03  07MAY02  Module created                                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF9794-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
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
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "PLANC";
        SType = "Selection";
        Label = "Ingenium Plan id";
    }

    INOUT MIR-CVG-STAT-TYP-CD
    {
        Key;
        Length = "6";
        CodeSource = "DataModel";
        CodeType = "CVG-STAT-TYP-CD";
        SType = "Selection";
        Label = "Coverage Type";
    }

}


