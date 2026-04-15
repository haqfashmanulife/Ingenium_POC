#*******************************************************************************
#*  Component:   BF9H45-O.s                                                    *
#*  Description: UNISYS STREAM 3 JIKOU SETTLEMENT SCREEN DESIGN                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYDM28  CTS      UNISYS JIKOU SETTLEMENT SCREEN CHANGES                    *
#*  S50400  CTS      NEW FIELD ADDITION                                        *
#*******************************************************************************

S-STEP BF9H45-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Output";
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

    IN MIR-POL-ID
    {
        Key;
        Mandatory;
        Length = "7";
        SType = "Text";
        Label = "Policy Id";
    }
    IN MIR-CVG-NUM
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Coverage Number";
    }
    IN MIR-LARG-TYP
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Large Product Code";
    }
    IN MIR-SMAL-TYP
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Small Product Code";
    }
    IN MIR-CVG-SML-PROD-TYP-CD
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rider Small Product Code";
    }
    IN MIR-POL-ISSU-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Issue Date";
    }
    IN MIR-CVG-MAT-XPRY-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Coverage Maturity Date / Expiry Date";
    }
    IN MIR-CALC-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Effective Date(Calculation Date)";
    }
    IN MIR-CSV-ELPS-DUR
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Elapsed YM(for calculation)";
    }
    IN MIR-POL-CSV-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Total CSV";
    }
    IN MIR-BASE-CVG-CSV-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "CSV for Base";
    }
    IN MIR-CVG-CSV-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "CSV for rider level";
    }
    IN MIR-LOAN-BAL-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Loan Balances";
    }
    IN MIR-LOAN-INT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Loan unpaid interest";
    }
    IN MIR-LOAN-SHRT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Loan Short Interest";
    }
    IN MIR-UNPAID-PREM-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Unpaid premium";
    }
    IN MIR-SHRT-PREM-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Deficient premium";
    }
    IN MIR-APL-BAL-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "APL";
    }
    IN MIR-APL-INT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "APL Interest";
    }
    IN MIR-TAXWH-FED-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Withholding tax, Government";
    }
    IN MIR-TAXWH-LOC-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Withholding tax, Local";
    }
    IN MIR-SAV-CVG-DEFR-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Deferral insurance claim received";
    }
    IN MIR-TOT-INCM-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Total income";
    }
    IN MIR-LOAN-UNEARN-INT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Loan unearned interest";
    }
    IN MIR-LOAN-XCES-INT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Loan excess interest";
    }
    IN MIR-UNEARN-PREM-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Unearned Premium";
    }
    IN MIR-XCES-PREM-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Excess premium";
    }
    IN MIR-EDUC-CNGRT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Educational Congratulatory";
    }
    IN MIR-HLTH-CNGRT-INT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Health Congratulatory A and B and Interest";
    }
    IN MIR-SURV-BEN-DEFR-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Survival Benefit Deferred amount and interest";
    }
    IN MIR-SPCL-DIV-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Special dividend defer and interest";
    }
    IN MIR-DEP-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Deposit and interest";
    }
    IN MIR-NEW-CNVR-BAL-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "New Conversion Balance";
    }
    IN MIR-CVG-PMT-DEP-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Amount and interest_ Applicable rider payment deposit";
    }
    IN MIR-DEFR-BNFT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Deferred Benefit and interest";
    }
    IN MIR-SAV-CVG-BNFT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Savings Rider Benefit Amount";
    }
    IN MIR-SAV-CVG-ADD-BNFT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Savings Rider Additional Benefit Amount";
    }
    IN MIR-TOT-XPNS-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Total Expenses";
    }
    IN MIR-REMIT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Difference between income and expenditure amount (_ is remittance amount)";
    }
    IN MIR-SURR-REMIT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Surrender Remittance Amount as on the particular cut_off date";
    }
    IN MIR-CUSTOD-DIV-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Accumulated Dividend on depoist(Accumulated Interest)";
    }
    IN MIR-CNVR-ADJ-DIV-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Conversion adjustment dividend";
    }
    IN MIR-VEST-CSV-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Vesting CSV";
    }
    IN MIR-NEW-CNVR-CSV-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "New Conversion Balance CSV";
    }
    IN MIR-WL-PREM-PUA-CSV-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Whole life premium paid_up addition CSV";
    }
    IN MIR-ENDOW-PUA-CSV-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Pure endowment paid_up addition CSV";
    }
    IN MIR-JV-CNGRT-DEFR-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Juvenile Congratulatory Deferred Amount";
    }
    IN MIR-JV-CNGRT-DEFR-INT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Juvenile Congratulatory Deferred interest";
    }
    IN MIR-INCR-ENDOW-DEFR-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Increase pure endowment premium defer and interest";
    }
    IN MIR-CVG-PMT-XPRY-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Coverage Payment expiration date";
    }
    IN MIR-POL-GRS-APREM-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Gross Annual Premium";
    }
    IN MIR-TOT-POL-PREM-PD-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Total Premium Paid at policy level";
    }
    IN MIR-LOAN-INT-VALID-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Loan Interest Valid Date";
    }
    IN MIR-ENDOW-PUA-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Pure endowment paid-up addition ";
    }
    IN MIR-WL-PREM-PUA-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Whole life premium paid-up addition";
    }
    IN MIR-VEST-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Vesting";
    }
    IN MIR-VEST-DEFR-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Vesting Defer and interest";
    }
    IN MIR-NO-ACCDNT-BNFT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "No Accident Benefit";
    }
    IN MIR-TAX-PMT-PD-PREM-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Paid Premium used in tax payment reports.";
    }
    IN MIR-VAR-LIFE-BNFT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Variable Life Additional Benefit";
    }
    IN MIR-CVG-RPU-FND-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Paid Up Capital Amount  as on the particular cut-off date";
    }
    IN MIR-CVG-RPU-FACE-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Paid-up Face Amount as on the particular cut-off date";
    }
    IN MIR-NOTI-DIV-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Notice Division";
    }
    IN MIR-LAPS-POL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Lapse Policy";
    }
    IN MIR-JIKOU-POL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Jikou Policy";
    }
    IN MIR-BIKIN-POL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Bikin Policy";
    }
    IN MIR-RPU-POL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "RPU Policy";
    }
    IN MIR-ANTY-PMT-POL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Annuity Payment Policy";
    }
    IN MIR-DTH-BNFT-AMT 
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Transitional Death Benefit";
    }
    IN MIR-RECALC-ERROR-CD
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Recalculation Error Code";
    }
#S50400 Changes starts
    IN MIR-ERROR-CD
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Error Code";
    }
#S50400 Changes ends
    IN MIR-RSRV-OTHR
    {
        DisplayOnly;
        Length = "82";
        SType = "Text";
        Label = "Reserve Field";
    }
    IN MIR-MAT-BNFT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Maturity Insurance claim(Maturity Addition)";
    }
    IN MIR-OVRDU-INT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Other Interest";
    }
    IN MIR-OTHR-RFND-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Other Refund amount";
    }
    IN MIR-INCR-SURV-BNFT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Increased insurance claims(Maturity addition)";
    }
    IN MIR-EDUC-MAT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Scholarship";
    }
    IN MIR-ACRU-DIV-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Accured Dividend amount";
    }
}  