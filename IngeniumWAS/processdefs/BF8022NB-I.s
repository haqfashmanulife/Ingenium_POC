# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:04 PM EDT

#*******************************************************************************
#*  Component:   BF8022NB-I.s                                                  *
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
#*  PR006C  FB       Add filter for MIR-PLAN-ID select box                     *
#*  PR006I  BMB      Change labels for connected coverages                     *
#*  P00859  FB       Add MIR-CVG-REINS-IND and MIR-CVG-REINS-CO-ID             *
#*  MFPL1B  H.L      ADD MIR-ILLUS-CD FOR ILLUSTRATION TYPE                    *
#*  MFFAN8  MC       ADD EXPECTED ANNUITY AGE AND DATE                         *
#*  RP2009  CTS      ADD COVERAGE PREMIUM CHANGE REASON CODE                   *
#*  MP29NB  CTS      ADDED MIR VARIABLES FOR TREATY NUMBER,CEDING PERCENTAGE   *
#*  MP29NB           AND CEDING AMOUNT.                                        *
#*  FEID01  CTS      ADD LIABILITY COMMENCEMENT DATE FIELD FOR LCD ONLINE      *
#*  FEID01           CHANGES                                                   *
#*  M142W3  CTS      CHANGES FOR PREMIUM CHANGE REASON                         *
#*  MP211B  CTS      ADD NEW FIELDS FOR LIEN DURATION.                         *
#*  M213K1  CTS      CHANGES FOR ADDING NEW FIELD BASE RIDER CVG NUM1,         *
#*                   BASE RIDER CVG NUM2 AND GROUP ID  AS PART RUM             *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  MP245J  CTS      ADD NEW FIELD FOR SUBSTANDARD AGE DURATION AS PART OF SPWL*
#*  MP253N  CTS      CHANGES DONE TO DISPLAY THE COMPLETE PLAN-NAMES OR FILTER *
#*                   PLAN-NAMES AS PART OF ULE-II                              *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  M271A8  CTS      TAX QUALIFIED INDIVIDUAL INDICATOR CHANGES                *
#*  M280A1  CTS      CHANGES DONE TO INCREASE THE LENGTH OF PLAN-BNFT-TYP-CD   *
#*  M280A1           FROM 1 BYTE TO 2 BYTES                                    *
#*  TLB015  CTS      REINSURANCE TYPE                                          *
#*  UYS133  CTS      Addition of PD group size field                           *
#*  UY349C  CTS      CORPORATE ANNUITY STREAM 3                                *
#*  NVCN01  CTS      CHANGES DONE AS PART OF ONTARIO XML UPLOAD                *
#*******************************************************************************

S-STEP BF8022NB-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-PLAN-ID";
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
        Decimals = "3";
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
        CodeSource = "EDIT";
        CodeType = "COMR";
        SType = "Selection";
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
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
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

    INOUT MIR-CVG-AD-PREM-AMT
    {
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
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
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
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

    INOUT MIR-CVG-BASIC-PREM-AMT
    {
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
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
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
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
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Face Amount";
    }

    INOUT MIR-CVG-FE-PREM-AMT
    {
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Flat Extra Premium Amount";
    }

    IN MIR-CVG-FE-UPREM-AMT
    {
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
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

    INOUT MIR-CVG-INT-PAYO-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PLAN-INT-PAYO-CD";
        SType = "Selection";
        Label = "Interest Handling Indicator";
    }

    INOUT MIR-CVG-JNT-LIFE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-JNT-LIFE-CD";
        SType = "Selection";
        Label = "Joint Type";
    }

    INOUT MIR-CVG-LTA-PREM-AMT
    {
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
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
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
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
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Length = "13";
        SType = "Currency";
        Label = "Commitment Amount";
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

    INOUT MIR-CVG-ME-PREM-AMT
    {
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
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

    INOUT MIR-CVG-MPREM-AMT
    {
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Modal Premium";
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

    INOUT MIR-CVG-ORIG-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "ORIG";
        SType = "Selection";
        Label = "Source of Business";
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
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        Signed;
        Length = "9";
        SType = "Currency";
        Label = "Flat Policy Fee";
    }

    INOUT MIR-CVG-PREM-CHNG-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Premium Change Date";
    }

#*   RP2009 CHANGES STARTS HERE *
#*   M142W3 CHANGES STARTS HERE *

    INOUT MIR-PREM-CHNG-REASN-CD
    {
        Length = "2";
#        CodeSource = "EDIT";
#        CodeType = "PRMCH";
        CodeSource = "DataModel";
        CodeType = "PREM-CHNG-REASN-CD";
        SType = "Selection";
        Label = "Premium Change Reason";
     }

#*   RP2009 CHANGES ENDS HERE *
#*   M142W3 CHANGES ENDS HERE *

    INOUT MIR-CVG-RESTR-PREM-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Restrict Premium Calculation Indicator";
    }

    INOUT MIR-CVG-RT-AGE
    {
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Age";
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
#      CodeSource = "EDIT";
#      CodeType = "STB1";
 	CodeSource = "CSOM9788";        
	FilterFields = "1";
        FilterField1 = "MIR-PLAN-ID"; 
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
#        CodeSource = "EDIT";
#        CodeType = "STB3";
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

    IN MIR-CVG-SUM-INS-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Sum Insured Amount";
    }

    INOUT MIR-CVG-UWG-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-GLOB-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Underwriting Amount";
    }

    INOUT MIR-CVG-WP-IND
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-WP-IND";
        SType = "Selection";
        Label = "Waiver of Premium Indicator";
    }
