# Converted to Pathfinder 3.0 on Dec 13, 2024 10:25:22 PM EDT

#*******************************************************************************
#*  Component:   BF9G78-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYDM36  CTS      INITIAL VERSION OF UNISYS ANNUITY POLICY INQUIRY SCREEN   *
#*******************************************************************************

S-STEP BF9G78-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        FocusField = "MIR-ANTY-POL-ID";
        FocusFrame = "ContentFrame";
        Type = "Input";
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
        SType="Hidden";
    }
    
    OUT index
    {
        SType = "Hidden";
    }
    
    
    INOUT MIR-ANTY-POL-ID
    {   
        Key;
        Mandatory;
        DefaultSession = "MIR-ANTY-POL-ID";
        Label = "Annuity Policy ID";
        Length = "10";
        SType = "Text";
    }
}
