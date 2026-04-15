# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:45 PM EDT

#*******************************************************************************
#*  Component:   BF1542-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1542-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-ALPHA-RESP-ETBL-ID";
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

    INOUT MIR-ALPHA-RESP-ETBL-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "EDIT";
        SType = "Selection";
        Label = "Alpha Result Edit Pointer";
    }

    INOUT MIR-CO-MAX-NRNG-QTY
    {
        Length = "8";
        SType = "Text";
        Label = "Company Maximum Range";
    }

    INOUT MIR-CO-MIN-NRNG-QTY
    {
        Length = "8";
        SType = "Text";
        Label = "Company Minimum Range";
    }

    INOUT MIR-LAB-MAX-NRNG-QTY
    {
        Length = "8";
        SType = "Text";
        Label = "Lab Maximum Range";
    }

    INOUT MIR-LAB-MIN-NRNG-QTY
    {
        Length = "8";
        SType = "Text";
        Label = "Lab Minimum Range";
    }

    INOUT MIR-RSLT-PRECSN-QTY
    {
        Mandatory;
        Length = "1";
        SType = "Text";
        Label = "Test Precision";
    }

    INOUT MIR-UNIT-MESUR-TXT
    {
        Length = "5";
        SType = "Text";
        Label = "Unit of Measure";
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

}

