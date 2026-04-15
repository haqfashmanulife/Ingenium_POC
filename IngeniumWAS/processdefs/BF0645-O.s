# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:27 PM EDT

#*******************************************************************************
#*  Component:   BF0645-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0645-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Mcvadj";
        Type = "Output";
        DelEmptyRows;
        FocusField = "confirmButton";
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

    IN MIR-CF-MCV-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "MCV Interest to Next Cash Flow Amount";
    }

    IN MIR-CF-MCV-TRXN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "MCV Net Amount";
    }

    IN MIR-MCV-ACUM-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "MCV Accumulated Interest Amount";
    }

    IN MIR-MCV-GUAR-INT-PCT
    {
        DisplayOnly;
        Signed;
        Length = "7";
        Decimals = "5";
        SType = "Percent";
        Label = "MCV Guaranteed Interest Rate";
    }

    IN MIR-CF-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Sequence Number";
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

    IN MIR-DV-CF-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
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

    IN MIR-SUPRES-CNFRM-IND
    {
        Key;
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Suppress Confirm";
    }

    IN MIR-ACUM-INT-LTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Accumulated Cash Flow Interest Paid Amount";
    }

    IN MIR-CF-CLI-TRXN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Cash Flow Amount";
    }

    IN MIR-CF-MCV-FND-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "MCV Current Fund Amount";
    }

    IN MIR-CF-MCV-INT-LTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Accumulated MCV Interest Amount";
    }

    IN MIR-CF-REASN-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CF-REASN-CD";
        SType = "Text";
        Label = "Transaction Reason";
    }

    IN MIR-CF-STAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CF-STAT-CD";
        SType = "Text";
        Label = "Cash Flow Status";
    }

    IN MIR-CF-TRXN-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CF-TRXN-CD";
        SType = "Text";
        Label = "Transaction Type";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

}

