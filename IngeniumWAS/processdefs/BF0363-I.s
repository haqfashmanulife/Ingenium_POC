# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:21 PM EDT

#*******************************************************************************
#*  Component:   BF0363-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0363-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Delete";
        Type = "Input";
        FocusField = "MIR-CCAS-TST-ID";
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

    INOUT MIR-CCAS-TST-ID
    {
        Key;
        Mandatory;
        Length = "4";
        SType = "Text";
        Label = "Test Number";
    }

    INOUT MIR-CCAS-TST-SUBSET-ID
    {
        Key;
        Mandatory;
        Length = "1";
        SType = "Text";
        Label = "Subset Test";
    }

}

