# Converted from PathFinder 2.2 to 3.0 MAR 28, 2022 3:12:39 PM EDT

#*******************************************************************************
#*  Component:   BF9E43-I.s                                                    *
#*  Description: Deferment Amount Quote - Input                                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3066  CTS  CHANGES FOR SAVING RIDER                                      *
#*******************************************************************************

S-STEP BF9E43-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Quotedefer";
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
        SType = "Hidden";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    INOUT MIR-EVNT-ACTV-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DEFR-ACTV-TYP-CD";
        SType = "Selection";
        Label = "Activity Type";
    }
    
    INOUT MIR-PRCES-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }
	
#UY3066 CHANGES START HERE

    INOUT MIR-CVG-NUM
    {
        Length = "2";
        DefaultConstant = "00";
        SType = "Text";
        Label = "Coverage Number";
    }

#UY3066 CHANGES ENDS HERE

}
