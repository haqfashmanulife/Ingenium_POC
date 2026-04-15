# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF9G44-I.s                                                    *
#*  Description: Reinsurance Input Screen                                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  TLB15C   CTS      REINSURANCE CHANGES                                      *
#*******************************************************************************
S-STEP BF9G44-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        FocusField = "MIR-POL-ID";
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

    INOUT MIR-POL-ID
    {
        DefaultSession = "MIR-POL-ID";
        Label = "Policy ID";
        Length = "10";
        SType = "Text";
    }
    INOUT MIR-CLI-ID 
    {
        DefaultSession = "MIR-CLI-ID";
        Label = "Client Id";
        Length = "10";
        SType = "Text";
    }

}
