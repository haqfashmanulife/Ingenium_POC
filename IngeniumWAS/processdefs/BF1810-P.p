# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:45 PM EDT

#*******************************************************************************
#*  Component:   BF1810-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01PR04  KRW      POST LAPSE SURRENDER TERMINATION                          *
#*  01PR11  KRW      FACE AMOUNT CALCULATION METHOD                            *
#*  01PR21  KRW      SURVIVORSHIP BENEFIT AND PAID-UP DATES                    *
#*  01PR22  KRW      NEW FIELDS FOR SUNDRY,COI, LUMP SUM                       *
#*  1CPR01  DEL      NEW FIELDS FOR CONVERSION                                 *
#*  PR0003  FB       NEW FIELD FOR STANDALONE POLICY                           *
#*  HNB004  HIN/MG   NEW EDITS PHASE 1                                         *
#*  HIS007  HIN/LJ   Increase MIR-PYRL-SAV-COMP-LMT length                     *
#*  CR126C  AT       ADD MINIMUM SUNDRY C AMOUNT                               *
#*  MM0056  BMB      Add Rider Renewal Expiry Date                             *
#*  PR0001  ROC      20% MVA Free Withdrawal                                   *
#*  M00037  CLB      Add minimum sundry D amount                               *
#*  MP0010  PM       Add Renewal Commission Date                               *
#*  MFFFU2  CLB      Add fields for SegFund COI Withdrawal Order               *
#*  PF30    AKATO    PF 3.0 Retrofit 2004AUG05                                 *
#*  MFFFU6  CLB      Add fields for Fund Transfers                             *
#*  IPPIRA  SUG      Add plan group code                                       *
#*  RP1VA2  CTS      ADD NEW FIELDS FOR REPRICING PROJECT                      *
#*  IPMPPU  CTS      ADD PAYOUT MODE FOR IPMP                                  *
#*  IPMPV4  CTS      ADDED ANNUITY PAYOUT TYPE AND ANNUITY RATE TYPE FOR IPMP  *
#*  MP5002  CTS      ADD MVA CUT-OFF DATE                                      *
#*  MP4801  CTS      ADD SUBSTITUTE CLAIMANT CUT OFF DATE                      *
#*  FEID01  CTS      ADD LIAB-ISS-CUT-OFF-DT for for LCD Issue Date Calculation*
#*  FEID01           - Online Screen Changes                                   *
#*  MP9713  CTS      ADD NEW FIELDS COI-RPRC-2-DT AND VALN-RPRC-2-DT           *
#*  NWLPSC  CTS      CHANGES DONE TO REMOVE THE POLICY FEE AND MODE FACTORS    * 
#*  NWLPSC           FROM THE PLAN MAINTENANCE SCREENS	                       *
#*  EN9547  CTS      COMMENTED OUT THE VARIABLE MIR-LIVES-INSRD-CD  DUE TO     *
#*                   DUPLICATE DECLARATION                                     *
#*  MP1541  CTS      ADD NEW FIELD APL-INT-RT-TYP-CD FOR APL PROCESSING        *
#*  MP143A  CTS      ADD NEW FIELD PREM-CALC-MTHD-CD FOR AMI PROCESSING        *
#*  MP173A  CTS      ADDED FIELD FOR TAX CERTIFICATE-TAX DEDUCTION CATEGORY    *
#*  TVI005  CTS      ADD NEW FIELD ADV-PMT-ALLOW-TYP-CD FOR TVI PROCESSING     *
#*  M280A1  CTS      CHANGES DONE TO INCREASE THE LENGTH OF PLAN-BNFT-TYP-CD   *
#*  M280A1           FROM 1 BYTE TO 2 BYTES                                    *
#*******************************************************************************

