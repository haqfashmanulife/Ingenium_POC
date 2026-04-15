# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:45 PM EDT

#*******************************************************************************
#*  Component:   BF1530-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00305  SC       Remove Writing & Commissionable Agent                     *
#*                                                                             *
#*******************************************************************************

S-STEP BF1530-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-CLI-ID";
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

    INOUT MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-SERV-AGT-ID
    {
        Key;
        Length = "6";
        SType = "Text";
        Label = "Servicing Agent Number";
    }

}

