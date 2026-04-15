# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:46 PM EDT

#*******************************************************************************
#*  Component:   BF1601-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1601-O
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

    IN MIR-CLI-ANN-INCM-AMT
    {
        Key;
        DisplayOnly;
        Length = "13";
        Decimals = "0";
        SType = "Currency";
        Label = "Annual Income";
    }

    IN MIR-CLI-INSRD-AGE
    {
        Key;
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Age";
    }

    IN MIR-OCCP-CLAS-CD
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "OCCCL";
        SType = "Text";
        Label = "Occupation Class";
    }

}

