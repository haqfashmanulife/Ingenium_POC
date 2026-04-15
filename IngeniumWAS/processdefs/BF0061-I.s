# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:13 PM EDT

#*******************************************************************************
#*  Component:   BF0061-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016057  6.1      Corrected INOUT attributes to match only those            *
#*                   fields that are actually output from the page             *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*******************************************************************************

S-STEP BF0061-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Connect";
        Type = "Input";
        FocusField = "MIR-CO-ID";
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

    INOUT MIR-CO-ID
    {
        Mandatory;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "COMP";
        SType = "Selection";
        Label = "Company";
    }

    IN MIR-DV-APPL-STAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "DV-APPL-STAT-CD";
        SType = "Text";
        Label = "Application Status";
    }

    IN MIR-USER-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "User ID";
    }

    IN MIR-USER-SESN-BTCH-NUM
    {
        DisplayOnly;
        Length = "7";
        Decimals = "0";
        SType = "Number";
        Label = "Batch Number";
    }

    INOUT MIR-USER-SESN-CRCY-CD
    {
        Mandatory;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Selection";
        Label = "Currency";
    }

    INOUT MIR-USER-SESN-CTRY-CD
    {
        Mandatory;
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Selection";
        Label = "Country";
    }

    IN MIR-USER-SESN-PRCES-DT
    {
        DisplayOnly;
        Length = "9";
        SType = "Date";
        Label = "Processing Date";
    }

    IN MIR-USER-SESN-STAT-CD
    {
        DisplayOnly;
        Length = "8";
        CodeSource = "DataModel";
        CodeType = "USER-SESN-STAT-CD";
        SType = "Text";
        Label = "User Status";
    }

    INOUT MIR-USER-PSWD-TXT
    {
        Mandatory;
        Length = "8";
        SType = "Text";
        Label = "Password";
    }

}

