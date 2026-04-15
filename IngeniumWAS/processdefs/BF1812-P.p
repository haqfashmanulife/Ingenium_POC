# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:45 PM EDT

#*******************************************************************************
#*  Component:   BF1812-P.p                                                    *
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
#*  B00016  KRW      ACTIVATE LIST BOX FOR EIA CALCULATION METHOD              *
#*  1CPR01  DEL      NEW FIELDS FOR CONVERSION                                 *
#*  PR0003  FB       NEW FIELD FOR STANDALONE POLICY                           *
#*  HNB004  HIN/MG   NEW EDITS PHASE 1                                         *
#*  HIS007  HIN/LJ   Increase MIR-PYRL-SAV-COMP-LMT length                     *
#*  CR126C  AT       Add minimum sundry C amount                               *
#*  MM0056  BMB      Add Rider Renewal Expiry Date                             *
#*  PR0001  ROC      20% MVA Free Withdrawal                                   *
#*  M00037  CLB      Add minimum sundry D amount                               *
#*  MP0010  PM       Add Renewal Commission Date                               *
#*  MFFFU2  CLB      Add fields for SegFund COI Withdrawal Order               *
#*  PF30    AKATO    PF 3.0 Retrofit 2004AUG10                                 *
#*  MFFFU6  CLB      Add fields for Fund Transfers                             *
#*  IPPIRA  SUG      Add plan group code                                       *
#*  RP1VA2  CTS      ADD NEW FIELDS FOR REPRICING PROJECT                      *
#*  IPMPPU  CTS      ADD PAYOUT MODE FOR IPMP                                  *
#*  IPMPV4  CTS      ADDED ANNUITY PAYOUT TYPE AND ANNUITY RATE TYPE FOR IPMP  *
#*  MP5002  CTS      ADD MVA Removal Cut Off Date                              *
#*  MP4801  CTS      ADD SUBSTITUTE CLAIMANT CUT OFF DATE                      *
#*  FEID01  CTS      ADD LIAB-ISS-CUT-OFF-DT for for LCD Issue Date Calculation*
#*  FEID01           - Online Screen Changes                                   *
#*  MP9713  CTS      ADD NEW FIELDS COI-RPRC-2-DT AND VALN-RPRC-2-DT           *
#*  NWLPSC  CTS      CHANGES DONE TO REMOVE THE POLICY FEE AND MODE FACTORS    * 
#*  NWLPSC           FROM THE PLAN MAINTENANCE SCREENS	                       *
#*  EN9547  CTS      COMMENTED OUT THE VARIABLE MIR-LIVES-INSRD-CD DUE TO      *
#*                   THE DUPLICATE DECLARATION                                 *
#*  MP1541  CTS      ADD NEW FIELD APL-INT-RT-TYP-CD FOR APL PROCESSING        *
#*  MP143A  CTS      ADD NEW FIELD PREM-CALC-MTHD-CD FOR AMI PROCESSING        *
#*  MP173A  CTS      ADDED FIELD FOR TAX CERTIFICATE-TAX DEDUCTION CATEGORY    *
#*  TVI005  CTS      ADD NEW FIELD ADV-PMT-ALLOW-TYP-CD FOR TVI PROCESSING     *
#*  M280A1  CTS      CHANGES DONE TO INCREASE THE LENGTH OF PLAN-BNFT-TYP-CD   *
#*  M280A1           FROM 1 BYTE TO 2 BYTES                                    *
#*******************************************************************************

