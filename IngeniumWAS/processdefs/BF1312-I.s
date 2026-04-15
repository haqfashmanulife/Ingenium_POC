# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:38 PM EDT

#*******************************************************************************
#*  Component:   BF1312-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  SESCAP  31DEC04  SESSION CAP ENHANCEMENT                                   *
#*                                                                             *
#*******************************************************************************

S-STEP BF1312-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-CLI-ID-ASIGN-IND";
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

    INOUT MIR-CLI-ID-ASIGN-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Use automatic client number assignment";
    }

    IN MIR-DV-MAX-POL-CVG-QTY
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Maximum Coverages/Policy";
    }

    INOUT MIR-MAX-CLI-ID-TRY-NUM
    {
        Mandatory;
        Length = "3";
        SType = "Text";
        Label = "Maximum Client Number Attempts";
    }

    INOUT MIR-MAX-CLI-ON-CVG-QTY
    {
        Mandatory;
        Length = "2";
        SType = "Text";
        Label = "Maximum Clients/Coverage";
    }

    INOUT MIR-MAX-CLI-ON-POL-QTY
    {
        Mandatory;
        Length = "2";
        SType = "Text";
        Label = "Maximum Non-insured Clients/Policy";
    }

    INOUT MIR-MAX-CLI-SRCH-QTY
    {
        Mandatory;
        Length = "2";
        SType = "Text";
        Label = "Maximum Search List Size";
    }

    INOUT MIR-MAX-PERS-MDRT-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Maximum Personal MDRT Credits";
    }

    INOUT MIR-MIB-COMUN-TYP-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MIB-COMUN-TYP-CD";
        SType = "Selection";
        Label = "Type of Connection to MIB";
    }

#SESCAP
    INOUT MIR-SESN-XPRY-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Session Expiry Period";
    }
}

