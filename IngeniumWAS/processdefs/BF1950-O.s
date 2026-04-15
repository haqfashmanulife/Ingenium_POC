# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:53 PM EDT

#*******************************************************************************
#*  Component:   BF1950-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1950-O
{
    ATTRIBUTES
    {
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

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    IN MIR-CO-ID
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "COMP";
        SType = "Text";
        Label = "Company";
    }

    IN MIR-CTRY-CD
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Text";
        Label = "Country";
    }

    IN MIR-CTRY-DT-FRMT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CTRY-DT-FRMT-CD";
        SType = "Text";
        Label = "Date Format";
    }

    IN MIR-CTRY-DT-SPRT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "DSEPA";
        SType = "Text";
        Label = "Date Separator";
    }

    IN MIR-CTRY-LEAD-ZERO-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Suppress leading zeros";
    }

}

