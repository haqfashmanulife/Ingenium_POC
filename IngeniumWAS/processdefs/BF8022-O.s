# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:04 PM EDT

#*******************************************************************************
#*  Component:   BF8022-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01CP02  GW       Added 'Agent Type' & 'Plan benefit Type' - Agent info.    *
#*                   only occurs (2).                                          *
#*  02PR55  RNL      Add MAT-XPRY-REASN-CD                                     *
#*  M00025  MAW      Added MIR-CVG-SUB-STAT-CD                                 *
#*  PR006I  BMB      Change labels for connected coverages                     *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  M280A1  CTS      CHANGES DONE TO INCREASE THE LENGTH OF PLAN-BNFT-TYP-CD   *
#*  M280A1           FROM 1 BYTE TO 2 BYTES                                    **
#*  NVCN01  CTS      CHANGES DONE AS PART OF ONTARIO XML UPLOAD                *
#*  UCR244  CTS      CHANGES DONE AS PART OF STREAM3                           *
#*******************************************************************************

S-STEP BF8022-O
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

    IN MIR-ADDL-FYR-COMM-RT-T[2]
    {
        DisplayOnly;
        Length = "5";
        Decimals = "3";
        FieldGroup = "Table2";
        SType = "Percent";
        Label = "First Year Adjustment";
        Index = "1";
    }

    IN MIR-AGE-RAT-REASN-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "ARST";
        SType = "Text";
        Label = "Age Restrict Reason";
    }

    IN MIR-AGT-ID-T[2]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Agent ID";
        Index = "1";
    }

    IN MIR-COMIT-RT-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Commitment Rate Effective Date";
    }

    IN MIR-COMIT-RT-END-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Commitment Rate End Date";
    }

    IN MIR-COMM-CHNG-CD-T[2]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "COMR";
        SType = "Text";
        Label = "Commission Change Reason";
        Index = "1";
    }

    IN MIR-COMM-RT-TBAC-ID-T[2]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Commission Pattern";
        Index = "1";
    }

    IN MIR-COMM-TRG-CALC-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "COMM-TRG-CALC-CD";
        SType = "Text";
        Label = "Commission Target Mode";
    }

    IN MIR-CONN-CVG-NUM
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Connected Coverage Number";
    }

    IN MIR-CONN-POL-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Connected Policy Number";
    }

    IN MIR-CPREM-CALC-CD-T[2]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "CPREM-CALC-CD";
        SType = "Text";
        Label = "Commissionable Premium Method of Payment";
        Index = "1";
    }

    IN MIR-CVG-AD-FACE-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "ADB Face Amount";
    }

    IN MIR-CVG-AD-MULT-FCT
    {
        DisplayOnly;
        Signed;
        Length = "3";
        Decimals = "2";
        SType = "Number";
        Label = "ADB Multiplier";
    }

    IN MIR-CVG-AD-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "ADB Premium";
    }

    IN MIR-CVG-AD-XPRY-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "ADB Expiry Date";
    }

    IN MIR-CVG-AGT-CPREM-AMT-T[2]
    {
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Commissionable Premium";
        Index = "1";
    }

    IN MIR-CVG-AGT-SHR-PCT-T[2]
    {
        DisplayOnly;
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table2";
        SType = "Percent";
        Label = "Share";
        Index = "1";
    }

    IN MIR-CVG-AGT-TYP-CD-T[2]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "CVG-AGT-TYP-CD";
        SType = "Text";
        Label = "Agent Type";
        Index = "1";
    }
 
    IN MIR-CVG-APP-RECV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Application Received Date";
    }

    IN MIR-CVG-APS-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-APS-CD";
        SType = "Text";
        Label = "Attending Physician Statement";
    }

    IN MIR-CVG-BASIC-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Annual Premium";
    }

    IN MIR-CVG-CNVR-XPRY-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Conversion Expiry Date";
    }

    IN MIR-CVG-COLA-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "COLA Premium";
    }

    IN MIR-CVG-COLA-SELCT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-COLA-SELCT-CD";
        SType = "Text";
        Label = "COLA";
    }

    IN MIR-CVG-COMIT-PCT
    {
        DisplayOnly;
        Length = "5";
        Decimals = "3";
        SType = "Percent";
        Label = "Commitment Interest Rate";
    }

    IN MIR-CVG-COMIT-RT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Commitment Letter Indicator";
    }

    IN MIR-CVG-COMM-TRG-AMT
    {
        DisplayOnly;
        Signed;
        Length = "11";
        Decimals = "0";
        SType = "Currency";
        Label = "Annual Commission Target";
    }

    IN MIR-CVG-CONN-REASN-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-CONN-REASN-CD";
        SType = "Text";
        Label = "Connected Policy/Coverage Reason";
    }