P-STEP BF1812-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1812";
        BusinessFunctionName = "Plan Description Record Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM0111";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-ACTN-COLCT-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "ACTIV";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Activity Notification Pointer";
    }

    INOUT MIR-ACUM-BRKPT-AMT
    {
        Length = "11";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "Minimum Guaranteed Interest Amount";
    }

    INOUT MIR-ADB-PLAN-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "ADB Reserve Pointer";
    }

    INOUT MIR-ADMIN-FEE-WAV-AMT
    {
        Length = "15";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Administrative Fee Waiver Amount";
    }

    INOUT MIR-AFR-THRSHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AFR-THRSHD-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Face Reduction";
    }

    INOUT MIR-AFR-THRSHD-PERI-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AFR-THRSHD-PERI-CD";
        DBTableName = "TPD";
        SType = "Selection";
        Label = "Threshold Period Indicator";
    }

    INOUT MIR-AGE-CALC-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AGE-CALC-MTHD-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Age Calculation Basis";
    }

    INOUT MIR-AGE-STBCK-STRT-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "Setback Start Age";
    }

    INOUT MIR-ALLOW-CCAS-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Clear Case Indicator";
    }

    INOUT MIR-APL-INT-RT-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "APL Interest Pointer";
    }

    INOUT MIR-APP-FORM-TYP-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "AFTT";
        DBTableName = "TAFTT";
        SType = "Selection";
        Label = "Application Form Type";
    }

    INOUT MIR-APPL-ID
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "APPL";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Administration System";
    }

    INOUT MIR-AUTO-PREM-PMT-IND
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Indicator";
        Label = "FPUL Automatic Premium Payment Indicator";
    }

    INOUT MIR-BASIC-PLAN-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Basic Plan Indicator";
    }

    INOUT MIR-CASM-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "ASMBP";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Assembly Pointer";
    }

    INOUT MIR-CF-INT-CALC-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CF-INT-CALC-TYP-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Interest Calculation Type";
    }

    INOUT MIR-CF-INT-MODE-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CF-INT-MODE-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Interest Handling Mode";
    }

    INOUT MIR-CNTRCT-PREM-IND
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Indicator";
        Label = "Contractual Premium";
    }

    INOUT MIR-CNVR-XPRY-AGE-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Conversion Age or Duration";
    }

    INOUT MIR-CNVR-XPRY-DT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CNVR-XPRY-DT-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Conversion Expiry Type";
    }

    INOUT MIR-COLA-1-PLAN-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "COLA 1 Reserve Pointer";
    }

    INOUT MIR-COLA-2-PLAN-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "COLA 2 Reserve Pointer";
    }

    INOUT MIR-COLA-3-PLAN-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "COLA 3 Reserve Pointer";
    }

    INOUT MIR-COLA-4-PLAN-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "COLA 4 Reserve Pointer";
    }

    INOUT MIR-COLFND-REQIR-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Plan requires a loan collateral fund";
    }

    INOUT MIR-COMM-PLAN-TYP-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "PPCNT";
        DBTableName = "TPD";
        SType = "Selection";
        Label = "Commission Percent Pointer";
    }

    INOUT MIR-COMM-RH-SUB-CD
    {
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "PRHDR";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Commission Rate Header Pointer";
    }

    INOUT MIR-COMM-RT-LOOP-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Renewal Commission Loop Indicator";
    }

    INOUT MIR-COMM-RT-TBAC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "COMM-RT-TBAC-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Commission Rate Code";
    }

    INOUT MIR-COMM-TRG-SSTD-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Commission Target Substandard Indicator";
    }

    INOUT MIR-CSV-CALC-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSV-CALC-MTHD-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Cash Value Calculation Type";
    }

    INOUT MIR-CSV-INT-RT-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "IRTS";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Fund Interest Rate Pointer";
    }

    INOUT MIR-CV-ALLOC-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CV-ALLOC-MTHD-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Policy Cash Value Allocation Method";
    }

    INOUT MIR-CVG-CV-ALLOC-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Coverage Cash Value Allocation Indicator";
    }

    INOUT MIR-CVG-ENHC-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-ENHC-TYP-CD";
        DBTableName = "TPD";
        SType = "Selection";
        Label = "Enhancement Code";
    }

    INOUT MIR-CVG-UL-PU-AGE-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "UL Paid-Up Age/Duration";
    }

    INOUT MIR-CVG-UL-PU-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-UL-PU-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "UL Paid-Up Type";
    }

    INOUT MIR-CVG-XPRY-AGE-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Coverage Expiry Number of Years";
    }

    INOUT MIR-DB-CALC-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DB-CALC-TYP-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Death Benefit Calculation Method";
    }

    INOUT MIR-DFLT-REQIR-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "AATBL";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Age and Amount Requirement Pointer";
    }

    INOUT MIR-DIA-SWP-THRSHD-AMT
    {
        Length = "15";
        DBTableName = "TPD";
        SType = "Currency";
        Label = "Auto Sweep Threshold Amount";
    }

    INOUT MIR-DIA-SWP-THRSHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DIA-SWP-THRSHD-CD";
        DBTableName = "TPD";
        SType = "Selection";
        Label = "Auto Sweep Threshold Indicator";
    }

    INOUT MIR-DIR-DPOS-MIN-AMT
    {
        Length = "13";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Minimum Direct Deposit Amount";
    }

    INOUT MIR-DISP-WTHDR-ORDR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DISP-WTHDR-ORDR-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Tax Processing Withdrawal Order";
    }

    INOUT MIR-DIV-OYT-TBAC-ID
    {
        Length = "5";
        DBTableName = "TPH";
        SType = "Text";
        Label = "One Year Term Pointer";
    }

    INOUT MIR-DIV-PUA-TBAC-ID
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Paid-up Additions Pointer";
    }

    INOUT MIR-DOD-INT-RT-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "IRTS";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Dividend on Deposit - Interest Pointer";
    }

    INOUT MIR-DPOS-WTHDR-ORDR-CD
    {
        Length = "4";
        CodeSource = "DataModel";
        CodeType = "DPOS-WTHDR-ORDR-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Deposit Withdrawal Order";
    }

    INOUT MIR-EIC-INIT-YR-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Years Until First Excess Interest Credit Calculation";
    }

    INOUT MIR-EIC-SUBSEQ-YR-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Years Between Excess Interest Credit Calculations";
    }

    INOUT MIR-ENHC-END-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "Enhancement Cease Age";
    }

    INOUT MIR-ENHC-END-DUR
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Enhancement Cease Anniversary";
    }

    INOUT MIR-ENHC-FREQ-DUR
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Enhancement Frequency Years";
    }

    INOUT MIR-ENHC-HIATUS-DUR
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Enhancement Hiatus Years";
    }

    INOUT MIR-ENHC-NELCT-DUR
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Maximum Non-elect Enhancement";
    }

    INOUT MIR-ENHC-STRT-DUR
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Enhancement Anniversary Start";
    }

    INOUT MIR-ENHC-UWG-FREQ-DUR
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Enhancement Financial Evidence Frequency";
    }

    INOUT MIR-ETI-FACE-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ETI-FACE-CALC-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "ETI Face Amount Calculation Method";
    }

    INOUT MIR-CNVR-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CNVR-TYP-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Conversion Type Code";
    }

    INOUT MIR-LIFE-RSK-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        DBTableName = "TPH";
        CodeType = "LIFE-RSK-TYP-CD";
        SType = "Selection";
        Label = "Type of Life Risk";
    }

    INOUT MIR-HLTH-STYLE-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "HLTH-STYLE-CD";
        SType = "Selection";
        Label = "Type of Life Risk";
    }
#EN9547 CHANGES START HERE	
#    INOUT MIR-LIVES-INSRD-CD
#    {
#        Length = "1";
#        CodeSource = "DataModel";
#        CodeType = "LIVES-INSRD-CD";
#        SType = "Text";
#        Label = "Lives Insured Code";
#    }
#EN9547 CHANGES END HERE
    INOUT MIR-ESC-XPRY-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Early Surrender Charge Expiry Date";
    }

    INOUT MIR-STDALN-DISALLOW-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Standalone Disallowed From Date";
    }

