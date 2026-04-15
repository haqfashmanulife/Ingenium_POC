# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:57 PM EDT

#*******************************************************************************
#*  Component:   BF2341-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2341-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-CPEVNT-POL-CLI-ID";
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

    INOUT MIR-CVG-NUM
    {
        Length = "2";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-EVNT-ACT-CD
    {
        Mandatory;
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "DACTN";
        SType = "Selection";
        Label = "Action";
    }

    INOUT MIR-CPEVNT-POL-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client ID";
    }

    INOUT MIR-CPEVNT-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-CPEVNT-TRXN-DT
    {
        Key;
        Length = "10";
        DefaultSession = "LSIR-SYS-DT-EXT";
        SType = "Date";
        Label = "Record Date";
    }

    INOUT MIR-CPEVNT-TRXN-TIME
    {
        Key;
        Length = "6";
        DefaultSession = "LSIR-SYS-TIME";
        SType = "Time";
        Label = "Record Time";
    }

    INOUT MIR-EVNT-ACTV-CD
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DACTV";
        SType = "Selection";
        Label = "Activity";
    }

}

