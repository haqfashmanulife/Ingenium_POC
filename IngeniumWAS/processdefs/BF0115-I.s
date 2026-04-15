# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:15 PM EDT

#*******************************************************************************
#*  Component:   BF0115-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0115-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Nextdate";
        Type = "Input";
        FocusField = "MIR-FND-ID";
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

    INOUT MIR-FND-ID
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        SType = "Selection";
        Label = "Fund";
    }

    INOUT MIR-FND-NXT-VALN-DT
    {
        Key;
        Mandatory;
        Length = "10";
        SType = "Date";
        Label = "Next Fund Valuation Date";
    }

    INOUT MIR-FNDVL-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Fund Valuation Date";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "process code";
    }

    OUT MIR-DV-PRCES-OVRID-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Override Indicator";
    }

}

