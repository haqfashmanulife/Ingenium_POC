# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:38 PM EDT

#*******************************************************************************
#*  Component:   BF1310-O.s                                                    *
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

S-STEP BF1310-O
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

    IN MIR-CLI-ID-ASIGN-IND
    {
        DisplayOnly;
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

    IN MIR-MAX-CLI-ID-TRY-NUM
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Maximum Client Number Attempts";
    }

    IN MIR-MAX-CLI-ON-CVG-QTY
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Maximum Clients/Coverage";
    }

    IN MIR-MAX-CLI-ON-POL-QTY
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Maximum Non-insured Clients/Policy";
    }

    IN MIR-MAX-CLI-SRCH-QTY
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Maximum Search List Size";
    }

    IN MIR-MAX-PERS-MDRT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Maximum Personal MDRT Credits";
    }

    IN MIR-MIB-COMUN-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MIB-COMUN-TYP-CD";
        SType = "Text";
        Label = "Type of Connection to MIB";
    }

    IN MIR-PREV-UPDT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last File Update";
    }

#SESCAP
    IN MIR-SESN-XPRY-DUR 
    {
      DisplayOnly;
      Length = "3";
      SType = "Text";
      Label = "Session Expiry Period";
    }
     
}