P-STEP BF1810-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1810";
        BusinessFunctionName = "Plan Description Record Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM0111";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Plan";
    }

    OUT MIR-ACTN-COLCT-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "ACTIV";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Activity Notification Pointer";
    }

    OUT MIR-ACUM-BRKPT-AMT
    {
        Length = "11";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "Minimum Guaranteed Interest Amount";
    }

    OUT MIR-ADB-PLAN-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "ADB Reserve Pointer";
    }

    OUT MIR-ADMIN-FEE-WAV-AMT
    {
        Length = "15";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Administrative Fee Waiver Amount";
    }

    OUT MIR-AFR-THRSHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AFR-THRSHD-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Face Reduction";
    }

    OUT MIR-AFR-THRSHD-PERI-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AFR-THRSHD-PERI-CD";
        DBTableName = "TPD";
        SType = "Text";
        Label = "Threshold Period Indicator";
    }

    OUT MIR-AGE-CALC-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGE-CALC-MTHD-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Age Calculation Basis";
    }

    OUT MIR-AGE-STBCK-STRT-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "Setback Start Age";
    }

    OUT MIR-ALLOW-CCAS-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Clear Case Indicator";
    }

    OUT MIR-APL-INT-RT-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "APL Interest Pointer";
    }

    OUT MIR-APP-FORM-TYP-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "AFTT";
        DBTableName = "TAFTT";
        SType = "Text";
        Label = "Application Form Type";
    }

    OUT MIR-APPL-ID
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "APPL";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Administration System";
    }

    OUT MIR-AUTO-PREM-PMT-IND
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Indicator";
        Label = "FPUL Automatic Premium Payment Indicator";
    }

    OUT MIR-BASIC-PLAN-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Basic Plan Indicator";
    }

    OUT MIR-CASM-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "ASMBP";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Assembly Pointer";
    }

    OUT MIR-CF-INT-CALC-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CF-INT-CALC-TYP-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Interest Calculation Type";
    }

    OUT MIR-CF-INT-MODE-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CF-INT-MODE-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Interest Handling Mode";
    }

    OUT MIR-CNTRCT-PREM-IND
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Indicator";
        Label = "Contractual Premium";
    }

    OUT MIR-CNVR-XPRY-AGE-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Conversion Age or Duration";
    }

    OUT MIR-CNVR-XPRY-DT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CNVR-XPRY-DT-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Conversion Expiry Type";
    }

    OUT MIR-COLA-1-PLAN-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "COLA 1 Reserve Pointer";
    }

    OUT MIR-COLA-2-PLAN-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "COLA 2 Reserve Pointer";
    }

    OUT MIR-COLA-3-PLAN-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "COLA 3 Reserve Pointer";
    }

    OUT MIR-COLA-4-PLAN-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "COLA 4 Reserve Pointer";
    }

    OUT MIR-COLFND-REQIR-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Plan requires a loan collateral fund";
    }

    OUT MIR-COMM-PLAN-TYP-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "PPCNT";
        DBTableName = "TPD";
        SType = "Text";
        Label = "Commission Percent Pointer";
    }

    OUT MIR-COMM-RH-SUB-CD
    {
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "PRHDR";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Commission Rate Header Pointer";
    }

    OUT MIR-COMM-RT-LOOP-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Renewal Commission Loop Indicator";
    }

    OUT MIR-COMM-RT-TBAC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "COMM-RT-TBAC-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Commission Rate Code";
    }

    OUT MIR-COMM-TRG-SSTD-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Commission Target Substandard Indicator";
    }

    OUT MIR-CSV-CALC-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSV-CALC-MTHD-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Cash Value Calculation Type";
    }

    OUT MIR-CSV-INT-RT-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "IRTS";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Fund Interest Rate Pointer";
    }

    OUT MIR-CV-ALLOC-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CV-ALLOC-MTHD-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Policy Cash Value Allocation Method";
    }

    OUT MIR-CVG-CV-ALLOC-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Coverage Cash Value Allocation Indicator";
    }

    OUT MIR-CVG-ENHC-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-ENHC-TYP-CD";
        DBTableName = "TPD";
        SType = "Text";
        Label = "Enhancement Code";
    }

    OUT MIR-CVG-UL-PU-AGE-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "UL Paid-Up Age/Duration";
    }

    OUT MIR-CVG-UL-PU-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-UL-PU-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "UL Paid-Up Type";
    }

    OUT MIR-CVG-XPRY-AGE-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Coverage Expiry Number of Years";
    }

    OUT MIR-DB-CALC-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DB-CALC-TYP-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Death Benefit Calculation Method";
    }

    OUT MIR-DFLT-REQIR-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "AATBL";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Age and Amount Requirement Pointer";
    }

    OUT MIR-DIA-SWP-THRSHD-AMT
    {
        Length = "15";
        DBTableName = "TPD";
        SType = "Currency";
        Label = "Auto Sweep Threshold Amount";
    }

    OUT MIR-DIA-SWP-THRSHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DIA-SWP-THRSHD-CD";
        DBTableName = "TPD";
        SType = "Text";
        Label = "Auto Sweep Threshold Indicator";
    }

    OUT MIR-DIR-DPOS-MIN-AMT
    {
        Length = "13";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Minimum Direct Deposit Amount";
    }

    OUT MIR-DISP-WTHDR-ORDR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DISP-WTHDR-ORDR-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Tax Processing Withdrawal Order";
    }

    OUT MIR-DIV-OYT-TBAC-ID
    {
        Length = "5";
        DBTableName = "TPH";
        SType = "Text";
        Label = "One Year Term Pointer";
    }

    OUT MIR-DIV-PUA-TBAC-ID
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Paid-up Additions Pointer";
    }

    OUT MIR-DOD-INT-RT-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "IRTS";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Dividend on Deposit - Interest Pointer";
    }

    OUT MIR-DPOS-WTHDR-ORDR-CD
    {
        Length = "4";
        CodeSource = "DataModel";
        CodeType = "DPOS-WTHDR-ORDR-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Deposit Withdrawal Order";
    }

    OUT MIR-EIC-INIT-YR-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Years Until First Excess Interest Credit Calculation";
    }

    OUT MIR-EIC-SUBSEQ-YR-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Years Between Excess Interest Credit Calculations";
    }

    OUT MIR-ENHC-END-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "Enhancement Cease Age";
    }

    OUT MIR-ENHC-END-DUR
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Enhancement Cease Anniversary";
    }

    OUT MIR-ENHC-FREQ-DUR
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Enhancement Frequency Years";
    }

    OUT MIR-ENHC-HIATUS-DUR
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Enhancement Hiatus Years";
    }

    OUT MIR-ENHC-NELCT-DUR
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Maximum Non-elect Enhancement";
    }

    OUT MIR-ENHC-STRT-DUR
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Enhancement Anniversary Start";
    }

    OUT MIR-ENHC-UWG-FREQ-DUR
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Enhancement Financial Evidence Frequency";
    }

    OUT MIR-ETI-FACE-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ETI-FACE-CALC-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "ETI Face Amount Calculation Method";
    }
    OUT MIR-CNVR-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CNVR-TYP-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Conversion Type Code";
    }

    OUT MIR-LIFE-RSK-TYP-CD
    {
      Length = "1";
        CodeSource = "DataModel";
        DBTableName = "TPH";
        CodeType = "LIFE-RSK-TYP-CD";
        SType = "Text";
        Label = "Type of Life Risk";
    }

    OUT MIR-HLTH-STYLE-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "HLTH-STYLE-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Health Style Code";
    }
    OUT MIR-LIVES-INSRD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "LIVES-INSRD-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Lives Insured Code";
    }

    OUT MIR-ESC-XPRY-DT
    {
        Length = "10";
        SType = "Date";
        DBTableName = "TPH";
        Label = "Early Surrender Charge Expiry Date";
    }

    OUT MIR-STDALN-DISALLOW-DT
    {
        Length = "10";
        SType = "Date";
        DBTableName = "TPH";
        Label = "Standalone Disallowed From Date";
    }

# MM0056 - Plan Renewal Expiry Date field added
    OUT MIR-PLAN-RENW-XPRY-DT
    {
        Length = "10";
        SType = "Date";
        DBTableName = "TPH";
        Label = "Renewal Expiry Date";
    }

    OUT MIR-PRE-CNVR-PREM-IND
    {
        Length = "1";
      SType = "Indicator";
        Label = "Lives Insured Code";
    }
