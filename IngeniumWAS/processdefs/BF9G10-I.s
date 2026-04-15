# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:02 PM EDT

#*******************************************************************************
#*  Component:   BF9G10-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  TLB404   CTS      NEW SCREEN FOR BULK BUNDLE APPLICATION                    *
#*******************************************************************************

S-STEP BF9G10-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "BF9G10";
        Type = "Input";
        FocusField = "MIR-UPLD-STRT-DT";
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

    INOUT MIR-UPLD-STRT-DT
    {
        Key;
        Mandatory;
        Length = "10";
        SType = "Date";
        Label = "Upload date";
    }
    
    INOUT MIR-UPLD-END-DT
    {
        Key;
        Mandatory;
        Length = "10";
        SType = "Date";
        Label = "Upload date";
    }    

    INOUT MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        SType = "Text";
        Label = "Specify client ID";
    }

}

