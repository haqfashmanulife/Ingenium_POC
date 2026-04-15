# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:46 PM EDT

#*******************************************************************************
#*  Component:   BF1570-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  6.1.1J   Code Clean Up                                             *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*******************************************************************************

S-STEP BF1570-O
{
    ATTRIBUTES
    {
        Type = "Output";
        DelEmptyRows;
        FocusField = "confirmButton";
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

    OUT index
    {
        SType = "Hidden";
    }

    IN MIR-APP-FORM-TYP-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "AFTT";
        SType = "Text";
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

    IN MIR-SPND-POL-REASN-CD
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "STOPR";
        SType = "Text";
        Label = "Suspend Reason";
    }

    IN MIR-SPND-POL-REDT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Policy redating allowed";
    }

    IN MIR-SPND-POL-UWG-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Underwriting required";
    }

    IN MIR-UW-USER-1-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "1st Underwriter Initials";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

}

