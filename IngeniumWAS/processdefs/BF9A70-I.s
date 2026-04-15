# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9A70-I.s                                                    *
#*  Description:Death Claim Notes Inquiry Screen                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCACN  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF9A70-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
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
        Key;
        Mandatory;  
        Length = "4";
        SType = "Number";
        Label = "Sequence Number";
    }
}
