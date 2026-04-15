# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:32 PM EDT

#*******************************************************************************
#*  Component:   BF0942-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  IPMPPA  CTS      Added MIR-TOT-MODE-PAYO-QTY and MIR-PAYO-ACUM-AMT         *
#*                                                                             *
#*******************************************************************************

S-STEP BF0942-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
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

    IN MIR-CDI-ALLOC-AMT-T[139]
    {
        DisplayOnly;
        Length = "17";
        FieldGroup = "Table139";
        SType = "Text";
        Label = "Amount / Percent / No. of Units";
        Index = "1";
    }

    IN MIR-CDI-ALLOC-CD-T[139]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table139";
        CodeSource = "DataModel";
        CodeType = "CDI-ALLOC-CD";
        SType = "Text";
        Label = "Allocation Basis";
        Index = "1";
    }

    IN MIR-CDI-PAYO-MTHD-CD-T[139]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table139";
        CodeSource = "DataModel";
        CodeType = "CDI-PAYO-MTHD-CD";
        SType = "Text";
        Label = "Payout Method";
        Index = "1";
    }

    IN MIR-CVG-NUM
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-DEST-CVG-NUM-T[139]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table139";
        SType = "Text";
        Label = "Destination Coverage Number";
        Index = "1";
    }

    IN MIR-DEST-FND-ID-T[139]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table139";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        SType = "Text";
        Label = "Fund Receiving Money";
        Index = "1";
    }

    IN MIR-DEST-POL-ID-BASE-T[139]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table139";
        SType = "Text";
        Label = "Policy Id Receiving Money";
        Index = "1";
    }

    IN MIR-DEST-POL-ID-SFX-T[139]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table139";
        SType = "Text";
        Label = "Suffix Receiving Money";
        Index = "1";
    }

    IN MIR-FND-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        SType = "Text";
        Label = "Fund";
    }

    IN MIR-PAYO-LEAD-TIME-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Lead Time";
    }

    IN MIR-POL-PAYO-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Total Payout Amount";
    }

    IN MIR-POL-PAYO-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Efffective Date";
    }

    IN MIR-POL-PAYO-END-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "End Date";
    }

    IN MIR-POL-PAYO-MODE-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-MODE-CD";
        SType = "Text";
        Label = "Payout Mode";
    }

    IN MIR-POL-PAYO-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-STAT-CD";
        SType = "Text";
        Label = "Status";
    }

    IN MIR-POL-PAYO-TAXWH-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Bypass Tax Withholding Calculations";
    }

    IN MIR-POL-PAYO-UNIT-QTY
    {
        DisplayOnly;
        Length = "18";
        SType = "Text";
        Label = "Total Payout Units";
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
        DefaultConstant = "00000";
        SType = "Text";
        Label = "Payout Number";
    }

    IN MIR-CDA-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Payment Date";
    }

    IN MIR-DV-FND-DESC-TXT
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Fund Description";
    }

    IN MIR-DV-FND-DESC-TXT-T[139]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table139";
        SType = "Text";
        Label = "Fund Description";
        Index = "1";
    }

    IN MIR-POL-PAYO-NXT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Next Payout Date";
    }

    IN MIR-POL-PAYO-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-TYP-CD";
        SType = "Text";
        Label = "Payout Type";
    }

    #Added for IPMPPA. Changes starts here
    IN MIR-TOT-MODE-PAYO-QTY
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Total number of Modal Payouts";
    }    
    
    IN MIR-PAYO_ACUM_AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Accumulated Amount of payouts";
    }
    # IPMPPA changes ends here
}

