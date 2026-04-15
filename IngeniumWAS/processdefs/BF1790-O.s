# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:51 PM EDT

#*******************************************************************************
#*  Component:   BF1790-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1790-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Reversal";
        Type = "Output";
        DelEmptyRows;
        FocusField = "nextButton";
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

    IN MIR-CIA-REVRS-REASN-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CIA-REVRS-REASN-CD";
        SType = "Text";
        Label = "Reversal Reason";
    }

    IN MIR-CIA-TYP-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CIA-TYP-CD";
        DefaultConstant = "DEP";
        SType = "Text";
        Label = "Activity Type";
    }

    IN MIR-SUPRES-CNFRM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

    IN MIR-CIA-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Effective Date";
    }

    IN MIR-CIA-SEQ-NUM
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

    IN MIR-CIA-EFF-DT-2
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Activity Effective Date";
    }

    IN MIR-CIA-FND-TRXN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Net Amount";
    }

    IN MIR-CIA-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Transaction Date";
    }

    IN MIR-CIA-REASN-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CIA-REASN-CD";
        SType = "Text";
        Label = "Surrender Reason";
    }

    IN MIR-CIA-REVRS-PRCES-DT
    {
        DisplayOnly;
        Length = "9";
        SType = "Date";
        Label = "Effective Date of Reversal";
    }

    IN MIR-CIA-REVRS-REASN-CD-2
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CIA-REVRS-REASN-CD";
        SType = "Text";
        Label = "Reversal Reason";
    }

    IN MIR-CIA-TYP-CD-2
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CIA-TYP-CD";
        SType = "Text";
        Label = "Activity Type";
    }

}