#UCR244 CHANGES STARTS
    IN MIR-CONN-CORP-INSRD-ID
    {
	    DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Connected Corporate Insured ID";
    }
#UCR244 CHANGES ENDS

    IN MIR-CVG-EKG-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-EKG-CD";
        SType = "Text";
        Label = "Electro-Cardiogram";
    }

    IN MIR-CVG-ENHC-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-ENHC-TYP-CD";
        SType = "Text";
        Label = "Enhancement Indicator";
    }

    IN MIR-CVG-FACE-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Face Amount";
    }

    IN MIR-CVG-FE-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Flat Extra Duration";
    }

    IN MIR-CVG-FE-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Flat Extra Premium Amount";
    }

    IN MIR-CVG-FE-REASN-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "RFLAT";
        SType = "Text";
        Label = "Flat Extra Reason";
    }

    IN MIR-CVG-FE-UPREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "9";
        SType = "Currency";
        Label = "Flat Extra Dollar Amount/Unit";
    }

    IN MIR-CVG-GUAR-INT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-GUAR-INT-CD";
        SType = "Text";
        Label = "Guaranteed Interest Type";
    }

    IN MIR-CVG-GUAR-INT-PCT
    {
        DisplayOnly;
        Signed;
        Length = "9";
        Decimals = "6";
        SType = "Percent";
        Label = "Guaranteed Interest Rate";
    }

    IN MIR-CVG-HO-SPCMN-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-HO-SPCMN-CD";
        SType = "Text";
        Label = "Head Office Specimen";
    }

    IN MIR-CVG-INCM-BRCKT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-INCM-BRCKT-CD";
        SType = "Text";
        Label = "Income Bracket";
    }

    IN MIR-CVG-INSPC-RPT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-INSPC-RPT-CD";
        SType = "Text";
        Label = "Inspection Report";
    }

    IN MIR-CVG-INT-PAYO-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PLAN-INT-PAYO-CD";
        SType = "Text";
        Label = "Interest Handling Indicator";
    }

    IN MIR-CVG-INTRNL-EXAM-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-INTNRL-EXAM-CD";
        SType = "Text";
        Label = "Medical Internal Exam";
    }

    IN MIR-CVG-JNT-LIFE-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-JNT-LIFE-CD";
        SType = "Text";
        Label = "Joint Type";
    }

    IN MIR-CVG-LIVES-INSRD-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Number of Lives Insured";
    }

    IN MIR-CVG-LTA-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "LTA Premium";
    }

    IN MIR-CVG-LTA-SELCT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Lifetime Accident Indicator";
    }

    IN MIR-CVG-LTB-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "LTB Premium";
    }

    IN MIR-CVG-LTB-SELCT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Lifetime Benefit Indicator";
    }

    IN MIR-CVG-MAT-XPRY-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Maturity/Expiry Date";
    }

    IN MIR-CVG-MAX-COMIT-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Commitment Amount";
    }

    IN MIR-CVG-ME-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Mortality/Morbidity Extra Premium Duration";
    }

    IN MIR-CVG-ME-FCT
    {
        DisplayOnly;
        Signed;
        Length = "3";
        Decimals = "2";
        SType = "Number";
        Label = "Mortality/Morbidity Extra Premium Rating";
    }

    IN MIR-CVG-ME-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Mortality/Morbidity Extra Premium Amount";
    }

    IN MIR-CVG-ME-RAT-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "TRATE";
        SType = "Text";
        Label = "True Table Rating";
    }

    IN MIR-CVG-ME-REASN-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "RMULT";
        SType = "Text";
        Label = "Mortality/Morbidity Extra Premium Reason";
    }

    IN MIR-CVG-MISC-RAT-1-CD
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Miscellaneous Reason 1";
    }

    IN MIR-CVG-MISC-RAT-2-CD
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Miscellaneous Reason 2";
    }

    IN MIR-CVG-MPREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Modal Premium";
    }

    IN MIR-CVG-NMED-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-NMED-CD";
        SType = "Text";
        Label = "Non-Medical";
    }

    IN MIR-CVG-NMED-PRVLG-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Non-Medical Priviledge";
    }

    IN MIR-CVG-NOTI-DEPT-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DEPT";
        SType = "Text";
        Label = "Notify Department";
    }

    IN MIR-CVG-NOTI-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Notify date";
    }

    IN MIR-CVG-NOTI-REASN-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "NOTRE";
        SType = "Text";
        Label = "Notify Reason";
    }

    IN MIR-CVG-NXT-CPI-FCT
    {
        DisplayOnly;
        Length = "5";
        Decimals = "3";
        SType = "Number";
        Label = "Next Premium Rate";
    }

    IN MIR-CVG-NXT-RENW-RT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-NXT-RENW-RT-CD";
        SType = "Text";
        Label = "Next Premium Renewal Rate Indicator";
    }

    IN MIR-CVG-OCCP-CLAS-CD
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Occupation Class";
    }

    IN MIR-CVG-ORIG-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "ORIG";
        SType = "Text";
        Label = "Source of Business";
    }

    IN MIR-CVG-ORIG-FACE-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Original Face Amount";
    }

    IN MIR-CVG-OUT-ALLOC-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-OUT-ALLOC-CD";
        SType = "Text";
        Label = "Policy Level Payout Splits";
    }

    IN MIR-CVG-PAR-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-PAR-CD";
        SType = "Text";
        Label = "Dividend Option";
    }

    IN MIR-CVG-PFEE-AMT
    {
        DisplayOnly;
        Signed;
        Length = "9";
        SType = "Currency";
        Label = "Flat Policy Fee";
    }

    IN MIR-CVG-PHYS-EXAM-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-PHYS-EXAM-CD";
        SType = "Text";
        Label = "Medical Examination";
    }

    IN MIR-CVG-PMED-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-PMED-CD";
        SType = "Text";
        Label = "Paramedical";
    }

    IN MIR-CVG-PREM-CHNG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Premium Change Date";
    }

    IN MIR-CVG-PREV-CPI-FCT
    {
        DisplayOnly;
        Length = "5";
        Decimals = "3";
        SType = "Number";
        Label = "Last Premium Rate";
    }

    IN MIR-CVG-PREV-FACE-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Last Face Amount";
    }

    IN MIR-CVG-PRST-RAT-PCT
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Percent";
        Label = "Persistency Rating";
    }

    IN MIR-CVG-RESTR-PREM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Restrict Premium Calculation Indicator";
    }

    IN MIR-CVG-ROLOVR-DT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Cash Flow Rollover Indicator";
    }

    IN MIR-CVG-RT-AGE
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Age";
    }

    IN MIR-CVG-SALE-SRC-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Source of Sale";
    }

    IN MIR-CVG-SEX-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-SEX-CD";
        SType = "Text";
        Label = "Sex";
    }

    IN MIR-CVG-SMKR-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SMOKE";
        SType = "Text";
        Label = "Smoker";
    }

    IN MIR-CVG-STBL-1-CD
    {
        DisplayOnly;
        Length = "2";
#* M241A3 changes START here*
#        CodeSource = "EDIT";
#        CodeType = "STB1";
        CodeSource = "CSOM9788";        
	FilterFields = "1";
        FilterField1 = "MIR-PLAN-ID"; 
#* M241A3 changes END here*
        SType = "Text";
        Label = "Sub-table 1";
    }

    IN MIR-CVG-STBL-2-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Text";
        Label = "Sub-table 2";
    }

    IN MIR-CVG-STBL-3-CD
    {
        DisplayOnly;
        Length = "40";
#* M241A3 changes START here*
#       CodeSource = "EDIT";
#       CodeType = "STB3";
 	CodeSource = "CSOM9789";        
	FilterFields = "1";
        FilterField1 = "MIR-PLAN-ID"; 
#* M241A3 changes END here*
        SType = "Text";
        Label = "Sub-table 3";
    }

    IN MIR-CVG-STBL-4-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        SType = "Text";
        Label = "Sub-table 4";
    }

    IN MIR-CVG-STRS-EKG-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-STRS-EKG-CD";
        SType = "Text";
        Label = "Stress Electro-Cardiogram";
    }

    IN MIR-CVG-SUM-INS-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Sum Insured Amount";
    }

    IN MIR-CVG-UWG-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Underwriting Amount";
    }

    IN MIR-CVG-UWGDECN-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-UWGDECN-CD";
        SType = "Text";
        Label = "Coverage Decision";
    }

    IN MIR-CVG-UWGDECN-SUB-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "CODEC";
        SType = "Text";
        Label = "Coverage Decision Type";
    }

    IN MIR-CVG-UWG-EXCL-CD-T[3]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "EXCL";
        SType = "Text";
        Label = "Exclusion Code";
        Index = "1";
    }

    IN MIR-CVG-WP-IND
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-WP-IND";
        SType = "Text";
        Label = "Waiver of Premium Indicator";
    }
