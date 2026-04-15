# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:32 PM EDT

#*******************************************************************************
#*  Component:   BF9F96-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  CA0002  CTS     BANK SEARCH SCREEN                                         *
#*                                                                             *
#*******************************************************************************

S-STEP BF9F96-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Input";
        FocusField = "MIR-BNK-ID";
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
    
    INOUT MIR-BNK-ID
    {
        Key;
        Length = "4";
        SType = "Text";
        Label = "Bank Code";
    }

    INOUT MIR-BNK-BR-ID
    {
        Key;
        Length = "3";
        SType = "Text";
        Label = "Branch Code";
    }
    
    INOUT MIR-BNK-NM
    {
        Length = "36";
        SType = "Text";
        Label = "Bank Name";
    }
    
    INOUT MIR-BNK-BR-NM
    {
        Length = "36";
        SType = "Text";
        Label = "Branch Name";
    }

}