#EN9547 CHANGES START HERE    
#    OUT MIR-LIVES-INSRD-CD
#    {
#        Length = "1";
#        CodeSource = "DataModel";
#        CodeType = "PLAN-LIVES-INSRD-CD";
#        SType = "Text";
#        Label = "Lives Insured Code";
#    }
#EN9547 CHANGES END HERE

    OUT MIR-MIN-FNDVL-ESC-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "MIN FUND EQUALS ESC IND";
    }

    OUT MIR-ETI-TBAC-ID
    {
        Length = "5";
        DBTableName = "TPH";
        SType = "Text";
        Label = "ETI Calculation Rate Pointer";
    }

    OUT MIR-FACE-AMT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FACE-AMT-TYP-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Face Amount Type";
    }

    OUT MIR-FACE-CALC-MTHD-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FACE-CALC-MTHD-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Face Amount Calculation Method";
    }

    OUT MIR-FPUL-ADDL-PREM-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "FPUL Pour-in Indicator";
    }

    OUT MIR-FPUL-LOAD-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FPUL-LOAD-TYP-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "FPUL Load Type";
    }

    OUT MIR-FPU-PLAN-BASE-ID
    {
        Length = "5";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Paid-up Plan";
    }

    OUT MIR-FREE-LK-INCR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-LK-INCR-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Free Look on Increase Type";
    }

    OUT MIR-FREE-LK-PRCES-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Subject to free look processing";
    }

    OUT MIR-FYR-COMM-XTRA-RT
    {
        Length = "5";
        Decimals = "4";
        DBTableName = "TPH";
        SType = "Percent";
        Label = "First Year Extra Commission Percentage";
    }

    OUT MIR-GAIN-RPT-TIME-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "GAIN-RPT-TIME-CD";
        DBTableName = "TPD";
        SType = "Text";
        Label = "Tax Gain Reporting Indicator";
    }

    OUT MIR-GIR-PREM-INCL-IND
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Indicator";
        Label = "GIR Calculation Indicator";
    }

    OUT MIR-IA-COMM-BAND-1-AMT
    {
        Length = "15";
        DBTableName = "TPD";
        SType = "Currency";
        Label = "IA Commission Band 1 Amount";
    }

    OUT MIR-IA-COMM-BAND-1-PCT
    {
        Length = "5";
        Decimals = "2";
        DBTableName = "TPD";
        SType = "Percent";
        Label = "IA Commision Band 1 Percent";
    }

    OUT MIR-IA-COMM-BAND-2-AMT
    {
        Length = "15";
        DBTableName = "TPD";
        SType = "Currency";
        Label = "IA Commission Band 2 Amount";
    }

    OUT MIR-IA-COMM-BAND-2-PCT
    {
        Length = "5";
        Decimals = "2";
        DBTableName = "TPD";
        SType = "Percent";
        Label = "IA Commission Band 2 Percent";
    }

    OUT MIR-IA-COMM-BAND-3-AMT
    {
        Length = "15";
        DBTableName = "TPD";
        SType = "Currency";
        Label = "IA Commission Band 3 Amount";
    }

    OUT MIR-IA-COMM-BAND-3-PCT
    {
        Length = "5";
        Decimals = "2";
        DBTableName = "TPD";
        SType = "Percent";
        Label = "IA Commission Band 3 Percent";
    }

    OUT MIR-IA-COMM-MAX-AMT
    {
        Length = "13";
        DBTableName = "TPD";
        SType = "Currency";
        Label = "IA Maximum Commission Amount";
    }

    OUT MIR-IA-INT-LEGAL-ID
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Text";
        Label = "IA Statutory Valuation Interest Rate Scale";
    }

    OUT MIR-IA-INT-PREM-ID
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Text";
        Label = "IA Premium Valuation Interest Rate Scale";
    }

    OUT MIR-IA-INT-RT-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PIRTS";
        DBTableName = "TPD";
        SType = "Text";
        Label = "IA Valuation Interest Pointer";
    }

    OUT MIR-IA-INT-TAX-ID
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Text";
        Label = "IA Tax Valuation Interest Rate Scale";
    }

    OUT MIR-IA-MORT-LEGAL-ID
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Text";
        Label = "IA Statutory Valuation Mortality Rate Scale";
    }

    OUT MIR-IA-MORT-PREM-ID
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Text";
        Label = "IA Premium Mortality Rate Scale";
    }

    OUT MIR-IA-MORT-TAX-ID
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Text";
        Label = "IA Tax Mortality Rate Scale";
    }

    OUT MIR-IA-MORT-UVAL-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PUVAL";
        DBTableName = "TPD";
        SType = "Text";
        Label = "IA Valuation Mortality Pointer";
    }

    OUT MIR-INDX-INCR-DY-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Interval Days";
    }

    OUT MIR-INDX-INCR-MO-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Interval Months";
    }

    OUT MIR-INDX-INCR-MTHD-CD
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Calculation Method";
    }

    OUT MIR-INIT-PREM-CHNG-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "Change Initial Age";
    }

    OUT MIR-INT-ADJ-MAX-DUR
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Interest Adjustment Frequency";
    }

    OUT MIR-ISWL-CALC-ADV-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "ISWL Advance Notice Days";
    }

    OUT MIR-ISWL-CALC-FREQ-DUR
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "ISWL Recalculation Frequency";
    }

    OUT MIR-ISWL-FRST-CALC-DUR
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "ISWL First Recalculation Anniversary";
    }

    OUT MIR-ISWL-PREM-VAR-RT
    {
        Length = "5";
        Decimals = "5";
        DBTableName = "TPH";
        SType = "Percent";
        Label = "ISWL Recalculation - Minimum Variance";
    }

    OUT MIR-LBILL-MODE-FEE-AMT
    {
        Length = "9";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Listbill Flat Amount per Mode";
    }

    OUT MIR-LOAN-INT-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "LOAN-INT-CALC-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Loan Interest Calculation Method";
    }

    OUT MIR-LOAN-INT-RT-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Loan Interest Rate Pointer";
    }

    OUT MIR-LOAN-INT-RT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "LOAN-INT-RT-TYP-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Loan Interest Type";
    }

    OUT MIR-LOC-GR-COLCT-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "LOCPT";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Group Location Pointer";
    }

    OUT MIR-LTA-PLAN-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Lifetime Accident Reserve Pointer";
    }

    OUT MIR-LTB-PLAN-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Lifetime Benefit Reserve Pointer";
    }

    OUT MIR-MAJ-LN-SORT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MAJ-LN-SORT-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Major Line Sort Key";
    }

    OUT MIR-MAT-CHRG-RTBL2-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PCNT";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Maturity Charge Rate Pointer";
    }

    OUT MIR-MAT-DT-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MAT-DT-CALC-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Maturity Indicator";
    }

    OUT MIR-MAX-LMPSM-FCT
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "MAX-LMPSM-FCT";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Maximum Lump Sum Multiplier";
    }

    OUT MIR-MAX-ROLOVR-DY-DUR
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Guaranteed Term Maximum Months/Days";
    }

    OUT MIR-MAX-SNDRY-A-AMT
    {
        Length = "13";
        CodeSource = "DataModel";
        CodeType = "MAX-SNDRY-A-AMT";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Max Sundry A Amount";
    }

    OUT MIR-MAX-SNDRY-AMT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MAX-SNDRY-AMT-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Max Sundry Amount Code";
    }

    OUT MIR-MAX-SNDRY-B-AMT
    {
        Length = "13";
        CodeSource = "DataModel";
        CodeType = "MAX-SNDRY-B-AMT";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Max Sundry B Amount";
    }

    OUT MIR-MAX-SNDRY-COI-QTY
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "MAX-SNDRY-COI-QTY";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Max Sundry COI Quantity";
    }

    OUT MIR-MCV-CALC-REQIR-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Calculate minimum cash value";
    }

    OUT MIR-MCV-INT-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MCV-INT-MTHD-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "MCV Interest Calculation Method";
    }

    OUT MIR-MCV-PMT-LOAD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MCV-PMT-LOAD-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "MCV Payment Load Order";
    }

    OUT MIR-MIN-CASL-PAYO-AMT
    {
        Length = "13";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Minimum RRIF/LIF Casual Payout Amount";
    }

    OUT MIR-MIN-ROLOVR-DY-DUR
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Guaranteed Term Minimum Months/Days";
    }

    OUT MIR-MIN-SNDRY-A-AMT
    {
        Length = "13";
        CodeSource = "DataModel";
        CodeType = "MIN-SNDRY-A-AMT";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Min Sundry A Amount";
    }

    OUT MIR-MIN-SNDRY-AMT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MIN-SNDRY-AMT-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Min Sundry Amount Code";
    }

    OUT MIR-MIN-SNDRY-B-AMT
    {
        Length = "13";
        CodeSource = "DataModel";
        CodeType = "MIN-SNDRY-B-AMT";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Min Sundry B Amount";
    }

    OUT MIR-MIN-SNDRY-C-AMT
    {
        Length = "13";
        CodeSource = "DataModel";
        CodeType = "MIN-SNDRY-C-AMT";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Min Sundry C Amount";
    }

    OUT MIR-MIN-SNDRY-D-AMT
    {
        Length = "13";
        CodeSource = "DataModel";
        CodeType = "MIN-SNDRY-D-AMT";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Min Sundry D Amount";
    }

    OUT MIR-MNPMT-TRG-SSTD-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Minimum Payment Target Substandard Indicator";
    }

    OUT MIR-MORT-XPNS-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MORT-XPNS-CALC-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Mortality and Expense Calculation Type";
    }

    OUT MIR-MORT-XPNS-CHRG-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "Mortality and Expense Age";
    }

    OUT MIR-MORT-XPNS-CHRG-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Mortality and Expense Duration";
    }