# MM0056 - Plan Renewal Expiry Date field added
    INOUT MIR-PLAN-RENW-XPRY-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Renewal Expiry Date";
    }

    INOUT MIR-PRE-CNVR-PREM-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Lives Insured Code";
    }

    INOUT MIR-LIVES-INSRD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "LIVES-INSRD-CD";
        SType = "Selection";
        Label = "Lives Insured Code";
    }

    INOUT MIR-MIN-FNDVL-ESC-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "MIN FUND EQUALS ESC IND";
    }


    INOUT MIR-ETI-TBAC-ID
    {
        Length = "5";
        DBTableName = "TPH";
        SType = "Text";
        Label = "ETI Calculation Rate Pointer";
    }

    INOUT MIR-FACE-AMT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FACE-AMT-TYP-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Face Amount Type";
    }

    INOUT MIR-FACE-CALC-MTHD-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FACE-CALC-MTHD-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Face Amount Calculation Method";
    }

    INOUT MIR-FPUL-ADDL-PREM-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "FPUL Pour-in Indicator";
    }

    INOUT MIR-FPUL-LOAD-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FPUL-LOAD-TYP-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "FPUL Load Type";
    }

    INOUT MIR-FPU-PLAN-BASE-ID
    {
        Length = "5";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Paid-up Plan";
    }

    INOUT MIR-FREE-LK-INCR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-LK-INCR-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Free Look on Increase Type";
    }

    INOUT MIR-FREE-LK-PRCES-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Subject to free look processing";
    }

    INOUT MIR-FYR-COMM-XTRA-RT
    {
        Length = "5";
        Decimals = "4";
        DBTableName = "TPH";
        SType = "Percent";
        Label = "First Year Extra Commission Percentage";
    }

    INOUT MIR-GAIN-RPT-TIME-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "GAIN-RPT-TIME-CD";
        DBTableName = "TPD";
        SType = "Selection";
        Label = "Tax Gain Reporting Indicator";
    }

    INOUT MIR-GIR-PREM-INCL-IND
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Indicator";
        Label = "GIR Calculation Indicator";
    }

    INOUT MIR-IA-COMM-BAND-1-AMT
    {
        Length = "15";
        DBTableName = "TPD";
        SType = "Currency";
        Label = "IA Commission Band 1 Amount";
    }

    INOUT MIR-IA-COMM-BAND-1-PCT
    {
        Length = "5";
        Decimals = "2";
        DBTableName = "TPD";
        SType = "Percent";
        Label = "IA Commision Band 1 Percent";
    }

    INOUT MIR-IA-COMM-BAND-2-AMT
    {
        Length = "15";
        DBTableName = "TPD";
        SType = "Currency";
        Label = "IA Commission Band 2 Amount";
    }

    INOUT MIR-IA-COMM-BAND-2-PCT
    {
        Length = "5";
        Decimals = "2";
        DBTableName = "TPD";
        SType = "Percent";
        Label = "IA Commission Band 2 Percent";
    }

    INOUT MIR-IA-COMM-BAND-3-AMT
    {
        Length = "15";
        DBTableName = "TPD";
        SType = "Currency";
        Label = "IA Commission Band 3 Amount";
    }

    INOUT MIR-IA-COMM-BAND-3-PCT
    {
        Length = "5";
        Decimals = "2";
        DBTableName = "TPD";
        SType = "Percent";
        Label = "IA Commission Band 3 Percent";
    }

    INOUT MIR-IA-COMM-MAX-AMT
    {
        Length = "13";
        DBTableName = "TPD";
        SType = "Currency";
        Label = "IA Maximum Commission Amount";
    }

    INOUT MIR-IA-INT-LEGAL-ID
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Text";
        Label = "IA Statutory Valuation Rate Scale";
    }

    INOUT MIR-IA-INT-PREM-ID
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Text";
        Label = "IA Premium Valuation Interest Rate Scale";
    }

    INOUT MIR-IA-INT-RT-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PIRTS";
        DBTableName = "TPD";
        SType = "Selection";
        Label = "IA Valuation Interest Pointer";
    }

    INOUT MIR-IA-INT-TAX-ID
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Text";
        Label = "IA Tax Valuation Interest Rate Scale";
    }

    INOUT MIR-IA-MORT-LEGAL-ID
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Text";
        Label = "Statutory Valuation Rate Scale";
    }

    INOUT MIR-IA-MORT-PREM-ID
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Text";
        Label = "IA Premium Mortality Rate Scale";
    }

    INOUT MIR-IA-MORT-TAX-ID
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Text";
        Label = "IA Tax Mortality Rate Scale";
    }

    INOUT MIR-IA-MORT-UVAL-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PUVAL";
        DBTableName = "TPD";
        SType = "Selection";
        Label = "IA Valuation Mortality Pointer";
    }

    INOUT MIR-INDX-INCR-DY-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Interval Days";
    }

    INOUT MIR-INDX-INCR-MO-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Interval Months";
    }

    INOUT MIR-INDX-INCR-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "INDX-INCR-MTHD-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Calculation Method";
    }

    INOUT MIR-INIT-PREM-CHNG-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "Change Initial Age";
    }

    INOUT MIR-INT-ADJ-MAX-DUR
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Interest Adjustment Frequency";
    }

    INOUT MIR-ISWL-CALC-ADV-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "ISWL Advance Notice Days";
    }

    INOUT MIR-ISWL-CALC-FREQ-DUR
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "ISWL Recalculation Frequency";
    }

    INOUT MIR-ISWL-FRST-CALC-DUR
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "ISWL First Recalculation Anniversary";
    }

    INOUT MIR-ISWL-PREM-VAR-RT
    {
        Length = "5";
        Decimals = "5";
        DBTableName = "TPH";
        SType = "Percent";
        Label = "ISWL Recalculation - Minimum Variance";
    }

    INOUT MIR-LBILL-MODE-FEE-AMT
    {
        Length = "9";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Listbill Flat Amount per Mode";
    }

    INOUT MIR-LOAN-INT-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "LOAN-INT-CALC-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Loan Interest Calculation Method";
    }

    INOUT MIR-LOAN-INT-RT-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Loan Interest Rate Pointer";
    }

    INOUT MIR-LOAN-INT-RT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "LOAN-INT-RT-TYP-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Loan Interest Type";
    }

    INOUT MIR-LOC-GR-COLCT-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "LOCPT";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Group Location Pointer";
    }

    INOUT MIR-LTA-PLAN-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Lifetime Accident Reserve Pointer";
    }

    INOUT MIR-LTB-PLAN-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Lifetime Benefit Reserve Pointer";
    }

    INOUT MIR-MAJ-LN-SORT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MAJ-LN-SORT-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Major Line Sort Key";
    }

    INOUT MIR-MAT-CHRG-RTBL2-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PCNT";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Maturity Charge Rate Pointer";
    }

    INOUT MIR-MAT-DT-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MAT-DT-CALC-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Maturity Indicator";
    }

    INOUT MIR-MAX-LMPSM-FCT
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "MAX-LMPSM-FCT";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Maximum Lump Sum Multiplier";
    }

    INOUT MIR-MAX-ROLOVR-DY-DUR
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Guaranteed Term Maximum Months/Days";
    }

    INOUT MIR-MAX-SNDRY-A-AMT
    {
        Length = "13";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Max Sundry A Amount";
    }

    INOUT MIR-MAX-SNDRY-AMT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MAX-SNDRY-AMT-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Max Sundry Amount Code";
    }

    INOUT MIR-MAX-SNDRY-B-AMT
    {
        Length = "13";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Max Sundry B Amount";
    }

    INOUT MIR-MAX-SNDRY-COI-QTY
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "MAX-SNDRY-COI-QTY";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Max Sundry COI Quantity";
    }

    INOUT MIR-MCV-CALC-REQIR-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Calculate minimum cash value";
    }

    INOUT MIR-MCV-INT-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MCV-INT-MTHD-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "MCV Interest Calculation Method";
    }

    INOUT MIR-MCV-PMT-LOAD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MCV-PMT-LOAD-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "MCV Payment Load Order";
    }

    INOUT MIR-MIN-CASL-PAYO-AMT
    {
        Length = "13";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Minimum RRIF/LIF Casual Payout Amount";
    }

    INOUT MIR-MIN-ROLOVR-DY-DUR
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Guaranteed Term Minimum Months/Days";
    }

    INOUT MIR-MIN-SNDRY-A-AMT
    {
        Length = "13";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Min Sundry A Amount";
    }

    INOUT MIR-MIN-SNDRY-AMT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MIN-SNDRY-AMT-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Min Sundry Amount Code";
    }

    INOUT MIR-MIN-SNDRY-B-AMT
    {
        Length = "13";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Min Sundry B Amount";
    }

    INOUT MIR-MIN-SNDRY-C-AMT
    {
        Length = "13";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Min Sundry C Amount";
    }

    INOUT MIR-MIN-SNDRY-D-AMT
    {
        Length = "13";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Min Sundry D Amount";
    }

    INOUT MIR-MNPMT-TRG-SSTD-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Minimum Payment Target Substandard Indicator";
    }

    INOUT MIR-MORT-XPNS-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MORT-XPNS-CALC-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Mortality and Expense Calculation Type";
    }

    INOUT MIR-MORT-XPNS-CHRG-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "Mortality and Expense Age";
    }

    INOUT MIR-MORT-XPNS-CHRG-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Mortality and Expense Duration";
    }
