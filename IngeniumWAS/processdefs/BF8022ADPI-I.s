# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:04 PM EDT

#*******************************************************************************
#*  Component:   BF8022ADPI-I.s                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016168  602J     have more link show if > 5 messages                       *
#*  016736  611J     code cleanup                                              *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01CP02  GW       Added 'Agent Type' & 'Plan benefit Type' - Agent info.    *
#*                   only occurs (2).                                          *
#*  02PR55  RNL      Add MAT-XPRY-REASN-CD                                     *
#*  02NB64  WBP      Add Insured Search                                        *
#*  M00025  MAW      Added MIR-CVG-SUB-STAT-CD                                 *
#*  PR006I  BMB      Change labels for connected coverages                     *
#*  P00859  FB       Add MIR-CVG-REINS-IND and MIR-CVG-REINS-CO-ID             *
#*  MFPL1B  H.L      ADD MIR-CVG-ILLUS-CD                                      *
#*  MFFAN8  MC       ADD EXPECTED ANNUITY AGE AND DATE                         *
#*                                                                             *
#*  RP2009  CTS      ADD COVERAGE PREMIUM CHANGE REASON CODE                   *
#*  MP29NB  CTS      ADDED MIR VARIABLES FOR TREATY NUMBER,CEDING PERCENTAGE   *
#*  MP29NB           AND CEDING AMOUNT.                                        *
#*  FEID01  CTS      ADD LIABILITY COMMENCEMENT DATE FIELD FOR LCD ONLINE      *
#*  FEID01           CHANGES                                                   *
#*  M142W3  CTS      CHANGES FOR PREMIUM CHANGE REASON                         *
#*  Q29538  16DEC12  MP211B- ADD NEW FIELDS FOR LIEN DURATION.                 *
#*  M213K1  CTS      CHANGES FOR ADDING NEW FIELD BASE RIDER CVG NUM1,         *
#*                   BASE RIDER CVG NUM2 AND GROUP ID  AS PART RUM             *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  MP245J  CTS      ADD NEW FIELD FOR SUBSTANDARD AGE DURATION AS PART OF SPWL*
#*  MP253N  CTS      CHANGES DONE FOR ULE-2 PIRA PROCESS                       *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  M271A8  CTS      TAX QUALIFIED INDIVIDUAL INDICATOR CHANGES                *
#*  M280A1  CTS      CHANGES DONE TO INCREASE THE LENGTH OF PLAN-BNFT-TYP-CD   *
#*  M280A1           FROM 1 BYTE TO 2 BYTES                                    *
#*  TLB015   CTS      REINSURANCE TYPE                                          *
#*  UYS014  CTS      ADDITION OF NEW FIELD FOR INCREASING FACE AMOUNT          *
#*  UYS133  CTS      Addition of PD group size field                           *
#*  S23388  CTS      FIX TO DISPLAY CURRECNY CODE                              *
#*******************************************************************************

S-STEP BF8022ADPI-I
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

    INOUT MIR-CVG-COMM-TRG-AMT
    {
#M271O1 CHANGES START HERE 
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE  
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
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
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

    IN MIR-CVG-FE-PREM-AMT
    {
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
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
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
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
        CodeType = "CVG-INTRNL-EXAM-CD";
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

    IN MIR-CVG-MAT-XPRY-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Maturity/Expiry Date";
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

    IN MIR-CVG-ME-PREM-AMT
    {
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
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
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
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
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
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

    IN MIR-CVG-PREM-CHNG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Premium Change Date";
    }

#*   RP2009 CHANGES STARTS HERE *
#*   M142W3 CHANGES STARTS HERE *

    IN MIR-PREM-CHNG-REASN-CD
    {
        DisplayOnly;
        Length = "2";
#        CodeSource = "EDIT";
#        CodeType = "PRMCH";
        CodeSource = "DataModel";
        CodeType = "PREM-CHNG-REASN-CD";
        SType = "Text";
        Label = "Premium Change Reason";
    }

#*   RP2009 CHANGES ENDS HERE *
#*   M142W3 CHANGES ENDS HERE *


    INOUT MIR-CVG-PREV-CPI-FCT
    {
        Length = "5";
        Decimals = "3";
        SType = "Number";
        Label = "Last Premium Rate";
    }

    INOUT MIR-CVG-PREV-FACE-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE  
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
#        CodeSource = "EDIT";
#        CodeType = "STB1";
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
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Sum Insured Amount";
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

    INOUT MIR-CVG-UWG-EXCL-1-CD-T[3]
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
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
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

    IN MIR-GIR-SEND-LTR-IND
    {
        DisplayOnly;
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

    IN MIR-DV-INSRD-CLI-NM-T[5]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Insured Name";
        Index = "1";
    }

    OUT ChangeInsuredLink-T[5]
    {
        Label = "Search for other";
        FieldGroup = "Table5";
        Link;
        SType = "Text";
        Action = "GoToInsuredSearch";
        Index = "1";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
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

    INOUT MIR-PLAN-ID
    {
        Length = "40";
#MP253N CHANGES START HERE         
#       CodeSource = "EDIT";
#       CodeType = "PLAN";
        CodeSource = "CSOM9902";
#       FilterFields = "3";
        FilterFields = "4";
        FilterField1 = "MIR-POL-ID-BASE";
        FilterField2 = "MIR-POL-ID-SFX";
        FilterField3 = "MIR-CVG-NUM";
        FilterField4 = "MIR-PLAN-LIST-CD";
#MP253N CHANGES END HERE        
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

    INOUT MIR-SNGL-CASE-AGRE-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Single Case Agreement";
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

    INOUT MIR-CVG-ISS-EFF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Issue Date";
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

    IN MIR-POL-APPL-CTL-CD
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Application System Code";
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

    IN MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status Code";
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

    IN MIR-POL-PD-TO-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Paid to Date";
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

    IN MIR-CVG-CSN-REC-CTR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Reinsurance Cession Record";
    }

    IN MIR-POL-CVG-REC-CTR
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Number of Coverages";
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
#MP253N CHANGES START HERE

    IN MIR-PLAN-LIST-CD
       {
          Length = "1";
          SType = "Hidden";
          Label = "Plan List";
       }
#MP253N CHANGES END HERE            
   
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
        CurrencyCode = "MIR-POL-CRCY-CD";
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
#Q29538 Changes starts

    INOUT MIR-CVG-LIEN-DUR
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        SType = "Selection";
        Label = "Lien Duration";
     }
#Q29538 Changes ends

#MP245J CHANGES STARTS HERE

    INOUT MIR-SSTD-AGE-ADD-DUR
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
#UYS014 CHANGES STARTS HERE
   IN MIR-INCR-FACE-AMT
   {
#S23388 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#S23388 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "Increased Face amount";
    }   
#UYS014 CHANGES ENDS HERE
#UYS133 CHANGES START 
    IN MIR-PD-GR-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        SType = "Text";
        Label = "PD group size";
    }
#UYS133 CHANGES END 
}


