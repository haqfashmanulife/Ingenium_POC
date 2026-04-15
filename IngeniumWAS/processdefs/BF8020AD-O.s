# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:03 PM EDT

#*******************************************************************************
#*  Component:   BF8020AD-O.s                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016168  602J     have more link show if > 5 messages                       *
#*  016736  611J     code cleanup                                              *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01CP02  GW       block Agent Info. reduced to occurs(2),add Agt Type.      *
#*  02PR55  RNL      ADD MAT-XPRY-REASN-CD                                     *
#*  M00025  MAW      Added MIR-CVG-SUB-STAT-CD                                 *
#*  PR006I  BMB      Changes for ManuMed rider renewals                        *
#*  P00859  FB       Add MIR-CVG-REINS-IND and MIR-CVG-REINS-CO-ID             *
#*  MFPL1B  H.L      ADD MIR-CVG-ILLUS-CD                                      *
#*  U40083  CLB      Display/edit new REDC FACE flds for Opt 2                 *
#*  MFFAN8  MC       ADD EXPECTED ANNUITY AGE AND DATE                         *
#*  RP2009  CTS      ADD COVERAGE PREMIUM CHANGE REASON CODE                   *
#*  RPL009  CTS      ADDED OVERRIDE SUBTABLE-3 FIELD FOR RENEWAL               *
#*  MP29NB  CTS      ADDED MIR VARIABLES FOR TREATY NUMBER,CEDING PERCENTAGE   *
#*  MP29NB           AND CEDING AMOUNT.                                        *
#*  FEID01  CTS      ADD LIABILITY COMMENCEMENT DATE FIELD FOR LCD ONLINE      *
#*  FEID01           CHANGES                                                   *
#*  M142W1  CTS      ADDED RENEWAL FACE AMOUNT AND EFFECTIVE DATE OF RENEWAL   *
#*  M142W1           FACE AMOUNT                                               *
#*  M142W3  CTS      CHANGES FOR PREMIUM CHANGE REASON                         *   
#*  MP211B  CTS      ADD NEW FIELDS FOR LIEN DURATION.                         *
#*  M213K1  CTS      CHANGES FOR ADDING NEW FIELD BASE RIDER CVG NUM1,         *
#*                   BASE RIDER CVG NUM2 AND GROUP ID  AS PART RUM             *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*  MP245J  CTS      ADD NEW FIELD FOR SUBSTANDARD AGE DURATION AS PART OF SPWL*
#*  M271O1  CTS      CHANGES DONE AS PART OF FRA                               * 
#*  M271A8  CTS      TAX QUALIFIED INDIVIDUAL INDICATOR CHANGES                *
#*  M280A1  CTS      CHANGES DONE TO INCREASE THE LENGTH OF PLAN-BNFT-TYP-CD   *
#*  M280A1           FROM 1 BYTE TO 2 BYTES                                    *
#*  018395  CTS      CHANGES DONE FOR TRAD RIDER RENEWAL                       *
#*  TDMG07  CTS      SCREEN CHANGES FOR NWL                                    *
#*  118579  CTS      CHANGES DONE TO CORRECT THE FIELD PREMIUM PAYMENT         *
#*  118579           DESCRIPTION 
#*  TLB015  CTS      RESINSURANCE CHANGES                                      *
#*  UYS014  CTS      ADDITION OF NEW FIELD FOR INCREASING FACE AMOUNT          *
#*  UYS133  CTS      Addition of PD group size field                           *
#*  S23388  CTS      FIX TO DISPLAY CURRECNY CODE                              * 
#*  UY3068  CTS      ADDITION OF NEW FIELDS AS PART OF STREAM3 FA REDUCTION    *
#*  UY3028  CTS      BASE PRODUCT RENEWAL                                      *
#*  UY349C  CTS      CORPORATE ANNUITY STREAM 3                                *
#*  UY304A  CTS      CALL CENTER SCREEN ENHANCEMENT                            *
#*  UCR244  CTS      CHANGES DONE AS PART OF STREAM3                           *
#*******************************************************************************

S-STEP BF8020AD-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
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
    # TDMG07 changes begin
    
         IN MIR-PREM-PMT-CMPLT-IND
         {
          DisplayOnly;
          Length = "1";
          SType = "Indicator";
# 118579 changes begin      
#         Label = "Premium Payment Completion";
	  Label = "Base Policy Premium Payment Completion";
# 118579 changes end 
         }
    		    
    # TDMG07 changes end 


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
        Label = "Commissionable Premium Method";
        Index = "1";
    }

    IN MIR-CVG-AD-FACE-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
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
        Label = "ADB Multipler";
    }

    IN MIR-CVG-AD-PREM-AMT
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
        Label = "ADB Premium";
    }

    IN MIR-CVG-AGT-CPREM-AMT-T[2]
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
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
        Label = "Annual Premium";
    }

    IN MIR-CVG-CNVR-XPRY-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Conversion Expiry Age";
    }

    IN MIR-CVG-COLA-PREM-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
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
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Face Amount";
    }