# NWLPSC CHANGES
#    INOUT MIR-MTHLY-PFEE-FCT
#    {
#        Length = "8";
#        Decimals = "7";
#        DBTableName = "TPD";
#        SType = "Number";
#        Label = "Monthly Policy Fee Factor";
#    }

    INOUT MIR-NF-PRCES-MO-DUR
    {
        Length = "4";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Months & Days Prior to Non-Forfeiture/Lapse";
    }

    INOUT MIR-NOTI-DEPT-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DEPT";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Notify Department";
    }

    INOUT MIR-NOTI-DT-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "NOTI-DT-CALC-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Notify Date Calculation Indicator";
    }

    INOUT MIR-NOTI-HIGH-AGE-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Last Notify Age";
    }

    INOUT MIR-NOTI-LOW-AGE-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Notify Age or Years";
    }

    INOUT MIR-NUM-GIR-OPT-QTY
    {
        Length = "2";
        DBTableName = "TPD";
        SType = "Text";
        Label = "Number of GIR Options";
    }

    INOUT MIR-OVRID-FRST-DGT-CD
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Text";
        Label = "Agent Situation";
    }

    INOUT MIR-OWN-OCCP-PLAN-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Own Occupation Reserve Pointer";
    }

    INOUT MIR-OWN-OCCP-XPRY-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "Own Occupation Expiry Age";
    }

    INOUT MIR-PAC-DPOS-MIN-AMT
    {
        Length = "13";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Minimum PAC Deposit Amount";
    }

    INOUT MIR-PAC-MODE-FEE-AMT
    {
        Length = "9";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "PAC Flat Charge per Mode";
    }
