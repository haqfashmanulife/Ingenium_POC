# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:04 PM EDT

#*******************************************************************************
#*  Component:   BF8072-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF8072-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-BUS-FCN-AUD-IND";
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

    INOUT MIR-BUS-FCN-AUD-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Audit Indicator";
    }

    INOUT MIR-BUS-FCN-CONN-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Connection Indicator";
    }

    INOUT MIR-BUS-FCN-PDRVR-ID
    {
        Length = "8";
        SType = "Text";
        Label = "Process Driver";
    }

    IN MIR-DV-ENTR-BUS-FCN-ID
    {
        Key;
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Business Function";
    }

}

