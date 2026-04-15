# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:10 PM EDT

#*  P00891  YC       Add Journal Date with no limitation   06JUN2003           *
S-STEP BF9441-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "RPlaps";
		Type = "Input";
		FocusField = "MIR-APPL-CTL-PRCES-DT";
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

	INOUT MIR-APPL-CTL-PRCES-DT
	{
		Key;
		Length = "10";
		DefaultSession = "LSIR-PRCES-DT";
		SType = "Date";
		Label = "Process Date";
	}

	INOUT MIR-POL-ID-BASE
	{
		Key;
		Mandatory;
		Length = "9";
		DefaultSession = "MIR-POL-ID-BASE";
		SType = "Text";
		Label = "Policy Id";
	}

	INOUT MIR-POL-ID-SFX
	{
		Key;
		Length = "1";
		DefaultSession = "MIR-POL-ID-SFX";
		SType = "Text";
		Label = "Suffix";
	}
#  P00891 YC      06JUN2003  Add 8 lines for Adding Journal Date
    INOUT MIR-JRNL-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
    }

}