#UY3068 CHANGES START HERE 
    IN MIR-CVG-ANTY-CAP-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Annuity Capital";
    }
#UY3068 CHANGES END HERE 
    IN MIR-CVG-FE-DUR
    {
        DisplayOnly;
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
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
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
        CodeType = "CVG-INTRNL-EXAM-CD";
        SType = "Text";
        Label = "Medical Internal Exam";
    }

    IN MIR-CVG-ISS-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Issue Date";
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
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
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
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
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
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
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
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
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

#*   RP2009 CHANGES STARTS HERE *
#*   M142W3 CHANGES STARTS HERE *

    IN MIR-PREM-CHNG-REASN-CD
    {
        DisplayOnly;
        Length = "02";
#        CodeSource = "EDIT";
#        CodeType = "PRMCH";
        CodeSource = "DataModel";
        CodeType = "PREM-CHNG-REASN-CD";
        SType = "Text";
        Label = "Premium Change Reason";
    }

#*   RP2009 CHANGES ENDS HERE *
#*   M142W3 CHANGES ENDS HERE *


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
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
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
#       CodeSource = "EDIT";
#       CodeType = "STB1";
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
        CodeSource = "CSOM9789";        
        FilterFields = "1";
        FilterField1 = "MIR-PLAN-ID"; 
#        CodeSource = "EDIT";
#        CodeType = "STB3";
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
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Sum Insured Amount";
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

    IN MIR-CVG-UWG-EXCL-1-CD-T[3]
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
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "Waiver of Premium Amount";
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
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
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
        Length = "51";
        SType = "Text";
        Label = "Insured Name";
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

    IN MIR-DV-INSRD-CLI-NM-T[5]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Insured Name";
        Index = "1";
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

    IN MIR-MORT-ASSESS-PCT
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Percent";
        Label = "Mortality Assessment Percentage";
    }

    IN MIR-MORT-XPNS-CHG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Mortality & Expense Change Date";
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
        Label = "Override Key";
        Index = "1";
    }

    IN MIR-OVRID-ID-T[2]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Override Situation";
        Index = "1";
    }

    IN MIR-OWN-OCCP-PREM-AMT
    {
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "Own Occupation Definition of Disability (OCC) Premium";
    }

    IN MIR-OWN-OCCP-SELCT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Own occupation benefit";
    }

    IN MIR-PDISAB-PREM-AMT
    {
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE  
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

    IN MIR-POL-BILL-MODE-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD"; 
        SType = "Text";
        Label = "Premium Mode";
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

    IN MIR-POL-PD-TO-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Paid to Date";
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
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
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

    IN MIR-POL-APPL-CTL-CD
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Application System Code";
    }

    IN MIR-CVG-MAT-XPRY-AGE
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Maturity Age";
    }

    IN MIR-CVG-MAT-XPRY-DUR
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Maturity Years";
    }

    IN MIR-CVG-UL-PU-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "UL Paid-Up Date";
    }

    IN MIR-PLAN-BNFT-TYP-CD
    {
#* M280A1 CHANGES START*    
#       Length = "1";
        Length = "2";
#* M280A1 CHANGES END*
        CodeSource = "DataModel";
        CodeType = "PLAN-BNFT-TYP-CD";
        DBTableName = "TCVG";
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

#*  PR006I  BMB      Changes for ManuMed rider renewals   *

    IN MIR-CVG-RENW-PLAN-ID
    {
        DisplayOnly;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Override Renewal Plan";
    }

#* 018395 CHANGES START HERE

    IN MIR-CVG-RENW-ACPT-DT
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Renewal Acceptance Date";
    }
#*  018395 CHANGES ENDS HERE   

    IN MIR-CVG-RENW-STBL-1-CD
    {
        DisplayOnly;
        Length = "2";
#* M241A3 changes START here*
        CodeSource = "CSOM9788";        
	FilterFields = "1";
        FilterField1 = "MIR-PLAN-ID"; 
#        CodeSource = "EDIT";
#        CodeType = "STB1";
#* M241A3 changes END here*
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Override Renewal Duration";
    }
    
#UY3028 CHANGES START HERE

    IN MIR-CVG-UNSECUR-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Unsecured Indicator";
        Index = "1";        
    }
    
    IN MIR-POL-RENW-DEN-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Renewal Denial Indicator";
        Index = "1";        
    }    

    IN MIR-ORIG-COVER-PER
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Original Coverage Period";
    }
 #UY3028 CHANGES END HERE     

    IN MIR-CVG-RENW-STBL-2-CD
    {
        DisplayOnly;
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Override Renewal Benefit Limit";
    }
#* RPL009 CHANGES STARTS HERE *
    IN MIR-CVG-RENW-STBL-3-CD
    {
        DisplayOnly;
        Length = "5";
#* M241A3 changes START here*
        CodeSource = "CSOM9789";        
        FilterFields = "1";
        FilterField1 = "MIR-PLAN-ID"; 
#       CodeSource = "EDIT";
#      CodeType = "STB3";
#* M241A3 changes END here*
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Override Sub-Table 3";
     }
#* RPL009 CHANGES ENDS HERE *

