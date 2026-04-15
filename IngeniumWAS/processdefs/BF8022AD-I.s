# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:04 PM EDT

#*******************************************************************************
#*  Component:   BF8022AD-I.s                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016168  602J     have more link show if > 5 messages                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01CP02  GW       Added 'Agent Type' & 'Plan benefit Type' - Agent info.    *
#*                   only occurs (2).                                          *
#*  02PR55  RNL      Add MAT-XPRY-REASN-CD                                     *
#*  M00025  MAW      Added MIR-CVG-SUB-STAT-CD                                 *
#*  PR006I  BMB      Change labels for connected coverages                     *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  M280A1  CTS      CHANGES DONE TO INCREASE THE LENGTH OF PLAN-BNFT-TYP-CD   *
#*  M280A1           FROM 1 BYTE TO 2 BYTES                                    **
#*******************************************************************************

S-STEP BF8022AD-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-ADDL-FYR-COMM-RT-T[1]";
        FocusFrame = "ContentFrame";
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

    INOUT MIR-ADDL-FYR-COMM-RT-T[2]
    {
        Length = "5";
        Decimals = "5";
        FieldGroup = "Table2";
        SType = "Percent";
        Label = "First Year Adjustment";
        Index = "1";
    }

    INOUT MIR-AGE-RAT-REASN-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "ARST";
        SType = "Selection";
        Label = "Age Restrict Reason";
    }

    INOUT MIR-AGT-ID-T[2]
    {
        Length = "6";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Agent ID";
        Index = "1";
    }

    INOUT MIR-COMIT-RT-EFF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Commitment Rate Effective Date";
    }

    INOUT MIR-COMIT-RT-END-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Commitment Rate End Date";
    }

    INOUT MIR-COMM-CHNG-CD-T[2]
    {
        Length = "40";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Commission Change Reason";
        Index = "1";
    }

    INOUT MIR-COMM-RT-TBAC-ID-T[2]
    {
        Length = "5";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Commission Pattern";
        Index = "1";
    }

    INOUT MIR-COMM-TRG-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "COMM-TRG-CALC-CD";
        SType = "Selection";
        Label = "Commission Target Mode";
    }

    INOUT MIR-CONN-CVG-NUM
    {
        Length = "2";
        SType = "Text";
        Label = "Connected Coverage Number";
    }

    INOUT MIR-CONN-POL-ID
    {
        Length = "10";
        SType = "Text";
        Label = "Connected Policy Number";
    }

    INOUT MIR-CPREM-CALC-CD-T[2]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "CPREM-CALC-CD";
        SType = "Selection";
        Label = "Commissionable Premium Method of Payment";
        Index = "1";
    }

    INOUT MIR-CVG-AD-FACE-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "ADB Face Amount";
    }

    INOUT MIR-CVG-AD-MULT-FCT
    {
        Signed;
        Length = "3";
        Decimals = "2";
        SType = "Number";
        Label = "ADB Multiplier";
    }

    INOUT MIR-CVG-AD-PREM-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "ADB Premium";
    }

    INOUT MIR-CVG-AD-XPRY-DT
    {
        Length = "10";
        SType = "Date";
        Label = "ADB Expiry Date";
    }

    INOUT MIR-CVG-AGT-CPREM-AMT-T[2]
    {
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Commissionable Premium";
        Index = "1";
    }

    INOUT MIR-CVG-AGT-SHR-PCT-T[2]
    {
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table2";
        SType = "Percent";
        Label = "Share";
        Index = "1";
    }

    INOUT MIR-CVG-AGT-TYP-CD-T[2]
    {
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "CVG-AGT-TYP-CD";
        SType = "Selection";
        Label = "Agent Type";
        Index = "1";
    }
 
    INOUT MIR-CVG-APP-RECV-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Application Received Date";
    }

    INOUT MIR-CVG-APS-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-APS-CD";
        SType = "Selection";
        Label = "Attending Physician Statement";
    }

    INOUT MIR-CVG-BASIC-PREM-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Annual Premium";
    }

    INOUT MIR-CVG-CNVR-XPRY-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Conversion Expiry Date";
    }

    INOUT MIR-CVG-COLA-PREM-AMT
    {
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "COLA Premium";
    }

    INOUT MIR-CVG-COLA-SELCT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-COLA-SELCT-CD";
        SType = "Selection";
        Label = "COLA";
    }

    INOUT MIR-CVG-COMIT-PCT
    {
        Length = "5";
        Decimals = "3";
        SType = "Percent";
        Label = "Commitment Interest Rate";
    }

    INOUT MIR-CVG-COMIT-RT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Commitment Letter Indicator";
    }

    INOUT MIR-CVG-COMM-TRG-AMT
    {
        Signed;
        Length = "11";
        Decimals = "0";
        SType = "Currency";
        Label = "Annual Commission Target";
    }

    INOUT MIR-CVG-CONN-REASN-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-CONN-REASN-CD";
        SType = "Selection";
        Label = "Connected Policy/Coverage Reason";
    }

    INOUT MIR-CVG-EKG-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-EKG-CD";
        SType = "Selection";
        Label = "Electro-Cardiogram";
    }

    INOUT MIR-CVG-ENHC-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-ENHC-TYP-CD";
        SType = "Selection";
        Label = "Enhancement Indicator";
    }

    INOUT MIR-CVG-FACE-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Face Amount";
    }

    INOUT MIR-CVG-FE-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Flat Extra Duration";
    }

    INOUT MIR-CVG-FE-PREM-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Flat Extra Premium Amount";
    }

    INOUT MIR-CVG-FE-REASN-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "RFLAT";
        SType = "Selection";
        Label = "Flat Extra Reason";
    }

    INOUT MIR-CVG-FE-UPREM-AMT
    {
        Signed;
        Length = "9";
        SType = "Currency";
        Label = "Flat Extra Dollar Amount/Unit";
    }

    INOUT MIR-CVG-GUAR-INT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-GUAR-INT-CD";
        SType = "Selection";
        Label = "Guaranteed Interest Type";
    }

    INOUT MIR-CVG-GUAR-INT-PCT
    {
        Signed;
        Length = "9";
        Decimals = "6";
        SType = "Percent";
        Label = "Guaranteed Interest Rate";
    }

    INOUT MIR-CVG-HO-SPCMN-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-HO-SPCMN-CD";
        SType = "Selection";
        Label = "Head Office Specimen";
    }

    INOUT MIR-CVG-INCM-BRCKT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-INCM-BRCKT-CD";
        SType = "Selection";
        Label = "Income Bracket";
    }

    INOUT MIR-CVG-INSPC-RPT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-INSPC-RPT-CD";
        SType = "Selection";
        Label = "Inspection Report";
    }

    INOUT MIR-CVG-INT-PAYO-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PLAN-INT-PAYO-CD";
        SType = "Selection";
        Label = "Interest Handling Indicator";
    }

    INOUT MIR-CVG-INTRNL-EXAM-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-INTNRL-EXAM-CD";
        SType = "Selection";
        Label = "Medical Internal Exam";
    }

    INOUT MIR-CVG-JNT-LIFE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-JNT-LIFE-CD";
        SType = "Selection";
        Label = "Joint Type";
    }

    INOUT MIR-CVG-LIVES-INSRD-CD
    {
        Length = "1";
        SType = "Text";
        Label = "Number of Lives Insured";
    }

    INOUT MIR-CVG-LTA-PREM-AMT
    {
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "LTA Premium";
    }

    INOUT MIR-CVG-LTA-SELCT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Lifetime Accident Indicator";
    }

    INOUT MIR-CVG-LTB-PREM-AMT
    {
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "LTB Premium";
    }

    INOUT MIR-CVG-LTB-SELCT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Lifetime Benefit Indicator";
    }

    INOUT MIR-CVG-MAT-XPRY-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Maturity/Expiry Date";
    }

    INOUT MIR-CVG-MAX-COMIT-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Commitment Amount";
    }

    INOUT MIR-CVG-ME-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Mortality/Morbidity Extra Premium Duration";
    }

    INOUT MIR-CVG-ME-FCT
    {
        Signed;
        Length = "3";
        Decimals = "2";
        SType = "Number";
        Label = "Mortality/Morbidity Extra Premium Rating";
    }

    INOUT MIR-CVG-ME-PREM-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Mortality/Morbidity Extra Premium Amount";
    }

    INOUT MIR-CVG-ME-RAT-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "TRATE";
        SType = "Selection";
        Label = "True Table Rating";
    }

    INOUT MIR-CVG-ME-REASN-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "RMULT";
        SType = "Selection";
        Label = "Mortality/Morbidity Extra Premium Reason";
    }

    INOUT MIR-CVG-MISC-RAT-1-CD
    {
        Length = "3";
        SType = "Text";
        Label = "Miscellaneous Reason 1";
    }

    INOUT MIR-CVG-MISC-RAT-2-CD
    {
        Length = "3";
        SType = "Text";
        Label = "Miscellaneous Reason 2";
    }

    INOUT MIR-CVG-MPREM-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Modal Premium";
    }

    INOUT MIR-CVG-NMED-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-NMED-CD";
        SType = "Selection";
        Label = "Non-Medical";
    }

    INOUT MIR-CVG-NMED-PRVLG-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Non-Medical Priviledge";
    }

    INOUT MIR-CVG-NOTI-DEPT-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DEPT";
        SType = "Selection";
        Label = "Notify Department";
    }

    INOUT MIR-CVG-NOTI-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Notify date";
    }

    INOUT MIR-CVG-NOTI-REASN-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "NOTRE";
        SType = "Selection";
        Label = "Notify Reason";
    }

    INOUT MIR-CVG-NXT-CPI-FCT
    {
        Length = "5";
        Decimals = "3";
        SType = "Number";
        Label = "Next Premium Rate";
    }

    INOUT MIR-CVG-NXT-RENW-RT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-NXT-RENW-RT-CD";
        SType = "Selection";
        Label = "Next Premium Renewal Rate Indicator";
    }

    INOUT MIR-CVG-OCCP-CLAS-CD
    {
        Length = "2";
        SType = "Text";
        Label = "Occupation Class";
    }

    INOUT MIR-CVG-ORIG-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "ORIG";
        SType = "Selection";
        Label = "Source of Business";
    }

    INOUT MIR-CVG-ORIG-FACE-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Original Face Amount";
    }

    INOUT MIR-CVG-OUT-ALLOC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-OUT-ALLOC-CD";
        SType = "Selection";
        Label = "Policy Level Payout Splits";
    }

    INOUT MIR-CVG-PAR-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-PAR-CD";
        SType = "Selection";
        Label = "Dividend Option";
    }

    INOUT MIR-CVG-PFEE-AMT
    {
        Signed;
        Length = "9";
        SType = "Currency";
        Label = "Flat Policy Fee";
    }

    INOUT MIR-CVG-PHYS-EXAM-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-PHYS-EXAM-CD";
        SType = "Selection";
        Label = "Medical Examination";
    }

    INOUT MIR-CVG-PMED-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-PMED-CD";
        SType = "Selection";
        Label = "Paramedical";
    }

    INOUT MIR-CVG-PREM-CHNG-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Premium Change Date";
    }

    INOUT MIR-CVG-PREV-CPI-FCT
    {
        Length = "5";
        Decimals = "3";
        SType = "Number";
        Label = "Last Premium Rate";
    }

    INOUT MIR-CVG-PREV-FACE-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Last Face Amount";
    }

    INOUT MIR-CVG-PRST-RAT-PCT
    {
        Length = "3";
        Decimals = "0";
        SType = "Percent";
        Label = "Persistency Rating";
    }

    INOUT MIR-CVG-RESTR-PREM-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Restrict Premium Calculation Indicator";
    }

    INOUT MIR-CVG-ROLOVR-DT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Cash Flow Rollover Indicator";
    }

    INOUT MIR-CVG-RT-AGE
    {
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Age";
    }

    INOUT MIR-CVG-SALE-SRC-CD
    {
        Length = "1";
        SType = "Text";
        Label = "Source of Sale";
    }

    INOUT MIR-CVG-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-SEX-CD";
        SType = "Selection";
        Label = "Sex";
    }

    INOUT MIR-CVG-SMKR-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SMOKE";
        SType = "Selection";
        Label = "Smoker";
    }

    INOUT MIR-CVG-STBL-1-CD
    {
        Length = "2";
#* M241A3 changes START here*
        CodeSource = "CSOM9788";        
	FilterFields = "1";
        FilterField1 = "MIR-PLAN-ID"; 
#        CodeSource = "EDIT";
#        CodeType = "STB1";
#* M241A3 changes END here*
        SType = "Selection";
        Label = "Sub-table 1";
    }

    INOUT MIR-CVG-STBL-2-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Selection";
        Label = "Sub-table 2";
    }

    INOUT MIR-CVG-STBL-3-CD
    {
        Length = "40";
#* M241A3 changes START here*
  #      CodeSource = "EDIT";
  #      CodeType = "STB3";
        CodeSource = "CSOM9789";        
	FilterFields = "1";
        FilterField1 = "MIR-PLAN-ID"; 
#* M241A3 changes END here*
        SType = "Selection";
        Label = "Sub-table 3";
    }

    INOUT MIR-CVG-STBL-4-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        SType = "Selection";
        Label = "Sub-table 4";
    }

    INOUT MIR-CVG-STRS-EKG-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-STRS-EKG-CD";
        SType = "Selection";
        Label = "Stress Electro-Cardiogram";
    }

    INOUT MIR-CVG-SUM-INS-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Sum Insured Amount";
    }

    INOUT MIR-CVG-UWG-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Underwriting Amount";
    }

    INOUT MIR-CVG-UWGDECN-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-UWGDECN-CD";
        SType = "Selection";
        Label = "Coverage Decision";
    }

    INOUT MIR-CVG-UWGDECN-SUB-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "CODEC";
        SType = "Selection";
        Label = "Coverage Decision Type";
    }

    INOUT MIR-CVG-UWG-EXCL-CD-T[3]
    {
        Length = "40";
        FieldGroup = "Table6";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "EXCL";
        SType = "Selection";
        Label = "Exclusion Code";
        Index = "1";
    }

    INOUT MIR-CVG-WP-IND
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-WP-IND";
        SType = "Selection";
        Label = "Waiver of Premium Indicator";
    }

    INOUT MIR-CVG-WP-MULT-FCT
    {
        Signed;
        Length = "3";
        Decimals = "2";
        SType = "Number";
        Label = "Waiver of Premium Multiplier";
    }

    INOUT MIR-CVG-WP-PREM-AMT
    {
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "Waiver of Premium Amount";
    }

    INOUT MIR-CVG-WP-XPRY-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Waiver of Premium Expiry Date";
    }

    INOUT MIR-CVG-WTHDR-ORDR-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-WTHDR-ORDR-CD";
        SType = "Selection";
        Label = "Withdrawal Order";
    }

    INOUT MIR-CVG-XRAY-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-XRAY-CD";
        SType = "Selection";
        Label = "X-Ray";
    }

    INOUT MIR-DIA-SWP-THRSHD-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Sweep Threshold Minimum Amount";
    }

    INOUT MIR-DIA-SWP-THRSHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DIA-SWP-THRSHD-CD";
        SType = "Selection";
        Label = "Sweep Threshold Indicator";
    }

    INOUT MIR-DPOS-TRM-DY-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Deposit Term Days";
    }

    INOUT MIR-DPOS-TRM-MO-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Deposit Term Months";
    }

    INOUT MIR-FYR-COMM-CALC-CD-T[2]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "FYR-COMM-CALC-CD";
        SType = "Selection";
        Label = "First Year Commission Method of Payment";
        Index = "1";
    }

    INOUT MIR-GIR-OPT-REMN-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "GIR Maximum Amount";
    }

    INOUT MIR-GIR-OPT-REMN-QTY
    {
        Length = "2";
        SType = "Text";
        Label = "GIR Number of Options Left";
    }

    INOUT MIR-GIR-SEND-LTR-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "GIR Send Letter Indicator";
    }

    INOUT MIR-GUAR-IMPRD-INT-PCT
    {
        Signed;
        Length = "9";
        Decimals = "6";
        SType = "Percent";
        Label = "Impaired Rate";
    }

    INOUT MIR-GUAR-INT-END-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Guaranteed Interest End Date";
    }

    INOUT MIR-GUAR-INT-PERI-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Guaranteed Interest Period";
    }

    INOUT MIR-GUAR-INT-STRT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Guaranteed Interest Start Date";
    }

    INOUT MIR-IA-QUOT-NUM
    {
        Length = "6";
        SType = "Text";
        Label = "Immediate Annuity Quote Number";
    }

    INOUT MIR-INSRD-CLI-ID-T[5]
    {
        Length = "10";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Client ID";
        Index = "1";
    }

    INOUT MIR-MAT-XPRY-DT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Recalculate Maturity/Expiry Date Indicator";
    }

    INOUT MIR-MAT-XPRY-REASN-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "MAT-XPRY-REASN-CD";
        SType = "Selection";
        Label = "Maturity/Expiry Reason";
    }
     
    INOUT MIR-MORT-ASSESS-PCT
    {
        Length = "3";
        Decimals = "0";
        SType = "Percent";
        Label = "Mortality Assessment Percentage";
    }

    INOUT MIR-OUT-ALLOC-AMT-PCT
    {
        Length = "15";
        Decimals = "3";
        SType = "Number";
        Label = "Share Percent/Amount";
    }

    INOUT MIR-OVRID-BASE-AGT-ID-T[2]
    {
        Length = "6";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Override";
        Index = "1";
    }

    INOUT MIR-OVRID-ID-T[2]
    {
        Length = "2";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Override";
        Index = "1";
    }

    INOUT MIR-OWN-OCCP-PREM-AMT
    {
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "Own Occupation Premium";
    }

    INOUT MIR-OWN-OCCP-SELCT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Own Occupation Benefit Indicator";
    }

    INOUT MIR-PDISAB-PREM-AMT
    {
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "Partial Disability Benefit Premium";
    }

    INOUT MIR-PDISAB-SELCT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Partial Disability Benefit Indicator";
    }

    INOUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Selection";
        Label = "Plan";
    }

    INOUT MIR-PMT-LOAD-TRG-AMT
    {
        Signed;
        Length = "11";
        Decimals = "0";
        SType = "Currency";
        Label = "Annual Payment Load Target";
    }

    INOUT MIR-PMT-LOAD-TRG-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PMT-LOAD-TRG-CD";
        SType = "Selection";
        Label = "Payment Load Target Mode";
    }

    INOUT MIR-POL-APP-NUM
    {
        Length = "1";
        SType = "Text";
        Label = "Number of Applications/Policy";
    }

    INOUT MIR-PREV-RENW-RT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PREV-RENW-RT-CD";
        SType = "Selection";
        Label = "Last Premium Renewal Rate Indicator";
    }

    INOUT MIR-REDC-EP-PREM-AMT
    {
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "EP/HOSP Premium";
    }

    INOUT MIR-REDC-EP-SELCT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "EP/HOSP Benefit Indicator";
    }

    INOUT MIR-REL-CVG-NUM
    {
        Length = "2";
        SType = "Text";
        Label = "Connecting Coverage Number";
    }

    INOUT MIR-RENW-COMM-CALC-CD-T[2]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "RENW-COMM-CALC-CD";
        SType = "Selection";
        Label = "Renewal Commission Method of Payment";
        Index = "1";
    }

    INOUT MIR-SNGL-CASE-AGRE-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Single Case Agreement";
    }

    INOUT MIR-UWG-AMT-REASN-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "URSN";
        SType = "Selection";
        Label = "Underwriting Reason";
    }

    INOUT MIR-UWG-REQIR-ESTB-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Underwriting Requirements Established";
    }

    INOUT MIR-UWG-USER-DEFN-1-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "UWREQ";
        SType = "Selection";
        Label = "Miscellaneous Underwriting Requirement 1";
    }

    INOUT MIR-UWG-USER-DEFN-2-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "UWREQ";
        SType = "Selection";
        Label = "Miscellaneous Underwriting Requirement 2";
    }

    INOUT MIR-UWG-USER-DEFN-3-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "UWREQ";
        SType = "Selection";
        Label = "Miscellaneous Underwriting Requirement 3";
    }

    INOUT MIR-UWG-USER-DEFN-4-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "UWREQ";
        SType = "Selection";
        Label = "Miscellaneous Underwriting Requirement 4";
    }

    INOUT MIR-UWG-USER-DEFN-5-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "UWREQ";
        SType = "Selection";
        Label = "Miscellaneous Underwriting Requirement 5";
    }

    INOUT MIR-UW-USER-ID
    {
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

    INOUT MIR-CVG-SUB-STAT-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBSC";
        SType = "Selection";
        Label = "Coverage Sub Status";
    }

}

