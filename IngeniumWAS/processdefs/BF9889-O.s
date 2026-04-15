# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:13 PM EDT

#*******************************************************************************
#*  Component:   BF9889-o.S                                                    *
#*  Description: Protected Claim Details Update                                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL104B HIN/IH   Initial version                                           *
#*  RP2CLA   CTS   CHANGES FOR CANCER LUMPSUM AUTOMATION                       *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *
#*******************************************************************************

S-STEP BF9889-O
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
        SType="Hidden";
    }

    IN MIR-CLM-ID
    {
        Key;
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table1";
        DefaultSession = "MIR-CLM-ID";
        SType = "Text";
        Label = "Master Claim ID";
    }

    IN MIR-POL-ID
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-CVG-NUM
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-PLAN-ID
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table1";
        Index = "1";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Rider Name";
    }

    IN MIR-BNFT-NM-ID
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table1";
        KeyColumn;
        Index = "1";
        CodeSource = "EDIT";
        CodeType = "BENNM";
        SType = "Text";
        Label = "Benefit Name";
    }

    IN MIR-CVG-FACE-AMT
    {
        DisplayOnly;
        Signed;
        Length = "16";
        FieldGroup = "Table1";
        SType = "Currency";
        Label = "Face Amount";
    }

    IN MIR-BNFT-PAYBL-AMT
    {
        DisplayOnly;
        Signed;
        Length = "16";
        FieldGroup = "Table1";
        SType = "Currency";
        Label = "Payable Amount";
    }

    IN MIR-DV-INS-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Insured Name";
    }

    IN MIR-CLMA-CLM-STAT-CD
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "CLMA-CLM-STAT-CD";
        SType = "Text";
        Label = "Master Claim Status";
    }

    IN MIR-CLMA-INSRD-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Insured Client ID";
    }

    IN MIR-CLI-BTH-DT
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table1";
        SType = "Date";
        Label = "Birth Date";
    }

    IN MIR-CLI-SEX-CD
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
    }

    IN MIR-INS-MORAL-RISK-IND
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table1";
        SType = "Indicator";
        Label = "Insured Moral Risk";
    }

    IN MIR-CLAIM-NOTE-IND
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table1";
        SType = "Indicator";
        Label = "Claim Note";
    }

    IN MIR-LIFE-INS-CLM-IND
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table1";
        SType = "Indicator";
        Label = "Life Insurance Claim In Progress";
    }

    IN MIR-SERV-BR-ID
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Text";
        Label = "Servicing Branch";
    }

    IN MIR-BNFT-STAT-CD
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "CLBN-BNFT-STAT-CD";
        SType = "Text";
        Label = "Benefit Claim Status";
    }

    IN MIR-CLMA-ASSOC-CLM-ID
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Associated Master Claim";
    }

    IN MIR-CLMA-HIST-CLM-IND
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table1";
        SType = "Indicator";
        Label = "Historical Claim";
    }
#UYSDMC CHANGES STARTS HERE
    IN MIR-CLMA-USYS-CLM-IND
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table1";
        SType = "Indicator";
        Label = "Unisys Claim";
    }
