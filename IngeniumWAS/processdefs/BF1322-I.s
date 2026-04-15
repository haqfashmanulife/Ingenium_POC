# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:38 PM EDT

#*******************************************************************************
#*  Component:   BF1322-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  P01844  BP       Increase size of MIR-CLI-CNTCT-SUB-CD                     *
#*                                                                             *
#*******************************************************************************

S-STEP BF1322-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-CLI-CNTCT-TYP-CD";
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

    INOUT MIR-CLI-CNTCT-RETEN-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-CNTCT-RETEN-CD";
        SType = "Selection";
        Label = "Retention Period";
    }

    INOUT MIR-CLI-CNTCT-SUB-CD
    {
        Length = "6";
        SType = "Text";
        Label = "Activity Type";
    }

    INOUT MIR-CLI-CNTCT-TYP-CD
    {
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "CHACT";
        SType = "Selection";
        Label = "Activity";
    }

    INOUT MIR-FOLWUP-ACT-CD
    {
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "CHFUA";
        SType = "Selection";
        Label = "Action";
    }

    INOUT MIR-FOLWUP-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Date";
    }

    INOUT MIR-FOLWUP-NOTE-TXT
    {
        Length = "150";
        SType = "Text";
        Label = "Comments";
    }

    INOUT MIR-FOLWUP-USER-ID
    {
        Length = "8";
        SType = "Text";
        Label = "User ID";
    }

    INOUT MIR-POL-ID-BASE
    {
        Length = "9";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-USER-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "User ID";
    }

    IN MIR-CLI-CNTCT-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Date";
    }

    IN MIR-CLI-CNTCT-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Sequence Number";
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

}

