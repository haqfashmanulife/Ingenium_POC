# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:04 PM EDT

#*******************************************************************************
#*  Component:   BF8070-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF8070-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
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

    IN MIR-DV-ENTR-BUS-FCN-ID
    {
        Key;
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Business Function";
    }

    IN MIR-BUS-FCN-AUD-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Audit Indicator";
    }

    IN MIR-BUS-FCN-CONN-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Connection Indicator";
    }

    IN MIR-BUS-FCN-PDRVR-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Process Driver";
    }

}

