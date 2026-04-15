# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:34 PM EDT

#*******************************************************************************
#*  Component:   BF1130-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1130-O
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

    IN MIR-CDA-EFF-IDT-NUM
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Withdrawal Effective Date";
    }

    IN MIR-CDA-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Withdrawal Sequence Number";
    }

    IN MIR-DPOS-CDA-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-DPOS-EFF-IDT-NUM
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Deposit Effective Date";
    }

    IN MIR-DPOS-POL-PAYO-NUM
    {
        Key;
        DisplayOnly;
        Length = "5";
        DefaultConstant = "99999";
        SType = "Text";
        Label = "Payout Number";
    }

    IN MIR-DWCHRG-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sub-Sequence";
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

    IN MIR-POL-PAYO-NUM
    {
        Key;
        DisplayOnly;
        Length = "5";
        DefaultConstant = "99999";
        SType = "Text";
        Label = "Withdrawal Payout Number";
    }

    IN MIR-DPOS-OVRID-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Override Payment Effective Date";
    }

    IN MIR-DV-DWCHRG-PCT
    {
        DisplayOnly;
        Length = "7";
        Decimals = "4";
        SType = "Percent";
        Label = "Surrender Charge Percent";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DWCHRG-AVAIL-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Amount Available for Withdrawal";
    }

    IN MIR-DWCHRG-CHRG-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Calculated Surrender Charge";
    }

    IN MIR-DWCHRG-FREE-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Free Amount Applied";
    }

    IN MIR-DWCHRG-WTHDR-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Total Withdrawal Amount";
    }

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

}