#*   RP2009 CHANGES STARTS HERE *
    IN MIR-CVG-RENW-STBL-4-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Override Sub-Table 4";
     }

#*   RP2009 CHANGES STARTS HERE *


    IN MIR-CVG-REINS-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Reinsured";
        Index = "1";
    }

#MP29NB changes start
    IN MIR-CVG-REINS-CO-ID
    {
#        Length = "1";
        Length = "2";
#        CodeSource = "DataModel";
#        CodeType = "CVG-REINS-CO-ID";
        CodeSource = "EDIT";
        CodeType = "REINS";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Reinsurance Company";
        Index = "1";
    }
      
    IN MIR-CVG-REINS-TRTY-NUM
    {    
        Length = "3";    
        CodeSource = "EDIT";
        CodeType = "TRTNM";    
        DBTableName = "TCVG";    
        SType = "Text";    
        Label = "Treaty Number";    
        Index = "1";    
    }    
        
    IN MIR-CVG-REINS-CED-PCT
     {    
        Length = "3";        
        CodeSource = "EDIT";   
        CodeType = "CDPCT";         
        DBTableName = "TCVG";        
        SType = "Text";        
        Label = "Ceding Percentage";    
        Index = "1";        
    }
    
    IN MIR-CVG-REINS-CED-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
#M245B2 CHANGES START HERE        
#        Decimals = "2";
#M245B2 CHANGES END HERE
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Ceded Amount";
        Index = "1";
    }                        
#MP29NB changes ends

    IN MIR-CVG-ILLUS-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "ILLUS";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Illustration Type";
    }

    IN MIR-SW-REDC-FACE-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Opt 2 Switch, Reduced Face Amount";
    }

    IN MIR-SW-REDC-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Opt 2 Switch, Effective Date of Reduced Face Amount";
    }
#*  M142W1 START  *
    IN MIR-RENW-FACE-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE  
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Renewal Face Amount";
    }

    IN MIR-RENW-FACE-CHNG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Effective Date of Renewal Face Amount";
    }
#*  M142W1 END  *

#*  MFFAN8 START  *
    IN MIR-CVG-XPCT-ANTY-AGE
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Expected Annuity Age";
    }

    IN MIR-CVG-XPCT-ANTY-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Expected Annuity Date";
    }
#*  MFFAN8 END  *

#* FEID01 Changes begin

    IN MIR-LIAB-STRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Liability Commencement date";
    }

#* FEID01 Changes end
#MP211B changes starts 

    IN MIR-CVG-LIEN-DUR
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        SType = "Text";
        Label = "Lien Duration";
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

    IN MIR-PRIM-1-CVG-NUM
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Base Rider Coverage Number 1";
        Index = "1";
    }
    
    IN MIR-PRIM-2-CVG-NUM
     {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Base Rider Coverage Number 2";
        Index = "1";
     }
    
    IN MIR-CVG-PRIM-GR-ID
     {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Group ID";
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
    IN MIR-TAX-QUALF-IND
    {
           DisplayOnly;
           Length = "1";
           SType = "Indicator";
           Label = "Tax Qualified Indicator"; 
           Index = "1";  
    }
#M271A8 CHANGES END HERE
#TLB015 CHANGES STARTS HERE
    IN MIR-REINS-TYP-CD
    {
        Length = "2";
        DisplayOnly;
        CodeSource = "EDIT";
        CodeType = "RETYP";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Reinsurance Type";
        Index = "1";
    }
#TLB015 CHANGES ENDS HERE
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
#UY3068 CHANGES START HERE
    IN MIR-CVG-PMT-TYP-IND
    {
        DisplayOnly;
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "P-Type Policy";
    }
#UY3068 CHANGES END HERE
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

#UY349C CHANGES STARTS HERE    
    IN MIR-ANTY-TYP-CD
    {
        Length = "2";
        SType = "Selection";
        DBTableName = "TCVG";
        CodeSource = "DataModel";
        CodeType = "CVG-ANTY-TYP-CD";
        Label = "Annuity Type";
    }
        
    IN MIR-ANTY-STYLE-CD
    {
        Length = "2";
        SType = "Selection";
        DBTableName = "TCVG";
        CodeSource = "DataModel";
        CodeType = "CVG-ANTY-STL";
        Label = "Annuity Style";      
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
#UY304A CHANGES STARTS HERE 
    IN MIR-BNFT-PAYO-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Benefit Payment Date";
    }
    IN MIR-PMT-CMPLT-IND
    {
        DisplayOnly;
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Single Premium Coverage Indicator";
    }
    IN MIR-PMT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "P-Type Policy";
    }
    IN MIR-SURR-ANTY-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Surrender Annuity Amount";
    }
    IN MIR-SURR-ANTY-CAP-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Surrender Annuity Capital Amount";
    }
    IN MIR-SURR-ADDL-ANTY-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "90% Additional Annuity Amount";
    }
    IN MIR-BASIC-ANTY-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Basic Annuity Amount";
    }
    IN MIR-ADDL-ANTY-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Additional Annuity Amount";
    }
#UY304A CHANGES ENDS
}