#NWLPSC CHANGES
#  OUT MIR-MTHLY-PFEE-FCT
#    {
#        Length = "8";
#        Decimals = "7";
#        DBTableName = "TPD";
#        SType = "Number";
#        Label = "Monthly Policy Fee Factor";
#    }

    OUT MIR-NF-PRCES-MO-DUR
    {
        Length = "4";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Months & Days Prior to Non-Forfeiture/Lapse";
    }

    OUT MIR-NOTI-DEPT-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DEPT";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Notify Department";
    }

    OUT MIR-NOTI-DT-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "NOTI-DT-CALC-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Notify Date Calculation Indicator";
    }

    OUT MIR-NOTI-HIGH-AGE-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Last Notify Age";
    }

    OUT MIR-NOTI-LOW-AGE-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Notify Age or Years";
    }

    OUT MIR-NUM-GIR-OPT-QTY
    {
        Length = "2";
        DBTableName = "TPD";
        SType = "Text";
        Label = "Number of GIR Options";
    }

    OUT MIR-OVRID-FRST-DGT-CD
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Text";
        Label = "Agent Situation";
    }

    OUT MIR-OWN-OCCP-PLAN-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Own Occupation Reserve Pointer";
    }

    OUT MIR-OWN-OCCP-XPRY-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "Own Occupation Expiry Age";
    }

    OUT MIR-PAC-DPOS-MIN-AMT
    {
        Length = "13";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Minimum PAC Deposit Amount";
    }

    OUT MIR-PAC-MODE-FEE-AMT
    {
        Length = "9";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "PAC Flat Charge per Mode";
    }
