# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:06 PM EDT

#*******************************************************************************
#*  Component:   BF9028-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  PF13    TBA      s-step name was listed as BF1812-O, This was corrected.   *
#*                                                                             *
#*******************************************************************************
 
S-STEP BF9028-O
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

	IN MIR-ACTN-COLCT-ID 
	{
		DisplayOnly;
		Length = "6";
		CodeSource = "EDIT";
		CodeType = "ACTIV";
		SType = "Text";
		Label = "Activity Notification Pointer";
	}

	IN MIR-ACUM-BRKPT-AMT 
	{
		DisplayOnly;
		Length = "11";
		Decimals = "0";
		SType = "Number";
		Label = "Minimum Guaranteed Interest Amount";
	}

	IN MIR-ADB-PLAN-ID 
	{
		DisplayOnly;
		Length = "6";
		SType = "Text";
		Label = "ADB Reserve Pointer";
	}

	IN MIR-ADMIN-FEE-WAV-AMT 
	{
		DisplayOnly;
		Length = "15";
		SType = "Currency";
		Label = "Administrative Fee Waiver Amount";
	}

	IN MIR-AFR-THRSHD-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "AFR-THRSHD-CD";
		SType = "Text";
		Label = "Face Reduction";
	}

	IN MIR-AFR-THRSHD-PERI-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "AFR-THRSHD-PERI-CD";
		SType = "Text";
		Label = "Threshold Period Indicator";
	}

	IN MIR-AGE-CALC-MTHD-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "AGE-CALC-MTHD-CD";
		SType = "Text";
		Label = "Age Calculation Basis";
	}

	IN MIR-AGE-STBCK-STRT-AGE 
	{
		DisplayOnly;
		Length = "3";
		Decimals = "0";
		SType = "Number";
		Label = "Setback Start Age";
	}

	IN MIR-ALLOW-CCAS-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Clear Case Indicator";
	}

	IN MIR-APL-INT-RT-ID 
	{
		DisplayOnly;
		Length = "6";
		SType = "Text";
		Label = "APL Interest Pointer";
	}

	IN MIR-APP-FORM-TYP-ID 
	{
		DisplayOnly;
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "AFTT";
		SType = "Text";
		Label = "Application Form Type";
	}

	IN MIR-APPL-ID 
	{
		DisplayOnly;
		Length = "2";
		CodeSource = "XTAB";
		CodeType = "APPL";
		SType = "Text";
		Label = "Administration System";
	}

	IN MIR-AUTO-PREM-PMT-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "FPUL Automatic Premium Payment Indicator";
	}

	IN MIR-BASIC-PLAN-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Basic Plan Indicator";
	}

	IN MIR-CASM-ID 
	{
		DisplayOnly;
		Length = "6";
		CodeSource = "EDIT";
		CodeType = "ASMBP";
		SType = "Text";
		Label = "Assembly Pointer";
	}

	IN MIR-CF-INT-CALC-TYP-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "CF-INT-CALC-TYP-CD";
		SType = "Text";
		Label = "Interest Calculation Type";
	}

	IN MIR-CF-INT-MODE-CD 
	{
		DisplayOnly;
		Length = "2";
		CodeSource = "DataModel";
		CodeType = "CF-INT-MODE-CD";
		SType = "Text";
		Label = "Interest Handling Mode";
	}

	IN MIR-CNTRCT-PREM-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Contractual Premium";
	}

	IN MIR-CNVR-XPRY-AGE-DUR 
	{
		DisplayOnly;
		Length = "3";
		SType = "Text";
		Label = "Conversion Age or Duration";
	}

	IN MIR-CNVR-XPRY-DT-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "CNVR-XPRY-DT-CD";
		SType = "Text";
		Label = "Conversion Expiry Type";
	}

	IN MIR-COLA-1-PLAN-ID 
	{
		DisplayOnly;
		Length = "6";
		SType = "Text";
		Label = "COLA 1 Reserve Pointer";
	}

	IN MIR-COLA-2-PLAN-ID 
	{
		DisplayOnly;
		Length = "6";
		SType = "Text";
		Label = "COLA 2 Reserve Pointer";
	}

	IN MIR-COLA-3-PLAN-ID 
	{
		DisplayOnly;
		Length = "6";
		SType = "Text";
		Label = "COLA 3 Reserve Pointer";
	}

	IN MIR-COLA-4-PLAN-ID 
	{
		DisplayOnly;
		Length = "6";
		SType = "Text";
		Label = "COLA 4 Reserve Pointer";
	}

	IN MIR-COLFND-REQIR-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Plan requires a loan collateral fund";
	}

	IN MIR-COMM-PLAN-TYP-CD 
	{
		DisplayOnly;
		Length = "2";
		CodeSource = "EDIT";
		CodeType = "PPCNT";
		SType = "Text";
		Label = "Commission Percent Pointer";
	}

	IN MIR-COMM-RH-SUB-CD 
	{
		DisplayOnly;
		Length = "4";
		CodeSource = "EDIT";
		CodeType = "PRHDR";
		SType = "Text";
		Label = "Commission Rate Header Pointer";
	}

	IN MIR-COMM-RT-LOOP-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Renewal Commission Loop Indicator";
	}

	IN MIR-COMM-RT-TBAC-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "COMM-RT-TBAC-CD";
		SType = "Text";
		Label = "Commission Rate Code";
	}

	IN MIR-COMM-TRG-SSTD-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Commission Target Substandard Indicator";
	}

	IN MIR-CSV-CALC-MTHD-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "CSV-CALC-MTHD-CD";
		SType = "Text";
		Label = "Cash Value Calculation Type";
	}

	IN MIR-CSV-INT-RT-ID 
	{
		DisplayOnly;
		Length = "6";
		CodeSource = "EDIT";
		CodeType = "IRTS";
		SType = "Text";
		Label = "Fund Interest Rate Pointer";
	}

	IN MIR-CV-ALLOC-MTHD-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "CV-ALLOC-MTHD-CD";
		SType = "Text";
		Label = "Policy Cash Value Allocation Method";
	}

	IN MIR-CVG-CV-ALLOC-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Coverage Cash Value Allocation Indicator";
	}

	IN MIR-CVG-ENHC-TYP-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "CVG-ENHC-TYP-CD";
		SType = "Text";
		Label = "Enhancement Code";
	}

	IN MIR-CVG-UL-PU-AGE-DUR 
	{
		DisplayOnly;
		Length = "3";
		SType = "Text";
		Label = "UL Paid-Up Age/Duration";
	}

	IN MIR-CVG-UL-PU-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "CVG-UL-PU-CD";
		SType = "Text";
		Label = "UL Paid-Up Type";
	}

	IN MIR-CVG-XPRY-AGE-DUR 
	{
		DisplayOnly;
		Length = "3";
		SType = "Text";
		Label = "Coverage Expiry Number of Years";
	}

	IN MIR-DB-CALC-TYP-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "DB-CALC-TYP-CD";
		SType = "Text";
		Label = "Death Benefit Calculation Method";
	}

	IN MIR-DFLT-REQIR-ID 
	{
		DisplayOnly;
		Length = "6";
		CodeSource = "EDIT";
		CodeType = "AATBL";
		SType = "Text";
		Label = "Age and Amount Requirement Pointer";
	}

	IN MIR-DIA-SWP-THRSHD-AMT 
	{
		DisplayOnly;
		Length = "15";
		SType = "Currency";
		Label = "Auto Sweep Threshold Amount";
	}

	IN MIR-DIA-SWP-THRSHD-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "DIA-SWP-THRSHD-CD";
		SType = "Text";
		Label = "Auto Sweep Threshold Indicator";
	}

	IN MIR-DIR-DPOS-MIN-AMT 
	{
		DisplayOnly;
		Length = "13";
		SType = "Currency";
		Label = "Minimum Direct Deposit Amount";
	}

	IN MIR-DISP-WTHDR-ORDR-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "DISP-WTHDR-ORDR-CD";
		SType = "Text";
		Label = "Tax Processing Withdrawal Order";
	}

	IN MIR-DIV-OYT-TBAC-ID 
	{
		DisplayOnly;
		Length = "5";
		SType = "Text";
		Label = "One Year Term Pointer";
	}

	IN MIR-DIV-PUA-TBAC-ID 
	{
		DisplayOnly;
		Length = "2";
		SType = "Text";
		Label = "Paid-up Additions Pointer";
	}

	IN MIR-DOD-INT-RT-ID 
	{
		DisplayOnly;
		Length = "6";
		CodeSource = "EDIT";
		CodeType = "IRTS";
		SType = "Text";
		Label = "Dividend on Deposit - Interest Pointer";
	}

	IN MIR-DPOS-WTHDR-ORDR-CD 
	{
		DisplayOnly;
		Length = "4";
		CodeSource = "DataModel";
		CodeType = "DPOS-WTHDR-ORDR-CD";
		SType = "Text";
		Label = "Deposit Withdrawal Order";
	}

	IN MIR-EIC-INIT-YR-DUR 
	{
		DisplayOnly;
		Length = "3";
		SType = "Text";
		Label = "Years Until First Excess Interest Credit Calculation";
	}

	IN MIR-EIC-SUBSEQ-YR-DUR 
	{
		DisplayOnly;
		Length = "3";
		SType = "Text";
		Label = "Years Between Excess Interest Credit Calculations";
	}

	IN MIR-ENHC-END-AGE 
	{
		DisplayOnly;
		Length = "3";
		Decimals = "0";
		SType = "Number";
		Label = "Enhancement Cease Age";
	}

	IN MIR-ENHC-END-DUR 
	{
		DisplayOnly;
		Length = "2";
		SType = "Text";
		Label = "Enhancement Cease Anniversary";
	}

	IN MIR-ENHC-FREQ-DUR 
	{
		DisplayOnly;
		Length = "2";
		SType = "Text";
		Label = "Enhancement Frequency Years";
	}

	IN MIR-ENHC-HIATUS-DUR 
	{
		DisplayOnly;
		Length = "2";
		SType = "Text";
		Label = "Enhancement Hiatus Years";
	}

	IN MIR-ENHC-NELCT-DUR 
	{
		DisplayOnly;
		Length = "2";
		SType = "Text";
		Label = "Maximum Non-elect Enhancement";
	}

	IN MIR-ENHC-STRT-DUR 
	{
		DisplayOnly;
		Length = "2";
		SType = "Text";
		Label = "Enhancement Anniversary Start";
	}

	IN MIR-ENHC-UWG-FREQ-DUR 
	{
		DisplayOnly;
		Length = "2";
		SType = "Text";
		Label = "Enhancement Financial Evidence Frequency";
	}

	IN MIR-ETI-FACE-CALC-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "ETI-FACE-CALC-CD";
		SType = "Text";
		Label = "ETI Face Amount Calculation Method";
	}

	IN MIR-ETI-TBAC-ID 
	{
		DisplayOnly;
		Length = "5";
		SType = "Text";
		Label = "ETI Calculation Rate Pointer";
	}

	IN MIR-FACE-AMT-TYP-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "FACE-AMT-TYP-CD";
		SType = "Text";
		Label = "Face Amount Type";
	}

	IN MIR-FACE-CALC-MTHD-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "FACE-CALC-MTHD-CD";
		SType = "Text";
		Label = "Face Amount Calculation Method";
	}

	IN MIR-FPUL-ADDL-PREM-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "FPUL Pour-in Indicator";
	}

	IN MIR-FPUL-LOAD-TYP-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "FPUL-LOAD-TYP-CD";
		SType = "Text";
		Label = "FPUL Load Type";
	}

	IN MIR-FPU-PLAN-BASE-ID 
	{
		DisplayOnly;
		Length = "5";
		SType = "Text";
		Label = "Paid-up Plan";
	}

	IN MIR-FREE-LK-INCR-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "FREE-LK-INCR-CD";
		SType = "Text";
		Label = "Free Look on Increase Type";
	}

	IN MIR-FREE-LK-PRCES-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Subject to free look processing";
	}

	IN MIR-FYR-COMM-XTRA-RT 
	{
		DisplayOnly;
		Length = "5";
		Decimals = "4";
		SType = "Percent";
		Label = "First Year Extra Commission Percentage";
	}

	IN MIR-GAIN-RPT-TIME-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "GAIN-RPT-TIME-CD";
		SType = "Text";
		Label = "Tax Gain Reporting Indicator";
	}

	IN MIR-GIR-PREM-INCL-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "GIR Calculation Indicator";
	}

	IN MIR-IA-COMM-BAND-1-AMT 
	{
		DisplayOnly;
		Length = "15";
		SType = "Currency";
		Label = "IA Commission Band 1 Amount";
	}

	IN MIR-IA-COMM-BAND-1-PCT 
	{
		DisplayOnly;
		Length = "5";
		Decimals = "2";
		SType = "Percent";
		Label = "IA Commision Band 1 Percent";
	}

	IN MIR-IA-COMM-BAND-2-AMT 
	{
		DisplayOnly;
		Length = "15";
		SType = "Currency";
		Label = "IA Commission Band 2 Amount";
	}

	IN MIR-IA-COMM-BAND-2-PCT 
	{
		DisplayOnly;
		Length = "5";
		Decimals = "2";
		SType = "Percent";
		Label = "IA Commission Band 2 Percent";
	}

	IN MIR-IA-COMM-BAND-3-AMT 
	{
		DisplayOnly;
		Length = "15";
		SType = "Currency";
		Label = "IA Commission Band 3 Amount";
	}

	IN MIR-IA-COMM-BAND-3-PCT 
	{
		DisplayOnly;
		Length = "5";
		Decimals = "2";
		SType = "Percent";
		Label = "IA Commission Band 3 Percent";
	}

	IN MIR-IA-COMM-MAX-AMT 
	{
		DisplayOnly;
		Length = "13";
		SType = "Currency";
		Label = "IA Maximum Commission Amount";
	}

	IN MIR-IA-INT-LEGAL-ID 
	{
		DisplayOnly;
		Length = "1";
		SType = "Text";
		Label = "IA Statutory Valuation Rate Scale";
	}

	IN MIR-IA-INT-PREM-ID 
	{
		DisplayOnly;
		Length = "1";
		SType = "Text";
		Label = "IA Premium Valuation Interest Rate Scale";
	}

	IN MIR-IA-INT-RT-ID 
	{
		DisplayOnly;
		Length = "5";
		CodeSource = "EDIT";
		CodeType = "PIRTS";
		SType = "Text";
		Label = "IA Valuation Interest Pointer";
	}

	IN MIR-IA-INT-TAX-ID 
	{
		DisplayOnly;
		Length = "1";
		SType = "Text";
		Label = "IA Tax Valuation Interest Rate Scale";
	}

	IN MIR-IA-MORT-LEGAL-ID 
	{
		DisplayOnly;
		Length = "1";
		SType = "Text";
		Label = "Statutory Valuation Rate Scale";
	}

	IN MIR-IA-MORT-PREM-ID 
	{
		DisplayOnly;
		Length = "1";
		SType = "Text";
		Label = "IA Premium Mortality Rate Scale";
	}

	IN MIR-IA-MORT-TAX-ID 
	{
		DisplayOnly;
		Length = "1";
		SType = "Text";
		Label = "IA Tax Mortality Rate Scale";
	}

	IN MIR-IA-MORT-UVAL-ID 
	{
		DisplayOnly;
		Length = "5";
		CodeSource = "EDIT";
		CodeType = "PUVAL";
		SType = "Text";
		Label = "IA Valuation Mortality Pointer";
	}

	IN MIR-INDX-INCR-DY-DUR 
	{
		DisplayOnly;
		Length = "3";
		SType = "Text";
		Label = "Interval Days";
	}

	IN MIR-INDX-INCR-MO-DUR 
	{
		DisplayOnly;
		Length = "3";
		SType = "Text";
		Label = "Interval Months";
	}

	IN MIR-INDX-INCR-MTHD-CD 
	{
		DisplayOnly;
		Length = "1";
		SType = "Text";
		Label = "Calculation Method";
	}

	IN MIR-INIT-PREM-CHNG-AGE 
	{
		DisplayOnly;
		Length = "3";
		Decimals = "0";
		SType = "Number";
		Label = "Change Initial Age";
	}

	IN MIR-INT-ADJ-MAX-DUR 
	{
		DisplayOnly;
		Length = "2";
		SType = "Text";
		Label = "Interest Adjustment Frequency";
	}

	IN MIR-ISWL-CALC-ADV-DUR 
	{
		DisplayOnly;
		Length = "3";
		SType = "Text";
		Label = "ISWL Advance Notice Days";
	}

	IN MIR-ISWL-CALC-FREQ-DUR 
	{
		DisplayOnly;
		Length = "2";
		SType = "Text";
		Label = "ISWL Recalculation Frequency";
	}

	IN MIR-ISWL-FRST-CALC-DUR 
	{
		DisplayOnly;
		Length = "2";
		SType = "Text";
		Label = "ISWL First Recalculation Anniversary";
	}

	IN MIR-ISWL-PREM-VAR-RT 
	{
		DisplayOnly;
		Length = "5";
		Decimals = "5";
		SType = "Percent";
		Label = "ISWL Recalculation - Minimum Variance";
	}

	IN MIR-LBILL-MODE-FEE-AMT 
	{
		DisplayOnly;
		Length = "9";
		SType = "Currency";
		Label = "Listbill Flat Amount per Mode";
	}

	IN MIR-LOAN-INT-CALC-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "LOAN-INT-CALC-CD";
		SType = "Text";
		Label = "Loan Interest Calculation Method";
	}

	IN MIR-LOAN-INT-RT-ID 
	{
		DisplayOnly;
		Length = "6";
		SType = "Text";
		Label = "Loan Interest Rate Pointer";
	}

	IN MIR-LOAN-INT-RT-TYP-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "LOAN-INT-RT-TYP-CD";
		SType = "Text";
		Label = "Loan Interest Type";
	}

	IN MIR-LOC-GR-COLCT-ID 
	{
		DisplayOnly;
		Length = "6";
		CodeSource = "EDIT";
		CodeType = "LOCPT";
		SType = "Text";
		Label = "Group Location Pointer";
	}

	IN MIR-LTA-PLAN-ID 
	{
		DisplayOnly;
		Length = "6";
		SType = "Text";
		Label = "Lifetime Accident Reserve Pointer";
	}

	IN MIR-LTB-PLAN-ID 
	{
		DisplayOnly;
		Length = "6";
		SType = "Text";
		Label = "Lifetime Benefit Reserve Pointer";
	}

	IN MIR-MAJ-LN-SORT-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "MAJ-LN-SORT-CD";
		SType = "Text";
		Label = "Major Line Sort Key";
	}

	IN MIR-MAT-CHRG-RTBL2-ID 
	{
		DisplayOnly;
		Length = "5";
		CodeSource = "EDIT";
		CodeType = "PCNT";
		SType = "Text";
		Label = "Maturity Charge Rate Pointer";
	}

	IN MIR-MAT-DT-CALC-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "MAT-DT-CALC-CD";
		SType = "Text";
		Label = "Maturity Indicator";
	}

	IN MIR-MAX-LMPSM-FCT 
	{
		DisplayOnly;
		Length = "2";
		SType = "Text";
		Label = "Maximum Lump Sum Multiplier";
	}

	IN MIR-MAX-ROLOVR-DY-DUR 
	{
		DisplayOnly;
		Length = "6";
		SType = "Text";
		Label = "Guaranteed Term Maximum Months/Days";
	}

	IN MIR-MAX-SNDRY-A-AMT 
	{
		DisplayOnly;
		Length = "13";
		SType = "Currency";
		Label = "Max Sundry A Amount";
	}

	IN MIR-MAX-SNDRY-AMT-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "MAX-SNDRY-AMT-CD";
		SType = "Text";
		Label = "Max Sundry Amount Code";
	}

	IN MIR-MAX-SNDRY-B-AMT 
	{
		DisplayOnly;
		Length = "13";
		SType = "Currency";
		Label = "Max Sundry B Amount";
	}

	IN MIR-MAX-SNDRY-COI-QTY 
	{
		DisplayOnly;
		Length = "2";
		SType = "Text";
		Label = "Max Sundry COI Quantity";
	}

	IN MIR-MCV-CALC-REQIR-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Calculate minimum cash value";
	}

	IN MIR-MCV-INT-MTHD-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "MCV-INT-MTHD-CD";
		SType = "Text";
		Label = "MCV Interest Calculation Method";
	}

	IN MIR-MCV-PMT-LOAD-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "MCV-PMT-LOAD-CD";
		SType = "Text";
		Label = "MCV Payment Load Order";
	}

	IN MIR-MIN-CASL-PAYO-AMT 
	{
		DisplayOnly;
		Length = "13";
		SType = "Currency";
		Label = "Minimum RRIF/LIF Casual Payout Amount";
	}

	IN MIR-MIN-ROLOVR-DY-DUR 
	{
		DisplayOnly;
		Length = "6";
		SType = "Text";
		Label = "Guaranteed Term Minimum Months/Days";
	}

	IN MIR-MIN-SNDRY-A-AMT 
	{
		DisplayOnly;
		Length = "13";
		SType = "Currency";
		Label = "Min Sundry A Amount";
	}

	IN MIR-MIN-SNDRY-AMT-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "MIN-SNDRY-AMT-CD";
		SType = "Text";
		Label = "Min Sundry Amount Code";
	}

	IN MIR-MIN-SNDRY-B-AMT 
	{
		DisplayOnly;
		Length = "13";
		SType = "Currency";
		Label = "Min Sundry B Amount";
	}

	IN MIR-MNPMT-TRG-SSTD-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Minimum Payment Target Substandard Indicator";
	}

	IN MIR-MORT-XPNS-CALC-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "MORT-XPNS-CALC-CD";
		SType = "Text";
		Label = "Mortality and Expense Calculation Type";
	}

	IN MIR-MORT-XPNS-CHRG-AGE 
	{
		DisplayOnly;
		Length = "3";
		Decimals = "0";
		SType = "Number";
		Label = "Mortality and Expense Age";
	}

	IN MIR-MORT-XPNS-CHRG-DUR 
	{
		DisplayOnly;
		Length = "3";
		SType = "Text";
		Label = "Mortality and Expense Duration";
	}

	IN MIR-MTHLY-PFEE-FCT 
	{
		DisplayOnly;
		Length = "8";
		Decimals = "7";
		SType = "Number";
		Label = "Monthly Policy Fee Factor";
	}

	IN MIR-NF-PRCES-MO-DUR 
	{
		DisplayOnly;
		Length = "4";
		SType = "Text";
		Label = "Months & Days Prior to Non-Forfeiture/Lapse";
	}

	IN MIR-NOTI-DEPT-ID 
	{
		DisplayOnly;
		Length = "5";
		CodeSource = "EDIT";
		CodeType = "DEPT";
		SType = "Text";
		Label = "Notify Department";
	}

	IN MIR-NOTI-DT-CALC-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "NOTI-DT-CALC-CD";
		SType = "Text";
		Label = "Notify Date Calculation Indicator";
	}

	IN MIR-NOTI-HIGH-AGE-DUR 
	{
		DisplayOnly;
		Length = "3";
		SType = "Text";
		Label = "Last Notify Age";
	}

	IN MIR-NOTI-LOW-AGE-DUR 
	{
		DisplayOnly;
		Length = "3";
		SType = "Text";
		Label = "Notify Age or Years";
	}

	IN MIR-NUM-GIR-OPT-QTY 
	{
		DisplayOnly;
		Length = "2";
		SType = "Text";
		Label = "Number of GIR Options";
	}

	IN MIR-OVRID-FRST-DGT-CD 
	{
		DisplayOnly;
		Length = "1";
		SType = "Text";
		Label = "Agent Situation";
	}

	IN MIR-OWN-OCCP-PLAN-ID 
	{
		DisplayOnly;
		Length = "6";
		SType = "Text";
		Label = "Own Occupation Reserve Pointer";
	}

	IN MIR-OWN-OCCP-XPRY-AGE 
	{
		DisplayOnly;
		Length = "3";
		Decimals = "0";
		SType = "Number";
		Label = "Own Occupation Expiry Age";
	}

	IN MIR-PAC-DPOS-MIN-AMT 
	{
		DisplayOnly;
		Length = "13";
		SType = "Currency";
		Label = "Minimum PAC Deposit Amount";
	}

	IN MIR-PAC-MODE-FEE-AMT 
	{
		DisplayOnly;
		Length = "9";
		SType = "Currency";
		Label = "PAC Flat Charge per Mode";
	}

	IN MIR-PAC-MTHLY-PFEE-FCT 
	{
		DisplayOnly;
		Length = "8";
		Decimals = "7";
		SType = "Number";
		Label = "Monthly PAC Policy Fee Factor";
	}

	IN MIR-PAC-QTR-PFEE-FCT 
	{
		DisplayOnly;
		Length = "8";
		Decimals = "7";
		SType = "Number";
		Label = "Quarterly PAC Policy Fee Factor";
	}

	IN MIR-PAC-SEMI-ANN-FCT 
	{
		DisplayOnly;
		Length = "8";
		Decimals = "7";
		SType = "Number";
		Label = "Semi-Annual PAC Mode Factor";
	}

	IN MIR-PAC-SEMI-PFEE-FCT 
	{
		DisplayOnly;
		Length = "8";
		Decimals = "7";
		SType = "Number";
		Label = "Semi-Annual PAC Policy Fee Factor";
	}

	IN MIR-PDF-INT-RT-ID 
	{
		DisplayOnly;
		Length = "6";
		CodeSource = "EDIT";
		CodeType = "IRTS";
		SType = "Text";
		Label = "PDF Interest Rate Pointer";
	}

	IN MIR-PDISAB-PLAN-ID 
	{
		DisplayOnly;
		Length = "6";
		SType = "Text";
		Label = "Partial Disability Reserve Pointer";
	}

	IN MIR-PDISAB-XPRY-AGE 
	{
		DisplayOnly;
		Length = "3";
		Decimals = "0";
		SType = "Number";
		Label = "Partial Disability Expiry Age";
	}

	IN MIR-PERI-STMT-DY-DUR 
	{
		DisplayOnly;
		Length = "3";
		SType = "Text";
		Label = "Duration Days";
	}

	IN MIR-PERI-STMT-MO-DUR 
	{
		DisplayOnly;
		Length = "2";
		SType = "Text";
		Label = "Duration Months";
	}

	IN MIR-PERI-STMT-TYP-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PERI-STMT-TYP-CD";
		SType = "Text";
		Label = "Type of Statement";
	}

	IN MIR-PLAN-7702-MXDX-ID 
	{
		DisplayOnly;
		Length = "2";
		SType = "Text";
		Label = "7702 Net Single Premium Pointer";
	}

	IN MIR-PLAN-ACCT-TYP-CD 
	{
		DisplayOnly;
		Length = "1";
		SType = "Text";
		Label = "2nd Digit of GL Account";
	}

	IN MIR-PLAN-ADB-XPRY-AGE 
	{
		DisplayOnly;
		Length = "3";
		Decimals = "0";
		SType = "Number";
		Label = "ADB Expiry Age";
	}

	IN MIR-PLAN-ADMIN-FEE-AMT 
	{
		DisplayOnly;
		Length = "11";
		SType = "Currency";
		Label = "Annual Administration Fee Amount";
	}

	IN MIR-PLAN-AGE-STBCK-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PLAN-AGE-STBCK-CD";
		SType = "Text";
		Label = "Female Setback Type";
	}

	IN MIR-PLAN-AGE-STBCK-QTY 
	{
		DisplayOnly;
		Length = "1";
		SType = "Text";
		Label = "Female Setback Years";
	}

	IN MIR-PLAN-BASE-XPRY-AGE 
	{
		DisplayOnly;
		Length = "3";
		Decimals = "0";
		SType = "Number";
		Label = "Policy Expiry Age";
	}

	IN MIR-PLAN-BNFT-TYP-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PLAN-BNFT-TYP-CD";
		SType = "Text";
		Label = "Plan Benefit Type Code";
	}

	IN MIR-PLAN-BON-EFF-DY 
	{
		DisplayOnly;
		Length = "2";
		SType = "Day";
		Label = "Annual Bonus Effective Days";
	}

	IN MIR-PLAN-BON-EFF-MO 
	{
		DisplayOnly;
		Length = "2";
		SType = "Month";
		Label = "Annual Bonus Effective Month";
	}

	IN MIR-PLAN-BON-INT-RT-ID 
	{
		DisplayOnly;
		Length = "6";
		SType = "Text";
		Label = "Bonus Interest Rate Pointer";
	}

	IN MIR-PLAN-BUS-CLAS-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "EDIT";
		CodeType = "CLASS";
		SType = "Text";
		Label = "Class of Business";
	}

	IN MIR-PLAN-CF-TYP-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PLAN-CF-TYP-CD";
		SType = "Text";
		Label = "Cash Flow Type";
	}

	IN MIR-PLAN-COLA-XPRY-AGE 
	{
		DisplayOnly;
		Length = "3";
		Decimals = "0";
		SType = "Number";
		Label = "COLA Expiry Age";
	}

	IN MIR-PLAN-COLFND-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Plan is a loan collateral fund";
	}

	IN MIR-PLAN-CPREM-CALC-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PLAN-CPREM-CALC-CD";
		SType = "Text";
		Label = "Commission Calculation Method";
	}

	IN MIR-PLAN-CSV-DT-TYP-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PLAN-CSV-DT-TYP-CD";
		SType = "Text";
		Label = "Cash Value Calculated Type";
	}

	IN MIR-PLAN-CVG-LOAN-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Coverage Loan Indicator";
	}

	IN MIR-PLAN-CVG-PFEE-AMT 
	{
		DisplayOnly;
		Length = "9";
		SType = "Currency";
		Label = "Plan as Additional Coverage Policy Fee Amount";
	}

	IN MIR-PLAN-CVG-XPRY-AGE 
	{
		DisplayOnly;
		Length = "3";
		Decimals = "0";
		SType = "Number";
		Label = "Coverage Expiry Age";
	}

	IN MIR-PLAN-DIV-INT-RT-ID 
	{
		DisplayOnly;
		Length = "6";
		SType = "Text";
		Label = "Dividend Interest Rate Pointer";
	}

	IN MIR-PLAN-DUR-TYP-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PLAN-DUR-TYP-CD";
		SType = "Text";
		Label = "Payor Waiver Expiry Indicator";
	}

	IN MIR-PLAN-EFF-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Date";
		Label = "Plan Effective Date";
	}

	IN MIR-PLAN-EIC-FREQ-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PLAN-EIC-FREQ-CD";
		SType = "Text";
		Label = "Excess Interest Credit Frequency";
	}

	IN MIR-PLAN-GUAR-INT-RT 
	{
		DisplayOnly;
		Length = "5";
		Decimals = "5";
		SType = "Percent";
		Label = "Minimum Guaranteed Interest Rate";
	}

	IN MIR-PLAN-IA-PFEE-AMT 
	{
		DisplayOnly;
		Length = "11";
		SType = "Currency";
		Label = "IA Policy Fee Amount";
	}

	IN MIR-PLAN-IMPRD-INT-RT 
	{
		DisplayOnly;
		Length = "5";
		Decimals = "5";
		SType = "Percent";
		Label = "Loan Interest Impairment Rate";
	}

	IN MIR-PLAN-IMPRD-RT-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PLAN-IMPRD-RT-CD";
		SType = "Text";
		Label = "Loan Interest Impairment Indicator";
	}

	IN MIR-PLAN-INS-TYP-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PLAN-INS-TYP-CD";
		SType = "Text";
		Label = "Type of Insurance";
	}

	IN MIR-PLAN-INT-PAYO-CD 
	{
		DisplayOnly;
		Length = "3";
		CodeSource = "DataModel";
		CodeType = "PLAN-INT-PAYO-CD";
		SType = "Text";
		Label = "Interest Handling Indicator";
	}

	IN MIR-PLAN-ISS-DT-TYP-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PLAN-ISS-DT-TYP-CD";
		SType = "Text";
		Label = "Date Rule";
	}

	IN MIR-PLAN-LOAN-INT-RT 
	{
		DisplayOnly;
		Length = "5";
		Decimals = "5";
		SType = "Percent";
		Label = "Loan Interest Rate";
	}

	IN MIR-PLAN-LOCK-FND-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Locked in Funds Indicator";
	}

	IN MIR-PLAN-LOC-LIC-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PLAN-LOC-LIC-CD";
		SType = "Text";
		Label = "Product License Indicator";
	}

	IN MIR-PLAN-LTA-XPRY-AGE 
	{
		DisplayOnly;
		Length = "3";
		Decimals = "0";
		SType = "Number";
		Label = "LTA Expiry Age";
	}

	IN MIR-PLAN-LTB-XPRY-AGE 
	{
		DisplayOnly;
		Length = "3";
		Decimals = "0";
		SType = "Number";
		Label = "LTB Expiry Age";
	}

	IN MIR-PLAN-MAT-AGE 
	{
		DisplayOnly;
		Length = "3";
		Decimals = "0";
		SType = "Number";
		Label = "Plan Maturity Age";
	}

	IN MIR-PLAN-MAT-AGE-DUR 
	{
		DisplayOnly;
		Length = "3";
		SType = "Text";
		Label = "Plan Maturity Years";
	}

	IN MIR-PLAN-MDRT-CLAS-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PLAN-MDRT-CLAS-CD";
		SType = "Text";
		Label = "MDRT Class";
	}

	IN MIR-PLAN-MIN-MPREM-QTY 
	{
		DisplayOnly;
		Length = "2";
		SType = "Text";
		Label = "Minimum Inforce Premiums";
	}

	IN MIR-PLAN-MKTVAL-ADJ-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PLAN-MKTVAL-ADJ-CD";
		SType = "Text";
		Label = "Market Value Adjustment Calculation";
	}

	IN MIR-PLAN-MODE-FEE-AMT 
	{
		DisplayOnly;
		Signed;
		Length = "9";
		SType = "Currency";
		Label = "Flat Charge Amount per Mode";
	}

	IN MIR-PLAN-MTHLY-FCT 
	{
		DisplayOnly;
		Length = "8";
		Decimals = "7";
		SType = "Number";
		Label = "Monthly Mode Factor";
	}

	IN MIR-PLAN-NAR-DSCNT-RT 
	{
		DisplayOnly;
		Length = "9";
		Decimals = "8";
		SType = "Percent";
		Label = "Risk Rate Divisor";
	}

	IN MIR-PLAN-NOTI-REASN-CD 
	{
		DisplayOnly;
		Length = "2";
		CodeSource = "EDIT";
		CodeType = "NOTRE";
		SType = "Text";
		Label = "Notify Reason";
	}

	IN MIR-PLAN-PAC-MTHLY-FCT 
	{
		DisplayOnly;
		Length = "8";
		Decimals = "7";
		SType = "Number";
		Label = "Monthly PAC Mode Factor";
	}

	IN MIR-PLAN-PAC-QTR-FCT 
	{
		DisplayOnly;
		Length = "8";
		Decimals = "7";
		SType = "Number";
		Label = "Quarterly PAC Mode Factor";
	}

	IN MIR-PLAN-PAR-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PLAN-PAR-CD";
		SType = "Text";
		Label = "Dividend Participation Indicator";
	}

	IN MIR-PLAN-PAYO-MTHD-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PLAN-PAYO-MTHD-CD";
		SType = "Text";
		Label = "Contractual Payout Option";
	}

	IN MIR-PLAN-PFEE-AMT 
	{
		DisplayOnly;
		Length = "9";
		SType = "Currency";
		Label = "Base Policy Fee Amount";
	}

	IN MIR-PLAN-QTR-FCT 
	{
		DisplayOnly;
		Length = "8";
		Decimals = "7";
		SType = "Number";
		Label = "Quarterly Mode Factor";
	}

	IN MIR-PLAN-QTR-PFEE-FCT 
	{
		DisplayOnly;
		Length = "8";
		Decimals = "7";
		SType = "Number";
		Label = "Quarterly Policy Fee Factor";
	}

	IN MIR-PLAN-REG-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Registration Indicator";
	}

	IN MIR-PLAN-REINST-DY-DUR 
	{
		DisplayOnly;
		Length = "3";
		SType = "Text";
		Label = "Time Limit in Days";
	}

	IN MIR-PLAN-REINST-MO-DUR 
	{
		DisplayOnly;
		Length = "3";
		SType = "Text";
		Label = "Time Limit in Months";
	}

	IN MIR-PLAN-REINST-LMT-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PLAN-REINST-LMT-CD";
		SType = "Text";
		Label = "Time Limit Calculation Start Date";
	}

	IN MIR-PLAN-ROLOVR-DT-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Maturity/Expiry Rollover Override Indicator";
	}

	IN MIR-PLAN-ROLOVR-TYP-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PLAN-ROLOVR-TYP-CD";
		SType = "Text";
		Label = "Guaranteed Term Rollover Type";
	}

	IN MIR-PLAN-RPU-DIV-RT 
	{
		DisplayOnly;
		Length = "5";
		Decimals = "5";
		SType = "Percent";
		Label = "RPU Dividend Calculation Percentage";
	}

	IN MIR-PLAN-RSRV-CALC-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PLAN-RSRV-CALC-CD";
		SType = "Text";
		Label = "Reserve Calculation Method";
	}

	IN MIR-PLAN-RULE-TYP-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PLAN-RULE-TYP-CD";
		SType = "Text";
		Label = "Face Amount Calculation Rule Type";
	}

	IN MIR-PLAN-SEMI-ANN-FCT 
	{
		DisplayOnly;
		Length = "8";
		Decimals = "7";
		SType = "Number";
		Label = "Semi-Annual Mode Factor";
	}

	IN MIR-PLAN-SUPP-BNFT-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PLAN-SUPP-BNFT-CD";
		SType = "Text";
		Label = "Supplemental Benefit Indicator";
	}

	IN MIR-PLAN-SURR-CHRG-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PLAN-SURR-CHRG-CD";
		SType = "Text";
		Label = "Surrender Charge Rate Code";
	}

	IN MIR-PLAN-TAMRA-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "TAMRA Seven Pay Indicator";
	}

	IN MIR-PLAN-TAMRA-MXDX-ID 
	{
		DisplayOnly;
		Length = "2";
		SType = "Text";
		Label = "TAMRA Seven Pay Pointer";
	}

	IN MIR-PLAN-TAX-TYP-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "POL-TAX-TYP-CD";
		SType = "Text";
		Label = "Tax Processing Indicator";
	}

	IN MIR-PLAN-TAXWH-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Withhold tax on disposition";
	}

	IN MIR-PLAN-TXEMP-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PLAN-TXEMP-CD";
		SType = "Text";
		Label = "Tax Exempt Indicator";
	}

	IN MIR-PLAN-UNIT-VALU-AMT 
	{
		DisplayOnly;
		Length = "7";
		Decimals = "0";
		SType = "Currency";
		Label = "Value Per Unit";
	}

	IN MIR-PLAN-UWG-IND 
	{
		DisplayOnly;
		Length = "40";
		SType = "Indicator";
		Label = "Underwriting Required Indicator";
	}

	IN MIR-PLAN-VPO-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Vanishing Premium Option Indicator";
	}

	IN MIR-PLAN-WP-XPRY-AGE 
	{
		DisplayOnly;
		Length = "3";
		Decimals = "0";
		SType = "Number";
		Label = "Waiver of Premium Expiry Age";
	}

	IN MIR-PLAN-WP-XPRY-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PLAN-WP-XPRY-CD";
		SType = "Text";
		Label = "Waiver Base Coverage Dependency";
	}

	IN MIR-PLAN-WTHDR-ORDR-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PLAN-WTHDR-ORDR-CD";
		SType = "Text";
		Label = "Fund Withdrawal Order Indicator";
	}

	IN MIR-PLAN-XPRY-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Date";
		Label = "Plan Expiry Date";
	}

	IN MIR-PMT-ALLOC-MTHD-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PMT-ALLOC-MTHD-CD";
		SType = "Text";
		Label = "Deposit Allocation Method";
	}

	IN MIR-PMT-LOAD-CALC-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PMT-LOAD-CALC-CD";
		SType = "Text";
		Label = "Payment Load Rate Code";
	}

	IN MIR-PMT-LOAD-FLAT-AMT 
	{
		DisplayOnly;
		Length = "11";
		SType = "Currency";
		Label = "Payment Load Flat Amount";
	}

	IN MIR-PMT-LOAD-ORDR-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PMT-LOAD-ORDR-CD";
		SType = "Text";
		Label = "Payment Load Order";
	}

	IN MIR-PMT-LOAD-RTBL2-ID 
	{
		DisplayOnly;
		Length = "5";
		SType = "Text";
		Label = "Payment Load Percent Table Pointer";
	}

	IN MIR-PMT-LOAD-SSTD-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Payment Load Target Substandard Rate Indicator";
	}

	IN MIR-PNSN-QUALF-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Plan is qualified";
	}

	IN MIR-POL-FND-SRVBEN-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "POL-FND-SRVBEN-CD";
		SType = "Text";
		Label = "Fund Survivorship Benefit Type";
	}

	IN MIR-POL-FND-SRVBEN-DUR 
	{
		DisplayOnly;
		Length = "3";
		SType = "Text";
		Label = "Fund Survivorship Benefit Duration";
	}

	IN MIR-POL-XPRY-AGE-DUR 
	{
		DisplayOnly;
		Length = "3";
		SType = "Text";
		Label = "Policy Expiry Number of Years";
	}

	IN MIR-PREM-CALC-TYP-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PREM-CALC-TYP-CD";
		SType = "Text";
		Label = "Premium Calculation Type";
	}

	IN MIR-PREM-CHNG-AGE-DUR 
	{
		DisplayOnly;
		Length = "3";
		SType = "Text";
		Label = "Premium Change AgeDuration";
	}

	IN MIR-PREM-CHNG-DT-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PREM-CHNG-DT-CD";
		SType = "Text";
		Label = "Premium Change Indicator";
	}

	IN MIR-PREM-PAY-UVAL-ID 
	{
		DisplayOnly;
		Length = "6";
		CodeSource = "EDIT";
		CodeType = "UVAL";
		SType = "Text";
		Label = "Unit Value Pointer - Premium Paying";
	}

	IN MIR-PREM-RECALC-OPT-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PREM-RECALC-OPT-CD";
		SType = "Text";
		Label = "ISWL Premium Recalculation Option";
	}

	IN MIR-PREM-RENW-RT-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PREM-RENW-RT-CD";
		SType = "Text";
		Label = "Renewal Premium Indicator";
	}

	IN MIR-PSUR-CHRG-FLAT-AMT 
	{
		DisplayOnly;
		Length = "11";
		SType = "Currency";
		Label = "Partial Surrender Charge Flat Amount";
	}

	IN MIR-PSUR-CHRG-RTBL2-ID 
	{
		DisplayOnly;
		Length = "5";
		CodeSource = "EDIT";
		CodeType = "PCNT";
		SType = "Text";
		Label = "Partial Surrender Charge Percent Table Pointer";
	}

	IN MIR-PSUR-CHRG-TYP-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PSUR-CHRG-TYP-CD";
		SType = "Text";
		Label = "Partial Surrender Charge Type";
	}

	IN MIR-PUA-DIV-CALC-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "PUA-DIV-CALC-CD";
		SType = "Text";
		Label = "Calculation Method for Paid-up Additions";
	}

	IN MIR-PU-UVAL-ID 
	{
		DisplayOnly;
		Length = "6";
		CodeSource = "EDIT";
		CodeType = "UVAL";
		SType = "Text";
		Label = "Unit Value Pointer - Paid-up";
	}

	IN MIR-REDC-EP-PLAN-ID 
	{
		DisplayOnly;
		Length = "6";
		SType = "Text";
		Label = "Elimination Period/Hospital Benefit Reserve Pointer";
	}

	IN MIR-REDC-EP-XPRY-AGE 
	{
		DisplayOnly;
		Length = "3";
		Decimals = "0";
		SType = "Number";
		Label = "Elimination Period/Hospital Benefit Expiry Age";
	}

	IN MIR-RPU-TBAC-ID 
	{
		DisplayOnly;
		Length = "5";
		SType = "Text";
		Label = "RPU Calculation Rate Pointer";
	}

	IN MIR-SE-GDLN-APREM-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Calculate SEC premiums";
	}

	IN MIR-SEMI-ANN-PFEE-FCT 
	{
		DisplayOnly;
		Length = "8";
		Decimals = "7";
		SType = "Number";
		Label = "Semi-Annual Policy Fee Factor";
	}

	IN MIR-SFB-NEG-SUSP-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Special Frequency Billing Allows Negative Suspense";
	}

	IN MIR-SFB-NEG-SUSP-QTY 
	{
		DisplayOnly;
		Length = "2";
		SType = "Text";
		Label = "Special Frequency Billing Limit (Months)";
	}

	IN MIR-SUM-INS-CALC-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "SUM-INS-CALC-CD";
		SType = "Text";
		Label = "Sum Insured Calculation Method";
	}

	IN MIR-SURR-ADJ-CALC-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "SURR-ADJ-CALC-CD";
		SType = "Text";
		Label = "Monthiversary Adjustment Method";
	}

	IN MIR-SURR-ADJ-MO-DUR 
	{
		DisplayOnly;
		Length = "3";
		SType = "Text";
		Label = "Monthiversary Adjustment Months";
	}

	IN MIR-SURR-ADJ-TYP-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "SURR-ADJ-TYP-CD";
		SType = "Text";
		Label = "Monthiversary Adjustment Type";
	}

	IN MIR-SURR-CHRG-CALC-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "SURR-CHRG-CALC-CD";
		SType = "Text";
		Label = "Partial Surrender Rate Type";
	}

	IN MIR-SURR-CHRG-FLAT-AMT 
	{
		DisplayOnly;
		Length = "11";
		SType = "Currency";
		Label = "Surrender Charge Flat Amount";
	}

	IN MIR-SURR-CHRG-RTBL2-ID 
	{
		DisplayOnly;
		Length = "5";
		CodeSource = "EDIT";
		CodeType = "PCNT";
		SType = "Text";
		Label = "Surrender Charge Percent Table Pointer";
	}

	IN MIR-SURR-CHRG-TYP-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "SURR-CHRG-TYP-CD";
		SType = "Text";
		Label = "Surrender Charge Method";
	}

	IN MIR-SURR-TRG-SSTD-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Surrender Target Substandard Indicator";
	}

	IN MIR-T5-REG-TITL-TXT 
	{
		DisplayOnly;
		Length = "13";
		SType = "Text";
		Label = "T5 Title if Registered";
	}

	IN MIR-TRAIL-COMM-BEG-DUR 
	{
		DisplayOnly;
		Length = "3";
		SType = "Text";
		Label = "Trail Start Delay";
	}

	IN MIR-TRAIL-COMM-FREQ-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "TRAIL-COMM-FREQ-CD";
		SType = "Text";
		Label = "Trail Commission Frequency";
	}

	IN MIR-TRAIL-COMM-LAG-DUR 
	{
		DisplayOnly;
		Length = "3";
		SType = "Text";
		Label = "Trail Commission Lag Period";
	}

	IN MIR-TRM-PREM-RFND-RT 
	{
		DisplayOnly;
		Signed;
		Length = "5";
		Decimals = "4";
		SType = "Percent";
		Label = "Percentage of Premium to Refund";
	}

	IN MIR-ULT-PREM-CHNG-AGE 
	{
		DisplayOnly;
		Length = "3";
		Decimals = "0";
		SType = "Number";
		Label = "Ultimate Premium Change Age";
	}

	IN MIR-UWG-FACE-AMT-FCT 
	{
		DisplayOnly;
		Length = "3";
		Decimals = "2";
		SType = "Number";
		Label = "Underwriting Multiplier";
	}

	IN MIR-VALN-LBL-ID 
	{
		DisplayOnly;
		Length = "6";
		CodeSource = "EDIT";
		CodeType = "RLBL";
		SType = "Text";
		Label = "Valuation Header";
	}

	IN MIR-WP-PLAN-ID 
	{
		DisplayOnly;
		Length = "6";
		SType = "Text";
		Label = "Waiver of Premium Reserve Pointer";
	}

	IN MIR-XEMP-TST-UVAL-ID 
	{
		DisplayOnly;
		Length = "6";
		CodeSource = "EDIT";
		CodeType = "UVAL";
		SType = "Text";
		Label = "Exemption Test Rate Pointer";
	}

	IN MIR-XPRY-DT-CALC-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "XPRY-DT-CALC-CD";
		SType = "Text";
		Label = "Expiry Date Calculation Method";
	}

	IN MIR-PLAN-INIT-PMT-IND 
	{
		DisplayOnly;
		Length = "1";
		SType = "Indicator";
		Label = "Initial Payment Indicator";
	}

	IN MIR-PLAN-ID 
	{
		Key;
		DisplayOnly;
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "PLAN";
		SType = "Text";
		Label = "Plan";
	}
}
