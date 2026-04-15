S-STEP BF9B96-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Aplint";
		FocusField = "MIR-APPL-CTL-PRCES-DT";
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
#RPCR11 CHANGES STARTS HERE
#	INOUT MIR-APPL-CTL-PRCES-DT
#	{
#		DefaultSession = "LSIR-PRCES-DT";
#		Label = "Process Date";
#		Length = "10";
#		Mandatory;
#		SType = "Date";
#	}
#RPCR11 CHANGES ENDS HERE

	INOUT MIR-DV-PRCES-STATE-CD
	{
		Label = "MIR-DV-PRCES-STATE-CD";
		Length = "1";
		SType = "Hidden";
	}

	INOUT MIR-POL-ID-BASE
	{
		DefaultSession = "MIR-POL-ID-BASE";
		Key;
		Label = "Policy Id";
		Length = "9";
		Mandatory;
		SType = "Text";
	}

	INOUT MIR-POL-ID-SFX
	{
		DefaultSession = "MIR-POL-ID-SFX";
		Key;
		Label = "Suffix";
		Length = "1";
		SType = "Text";
	}

	INOUT MIR-SUPRES-CNFRM-IND
	{
		Label = "Suppress confirmation statement";
		Length = "1";
		SType = "Indicator";
	}

	INOUT MIR-JRNL-DT
	{
		DefaultSession = "LSIR-PRCES-DT";
		Label = "Journal Date";
		Length = "10";
		SType = "Date";
	}
}