#NWLPSC CHANGES
#    OUT MIR-PAC-MTHLY-PFEE-FCT
#    {
#        Length = "8";
#        Decimals = "7";
#        DBTableName = "TPD";
#        SType = "Number";
#        Label = "Monthly PAC Policy Fee Factor";
#    }
#
#    OUT MIR-PAC-QTR-PFEE-FCT
#    {
#        Length = "8";
#        Decimals = "7";
#        DBTableName = "TPD";
#        SType = "Number";
#        Label = "Quarterly PAC Policy Fee Factor";
#    }
#
#    OUT MIR-PAC-SEMI-ANN-FCT
#    {
#        Length = "8";
#        Decimals = "7";
#        DBTableName = "TPD";
#        SType = "Number";
#        Label = "Semi-Annual PAC Mode Factor";
#    }
#
#    OUT MIR-PAC-SEMI-PFEE-FCT
#   {
#       Length = "8";
#       Decimals = "7";
#       DBTableName = "TPD";
#       SType = "Number";
#       Label = "Semi-Annual PAC Policy Fee Factor";
#   }

    OUT MIR-PDF-INT-RT-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "IRTS";
        DBTableName = "TPH";
        SType = "Text";
        Label = "PDF Interest Rate Pointer";
    }

    OUT MIR-PDISAB-PLAN-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Partial Disability Reserve Pointer";
    }

    OUT MIR-PDISAB-XPRY-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "Partial Disability Expiry Age";
    }

    OUT MIR-PERI-STMT-DY-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Duration Days";
    }

    OUT MIR-PERI-STMT-MO-DUR
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Duration Months";
    }

    OUT MIR-PERI-STMT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PERI-STMT-TYP-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Type of Statement";
    }

    OUT MIR-PLAN-7702-MXDX-ID
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "7702 Net Single Premium Pointer";
    }

    OUT MIR-PLAN-ACCT-TYP-CD
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Text";
        Label = "2nd Digit of GL Account";
    }

    OUT MIR-PLAN-ADB-XPRY-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "ADB Expiry Age";
    }

    OUT MIR-PLAN-ADMIN-FEE-AMT
    {
        Length = "11";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Annual Administration Fee Amount";
    }

    OUT MIR-PLAN-AGE-STBCK-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-AGE-STBCK-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Female Setback Type";
    }

    OUT MIR-PLAN-AGE-STBCK-QTY
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Female Setback Years";
    }

    OUT MIR-PLAN-BASE-XPRY-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "Policy Expiry Age";
    }

    OUT MIR-PLAN-BNFT-TYP-CD
    {
#* M280A1 CHANGES START*    
#       Length = "1";
        Length = "2";
#* M280A1 CHANGES END*
        CodeSource = "DataModel";
        CodeType = "PLAN-BNFT-TYP-CD";
        DBTableName = "TPD";
        SType = "Selection";
        Label = "Plan Benefit Type Code";
    }

    OUT MIR-PLAN-BON-EFF-DY
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Day";
        Label = "Annual Bonus Effective Days";
    }

    OUT MIR-PLAN-BON-EFF-MO
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Month";
        Label = "Annual Bonus Effective Months";
    }

    OUT MIR-PLAN-BON-INT-RT-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Bonus Interest Rate Pointer";
    }

    OUT MIR-PLAN-BUS-CLAS-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CLASS";
        DBTableName = "TPD";
        SType = "Text";
        Label = "Class of Business";
    }

    OUT MIR-PLAN-CF-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-CF-TYP-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Cash Flow Type";
    }

    OUT MIR-PLAN-COLA-XPRY-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "COLA Expiry Age";
    }

    OUT MIR-PLAN-COLFND-IND
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Indicator";
        Label = "Plan is a loan collateral fund";
    }

    OUT MIR-PLAN-CPREM-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-CPREM-CALC-CD";
        DBTableName = "TPD";
        SType = "Text";
        Label = "Commission Calculation Method";
    }

    OUT MIR-PLAN-CSV-DT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-CSV-DT-TYP-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Cash Value Calculated Type";
    }

    OUT MIR-PLAN-CVG-LOAN-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Coverage Loan Indicator";
    }

    OUT MIR-PLAN-CVG-PFEE-AMT
    {
        Length = "9";
        DBTableName = "TPD";
        SType = "Currency";
        Label = "Plan as Additional Coverage Policy Fee Amount";
    }

    OUT MIR-PLAN-CVG-XPRY-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "Coverage Expiry Age";
    }

    OUT MIR-PLAN-DIV-INT-RT-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Dividend Interest Rate Pointer";
    }

    OUT MIR-PLAN-DUR-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-DUR-TYP-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Payor Waiver Expiry Indicator";
    }

    OUT MIR-PLAN-EFF-DT
    {
        Length = "10";
        DBTableName = "TPH";
        SType = "Date";
        Label = "Plan Effective Date";
    }

    OUT MIR-PLAN-EIC-FREQ-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-EIC-FREQ-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Excess Interest Credit Frequency";
    }

    OUT MIR-PLAN-GUAR-INT-RT
    {
        Length = "5";
        Decimals = "5";
        DBTableName = "TPH";
        SType = "Percent";
        Label = "Minimum Guaranteed Interest Rate";
    }

    OUT MIR-PLAN-IA-PFEE-AMT
    {
        Length = "11";
        DBTableName = "TPD";
        SType = "Currency";
        Label = "IA Policy Fee Amount";
    }

    OUT MIR-PLAN-IMPRD-INT-RT
    {
        Length = "5";
        Decimals = "5";
        DBTableName = "TPH";
        SType = "Percent";
        Label = "Loan Interest Impairment Rate";
    }

    OUT MIR-PLAN-IMPRD-RT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-IMPRD-RT-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Loan Interest Impairment Indicator";
    }

    OUT MIR-PLAN-INS-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-INS-TYP-CD";
        DBTableName = "TPD";
        SType = "Text";
        Label = "Type of Insurance";
    }

    OUT MIR-PLAN-INT-PAYO-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "PLAN-INT-PAYO-CD";
        DBTableName = "TPD";
        SType = "Text";
        Label = "Interest Handling Indicator";
    }

    OUT MIR-PLAN-ISS-DT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-ISS-DT-TYP-CD";
        DBTableName = "TPD";
        SType = "Text";
        Label = "Date Rule";
    }

    OUT MIR-PLAN-LOAN-INT-RT
    {
        Length = "5";
        Decimals = "5";
        DBTableName = "TPH";
        SType = "Percent";
        Label = "Loan Interest Rate";
    }

    OUT MIR-PLAN-LOCK-FND-IND
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Indicator";
        Label = "Locked in Funds Indicator";
    }

    OUT MIR-PLAN-LOC-LIC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-LOC-LIC-CD";
        DBTableName = "TPD";
        SType = "Text";
        Label = "Product License Indicator";
    }

    OUT MIR-PLAN-LTA-XPRY-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "LTA Expiry Age";
    }

    OUT MIR-PLAN-LTB-XPRY-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "LTB Expiry Age";
    }

    OUT MIR-PLAN-MAT-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "Plan Maturity Age";
    }

    OUT MIR-PLAN-MAT-AGE-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Plan Maturity Years";
    }

    OUT MIR-PLAN-MDRT-CLAS-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-MDRT-CLAS-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "MDRT Class";
    }

    OUT MIR-PLAN-MIN-MPREM-QTY
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Minimum Inforce Premiums";
    }

    OUT MIR-PLAN-MKTVAL-ADJ-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-MKTVAL-ADJ-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Market Value Adjustment Calculation";
    }

    OUT MIR-PLAN-MODE-FEE-AMT
    {
        Signed;
        Length = "9";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Flat Charge Amount per Mode";
    }
