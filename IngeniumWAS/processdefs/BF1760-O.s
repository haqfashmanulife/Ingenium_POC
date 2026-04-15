# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:50 PM EDT

#*******************************************************************************
#*  Component:   BF1760-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  UY3060   CTS     Added 2 new fields                                        *
#*******************************************************************************

S-STEP BF1760-O
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

    IN MIR-BON-DIV-IDT-NUM
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Declaration Date";
    }

    IN MIR-BON-DIV-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-BON-DIV-TYP-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "BON-DIV-TYP-CD";
        SType = "Text";
        Label = "Record Type";
    }

    IN MIR-CVG-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-BON-DIV-PUA-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Bonus Paid Up Additions Face Amount";
    }

    IN MIR-BON-DIV-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "BON-DIV-STAT-CD";
        SType = "Text";
        Label = "Status";
    }

    IN MIR-BON-DIV-TRXN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Cash Amount";
    }

    IN MIR-BON-DIV-TRXN-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "BON-DIV-TRXN-CD";
        SType = "Text";
        Label = "Sub Type";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-EFF-IDT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Bonus / Dividend Effective Date";
    }
#UY3060 Changes Starts   
    IN MIR-BON-DIV-ACUM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Accumulated Dividend Amount";
    }
    
    IN MIR-BON-DIV-ACUM-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Accumulated Interest Amount";
    }
#UY3060 Changes ENDS
}