#NVCN01 START
    INOUT MIR-CVG-WP-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "WPIND";
        SType = "Selection";
        Label = "WoP Type";
    }
#NVCN01 END
    IN MIR-CVG-WP-MULT-FCT
    {
        DisplayOnly;
        Signed;
        Length = "3";
        Decimals = "2";
        SType = "Number";
        Label = "Waiver of Premium Multiplier";
    }

    INOUT MIR-CVG-WP-PREM-AMT
    {
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
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

    INOUT MIR-DIA-SWP-THRSHD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
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

    IN MIR-GIR-OPT-REMN-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
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
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
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
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
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
    
#MP253N CHANGES START HERE
    IN MIR-PLAN-LIST-CD
       {
          Length = "1";
          SType = "Hidden";
          Label = "Plan List";
       }
#MP253N CHANGES END HERE       

    # the following field is used to provide a filtered
    # selection box to the user, providing them only with
    # products that match their input criteria.

    INOUT MIR-PLAN-ID
    {
        Length = "40";
        Mandatory;
        CodeSource = "CSOM9902";
#MP253N CHANGES START HERE         
#        FilterFields = "3";
         FilterFields = "4";
#MP253N CHANGES END HERE         
        FilterField1 = "MIR-POL-ID-BASE";
        FilterField2 = "MIR-POL-ID-SFX";
        FilterField3 = "MIR-CVG-NUM";
#MP253N CHANGES START HERE        
        FilterField4 = "MIR-PLAN-LIST-CD";
#MP253N CHANGES END HERE         
        SType = "Selection";
        Label = "Plan ID";
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

    INOUT MIR-REDC-EP-PREM-AMT
    {
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
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

    INOUT MIR-UWG-AMT-REASN-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "URSN";
        SType = "Selection";
        Label = "Underwriting Reason";
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

    IN MIR-DV-INSRD-CLI-NM-T[5]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Insured Name";
        Index = "1";
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
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Length = "7";
#M245B2 CHANGES START HERE        
#        Decimals = "0";
#M245B2 CHANGES END HERE
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

    IN MIR-MNPMT-TRG-LTD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
#M245B2 CHANGES START HERE        
#        Decimals = "0";
#M245B2 CHANGES END HERE
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
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
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
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Annual Premium";
    }

    IN MIR-POL-MPREM-AMT
    {
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Mode Premium";
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

    IN MIR-POL-APPL-CTL-CD
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Application System Code";
    }

    INOUT MIR-CVG-MAT-XPRY-AGE
    {
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Maturity Age";
    }

    INOUT MIR-CVG-MAT-XPRY-DUR
    {
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Maturity Years";
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

    INOUT MIR-CVG-REINS-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Reinsured";
        Index = "1";
    }
  
#MP29NB changes start
    INOUT MIR-CVG-REINS-CO-ID
    {
#        Length = "1";
        Length = "2";
#        CodeSource = "DataModel";
#        CodeType = "CVG-REINS-CO-ID";
        CodeSource = "EDIT";
        CodeType = "REINS";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Reinsurance Company";
        Index = "1";
    }
    
    INOUT MIR-CVG-REINS-TRTY-NUM
    {    
        Length = "3";    
        CodeSource = "EDIT";
        CodeType = "TRTNM";     
        DBTableName = "TCVG";    
        SType = "Selection";    
        Label = "Treaty Number";    
        Index = "1";    
    }    
        
    INOUT MIR-CVG-REINS-CED-PCT
     {    
        Length = "3";        
        CodeSource = "EDIT";   
        CodeType = "CDPCT";        
        DBTableName = "TCVG";        
        SType = "Selection";        
        Label = "Ceding Percentage";    
        Index = "1";        
    }
    
    INOUT MIR-CVG-REINS-CED-AMT
    {
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Ceded Amount";
        Index = "1";
    }                        
#MP29NB changes ends        

    INOUT MIR-CVG-ILLUS-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "ILLUS";
        SType = "Selection";
        Label = "Coverage Illustration Type";
    }

#* MFFAN8 START ****
    INOUT MIR-CVG-XPCT-ANTY-AGE
    {
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Maturity Age";
    }

    IN MIR-CVG-XPCT-ANTY-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Expected Annuity Date";
    }