#NWLPSC CHANGES

#    OUT MIR-PLAN-MTHLY-FCT
#   {
#       Length = "8";
#       Decimals = "7";
#       DBTableName = "TPD";
#       SType = "Number";
#       Label = "Monthly Mode Factor";
#   }  
 
    OUT MIR-PLAN-NAR-DSCNT-RT
    {
        Length = "9";
        Decimals = "8";
        DBTableName = "TPH";
        SType = "Percent";
        Label = "Risk Rate Divisor";
    }

    OUT MIR-PLAN-NOTI-REASN-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "NOTRE";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Notify Reason";
    }
#NWLPSC CHANGES
#    OUT MIR-PLAN-PAC-MTHLY-FCT
#   {
#       Length = "8";
#       Decimals = "7";
#       DBTableName = "TPD";
#       SType = "Number";
#       Label = "Monthly PAC Mode Factor";
#   }
#
#  OUT MIR-PLAN-PAC-QTR-FCT
#   {
#       Length = "8";
#       Decimals = "7";
#       DBTableName = "TPD";
#       SType = "Number";
#       Label = "Quarterly PAC Mode Factor";
#   }

    OUT MIR-PLAN-PAR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-PAR-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Dividend Participation Indicator";
    }

    OUT MIR-PLAN-PAYO-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-PAYO-MTHD-CD";
        DBTableName = "TPD";
        SType = "Text";
        Label = "Contractual Payout Option";
    }

    OUT MIR-PLAN-PFEE-AMT
    {
        Length = "9";
        DBTableName = "TPD";
        SType = "Currency";
        Label = "Base Policy Fee Amount";
    }
#NWLPSC CHANGES
#    OUT MIR-PLAN-QTR-FCT
#   {
#       Length = "8";
#       Decimals = "7";
#       DBTableName = "TPD";
#       SType = "Number";
#       Label = "Quarterly Mode Factor";
#   }
#
#   OUT MIR-PLAN-QTR-PFEE-FCT
#   {
#       Length = "8";
#       Decimals = "7";
#       DBTableName = "TPD";
#       SType = "Number";
#       Label = "Quarterly Policy Fee Factor";
#   }  

    OUT MIR-PLAN-REG-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Registration Indicator";
    }

    OUT MIR-PLAN-REINST-DY-DUR
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "PLAN-REINST-DY-DUR";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Time Limit in Days";
    }

    OUT MIR-PLAN-REINST-MO-DUR
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "PLAN-REINST-MO-DUR";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Time Limit in Months";
    }

    OUT MIR-PLAN-REINST-LMT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-REINST-LMT-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Time Limit Calculation Start Date";
    }

    OUT MIR-PLAN-ROLOVR-DT-IND
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Indicator";
        Label = "Maturity/Expiry Rollover Override Indicator";
    }

    OUT MIR-PLAN-ROLOVR-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-ROLOVR-TYP-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Guaranteed Term Rollover Type";
    }

    OUT MIR-PLAN-RPU-DIV-RT
    {
        Length = "5";
        Decimals = "5";
        DBTableName = "TPH";
        SType = "Percent";
        Label = "RPU Dividend Calculation Percentage";
    }

    OUT MIR-PLAN-RSRV-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-RSRV-CALC-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Reserve Calculation Method";
    }

    OUT MIR-PLAN-RULE-TYP-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-RULE-TYP-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Face Amount Calculation Rule Type";
    }
