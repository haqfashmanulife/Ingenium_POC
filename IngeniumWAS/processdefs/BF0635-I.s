# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:26 PM EDT

#*******************************************************************************
#*  Component:   BF0635-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  P00264  GW       added Report Date                                         *
#*  U11151  CLB      Make correction to definition of MIR-DV-CF-REP-DT (JrnlDt)*
#*                                                                             *
#*******************************************************************************

S-STEP BF0635-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Srrevrs";
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

    INOUT MIR-SUPRES-CNFRM-IND
    {
        Key;
        Length = "1";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

    INOUT MIR-CF-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-DV-CF-CLI-TRXN-AMT
    {
        Key;
        Mandatory;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Reversal Amount";
    }

    INOUT MIR-DV-CF-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Cashflow Effective Date";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "process code";
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

    INOUT MIR-DV-CF-REP-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
         Label = "Journal Date";
    #    Label = "Report Date";
    }

}