# NWLPSC CHANGES
#    INOUT MIR-PAC-MTHLY-PFEE-FCT
#    {
#        Length = "8";
#        Decimals = "7";
#        DBTableName = "TPD";
#        SType = "Number";
#        Label = "Monthly PAC Policy Fee Factor";
#    }
#
#    INOUT MIR-PAC-QTR-PFEE-FCT
#    {
#        Length = "8";
#        Decimals = "7";
#        DBTableName = "TPD";
#        SType = "Number";
#        Label = "Quarterly PAC Policy Fee Factor";
#    }
#
#    INOUT MIR-PAC-SEMI-ANN-FCT
#    {
#        Length = "8";
#        Decimals = "7";
#        DBTableName = "TPD";
#        SType = "Number";
#        Label = "Semi-Annual PAC Mode Factor";
#    }
#
#    INOUT MIR-PAC-SEMI-PFEE-FCT
#    {
#        Length = "8";
#        Decimals = "7";
#        DBTableName = "TPD";
#        SType = "Number";
#        Label = "Semi-Annual PAC Policy Fee Factor";
#    }

    INOUT MIR-PDF-INT-RT-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "IRTS";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "PDF Interest Rate Pointer";
    }

    INOUT MIR-PDISAB-PLAN-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Partial Disability Reserve Pointer";
    }

    INOUT MIR-PDISAB-XPRY-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "Partial Disability Expiry Age";
    }

    INOUT MIR-PERI-STMT-DY-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Duration Days";
    }

    INOUT MIR-PERI-STMT-MO-DUR
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Duration Months";
    }

    INOUT MIR-PERI-STMT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PERI-STMT-TYP-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Type of Statement";
    }

    INOUT MIR-PLAN-7702-MXDX-ID
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "7702 Net Single Premium Pointer";
    }

    INOUT MIR-PLAN-ACCT-TYP-CD
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Text";
        Label = "2nd Digit of GL Account";
    }

    INOUT MIR-PLAN-ADB-XPRY-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "ADB Expiry Age";
    }

    INOUT MIR-PLAN-ADMIN-FEE-AMT
    {
        Length = "11";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Annual Administration Fee Amount";
    }

    INOUT MIR-PLAN-AGE-STBCK-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-AGE-STBCK-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Female Setback Type";
    }

    INOUT MIR-PLAN-AGE-STBCK-QTY
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Female Setback Years";
    }

    INOUT MIR-PLAN-BASE-XPRY-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "Policy Expiry Age";
    }

    INOUT MIR-PLAN-BNFT-TYP-CD
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

    INOUT MIR-PLAN-BON-EFF-DY
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Day";
        Label = "Annual Bonus Effective Days";
    }

    INOUT MIR-PLAN-BON-EFF-MO
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Month";
        Label = "Annual Bonus Effective Month";
    }

    INOUT MIR-PLAN-BON-INT-RT-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Bonus Interest Rate Pointer";
    }

    INOUT MIR-PLAN-BUS-CLAS-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CLASS";
        DBTableName = "TPD";
        SType = "Selection";
        Label = "Class of Business";
    }

    INOUT MIR-PLAN-CF-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-CF-TYP-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Cash Flow Type";
    }

    INOUT MIR-PLAN-COLA-XPRY-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "COLA Expiry Age";
    }

    INOUT MIR-PLAN-COLFND-IND
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Indicator";
        Label = "Plan is a loan collateral fund";
    }

    INOUT MIR-PLAN-CPREM-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-CPREM-CALC-CD";
        DBTableName = "TPD";
        SType = "Selection";
        Label = "Commission Calculation Method";
    }

    INOUT MIR-PLAN-CSV-DT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-CSV-DT-TYP-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Cash Value Calculated Type";
    }

    INOUT MIR-PLAN-CVG-LOAN-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Coverage Loan Indicator";
    }

    INOUT MIR-PLAN-CVG-PFEE-AMT
    {
        Length = "9";
        DBTableName = "TPD";
        SType = "Currency";
        Label = "Plan as Additional Coverage Policy Fee Amount";
    }

    INOUT MIR-PLAN-CVG-XPRY-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "Coverage Expiry Age";
    }

    INOUT MIR-PLAN-DIV-INT-RT-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Dividend Interest Rate Pointer";
    }

    INOUT MIR-PLAN-DUR-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-DUR-TYP-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Payor Waiver Expiry Indicator";
    }

    INOUT MIR-PLAN-EFF-DT
    {
        Length = "10";
        DBTableName = "TPH";
        SType = "Date";
        Label = "Plan Effective Date";
    }

    INOUT MIR-PLAN-EIC-FREQ-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-EIC-FREQ-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Excess Interest Credit Frequency";
    }

    INOUT MIR-PLAN-GUAR-INT-RT
    {
        Length = "5";
        Decimals = "5";
        DBTableName = "TPH";
        SType = "Percent";
        Label = "Minimum Guaranteed Interest Rate";
    }

    INOUT MIR-PLAN-IA-PFEE-AMT
    {
        Length = "11";
        DBTableName = "TPD";
        SType = "Currency";
        Label = "IA Policy Fee Amount";
    }

    INOUT MIR-PLAN-IMPRD-INT-RT
    {
        Length = "5";
        Decimals = "5";
        DBTableName = "TPH";
        SType = "Percent";
        Label = "Loan Interest Impairment Rate";
    }

    INOUT MIR-PLAN-IMPRD-RT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-IMPRD-RT-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Loan Interest Impairment Indicator";
    }

    INOUT MIR-PLAN-INS-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-INS-TYP-CD";
        DBTableName = "TPD";
        SType = "Selection";
        Label = "Type of Insurance";
    }

    INOUT MIR-PLAN-INT-PAYO-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "PLAN-INT-PAYO-CD";
        DBTableName = "TPD";
        SType = "Selection";
        Label = "Interest Handling Indicator";
    }

    INOUT MIR-PLAN-ISS-DT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-ISS-DT-TYP-CD";
        DBTableName = "TPD";
        SType = "Selection";
        Label = "Date Rule";
    }

    INOUT MIR-PLAN-LOAN-INT-RT
    {
        Length = "5";
        Decimals = "5";
        DBTableName = "TPH";
        SType = "Percent";
        Label = "Loan Interest Rate";
    }

    INOUT MIR-PLAN-LOCK-FND-IND
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Indicator";
        Label = "Locked in Funds Indicator";
    }

    INOUT MIR-PLAN-LOC-LIC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-LOC-LIC-CD";
        DBTableName = "TPD";
        SType = "Selection";
        Label = "Product License Indicator";
    }

    INOUT MIR-PLAN-LTA-XPRY-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "LTA Expiry Age";
    }

    INOUT MIR-PLAN-LTB-XPRY-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "LTB Expiry Age";
    }

    INOUT MIR-PLAN-MAT-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "Plan Maturity Age";
    }

    INOUT MIR-PLAN-MAT-AGE-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Plan Maturity Years";
    }

    INOUT MIR-PLAN-MDRT-CLAS-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-MDRT-CLAS-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "MDRT Class";
    }

    INOUT MIR-PLAN-MIN-MPREM-QTY
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Minimum Inforce Premiums";
    }

    INOUT MIR-PLAN-MKTVAL-ADJ-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-MKTVAL-ADJ-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Market Value Adjustment Calculation";
    }

    INOUT MIR-PLAN-MODE-FEE-AMT
    {
        Signed;
        Length = "9";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Flat Charge Amount per Mode";
    }
