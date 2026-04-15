# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:32 PM EDT

#*******************************************************************************
#*  Component:   BF0945-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  MPCR01  14DEC07  Added Delay Interest Override fields                      *
#*  MPCR18  05MAR08  Added Withholding Tax and One time Deduction fields       *
#*  ISLIMP  18JAN10  ADDED 2 NEW FIELDS AS PART OF INSURANCE LAW IPMP          *
#*  Q05003  08MAR11  MP113A - Added Annuity Fund Amount field                  *
#*  UY3049  CTS      ANNUITY PAYMENT SCREEN                                    *
#*******************************************************************************

S-STEP BF0945-O
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
        Label = "Suffix";
        Index = "1";
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

    IN MIR-POL-PAYO-NXT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Next Payout Date";
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

    IN MIR-POL-PAYO-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-TYP-CD";
        SType = "Text";
        Label = "Payout Type";
    }

    IN MIR-POL-PAYO-UNIT-QTY
    {
        DisplayOnly;
        Length = "18";
        SType = "Text";
        Label = "Total Payout Units";
    }

    IN MIR-SUPRES-CNFRM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Suppress Confirm Indicator";
    }

# MPCR01 Changes start here

    IN MIR-BPSS-DLAY-INT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Bypass Delay Interest Computation";
    }

    IN MIR-DLAY-INT-OVRID-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Delay Interest Override Amount";
    }
# MPCR01 Changes end here
# MPCR18 Changes starts here

    IN MIR-POL-PAYO-TAXWH-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Withholding Tax";
    }
    IN MIR-ONE-TIME-DED-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "One Time Deduction";
    }

# MPCR18 Changes end here

# ISLIMP - Changes start here

    IN MIR-CLM-DYS-BFR-PMT-DUE
    {
        DisplayOnly;
        Length = "03";
        CodeSource = "DataModel";
        CodeType = "DYS-BFR-PMT-DUE";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Days before Claim Payment Due";
    }

    IN MIR-DLY-INT-STRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Delay Interest Start Date";
    }

# MP113A - Q05003 Changes

    IN MIR-ANTY-FND-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        Decimals = "2";
        SType = "Number";
        Label = "Annuity Fund Amount";
    }      
#UY3049 CHANGES STARTS
    IN MIR-10-POL-ID
    {
        Length = "10";
        SType = "Hidden";
        Label = "Policy Id";
    }     
    IN MIR-STR3-PAYO-IND
    {
        Length = "1";
        SType = "Hidden";
    }
#UY3049 CHANGES ENDS
}

