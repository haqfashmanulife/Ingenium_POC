# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:45 PM EDT

#*******************************************************************************
#*  Component:   BF1540-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1540-O
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

    IN MIR-LAB-ID
    {
        Key;
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LABCD";
        SType = "Text";
        Label = "Laboratory";
    }

    IN MIR-LTST-ID
    {
        Key;
        DisplayOnly;
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "TSTNO";
        SType = "Text";
        Label = "Lab Test Number";
    }

    IN MIR-LTST-STD-AGE-QTY
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Highest Age for Test";
    }

    IN MIR-LTST-STD-SEX-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "LTST-STD-SEX-CD";
        SType = "Text";
        Label = "Sex";
    }

    IN MIR-ALPHA-RESP-ETBL-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "EDIT";
        SType = "Text";
        Label = "Alpha Result Edit Pointer";
    }

    IN MIR-CO-MAX-NRNG-QTY
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Company Maximum Range";
    }

    IN MIR-CO-MIN-NRNG-QTY
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Company Minimum Range";
    }

    IN MIR-LAB-MAX-NRNG-QTY
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Lab Maximum Range";
    }

    IN MIR-LAB-MIN-NRNG-QTY
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Lab Minimum Range";
    }

    IN MIR-RSLT-PRECSN-QTY
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Test Precision";
    }

    IN MIR-UNIT-MESUR-TXT
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Unit of Measure";
    }

}