# NWLPSC CHANGES
#    INOUT MIR-PLAN-MTHLY-FCT
#    {
#        Length = "8";
#        Decimals = "7";
#        DBTableName = "TPD";
#        SType = "Number";
#        Label = "Monthly Mode Factor";
#    }

    INOUT MIR-PLAN-NAR-DSCNT-RT
    {
        Length = "9";
        Decimals = "8";
        DBTableName = "TPH";
        SType = "Percent";
        Label = "Risk Rate Divisor";
    }

    INOUT MIR-PLAN-NOTI-REASN-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "NOTRE";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Notify Reason";
    }
# NWLPSC CHANGES
#    INOUT MIR-PLAN-PAC-MTHLY-FCT
#    {
#        Length = "8";
#        Decimals = "7";
#        DBTableName = "TPD";
#        SType = "Number";
#        Label = "Monthly PAC Mode Factor";
#    }
#
#    INOUT MIR-PLAN-PAC-QTR-FCT
#    {
#        Length = "8";
#        Decimals = "7";
#        DBTableName = "TPD";
#        SType = "Number";
#        Label = "Quarterly PAC Mode Factor";
#    }

    INOUT MIR-PLAN-PAR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-PAR-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Dividend Participation Indicator";
    }

    INOUT MIR-PLAN-PAYO-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-PAYO-MTHD-CD";
        DBTableName = "TPD";
        SType = "Selection";
        Label = "Contractual Payout Option";
    }

    INOUT MIR-PLAN-PFEE-AMT
    {
        Length = "9";
        DBTableName = "TPD";
        SType = "Currency";
        Label = "Base Policy Fee Amount";
    }
# NWLPSC CHANGES
#    INOUT MIR-PLAN-QTR-FCT
#    {
#        Length = "8";
#        Decimals = "7";
#        DBTableName = "TPD";
#        SType = "Number";
#        Label = "Quarterly Mode Factor";
#    }
#
#    INOUT MIR-PLAN-QTR-PFEE-FCT
#    {
#        Length = "8";
#        Decimals = "7";
#        DBTableName = "TPD";
#        SType = "Number";
#        Label = "Quarterly Policy Fee Factor";
#    }

    INOUT MIR-PLAN-REG-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Registration Indicator";
    }

    INOUT MIR-PLAN-REINST-DY-DUR
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "PLAN-REINST-DY-DUR";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Time Limit in Days";
    }

    INOUT MIR-PLAN-REINST-MO-DUR
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "PLAN-REINST-MO-DUR";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Time Limit in Months";
    }

    INOUT MIR-PLAN-REINST-LMT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-REINST-LMT-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Time Limit Calculation Start Date";
    }

    INOUT MIR-PLAN-ROLOVR-DT-IND
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Indicator";
        Label = "Maturity/Expiry Rollover Override Indicator";
    }

    INOUT MIR-PLAN-ROLOVR-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-ROLOVR-TYP-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Guaranteed Term Rollover Type";
    }

    INOUT MIR-PLAN-RPU-DIV-RT
    {
        Length = "5";
        Decimals = "5";
        DBTableName = "TPH";
        SType = "Percent";
        Label = "RPU Dividend Calculation Percentage";
    }

    INOUT MIR-PLAN-RSRV-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-RSRV-CALC-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Reserve Calculation Method";
    }

    INOUT MIR-PLAN-RULE-TYP-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-RULE-TYP-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Face Amount Calculation Rule Type";
    }
