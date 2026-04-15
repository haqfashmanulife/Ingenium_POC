# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:00 PM EDT

#*******************************************************************************
#*  Component:   BF6970-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01AD25  BMB      Change MIR-CVG-NUM to control display of more than 20 cvgs*
#*                   Focusfield is the more button...                          *
#*                                                                             *
#*******************************************************************************

S-STEP BF6970-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Uldtl";
        Type = "Output";
        DelEmptyRows;
        FocusField = "moreButton";
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

#01AD25 - Allow changes to the coverage number
    INOUT MIR-CVG-NUM
    {
        Length = "2";
        DBTableName = "TCVG";
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

    IN MIR-CVG-COMM-TRG-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        Decimals = "0";
        SType = "Currency";
        Label = "Total Commission Targets";
    }

    IN MIR-CVG-COMM-TRG-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Total Commission Targets";
        Index = "1";
    }

    IN MIR-CVGD-DUR-T[20]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Duration";
        Index = "1";
    }

    IN MIR-CVGD-PMT-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Cumulative Payments for Duration";
        Index = "1";
    }

    IN MIR-CVGD-PMT-LOAD-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Cumulative Front-end Load";
        Index = "1";
    }

    IN MIR-CVG-GUAR-INT-PCT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "9";
        Decimals = "6";
        FieldGroup = "Table20";
        SType = "Percent";
        Label = "Interest Guaranteed Period - Interest Rate";
        Index = "1";
    }

    IN MIR-CVG-NUM-T[20]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-CVG-PMT-LTD-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "19";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Cumulative Payments Life to Date";
        Index = "1";
    }

    IN MIR-CVG-SURR-LTD-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "19";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Surrender Charges Life to Date";
        Index = "1";
    }

    IN MIR-CVG-SURR-TRG-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        Decimals = "0";
        SType = "Currency";
        Label = "Total Surrender Charge Targets";
    }

    IN MIR-CVG-SURR-TRG-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Total Surrender Charge Targets";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-UL-NLAPS-END-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "No Lapse Guaranteed End Date";
    }

    IN MIR-GUAR-IMPRD-INT-PCT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "7";
        Decimals = "6";
        FieldGroup = "Table20";
        SType = "Percent";
        Label = "Interest Guaranteed Period - Impaired Interest Rate";
        Index = "1";
    }

    IN MIR-GUAR-INT-END-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Interest Guarantee Period - End Date";
        Index = "1";
    }

    IN MIR-MNPMT-TRG-LTD-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        Decimals = "0";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Minimum Payment Target Amount";
        Index = "1";
    }

    IN MIR-PMT-LOAD-LTD-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Payment Loads Life to Date";
        Index = "1";
    }

    IN MIR-PMT-LOAD-TRG-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        Decimals = "0";
        SType = "Currency";
        Label = "Total Payment Load Targets";
    }

    IN MIR-PMT-LOAD-TRG-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Total Payment Load Targets";
        Index = "1";
    }

    IN MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
    }

    IN MIR-POL-CVG-REC-CTR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Coverages";
    }

    IN MIR-POL-DB-OPT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DB-OPT-CD";
        SType = "Text";
        Label = "Death Benefit Option";
    }

    IN MIR-POL-MNPMT-TRG-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        Decimals = "0";
        SType = "Currency";
        Label = "Total Minimum Payment Targets";
    }

    IN MIR-POL-UL-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Monthiversary Paid to Date";
    }

    IN MIR-POL-UL-SHRT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Shortage Amount";
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

    IN MIR-SURR-LOAD-LTD-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Cumulative Surrender Life to Date";
        Index = "1";
    }

    IN MIR-UL-LAPS-NOTI-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Reactivate Policy Amount";
    }

    IN MIR-UL-LAPS-STRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Lapse Start Date";
    }

}

