# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:22 PM EDT


#*******************************************************************************
#*  Component:   BF0422-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016227  602J     Code Cleanup                                              *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  ------  PF22     CodeType = "dummy" for XSOM4914 removed for PathFinder Rel*
#*******************************************************************************

S-STEP BF0422-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-DV-QSTN-RESP-TXT-001";
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

    IN QuestionText
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Question Text";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-001
    {
        DisplayOnly;
        Length = "20";
        SType = "Text";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-002
    {
        DisplayOnly;
        Length = "20";
        SType = "Text";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-003
    {
        DisplayOnly;
        Length = "20";
        SType = "Text";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-004
    {
        DisplayOnly;
        Length = "20";
        SType = "Text";
        Label = "Response to Variable Questions";
    }

    IN MIR-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
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

    IN MIR-FLD-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        CodeSource = "XSOM4914";
        Label = "Base Question Field Name";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

    IN MIR-LOC-GR-ID
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Text";
        Label = "Location Group";
    }

    IN MIR-APP-FORM-TYP-ID
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "AFTT";
        SType = "Text";
        Label = "Application Form Type";
    }

}

