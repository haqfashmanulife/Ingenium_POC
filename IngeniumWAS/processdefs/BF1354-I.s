# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:38 PM EDT

#*******************************************************************************
#*  Component:   BF1354-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  MFCR97 05DEC05 KNM  ADD MIR-SA-XFER-EFF-DT FOR BACKDATED POLICY            *
#*  FEID11 28MAY08 CTS  ADDED A NEW INDICATOR FOR ISSUE REVERSAL CHANGES       *
#*******************************************************************************
S-STEP BF1354-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Issue";
        Type = "Input";
        FocusField = "MIR-POL-ID-BASE";
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

    INOUT MIR-DV-AUTO-SETL-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-AUTO-SETL-CD";
        SType = "Selection";
        Label = "Policy Settlement";
    }

    INOUT MIR-POL-ISS-DT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-ISS-DT-TYP-CD";
        SType = "Selection";
        Label = "Policy Issue Date Type";
    }

    INOUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Policy Issue Date";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-DV-SA-XFER-EFF-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Initial SA Effective Date";
    }
#CHANGES STARTS FOR FEID11-ISSUE REVERSAL
    INOUT  MIR-DV-SUPRES-PCERT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Suppress Policy Certificate";
    }
#CHANGES ENDS FOR FEID11-ISSUE REVERSAL
}




