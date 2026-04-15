# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:25 PM EDT

#*******************************************************************************
#*  Component:   BF0602-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0602-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-UW-CASE-PRTY-CD";
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

    INOUT MIR-UW-CASE-PRTY-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "UWPTY";
        SType = "Selection";
        Label = "Priority";
    }

    INOUT MIR-UW-CASE-REASN-CD
    {
        Mandatory;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "UWRSN";
        SType = "Selection";
        Label = "Reason";
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

    INOUT MIR-DV-UW-CASE-FCN-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DV-UW-CASE-FCN-CD";
        SType = "Selection";
        Label = "Function Code";
    }

    INOUT MIR-DV-UW-CASE-USER-ID
    {
        Length = "8";
        SType = "Text";
        Label = "New UW's Initial";
    }

    IN MIR-USER-ID
    {
        Key;
        DisplayOnly;
        Length = "8";
        DefaultSession = "MIR-USER-ID";
        SType = "Text";
        Label = "Underwriter's Initials";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

}