#NWLPSC CHANGES
#    OUT MIR-PLAN-SEMI-ANN-FCT
#   {
#       Length = "8";
#       Decimals = "7";
#       DBTableName = "TPD";
#       SType = "Number";
#       Label = "Semi-Annual Mode Factor";
#   }  

    OUT MIR-PLAN-SUPP-BNFT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-SUPP-BNFT-CD";
        DBTableName = "TPD";
        SType = "Text";
        Label = "Supplemental Benefit Indicator";
    }

    OUT MIR-PLAN-SURR-CHRG-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-SURR-CHRG-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Surrender Charge Rate Code";
    }

    OUT MIR-PLAN-TAMRA-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "TAMRA Seven Pay Indicator";
    }

    OUT MIR-PLAN-TAMRA-MXDX-ID
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "TAMRA Seven Pay Pointer";
    }

    OUT MIR-PLAN-TAX-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-TAX-TYP-CD";
        DBTableName = "TPD";
        SType = "Text";
        Label = "Tax Processing Indicator";
    }

    OUT MIR-PLAN-TAXWH-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Withhold tax on disposition";
    }

    OUT MIR-PLAN-TXEMP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-TXEMP-CD";
        DBTableName = "TPD";
        SType = "Text";
        Label = "Tax Exempt Indicator";
    }

    OUT MIR-PLAN-UNIT-VALU-AMT
    {
        Length = "7";
        Decimals = "0";
        DBTableName = "TPD";
        SType = "Currency";
        Label = "Value Per Unit";
    }

    OUT MIR-PLAN-UWG-IND
    {
        Length = "40";
        DBTableName = "TPD";
        SType = "Indicator";
        Label = "Underwriting Required Indicator";
    }

    OUT MIR-PLAN-VPO-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Vanishing Premium Option Indicator";
    }

    OUT MIR-PLAN-WP-XPRY-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "Waiver of Premium Expiry Age";
    }

    OUT MIR-PLAN-WP-XPRY-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-WP-XPRY-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Waiver Base Coverage Dependency";
    }

    OUT MIR-PLAN-WTHDR-ORDR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-WTHDR-ORDR-CD";
        DBTableName = "TPD";
        SType = "Text";
        Label = "Fund Withdrawal Order Indicator";
    }

    OUT MIR-PLAN-XPRY-DT
    {
        Length = "10";
        DBTableName = "TPH";
        SType = "Date";
        Label = "Plan Expiry Date";
    }

    OUT MIR-PMT-ALLOC-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PMT-ALLOC-MTHD-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Deposit Allocation Method";
    }

    OUT MIR-PMT-LOAD-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PMT-LOAD-CALC-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Payment Load Rate Code";
    }

    OUT MIR-PMT-LOAD-FLAT-AMT
    {
        Length = "11";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Payment Load Flat Amount";
    }

    OUT MIR-PMT-LOAD-ORDR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PMT-LOAD-ORDR-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Payment Load Order";
    }

    OUT MIR-PMT-LOAD-RTBL2-ID
    {
        Length = "5";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Payment Load Percent Table Pointer";
    }

    OUT MIR-PMT-LOAD-SSTD-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Payment Load Target Substandard Rate Indicator";
    }

    OUT MIR-PNSN-QUALF-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Plan is qualified";
    }

    OUT MIR-POL-FND-SRVBEN-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-FND-SRVBEN-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Fund Survivor Benefit Type";
    }

    OUT MIR-POL-FND-SRVBEN-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Fund Survivor Benefit Duration";
    }

    OUT MIR-POL-XPRY-AGE-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Policy Expiry Number of Years";
    }

    OUT MIR-PREM-CALC-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PREM-CALC-TYP-CD";
        DBTableName = "TPD";
        SType = "Text";
        Label = "Premium Calculation Type";
    }

    OUT MIR-PREM-CHNG-AGE-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Premium Change Age\Duration";
    }

    OUT MIR-PREM-CHNG-DT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PREM-CHNG-DT-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Premium Change Indicator";
    }

    OUT MIR-PREM-PAY-UVAL-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "UVAL";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Unit Value Pointer - Premium Paying";
    }

    OUT MIR-PREM-RECALC-OPT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PREM-RECALC-OPT-CD";
        DBTableName = "TPD";
        SType = "Text";
        Label = "ISWL Premium Recalculation Option";
    }

    OUT MIR-PREM-RENW-RT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PREM-RENW-RT-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Renewal Premium Indicator";
    }
    
#* MP143A changes start

    OUT MIR-PREM-CALC-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PREM-CALC-MTHD-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Premium Calculation Method Code";
    }

#* MP143A changes end


    OUT MIR-PSUR-CHRG-FLAT-AMT
    {
        Length = "11";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Partial Surrender Charge Flat Amount";
    }

    OUT MIR-PSUR-CHRG-RTBL2-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PCNT";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Partial Surrender Charge Percent Table Pointer";
    }

    OUT MIR-PSUR-CHRG-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PSUR-CHRG-TYP-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Partial Surrender Charge Type";
    }

    OUT MIR-PUA-DIV-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PUA-DIV-CALC-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Calculation Method for Paid-up Additions";
    }

    OUT MIR-PU-UVAL-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "UVAL";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Unit Value Pointer - Paid-up";
    }

    OUT MIR-PYRL-SAV-COMP-LMT
    {
        Length = "13";
        CodeSource = "DataModel";
        CodeType = "PYRL-SAV-COMP-LMT";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Payroll Savings Component Limit";
    }

    OUT MIR-REDC-EP-PLAN-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Elimination Period/Hospital Benefit Reserve Pointer";
    }

    OUT MIR-REDC-EP-XPRY-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "Elimination Period/Hospital Benefit Expiry Age";
    }

    OUT MIR-RPU-TBAC-ID
    {
        Length = "5";
        DBTableName = "TPH";
        SType = "Text";
        Label = "RPU Calculation Rate Pointer";
    }

    OUT MIR-SE-GDLN-APREM-IND
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Indicator";
        Label = "Calculate SEC premiums";
    }
