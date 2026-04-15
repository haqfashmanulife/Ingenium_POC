# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:17 PM EDT

#*******************************************************************************
#*  Component:   BF0210-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0210-I
{
    ATTRIBUTES
    {
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

    OUT index
    {
        SType = "Hidden";
    }


    #	INOUT MIR-DV-CNTRCT-RQST-IND-T-1
    #	{
    #		Length = "1";
    #		Occurs = "17";
    #		FieldGroup = "Table17";
    #		Index = "1";
    #		CodeSource = "DataModel": RT;
    #		CodeType = "DV-CNTRCT-RQST-IND": RT;
    #		SType = "Indicator": RT;
    #		Label = "Contract Requests";
    #	}
    #
    #	INOUT MIR-DV-CNTRCT-RQST-IND-T-2
    #	{
    #		Length = "1";
    #		Occurs = "17";
    #		FieldGroup = "Table17";
    #		Index = "2";
    #		CodeSource = "DataModel": RT;
    #		CodeType = "DV-CNTRCT-RQST-IND": RT;
    #		SType = "Indicator": RT;
    #		Label = "Contract Requests";
    #	}
    #
    #	INOUT MIR-DV-CNTRCT-RQST-IND-T-3
    #	{
    #		Length = "1";
    #		Occurs = "17";
    #		FieldGroup = "Table17";
    #		Index = "3";
    #		CodeSource = "DataModel": RT;
    #		CodeType = "DV-CNTRCT-RQST-IND": RT;
    #		SType = "Indicator": RT;
    #		Label = "Contract Requests";
    #	}
    #
    #	INOUT MIR-DV-CNTRCT-RQST-IND-T-4
    #	{
    #		Length = "1";
    #		Occurs = "17";
    #		FieldGroup = "Table17";
    #		Index = "4";
    #		CodeSource = "DataModel": RT;
    #		CodeType = "DV-CNTRCT-RQST-IND": RT;
    #		SType = "Indicator": RT;
    #		Label = "Contract Requests";
    #	}
    #
    #	INOUT MIR-DV-CNTRCT-RQST-IND-T-5
    #	{
    #		Length = "1";
    #		Occurs = "17";
    #		FieldGroup = "Table17";
    #		Index = "5";
    #		CodeSource = "DataModel": RT;
    #		CodeType = "DV-CNTRCT-RQST-IND": RT;
    #		SType = "Indicator": RT;
    #		Label = "Contract Requests";
    #	}
    #
    #	INOUT MIR-DV-CNTRCT-RQST-IND-T-6
    #	{
    #		Length = "1";
    #		Occurs = "17";
    #		FieldGroup = "Table17";
    #		Index = "6";
    #		CodeSource = "DataModel": RT;
    #		CodeType = "DV-CNTRCT-RQST-IND": RT;
    #		SType = "Indicator": RT;
    #		Label = "Contract Requests";
    #	}
    #
    #	INOUT MIR-DV-CNTRCT-RQST-IND-T-7
    #	{
    #		Length = "1";
    #		Occurs = "17";
    #		FieldGroup = "Table17";
    #		Index = "7";
    #		CodeSource = "DataModel": RT;
    #		CodeType = "DV-CNTRCT-RQST-IND": RT;
    #		SType = "Indicator": RT;
    #		Label = "Contract Requests";
    #	}
    #
    #	INOUT MIR-DV-CNTRCT-RQST-IND-T-8
    #	{
    #		Length = "1";
    #		Occurs = "17";
    #		FieldGroup = "Table17";
    #		Index = "8";
    #		CodeSource = "DataModel": RT;
    #		CodeType = "DV-CNTRCT-RQST-IND": RT;
    #		SType = "Indicator": RT;
    #		Label = "Contract Requests";
    #	}
    #
    #	INOUT MIR-DV-CNTRCT-RQST-IND-T-9
    #	{
    #		Length = "1";
    #		Occurs = "17";
    #		FieldGroup = "Table17";
    #		Index = "9";
    #		CodeSource = "DataModel": RT;
    #		CodeType = "DV-CNTRCT-RQST-IND": RT;
    #		SType = "Indicator": RT;
    #		Label = "Contract Requests";
    #	}

    INOUT MIR-DV-CNTRCT-RQST-IND-T[14]
    {
        Length = "1";
        FieldGroup = "Table17";
        CodeSource = "DataModel";
        CodeType = "DV-CNTRCT-RQST-IND";
        SType = "Indicator";
        Label = "Contract Requests";
        Index = "1";
    }


    #	INOUT MIR-DV-CNTRCT-RQST-IND-T-15
    #	{
    #		Length = "1";
    #		Occurs = "17";
    #		FieldGroup = "Table17";
    #		Index = "15";
    #		CodeSource = "DataModel": RT;
    #		CodeType = "DV-CNTRCT-RQST-IND": RT;
    #		SType = "Indicator": RT;
    #		Label = "Contract Requests";
    #	}
    #
    #	INOUT MIR-DV-CNTRCT-RQST-IND-T-16
    #	{
    #		Length = "1";
    #		Occurs = "17";
    #		FieldGroup = "Table17";
    #		Index = "16";
    #		CodeSource = "DataModel": RT;
    #		CodeType = "DV-CNTRCT-RQST-IND": RT;
    #		SType = "Indicator": RT;
    #		Label = "Contract Requests";
    #	}
    #
    #	INOUT MIR-DV-CNTRCT-RQST-IND-T-17
    #	{
    #		Length = "1";
    #		Occurs = "17";
    #		FieldGroup = "Table17";
    #		Index = "17";
    #		CodeSource = "DataModel": RT;
    #		CodeType = "DV-CNTRCT-RQST-IND": RT;
    #		SType = "Indicator": RT;
    #		Label = "Contract Requests";
    #	}

    INOUT MIR-CLI-ID
    {
        Key;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-DOC-ID
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        SType = "Selection";
        Label = "Document Name";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
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

    INOUT MIR-TRNXT-DOC-CPY-QTY
    {
        Mandatory;
        Length = "2";
        SType = "Text";
        Label = "Number of Copies";
    }

    INOUT MIR-TRNXT-LANG-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Selection";
        Label = "Language";
    }

    INOUT MIR-TRNXT-RPT-DSTRB-CD
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "PRTID";
        SType = "Selection";
        Label = "Printer";
    }

}

