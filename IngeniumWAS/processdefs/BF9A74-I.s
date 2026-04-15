# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9A74-I.s                                                    *
#*  Description: Death Claim Notes List Screen                                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCACN  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF9A74-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        FocusField = "MIR-CLM-ID";
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

    INOUT MIR-CLM-ID
    {
        Key;
        Mandatory;
        Length = "8";
        SType = "Text";
        DefaultSession = "MIR-CLM-ID";    
        Label = "Death Master Claim ID";
    }

    INOUT MIR-CLM-NOTE-SEQ-NUM
    {
        Length = "4";
        SType = "Number";
        Label = "Sequence Number";
    }
}