#* MFFAN8 END ****

#* FEID01 Changes begin

    INOUT MIR-LIAB-STRT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Liability Commencement date";
    }

#* FEID01 Changes end
#MP211B changes starts

    IN MIR-CVG-LIEN-DUR
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        SType = "Text";
        Label = "Lien Duration";
        Index = "1";
    }
#MP211B changes ends

#MP245J CHANGES STARTS HERE

    IN MIR-SSTD-AGE-ADD-DUR
    {
        DisplayOnly;
        Length = "2";
        Decimals = "0";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Substandard Age Duration";
    }

#MP245J CHANGES ENDS HERE

#* M213K1 Changes begin

    INOUT MIR-PRIM-1-CVG-NUM
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label ="Base Rider Coverage Number 1";
        Index = "1";
    }
    
    INOUT MIR-PRIM-2-CVG-NUM
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label ="Base Rider Coverage Number 2";
        Index = "1";
    }

    INOUT MIR-CVG-PRIM-GR-ID
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label ="Group ID";
        Index = "1";
    }


#* M213K1 Changes end

#M245B2 CHANGES START HERE     
      INOUT MIR-POL-CRCY-CD
        {
     
          Length = "2";
          SType = "Hidden";
          Label = "Currency";
        }
      INOUT MIR-GLOB-CRCY-CD
        {
     
          Length = "2";
          SType = "Hidden";
          Label = "Currency";
        }
#M245B2 CHANGES END HERE    
#M271O1 CHANGES START HERE  
         
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 
#M271A8 CHANGES START HERE  
    INOUT MIR-TAX-QUALF-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Tax Qualified Indicator"; 
        Index = "1";  
    }
#M271A8 CHANGES END HERE
#TLB015 CHANGES START HERE
    IN MIR-REINS-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "RETYP";
        SType = "Text";
        Label = "Reinsurance Type";
    }
#TLB015 CHANGES END HERE
#UYS133 CHANGES START
    IN MIR-PD-GR-TYP-CD
    {
        DisplayOnly;
        Length      = "1";
        SType       = "Text";
        CodeSource  = "DataModel";
        CodeType    = "PD-GR-TYP-CD";
        Label       = "PD group size";
    }
#UYS133 CHANGES END

#UY349C CHANGES STARTS HERE    
    INOUT MIR-ANTY-TYP-CD
    {
        Length = "2";
        SType = "Selection";
        DBTableName = "TCVG";
        CodeSource = "DataModel";
        CodeType = "CVG-ANTY-TYP-CD";
        Label = "Annuity Type";
    }
        
    INOUT MIR-ANTY-STYLE-CD
    {
        Length = "2";
        SType = "Selection";
        DBTableName = "TCVG";
        CodeSource = "DataModel";
        CodeType = "CVG-ANTY-STL";
        Label = "Annuity Style";      
    }
    
    INOUT MIR-CONN-CORP-INSRD-ID
    {
        Length = "10";
        SType = "Text";
        Label = "Connected Policy Number";
    }

#UY349C CHANGES ENDS
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

