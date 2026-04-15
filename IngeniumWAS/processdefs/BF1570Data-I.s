# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:46 PM EDT

#*******************************************************************************
#*  Component:   BF1570Data-I.s                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1570Data-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-UW-USER-1-ID";
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

    INOUT MIR-APP-FORM-TYP-ID
    {
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "AFTT";
        SType = "Selection";
        Label = "Application Form Type";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-SPND-POL-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-SPND-POL-REASN-CD
    {
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "STOPR";
        SType = "Selection";
        Label = "Suspend Reason";
    }

    INOUT MIR-SPND-POL-REDT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Policy redating allowed";
    }

    INOUT MIR-SPND-POL-UWG-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Underwriting required";
    }

    INOUT MIR-UW-USER-1-ID
    {
        Mandatory;
        Length = "8";
        DefaultSession = "MIR-USER-ID";
        SType = "Text";
        Label = "1st Underwriter Initials";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

}