#NWLPSC CHANGES
#    OUT MIR-SEMI-ANN-PFEE-FCT
#   {
#       Length = "8";
#       Decimals = "7";
#       DBTableName = "TPD";
#       SType = "Number";
#       Label = "Semi-Annual Policy Fee Factor";
#   }  

    OUT MIR-SFB-NEG-SUSP-IND
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Indicator";
        Label = "Special Frequency Billing Allows Negative Suspense";
    }

    OUT MIR-SFB-NEG-SUSP-QTY
    {
        Length = "2";
        DBTableName = "TPD";
        SType = "Text";
        Label = "Special Frequency Billing Limit (Months)";
    }

    OUT MIR-SUM-INS-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SUM-INS-CALC-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Sum Insured Calculation Method";
    }

    OUT MIR-SURR-ADJ-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SURR-ADJ-CALC-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Monthiversary Adjustment Method";
    }

    OUT MIR-SURR-ADJ-MO-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Monthiversary Adjustment Months";
    }

    OUT MIR-SURR-ADJ-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SURR-ADJ-TYP-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Monthiversary Adjustment Type";
    }

    OUT MIR-SURR-CHRG-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SURR-CHRG-CALC-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Partial Surrender Rate Type";
    }

    OUT MIR-MIN-WTHDR-AMT
    {
        Length = "13";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Minimum Withdrawal Amount";
    }

    OUT MIR-SURR-CHRG-FLAT-AMT
    {
        Length = "11";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Surrender Charge Flat Amount";
    }

    OUT MIR-SURR-CHRG-RTBL2-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PCNT";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Surrender Charge Percent Table Pointer";
    }

    OUT MIR-SURR-CHRG-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SURR-CHRG-TYP-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Surrender Charge Method";
    }

    OUT MIR-SURR-TRG-SSTD-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Surrender Target Substandard Indicator";
    }

    OUT MIR-T5-REG-TITL-TXT
    {
        Length = "13";
        DBTableName = "TPH";
        SType = "Text";
        Label = "T5 Title if Registered";
    }

    OUT MIR-TRAIL-COMM-BEG-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Trail Start Delay";
    }

    OUT MIR-TRAIL-COMM-FREQ-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TRAIL-COMM-FREQ-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Trail Commission Frequency";
    }

    OUT MIR-TRAIL-COMM-LAG-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Trail Commission Lag Period";
    }

    OUT MIR-TRM-PREM-RFND-RT
    {
        Signed;
        Length = "5";
        Decimals = "4";
        DBTableName = "TPH";
        SType = "Percent";
        Label = "Percentage of Premium to Refund";
    }

    OUT MIR-ULT-PREM-CHNG-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "Ultimate Premium Change Age";
    }

    OUT MIR-UWG-FACE-AMT-FCT
    {
        Length = "3";
        Decimals = "2";
        DBTableName = "TPD";
        SType = "Number";
        Label = "Underwriting Multiplier";
    }

    OUT MIR-VALN-LBL-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "RLBL";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Valuation Header";
    }

    OUT MIR-WP-PLAN-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Waiver of Premium Reserve Pointer";
    }

    OUT MIR-XEMP-TST-UVAL-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "UVAL";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Exemption Test Rate Pointer";
    }

    OUT MIR-XPRY-DT-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "XPRY-DT-CALC-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Expiry Date Calculation Method";
    }

    OUT MIR-PLAN-INIT-PMT-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Initial Payment Indicator";
    }

    OUT MIR-RENW-COMM-DT
    {
        Length = "10";
        SType = "Date";
        DBTableName = "TPH";
        Label = "Renewal Commission Date";
    }

    OUT MIR-COI-WTHDR-RULE-CD
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "COI Withdrawal Rule";
    }

    OUT MIR-COI-PLAN-ORDR-CD
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "COI Withdrawal Plan Level Order";
    }

    OUT MIR-MIN-XFER-AMT
    {
        Length = "13";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Minimum Transfer Amount";
    }

# IPPIRA - Plan group code added
    OUT MIR-PLAN-GR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-GR-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Plan Group Code";
    }

# RP1VA2 - COI REPRICED DATE FIELD ADDED
    OUT MIR-COI-RPRC-DT
    {
        Length = "10";
        SType = "Date";
        DBTableName = "TPH";
        SType = "Date";
        Label = "COI Repricing Effective Date";
    }

# RP1VA2 - VALUATION REPRICED DATE FIELD ADDED
    OUT MIR-VALN-RPRC-DT
    {
        Length = "10";
        SType = "Date";
        DBTableName = "TPH";
        SType = "Date";
        Label = "Valuation Repricing Effective Date";
    }

# MP9713 - COI REPRICED DATE FIELD-2 ADDED
    OUT MIR-COI-RPRC-2-DT
    {
        Length = "10";
        DBTableName = "TPH";
        SType = "Date";
        Label = "COI Repricing Effective Date-2";
    }

# MP9713 - VALUATION REPRICED DATE-2 FIELD ADDED
    OUT MIR-VALN-RPRC-2-DT
    {
        Length = "10";
        DBTableName = "TPH";
        SType = "Date";
        Label = "Valuation Repricing Effective Date-2";
    }
# IPMPPU
    OUT MIR-PLAN-PAYO-MODE-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "PLAN-PAYO-MODE-CD";
        DBTableName = "TPD";
        SType = "Text";
        Label = "Payout Mode";
    }

# IPMPV4 STARTS HERE
    OUT MIR-ANTY-PAYO-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ANTY-PAYO-TYP-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Annuity Payout Type";
    }

    OUT MIR-ANTY-RT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ANTY-RT-TYP-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Annuity Rate Type";
    }

# IPMPV4 ENDS HERE

#MP5002
  OUT MIR-MVA-REMOV-CUT-DT
  {
    DisplayOnly;
    Length = "10";
    DBTableName = "TPH";
    SType = "Date";
    Label = "MVA Cut Off Date";
  }

#MP4801
   OUT MIR-SUBST-CLMT-CUT-DT
   {
    DisplayOnly;
    Length = "10";
    DBTableName = "TPH";
    SType = "Date";
    Label = "Substitute Claimant Rider Cut Off Date";
  }
#* FEID01 changes start

  OUT MIR-LIAB-ISS-CUT-OFF-DT
  {
    Length = "10";
    SType = "Date";
    DBTableName = "TPH";
    Label = "Liability based Issue calculation Cut off Date ";
  }

#* FEID01 changes end
#* MP1541 changes start

  OUT MIR-APL-INT-RT-TYP-CD
  {
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "APL-INT-RT-TYP-CD";
    DBTableName = "TPH";
    SType = "Text";
    Label = "APL Interest Type";
  }
    
#* MP1541 changes end

#* MP173A changes start

    OUT MIR-TAX-DED-CAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TAX-DED-CAT-CD";
        DBTableName = "TPD";
        SType = "Selection";
        Label = "Tax Deduction Category";
    }

#* MP173A changes end
#* TVI005 changes start

  OUT MIR-ADV-PMT-ALLOW-TYP-CD
  {
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "ADV-PMT-ALLOW-TYP-CD";
    DBTableName = "TPH";
    SType = "Text";
    Label = "Advance Payment Allowable Type Code";
  }
  
#* TVI005 changes end
}