# NWLPSC CHANGES
#    INOUT MIR-PLAN-SEMI-ANN-FCT
#    {
#        Length = "8";
#        Decimals = "7";
#        DBTableName = "TPD";
#        SType = "Number";
#        Label = "Semi-Annual Mode Factor";
#    }

    INOUT MIR-PLAN-SUPP-BNFT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-SUPP-BNFT-CD";
        DBTableName = "TPD";
        SType = "Selection";
        Label = "Supplemental Benefit Indicator";
    }

    INOUT MIR-PLAN-SURR-CHRG-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-SURR-CHRG-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Surrender Charge Rate Code";
    }

    INOUT MIR-PLAN-TAMRA-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "TAMRA Seven Pay Indicator";
    }

    INOUT MIR-PLAN-TAMRA-MXDX-ID
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "TAMRA Seven Pay Pointer";
    }

    INOUT MIR-PLAN-TAX-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-TAX-TYP-CD";
        DBTableName = "TPD";
        SType = "Selection";
        Label = "Tax Processing Indicator";
    }

    INOUT MIR-PLAN-TAXWH-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Withhold tax on disposition";
    }

    INOUT MIR-PLAN-TXEMP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-TXEMP-CD";
        DBTableName = "TPD";
        SType = "Selection";
        Label = "Tax Exempt Indicator";
    }

    INOUT MIR-PLAN-UNIT-VALU-AMT
    {
        Length = "7";
        Decimals = "0";
        DBTableName = "TPD";
        SType = "Currency";
        Label = "Value Per Unit";
    }

    INOUT MIR-PLAN-UWG-IND
    {
        Length = "40";
        DBTableName = "TPD";
        SType = "Indicator";
        Label = "Underwriting Required Indicator";
    }

    INOUT MIR-PLAN-VPO-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Vanishing Premium Option Indicator";
    }

    INOUT MIR-PLAN-WP-XPRY-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "Waiver of Premium Expiry Age";
    }

    INOUT MIR-PLAN-WP-XPRY-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-WP-XPRY-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Waiver Base Coverage Dependency";
    }

    INOUT MIR-PLAN-WTHDR-ORDR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-WTHDR-ORDR-CD";
        DBTableName = "TPD";
        SType = "Selection";
        Label = "Fund Withdrawal Order Indicator";
    }

    INOUT MIR-PLAN-XPRY-DT
    {
        Length = "10";
        DBTableName = "TPH";
        SType = "Date";
        Label = "Plan Expiry Date";
    }

    INOUT MIR-PMT-ALLOC-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PMT-ALLOC-MTHD-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Deposit Allocation Method";
    }

    INOUT MIR-PMT-LOAD-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PMT-LOAD-CALC-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Payment Load Rate Code";
    }

    INOUT MIR-PMT-LOAD-FLAT-AMT
    {
        Length = "11";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Payment Load Flat Amount";
    }

    INOUT MIR-PMT-LOAD-ORDR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PMT-LOAD-ORDR-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Payment Load Order";
    }

    INOUT MIR-PMT-LOAD-RTBL2-ID
    {
        Length = "5";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Payment Load Percent Table Pointer";
    }

    INOUT MIR-PMT-LOAD-SSTD-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Payment Load Target Substandard Rate Indicator";
    }

    INOUT MIR-PNSN-QUALF-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Plan is qualified";
    }

    INOUT MIR-POL-FND-SRVBEN-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-FND-SRVBEN-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Fund Survivorship Benefit Type";
    }

    INOUT MIR-POL-FND-SRVBEN-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Fund Survivorship Benefit Duration";
    }

    INOUT MIR-POL-XPRY-AGE-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Policy Expiry Number of Years";
    }

    INOUT MIR-PREM-CALC-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PREM-CALC-TYP-CD";
        DBTableName = "TPD";
        SType = "Selection";
        Label = "Premium Calculation Type";
    }

    INOUT MIR-PREM-CHNG-AGE-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Premium Change Age\Duration";
    }

    INOUT MIR-PREM-CHNG-DT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PREM-CHNG-DT-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Premium Change Indicator";
    }

    INOUT MIR-PREM-PAY-UVAL-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "UVAL";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Unit Value Pointer - Premium Paying";
    }

    INOUT MIR-PREM-RECALC-OPT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PREM-RECALC-OPT-CD";
        DBTableName = "TPD";
        SType = "Selection";
        Label = "ISWL Premium Recalculation Option";
    }

    INOUT MIR-PREM-RENW-RT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PREM-RENW-RT-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Renewal Premium Indicator";
    }

#* MP143A changes start
    
    INOUT MIR-PREM-CALC-MTHD-CD   
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PREM-CALC-MTHD-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "premium calculation method code";
    }

#* MP143A changes end

    INOUT MIR-PSUR-CHRG-FLAT-AMT
    {
        Length = "11";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Partial Surrender Charge Flat Amount";
    }

    INOUT MIR-PSUR-CHRG-RTBL2-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PCNT";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Partial Surrender Charge Percent Table Pointer";
    }

    INOUT MIR-PSUR-CHRG-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PSUR-CHRG-TYP-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Partial Surrender Charge Type";
    }

    INOUT MIR-PUA-DIV-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PUA-DIV-CALC-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Calculation Method for Paid-up Additions";
    }

    INOUT MIR-PU-UVAL-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "UVAL";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Unit Value Pointer - Paid-up";
    }

    INOUT MIR-PYRL-SAV-COMP-LMT
    {
        Length = "13";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Payroll Savings Component Limit";
    }

    INOUT MIR-REDC-EP-PLAN-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Elimination Period/Hospital Benefit Reserve Pointer";
    }

    INOUT MIR-REDC-EP-XPRY-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "Elimination Period/Hospital Benefit Expiry Age";
    }

    INOUT MIR-RPU-TBAC-ID
    {
        Length = "5";
        DBTableName = "TPH";
        SType = "Text";
        Label = "RPU Calculation Rate Pointer";
    }

    INOUT MIR-SE-GDLN-APREM-IND
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Indicator";
        Label = "Calculate SEC premiums";
    }