#UYSDMC CHANGES ENDS HERE
    IN MIR-CLBN-KEY
    {
        DisplayOnly;
        Length = "27";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "CLBN Record Key";
    }

    IN MIR-BNFT-PMT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "BENS-PMT-TYP-CD";
        SType = "Text";
        Label = "Unit Category";
    }

    IN MIR-BNFT-PAYBL-UNIT-QTY
    {
        DisplayOnly;
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table2";
        SType = "Number";
        Label = "Payable Units";
    }

    IN MIR-BNFT-MULTR-FCT
    {
#*RP2CLA-Changed Decimals ="1"    
        DisplayOnly;
        Length = "6";
        Decimals = "1";
        FieldGroup = "Table2";
        SType = "Number";
        Label = "Multiplier";
    }

    IN MIR-SUMM-AGG-NUM-T[50]
    {
        DisplayOnly;
        Length = "4";
        Decimals = "0";
        FieldGroup = "Table3";
        Index = "1";
        SType = "Number";
        Label = "Agg. No.";
    }

    IN MIR-TOT-BEFORE-AGG-QTY-T[50]
    {
#*RP2CLA-Changed Decimals ="1"    
        DisplayOnly;
        Length = "6";
        Decimals = "1";
        FieldGroup = "Table3";
        Index = "1";
        SType = "Number";
        Label = "Total Before Aggregation";
    }

    IN MIR-TOT-AGG-QTY-T[50]
    {
        DisplayOnly;
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table3";
        Index = "1";
        SType = "Number";
        Label = "Aggregated Total";
    }

    IN MIR-OVERLAP-QTY-T[50]
    {
        DisplayOnly;
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table3";
        Index = "1";
        SType = "Number";
        Label = "Overlap Units";
    }

    IN MIR-BELOW-MIN-HOSP-QTY-T[50]
    {
        DisplayOnly;
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table3";
        Index = "1";
        SType = "Number";
        Label = "Below Min. Hospital";
    }

    IN MIR-OTHR-EXCL-QTY-T[50]
    {
        DisplayOnly;
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table3";
        Index = "1";
        SType = "Number";
        Label = "Other Excluded Units";
    }

    IN MIR-EXCL-INIT-DED-QTY-T[50]
    {
        DisplayOnly;
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table3";
        Index = "1";
        SType = "Number";
        Label = "Initial Deductible Units";
    }

    IN MIR-EXCL-XCES-QTY-T[50]
    {
        DisplayOnly;
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table3";
        Index = "1";
        SType = "Number";
        Label = "Excess Units";
    }

    IN MIR-INELIG-XCES-QTY-T[50]
    {
        DisplayOnly;
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table3";
        Index = "1";
        SType = "Number";
        Label = "Excess Units";
    }

    IN MIR-ALREADY-PD-QTY-T[50]
    {
#*RP2CLA-Changed Decimals ="1"    
        DisplayOnly;
        Length = "6";
        Decimals = "1";
        FieldGroup = "Table3";
        Index = "1";
        SType = "Number";
        Label = "Already Paid";
    }

    IN MIR-MULTR-TO-PAY-QTY-T[50]
    {
#*RP2CLA-Changed  Decimals ="1"    
        DisplayOnly;
        Length = "6";
        Decimals = "1";
        FieldGroup = "Table3";
        Index = "1";
        SType = "Number";
        Label = "Multiplier To Be Paid";
    }

    IN MIR-SUMM-PAYBL-AMT-T[50]
    {
        DisplayOnly;
        Signed;
        Length = "16";
        FieldGroup = "Table3";
        Index = "1";
        SType = "Currency";
        Label = "Payable Amount";
    }

    IN MIR-PD-CLM-END-DT-T[50]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table3";
        Index = "1";
        SType = "Date";
        Label = "Paid Claim End Date";
    }

    IN MIR-DTL-BCD-MAX-INDX
    {
        DisplayOnly;
        Length = "03";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Num Benefit Rcds";
    }

    IN MIR-DTL-BCD-KEY-T[100]
    {
        DisplayOnly;
        Length = "27";
        FieldGroup = "Table4";
        Index = "1";
        SType = "Text";
        Label = "CLBD Record Key";
    }

    IN MIR-DTL-STRT-DT-T[100]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table4";
        Index = "1";
        SType = "Date";
        Label = "Start Date";
    }

    IN MIR-DTL-END-DT-T[100]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table4";
        Index = "1";
        SType = "Date";
        Label = "End Date";
    }

    IN MIR-DTL-END-STAT-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table4";
        Index = "1";
        CodeSource = "DataModel";
        CodeType = "CLEV-HOSP-STAT-CD";
        SType = "Text";
        Label = "End Date Status";
    }

    IN MIR-DTL-AGG-NUM-T[100]
    {
        DisplayOnly;
        Length = "4";
        Decimals = "0";
        FieldGroup = "Table4";
        Index = "1";
        SType = "Number";
        Label = "Agg. No.";
    }

    IN MIR-DTL-SEQ-NUM-T[100]
    {
        DisplayOnly;
        Length = "4";
        Decimals = "0";
        FieldGroup = "Table4";
        Index = "1";
        SType = "Number";
        Label = "No.";
    }

    IN MIR-DTL-HOSP-DAYS-QTY-T[100]
    {
        DisplayOnly;
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table4";
        Index = "1";
        SType = "Number";
        Label = "Hosp Days";
    }

    IN MIR-DTL-DAYS-SINCE-QTY-T[100]
    {
        DisplayOnly;
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table4";
        Index = "1";
        SType = "Number";
        Label = "Days Since Disch. Or Acc";
    }

    IN MIR-DTL-EXCL-QTY-T[100]
    {
        DisplayOnly;
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table4";
        Index = "1";
        SType = "Number";
        Label = "Excluded Units";
    }

    IN MIR-DTL-REASN-CD-T[100]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table4";
        Index = "1";
        CodeSource = "EDIT";
        CodeType = "CLBRN";
        SType = "Text";
        Label = "Reason";
    }

    IN MIR-DTL-PAYBL-QTY-T[100]
    {
        DisplayOnly;
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table4";
        Index = "1";
        SType = "Number";
        Label = "Payable Units";
    }

    IN MIR-DTL-MULTR-FCT-T[100]
    {
#*RP2CLA-Changed Decimals ="1"    
        DisplayOnly;
        Length = "6";
        Decimals = "1";
        FieldGroup = "Table4";
        Index = "1";
        SType = "Number";
        Label = "Multiplier";
    }

    IN MIR-DTL-PAYBL-AMT-T[100]
    {
        DisplayOnly;
        Signed;
        Length = "16";
        FieldGroup = "Table4";
        Index = "1";
        SType = "Currency";
        Label = "Payable Amount";
    }
}
