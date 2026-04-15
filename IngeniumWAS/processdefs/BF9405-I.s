# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:02 PM EDT

#*******************************************************************************
#*  Component:   BF9405-I.s                                                    *
#*  Description: Bulk Application Inquiry Screen                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  MP176B  CTS      Intial Version                                            *
#*                                                                             *
#*  C19006  CTS      CHANGES TO REMOVE DEFAULT SESSION FOR BULK APPLICATION ID *                      *
#*******************************************************************************

S-STEP BF9405-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Input";
        FocusField = "MIR-POL-BULK-APP-ID";
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

    INOUT MIR-POL-BULK-APP-ID
    {
        Key;
        Mandatory;
        Length = "15";
# C19006 Changes Begins Here        
#        DefaultSession = "MIR-POL-BULK-APP-ID";
# C19006 Changes Ends Here        
        SType = "Text";
        Label = "Bulk Application ID";
    }
}
