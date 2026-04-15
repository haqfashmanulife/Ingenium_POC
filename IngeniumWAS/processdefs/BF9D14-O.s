# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:44 PM EDT

#*******************************************************************************
#*  Component:   BF9D14-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP302C  CTS       Reversal Survival Benefit                                *
#*******************************************************************************

S-STEP BF9D14-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "RTDsrvb";
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
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

    IN MIR-POL-ID-BASE
    {
        DefaultSession = "MIR-POL-ID-BASE";
	DisplayOnly;
	Key;
	Label = "Policy Id";
	Length = "9";
        SType = "Text";
    }
    
    IN MIR-APPL-CTL-PRCES-DT
    {
        DefaultSession = "LSIR-PRCES-DT";
	DisplayOnly;
	Label = "Process Date";
	Length = "10";
        SType = "Date";      
    }
     
    IN MIR-DV-OWN-CLI-NM
    {
    	Length = "50";
    	DefaultSession = "MIR-DV-OWN-CLI-NM";
    	DisplayOnly;
    	SType = "Text";
    	Label = "Owner name"; 
    }
 }

