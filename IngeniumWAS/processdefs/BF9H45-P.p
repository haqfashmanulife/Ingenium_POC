#*******************************************************************************
#*  Component:   BF9H45-P.p                                                    *
#*  Description: UNISYS STREAM 3 JIKOU SETTLEMENT SCREEN DESIGN                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYDM28  CTS      UNISYS JIKOU SETTLEMENT SCREEN CHANGES                    *
#*  S50400  CTS      NEW FIELD ADDITION                                        *
#*******************************************************************************

P-STEP BF9H45-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9H45";
        BusinessFunctionName = "Jikou Screen";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9H45";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID
    {
        Key;
        Mandatory;
        Length = "7";
        DBTableName = "TJKOU";
        SType = "Text";
        Label = "Policy Id";
    }
    INOUT MIR-LARG-TYP
    {
        Length = "3";
        DBTableName = "TJKOU";
        SType = "Text";
        Label = "Large Product Code";
    }
    INOUT MIR-SMAL-TYP
    {
        Length = "3";
        DBTableName = "TJKOU";
        SType = "Text";
        Label = "Small Product Code";
    }
    INOUT MIR-POL-ISSU-DT
    {
        Length = "10";
        DBTableName = "TJKOU";
        SType = "Date";
        Label = "Issue Date";
    }
    INOUT MIR-CVG-NUM 
    {
        Length = "2";
        DBTableName = "TJKOU";
        SType = "Text";
        Label = "Coverage Number";
    }
    INOUT MIR-CVG-SML-PROD-TYP-CD
    {
        Length = "3";
        DBTableName = "TJKOU";
        SType = "Text";
        Label = "Rider Small Product Code";
    }
    OUT MIR-CVG-MAT-XPRY-DT
    {
        Length = "10";
        DBTableName = "TJKOU";
        SType = "Date";
        Label = "Coverage Maturity Date / Expiry Date";
    }
    OUT MIR-CSV-ELPS-DUR
    {
        Length = "4";
        DBTableName = "TJKOU";
        SType = "Text";
        Label = "Elapsed YM(for calculation)";
    }
    OUT MIR-CALC-EFF-DT
    {
        Length = "10";
        DBTableName = "TJKOU";
        SType = "Date";
        Label = "Effective Date(Calculation Date)";
    }    
    OUT MIR-LOAN-BAL-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Loan Balances";
    }
    OUT MIR-LOAN-INT-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Loan unpaid interest";
    }
    OUT MIR-LOAN-SHRT-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Loan Short Interest";
    }
    OUT MIR-UNPAID-PREM-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Unpaid premium";
    }
    OUT MIR-SHRT-PREM-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Deficient premium";
    }
    OUT MIR-APL-BAL-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "APL";
    }
    OUT MIR-APL-INT-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "APL Interest";
    }
    OUT MIR-TAXWH-FED-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Withholding tax, Government";
    }
    OUT MIR-TAXWH-LOC-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Withholding tax, Local";
    }
    OUT MIR-TOT-INCM-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Total income";
    }
    OUT MIR-POL-CSV-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Total CSV";
    }
    OUT MIR-BASE-CVG-CSV-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "CSV for Base";
    }
    OUT MIR-CVG-CSV-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "CSV for rider level";
    }    
    OUT MIR-LOAN-UNEARN-INT-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Loan unearned interest";
    }
    OUT MIR-LOAN-XCES-INT-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Loan excess interest";
    }
    OUT MIR-UNEARN-PREM-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Unearned Premium";
    }
    OUT MIR-XCES-PREM-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Excess premium";
    }
    OUT MIR-EDUC-CNGRT-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Educational Congratulatory";
    }
    OUT MIR-HLTH-CNGRT-INT-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Health Congratulatory A and B and Interest";
    }
    OUT MIR-SURV-BEN-DEFR-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Survival Benefit Deferred amount and interest";
    }
    OUT MIR-SPCL-DIV-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Special dividend defer and interest";
    }
    OUT MIR-DEP-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = " Deposit and interest";
    }
    OUT MIR-NEW-CNVR-BAL-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "New Conversion Balance";
    }
    OUT MIR-CVG-PMT-DEP-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Amount and interest_ Applicable rider payment deposit";
    }
    OUT MIR-DEFR-BNFT-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Deferred Benefit and interest";
    }
    OUT MIR-SAV-CVG-BNFT-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Savings Rider Benefit Amount";
    }
    OUT MIR-SAV-CVG-ADD-BNFT-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Savings Rider Additional Benefit Amount";
    }
    OUT MIR-TOT-XPNS-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Total Expenses";
    }
    OUT MIR-REMIT-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Difference between income and expenditure amount     (_ is remittance amount)";
    }
    OUT MIR-SURR-REMIT-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Surrender Remittance Amount as on the particular cut_off date";
    }
 
    OUT MIR-CNVR-ADJ-DIV-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Conversion adjustment dividend";
    }
    OUT MIR-NEW-CNVR-CSV-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "New Conversion Balance CSV";
    }
    OUT MIR-ENDOW-PUA-CSV-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Pure endowment paid_up addition CSV";
    }
    OUT MIR-JV-CNGRT-DEFR-INT-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Juvenile Congratulatory Deferred interest";
    }
    OUT MIR-ENDOW-PUA-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Pure endowment paid-up addition";
    }
    OUT MIR-VEST-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Vesting";
    }
    OUT MIR-NO-ACCDNT-BNFT-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "No Accident Benefit";
    }    
    OUT MIR-VAR-LIFE-BNFT-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Variable Life Additional Benefit";
    }
    OUT MIR-CVG-RPU-FACE-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Paid-up Face Amount as on the particular cut-off date";
    }
    OUT MIR-CVG-PMT-XPRY-DT
    {
        Length = "10";
        DBTableName = "TJKOU";
        SType = "Date";
        Label = "Coverage Payment expiration date";
    }
    OUT MIR-TOT-POL-PREM-PD-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Total Premium Paid at policy level";
    }
    OUT MIR-LAPS-POL-IND
    {
        Length = "1";
        DBTableName = "TJKOU";
        SType = "Text";
        Label = "Lapse Policy";
    }
    OUT MIR-BIKIN-POL-IND
    {
        Length = "1";
        DBTableName = "TJKOU";
        SType = "Text";
        Label = "Bikin Policy";
    }
    OUT MIR-ANTY-PMT-POL-IND
    {
        Length = "1";
        DBTableName = "TJKOU";
        SType = "Text";
        Label = "Annuity Payment Policy";
    }
    OUT MIR-RECALC-ERROR-CD
    {
        Length = "5";
        DBTableName = "TJKOU";
        SType = "Text";
        Label = "Recalculation Error Code";
    }