#  NWLPSC CHANGES
#    INOUT MIR-SEMI-ANN-PFEE-FCT
#    {
#        Length = "8";
#        Decimals = "7";
#        DBTableName = "TPD";
#        SType = "Number";
#        Label = "Semi-Annual Policy Fee Factor";
#    }

    INOUT MIR-SFB-NEG-SUSP-IND
    {
        Length = "1";
        DBTableName = "TPD";
        SType = "Indicator";
        Label = "Special Frequency Billing Allows Negative Suspense";
    }

    INOUT MIR-SFB-NEG-SUSP-QTY
    {
        Length = "2";
        DBTableName = "TPD";
        SType = "Text";
        Label = "Special Frequency Billing Limit (Months)";
    }

    INOUT MIR-SUM-INS-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SUM-INS-CALC-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Sum Insured Calculation Method";
    }

    INOUT MIR-SURR-ADJ-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SURR-ADJ-CALC-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Monthiversary Adjustment Method";
    }

    INOUT MIR-SURR-ADJ-MO-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Monthiversary Adjustment Months";
    }

    INOUT MIR-SURR-ADJ-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SURR-ADJ-TYP-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Monthiversary Adjustment Type";
    }

    INOUT MIR-SURR-CHRG-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SURR-CHRG-CALC-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Partial Surrender Rate Type";
    }

    INOUT MIR-MIN-WTHDR-AMT
    {
        Length = "13";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Minimum Withdrawal Amount";
    }

    INOUT MIR-SURR-CHRG-FLAT-AMT
    {
        Length = "11";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Surrender Charge Flat Amount";
    }

    INOUT MIR-SURR-CHRG-RTBL2-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PCNT";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Surrender Charge Percent Table Pointer";
    }

    INOUT MIR-SURR-CHRG-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SURR-CHRG-TYP-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Surrender Charge Method";
    }

    INOUT MIR-SURR-TRG-SSTD-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Surrender Target Substandard Indicator";
    }

    INOUT MIR-T5-REG-TITL-TXT
    {
        Length = "13";
        DBTableName = "TPH";
        SType = "Text";
        Label = "T5 Title if Registered";
    }

    INOUT MIR-TRAIL-COMM-BEG-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Trail Start Delay";
    }

    INOUT MIR-TRAIL-COMM-FREQ-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TRAIL-COMM-FREQ-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Trail Commission Frequency";
    }

    INOUT MIR-TRAIL-COMM-LAG-DUR
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Trail Commission Lag Period";
    }

    INOUT MIR-TRM-PREM-RFND-RT
    {
        Signed;
        Length = "5";
        Decimals = "4";
        DBTableName = "TPH";
        SType = "Percent";
        Label = "Percentage of Premium to Refund";
    }

    INOUT MIR-ULT-PREM-CHNG-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TPH";
        SType = "Number";
        Label = "Ultimate Premium Change Age";
    }

    INOUT MIR-UWG-FACE-AMT-FCT
    {
        Length = "3";
        Decimals = "2";
        DBTableName = "TPD";
        SType = "Number";
        Label = "Underwriting Multiplier";
    }

    INOUT MIR-VALN-LBL-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "RLBL";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Valuation Header";
    }

    INOUT MIR-WP-PLAN-ID
    {
        Length = "6";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Waiver of Premium Reserve Pointer";
    }

    INOUT MIR-XEMP-TST-UVAL-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "UVAL";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Exemption Test Rate Pointer";
    }

    INOUT MIR-XPRY-DT-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "XPRY-DT-CALC-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Expiry Date Calculation Method";
    }

    INOUT MIR-PLAN-INIT-PMT-IND
    {
        Length = "1";
        DBTableName = "TPH";
        SType = "Indicator";
        Label = "Initial Payment Indicator";
    }

    INOUT MIR-RENW-COMM-DT
    {
        Length = "10";
        DBTableName = "TPH";
        SType = "Date";
        Label = "Renewal Commission Date";
    }

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

    INOUT MIR-COI-WTHDR-RULE-CD
    {
        Length = "2";
        DBTableName = "TPH";
        SType = "Text";
        Label = "COI Withdrawal Rule";
    }

    INOUT MIR-COI-PLAN-ORDR-CD
    {
        Length = "3";
        DBTableName = "TPH";
        SType = "Text";
        Label = "COI Withdrawal Plan Level Order";
    }

    INOUT MIR-MIN-XFER-AMT
    {
        Length = "13";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Minimum Transfer Amount";
    }

# IPPIRA - Plan group code added
    INOUT MIR-PLAN-GR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-GR-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Plan Group Code";
    }

# RP1VA2 - COI REPRICED DATE FIELD ADDED
    INOUT MIR-COI-RPRC-DT
    {
        Length = "10";
        DBTableName = "TPH";
        SType = "Date";
        Label = "COI Repricing Effective Date";
    }

# RP1VA2 - VALUATION REPRICED DATE FIELD ADDED
    INOUT MIR-VALN-RPRC-DT
    {
        Length = "10";
        DBTableName = "TPH";
        SType = "Date";
        Label = "Valuation Repricing Effective Date";
    }

# MP9713 - COI REPRICED DATE-2 FIELD ADDED
    INOUT MIR-COI-RPRC-2-DT
    {
       Length = "10";
       DBTableName = "TPH";
       SType = "Date";
       Label = "COI Repricing Effective Date-2";
    }

# MP9713 - VALUATION REPRICED DATE-2 FIELD ADDED
    INOUT MIR-VALN-RPRC-2-DT
    {
        Length = "10";
        DBTableName = "TPH";
        SType = "Date";
        Label = "Valuation Repricing Effective Date-2";
    }

# IPMPPU
    INOUT MIR-PLAN-PAYO-MODE-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "PLAN-PAYO-MODE-CD";
        DBTableName = "TPD";
        SType = "Selection";
        Label = "Payout Mode";
    }

# IPMPV4 STARTS HERE
    INOUT MIR-ANTY-PAYO-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ANTY-PAYO-TYP-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Annuity Payout Type";
    }

    INOUT MIR-ANTY-RT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ANTY-RT-TYP-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Annuity Rate Type";
    }

# IPMPV4 ENDS HERE
# MP5002
    INOUT MIR-MVA-REMOV-CUT-DT
    {
        Length = "10";
        DBTableName = "TPH";
        SType = "Date";
        Label = "MVA Removal Cut Off Date";
    }

# MP4801
    INOUT MIR-SUBST-CLMT-CUT-DT
   {
        Length = "10";
        DBTableName = "TPH";
        SType = "Date";
        Label = "Substitute Claimant Rider Cut Off Date";
  }

#* FEID01 changes start

    INOUT MIR-LIAB-ISS-CUT-OFF-DT
    {
        Length = "10";
        SType = "Date";
        DBTableName = "TPH";
        Label = "Liability based Issue calculation Cut Off Date ";
    }

#* FEID01 changes end

#* MP1541 changes start

    INOUT MIR-APL-INT-RT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "APL-INT-RT-TYP-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "APL Interest Type";
    }

#* MP1541 changes end 

#* MP173A changes start

    INOUT MIR-TAX-DED-CAT-CD 
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

    INOUT MIR-ADV-PMT-ALLOW-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ADV-PMT-ALLOW-TYP-CD";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Advance Payment Allowable Type Code";
    }
  
#* TVI005 changes end
}

