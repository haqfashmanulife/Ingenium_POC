# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:07 PM EDT

#*******************************************************************************
#*  Component:   BF9074-I.s                                                    *
#*  Description: LINC TRANSACTION LIST                                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB05B EKM      CREATION OF STEP                                          *
#*                                                                             *
#*******************************************************************************

S-STEP BF9074-I
{
    ATTRIBUTES
    {
	BusinessFunctionType = "List";
	Type = "Input";
	FocusField = "MIR-POL-ID-BASE";
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
       	SType="Hidden";
    }

    INOUT MIR-POL-ID-BASE
    {
       	Key;
       	Length = "09";
       	SType = "Text";
       	Label = "Policy ID";
    }

    INOUT MIR-POL-ID-SFX
    {
       	Key;
       	Length = "1";
       	SType = "Text";
       	Label = "Suffix";
    }

    INOUT MIR-CLI-ID
    {
       	Key;
       	Length = "10";
       	SType = "Text";
       	Label = "Client ID";
    }
}