#S50400 Changes start
    OUT MIR-ERROR-CD
    {
        Length = "5";
        DBTableName = "TJKOU";
        SType = "Text";
        Label = "Error Code";
    }
#S50400 Changes ends
    OUT MIR-VEST-CSV-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Vesting CSV";
    }
    OUT MIR-WL-PREM-PUA-CSV-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Whole life premium paid_up addition CSV";
    } 
    OUT MIR-JV-CNGRT-DEFR-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Juvenile Congratulatory Deferred Amount";
    }
    OUT MIR-INCR-ENDOW-DEFR-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Increase pure endowment premium defer and interest";
    }
    OUT MIR-WL-PREM-PUA-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Whole life premium paid-up addition";
    }
    OUT MIR-VEST-DEFR-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Vesting Defer and interest";
    }
    OUT MIR-DTH-BNFT-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Transitional Death Benefit";
    }
    OUT MIR-RSRV-OTHR 
    {
        Length = "82";
        DBTableName = "TJKOU";
        SType = "Text";
        Label = "Reserve Field";
    }
    OUT MIR-POL-GRS-APREM-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Gross Annual Premium";
    }
    OUT MIR-LOAN-INT-VALID-DT
    {
        Length = "10";
        DBTableName = "TJKOU";
        SType = "Date";
        Label = "Loan Interest Valid Date";
    }
    OUT MIR-TAX-PMT-PD-PREM-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Paid Premium used in tax payment reports.";
    }
    OUT MIR-CVG-RPU-FND-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Paid Up Capital Amount  as on the particular cut-off date";
    }
    OUT MIR-NOTI-DIV-IND
    {
        Length = "1";
        DBTableName = "TJKOU";
        SType = "Text";
        Label = "Notice Division";
    }
    OUT MIR-JIKOU-POL-IND
    {
        Length = "1";
        DBTableName = "TJKOU";
        SType = "Text";
        Label = "Jikou Policy";
    }
    OUT MIR-RPU-POL-IND
    {
        Length = "1";
        DBTableName = "TJKOU";
        SType = "Text";
        Label = "RPU Policy";
    }
    OUT MIR-SAV-CVG-DEFR-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Deferral insurance claim received";
    }
    OUT MIR-OVRDU-INT-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Other Interest";
    }
    OUT MIR-MAT-BNFT-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Maturity Insurance claim(Maturity Addition)";
    }
    OUT MIR-OTHR-RFND-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Other Refund amount";
    }
    OUT MIR-INCR-SURV-BNFT-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Increased insurance claims(Maturity addition)";
    }
    OUT MIR-EDUC-MAT-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Scholarship";
    }
    OUT MIR-CUSTOD-DIV-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Accumulated Dividend on depoist(Accumulated Interest)";
    }
    OUT MIR-ACRU-DIV-AMT
    {
        Length = "15";
        DBTableName = "TJKOU";
        SType = "Currency";
        Label = "Accured Dividend amount";
    }
}  