#NVCN01 STARTS
    IN MIR-CVG-WP-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-WP-TYP-CD";
        SType = "Text";
        Label = "WoP Type";
    }
#NVCN01 ENDS
    IN MIR-CVG-WP-MULT-FCT
    {
        DisplayOnly;
        Signed;
        Length = "3";
        Decimals = "2";
        SType = "Number";
        Label = "Waiver of Premium Multiplier";
    }

    IN MIR-CVG-WP-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "Waiver of Premium Amount";
    }

    IN MIR-CVG-WP-XPRY-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Waiver of Premium Expiry Date";
    }

    IN MIR-CVG-WTHDR-ORDR-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-WTHDR-ORDR-CD";
        SType = "Text";
        Label = "Withdrawal Order";
    }

    IN MIR-CVG-XRAY-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-XRAY-CD";
        SType = "Text";
        Label = "X-Ray";
    }

    IN MIR-DIA-SWP-THRSHD-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Sweep Threshold Minimum Amount";
    }

    IN MIR-DIA-SWP-THRSHD-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DIA-SWP-THRSHD-CD";
        SType = "Text";
        Label = "Sweep Threshold Indicator";
    }

    IN MIR-DPOS-TRM-DY-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Deposit Term Days";
    }

    IN MIR-DPOS-TRM-MO-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Deposit Term Months";
    }

    IN MIR-FYR-COMM-CALC-CD-T[2]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "FYR-COMM-CALC-CD";
        SType = "Text";
        Label = "First Year Commission Method of Payment";
        Index = "1";
    }

    IN MIR-GIR-OPT-REMN-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "GIR Maximum Amount";
    }

    IN MIR-GIR-OPT-REMN-QTY
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "GIR Number of Options Left";
    }

    IN MIR-GIR-SEND-LTR-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "GIR Send Letter Indicator";
    }

    IN MIR-GUAR-IMPRD-INT-PCT
    {
        DisplayOnly;
        Signed;
        Length = "9";
        Decimals = "6";
        SType = "Percent";
        Label = "Impaired Rate";
    }

    IN MIR-GUAR-INT-END-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Guaranteed Interest End Date";
    }

    IN MIR-GUAR-INT-PERI-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Guaranteed Interest Period";
    }

    IN MIR-GUAR-INT-STRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Guaranteed Interest Start Date";
    }

    IN MIR-IA-QUOT-NUM
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Immediate Annuity Quote Number";
    }

    IN MIR-INSRD-CLI-ID-T[5]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Client ID";
        Index = "1";
    }

    IN MIR-MAT-XPRY-DT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Recalculate Maturity/Expiry Date Indicator";
    }

    IN MIR-MAT-XPRY-REASN-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "MAT-XPRY-REASN-CD";
        SType = "Text";
        Label = "Maturity/Expiry Reason";
    }

    IN MIR-MORT-ASSESS-PCT
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Percent";
        Label = "Mortality Assessment Percentage";
    }

    IN MIR-OUT-ALLOC-AMT-PCT
    {
        DisplayOnly;
        Length = "15";
        Decimals = "3";
        SType = "Number";
        Label = "Share Percent/Amount";
    }

    IN MIR-OVRID-BASE-AGT-ID-T[2]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Override";
        Index = "1";
    }

    IN MIR-OVRID-ID-T[2]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Override";
        Index = "1";
    }

    IN MIR-OWN-OCCP-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "Own Occupation Premium";
    }

    IN MIR-OWN-OCCP-SELCT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Own Occupation Benefit Indicator";
    }

    IN MIR-PDISAB-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "Partial Disability Benefit Premium";
    }

    IN MIR-PDISAB-SELCT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Partial Disability Benefit Indicator";
    }

    IN MIR-PLAN-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
    }

    IN MIR-PMT-LOAD-TRG-AMT
    {
        DisplayOnly;
        Signed;
        Length = "11";
        Decimals = "0";
        SType = "Currency";
        Label = "Annual Payment Load Target";
    }

    IN MIR-PMT-LOAD-TRG-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PMT-LOAD-TRG-CD";
        SType = "Text";
        Label = "Payment Load Target Mode";
    }

    IN MIR-POL-APP-NUM
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Number of Applications/Policy";
    }

    IN MIR-PREV-RENW-RT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PREV-RENW-RT-CD";
        SType = "Text";
        Label = "Last Premium Renewal Rate Indicator";
    }

    IN MIR-REDC-EP-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "EP/HOSP Premium";
    }

    IN MIR-REDC-EP-SELCT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "EP/HOSP Benefit Indicator";
    }

    IN MIR-REL-CVG-NUM
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Connecting Coverage Number";
    }

    IN MIR-RENW-COMM-CALC-CD-T[2]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "RENW-COMM-CALC-CD";
        SType = "Text";
        Label = "Renewal Commission Method of Payment";
        Index = "1";
    }

    IN MIR-SNGL-CASE-AGRE-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Single Case Agreement";
    }

    IN MIR-UWG-AMT-REASN-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "URSN";
        SType = "Text";
        Label = "Underwriting Reason";
    }

    IN MIR-UWG-REQIR-ESTB-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Underwriting Requirements Established";
    }

    IN MIR-UWG-USER-DEFN-1-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "UWREQ";
        SType = "Text";
        Label = "Miscellaneous Underwriting Requirement 1";
    }

    IN MIR-UWG-USER-DEFN-2-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "UWREQ";
        SType = "Text";
        Label = "Miscellaneous Underwriting Requirement 2";
    }

    IN MIR-UWG-USER-DEFN-3-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "UWREQ";
        SType = "Text";
        Label = "Miscellaneous Underwriting Requirement 3";
    }

    IN MIR-UWG-USER-DEFN-4-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "UWREQ";
        SType = "Text";
        Label = "Miscellaneous Underwriting Requirement 4";
    }

    IN MIR-UWG-USER-DEFN-5-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "UWREQ";
        SType = "Text";
        Label = "Miscellaneous Underwriting Requirement 5";
    }

    IN MIR-UW-USER-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Underwriter's Initial";
    }

    IN MIR-CVG-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        DefaultConstant = "01";
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

    IN MIR-CLI-SEX-CD-T[5]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table5";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    IN MIR-CLI-SMKR-CD-T[5]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table5";
        CodeSource = "DataModel";
        CodeType = "CLI-SMKR-CD";
        SType = "Text";
        Label = "Smoker";
        Index = "1";
    }

    IN MIR-CVG-ACCT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "General Ledger Account Type";
    }

    IN MIR-CVG-CLI-ADJ-AGE-T[5]
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table5";
        SType = "Number";
        Label = "Adjusted Age";
        Index = "1";
    }

    IN MIR-CVG-CLI-ISS-AGE-T[5]
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table5";
        SType = "Number";
        Label = "Issue Age";
        Index = "1";
    }

    IN MIR-CVG-CSN-REC-CTR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Reinsurance Cession Record";
    }

    IN MIR-CVG-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Text";
        Label = "Coverage Status";
    }

    IN MIR-CVG-INS-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-INS-TYP-CD";
        SType = "Text";
        Label = "Type of Insurance";
    }

    IN MIR-CVG-ISS-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Issue Date";
    }

    IN MIR-CVG-SPND-CSTAT-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Text";
        Label = "Suspended Coverage Status";
    }

    IN MIR-CVG-UNIT-VALU-AMT
    {
        DisplayOnly;
        Length = "7";
        Decimals = "0";
        SType = "Currency";
        Label = "Unit Value";
    }

    IN MIR-DV-AGT-CLI-NM-T[2]
    {
        DisplayOnly;
        Length = "51";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Agent Name";
        Index = "1";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }

    IN MIR-DV-INSRD-CLI-NM-T[5]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Insured Name";
        Index = "1";
    }

    IN MIR-MNPMT-TRG-LTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        Decimals = "0";
        SType = "Currency";
        Label = "Minimum Payment Target";
    }

    IN MIR-MORT-XPNS-CHG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Mortality & Expense Change Date";
    }

    IN MIR-PLAN-PERI-PREM-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Planned Periodic Premium";
    }

    IN MIR-POL-BILL-MODE-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Premium Mode";
    }

    IN MIR-POL-BILL-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Text";
        Label = "Billing Type";
    }

    IN MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status Code";
    }

    IN MIR-POL-CVG-REC-CTR
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Number of Coverages";
    }

    IN MIR-POL-GRS-APREM-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Annual Premium";
    }

    IN MIR-POL-MPREM-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Mode Premium";
    }

    IN MIR-POL-OPTL-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-OPTL-CD";
        SType = "Text";
        Label = "Optional Policy";
    }

    IN MIR-POL-PD-TO-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Paid to Date";
    }

    IN MIR-POL-PREM-DSCNT-PCT
    {
        DisplayOnly;
        Length = "5";
        Decimals = "3";
        SType = "Percent";
        Label = "Discount Percentage";
    }

    IN MIR-POL-REINS-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-REINS-CD";
        SType = "Text";
        Label = "Reinsurance";
    }

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub-Company";
    }

    IN MIR-SERV-AGT-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Policy Servicing Agent ID";
    }

    IN MIR-ULT-PREM-RT-AGE
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Step-Rated Ultimate Rate Age";
    }

    IN MIR-ULT-PREM-RT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ULT-PREM-RT-CD";
        SType = "Text";
        Label = "Step-rated Ultimate Rate";
    }

    IN MIR-PLAN-BNFT-TYP-CD
    {
        DisplayOnly;
#* M280A1 CHANGES START*    
#       Length = "1";
        Length = "2";
#* M280A1 CHANGES END*
        CodeSource = "DataModel";
        CodeType = "PLAN-BNFT-TYP-CD";
        SType = "Text";
        Label = "Plan benefit type";
    }

    IN MIR-CVG-SUB-STAT-CD 
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBSC";
        SType = "Text";
        Label = "Coverage Sub Status";
    }

}

