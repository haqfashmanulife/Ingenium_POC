# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:15 PM EDT

#*******************************************************************************
#*  Component:   BF0115-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016347  602J     Fix focus on override page                                *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0115-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Nextdate";
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;


    #	Add ability to change the focus frame

    IN FocusFrame;

    IN FocusField;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    IN MIR-FND-ID
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        SType = "Text";
        Label = "Fund";
    }

    IN MIR-FND-NXT-VALN-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Next Fund Valuation Date";
    }

    IN MIR-FNDVL-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Fund Valuation Date";
    }

    IN MIR-DV-PRCES-OVRID-IND
    {
        Length = "1";
        SType = "Hidden";
        Label = "Override Indicator";
    }

    IN MIR-FND-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "FND-TYP-CD";
        SType = "Text";
        Label = "Fund Type";
    }

}

