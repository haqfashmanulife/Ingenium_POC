# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:54 PM EDT

#*******************************************************************************
#*  Component:   BF8020-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  611J     code cleanup                                              *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01CP02  GW       1st. Agent Info. block reduced to uccurs(2), add Agt.type *
#*  02PR55  RNL      Add MAT-XPRY-REASN-CD                                     *
#*  M00025  MAW      Add MIR-CVG-SUB-STAT-CD                                   *
#*  PR006I  BMB      Changes for ManuMed rider renewals                        *
#*  P00859  FB       Add MIR-CVG-REINS-IND and MIR-CVG-REINS-CO-ID             *
#*  MFPL1B  H.L      ADD MIR-CVG-ILLUS-CD                                      *
#*  U40083  CLB      Display/edit new REDC FACE flds for Opt 2                 *
#*  MFFAN8  MC       ADD EXPECTED ANNUITY AGE AND DATE
#*  RP2009  CTS      ADD COVERAGE PREMIUM CHANGE REASON CODE                   *
#*  RPL009  CTS      ADDED OVERRIDE SUBTABLE-3 FIELD FOR RENEWAL               *
#*  MP29NB  CTS      ADDED MIR VARIABLES FOR TREATY NUMBER,CEDING PERCENTAGE   *
#*  MP29NB           AND CEDING AMOUNT.                                        *
#*  FEID01  CTS      ADD LIABILITY COMMENCEMENT DATE FIELD FOR LCD ONLINE      *
#*  FEID01           CHANGES                                                   *
#*  M142W1  CTS      DISPLAY NEW RENEWAL FACE FIELDS                           *
#*  M142W3  CTS      CHANGES FOR PREMIUM CHANGE REASON                         *
#*  MP211B  CTS      ADD NEW FIELDS FOR LIEN DURATION.                         *
#*  M213K1  CTS      CHANGES FOR ADDING NEW FIELD BASE RIDER CVG NUM1,         *
#*                   BASE RIDER CVG NUM2 AND GROUP ID  AS PART RUM             *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  MP245J  CTS      ADD NEW FIELD FOR SUBSTANDARD AGE DURATION AS PART OF SPWL*
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  M271A8  CTS      TAX QUALIFIED INDIVIDUAL INDICATOR CHANGES                *
#*  M280A1  CTS      CHANGES DONE TO INCREASE THE LENGTH OF PLAN-BNFT-TYP-CD   *
#*  M280A1           FROM 1 BYTE TO 2 BYTES                                    *
#*  018395  CTS      CHANGES DONE FOR TRAD RIDER RENEWAL                       *
#*  TDMG07  CTS      SCREEN CHANGES FOR NWL                                    *
#*  118579  CTS      CHANGES DONE TO CORRECT THE FIELD PREMIUM PAYMENT         *
#*  118579           DESCRIPTION                                               *
#*  TLB015  CTS      REINSURANCE TYPE                                          *
#*  UYS014  CTS      ADDITION OF NEW FIELD FOR INCREASING FACE AMOUNT          *
#*  UYS133  CTS      Addition of PD group size field                           *
#*  UY3068  CTS      ADDITION OF NEW FIELDS AS PART OF STREAM3 FA REDUCTION    *
#*  UY3028  CTS      BASE PRODUCT RENEWAL                                      *
#*  UY3100  CTS      JIKKO POLICY                                              *
#*  UY349C  CTS      CORPORATE ANNUITY STREAM 3                                *
#*  UY304A  CTS      CALL CENTER SCREEN ENHANCEMENT                            *
#*  NVCN01  CTS      CHANGES DONE AS PART OF ONTARIO XML UPLOAD                *
#*******************************************************************************

P-STEP BF8020-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8020";
        BusinessFunctionName = "Coverage Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM8020";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TCVG";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TCVG";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
#UY3100 STARTS
    IN MIR-SMAL-TYP
    {
        Length = "3";
        SType = "Text";
        Label = "Small Type Code";
    }
#UY3100 ENDS
    OUT MIR-ADDL-FYR-COMM-RT-T[2]
    {
        Length = "5";
        Decimals = "3";
        FieldGroup = "Table2";
        DBTableName = "TCVGA";
        SType = "Percent";
        Label = "First Year Adjustment";
        Index = "1";
    }

    OUT MIR-AGE-RAT-REASN-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "ARST";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Age Restrict Reason";
    }

    OUT MIR-AGT-ID-T[2]
    {
        Length = "6";
        FieldGroup = "Table2";
        DBTableName = "TCVGA";
        SType = "Text";
        Label = "Agent ID";
        Index = "1";
    }

    OUT MIR-CLI-SEX-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table5";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    OUT MIR-CLI-SMKR-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table5";
        CodeSource = "DataModel";
        CodeType = "CLI-SMKR-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Smoker";
        Index = "1";
    }

    OUT MIR-COMIT-RT-EFF-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Commitment Rate Effective Date";
    }

    OUT MIR-COMIT-RT-END-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Commitment Rate End Date";
    }

    OUT MIR-COMM-CHNG-CD-T[2]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "COMR";
        DBTableName = "TCVGA";
        SType = "Selection";
        Label = "Commission Change Reason";
        Index = "1";
    }

    OUT MIR-COMM-RT-TBAC-ID-T[2]
    {
        Length = "5";
        FieldGroup = "Table2";
        DBTableName = "TCVGA";
        SType = "Text";
        Label = "Commission Pattern";
        Index = "1";
    }

    OUT MIR-COMM-TRG-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "COMM-TRG-CALC-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Commission Target Mode";
    }

    OUT MIR-CONN-CVG-NUM
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Connected Coverage Number";
    }

    OUT MIR-CONN-POL-ID
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Connected Policy Number";
    }

    OUT MIR-CPREM-CALC-CD-T[2]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "CPREM-CALC-CD";
        DBTableName = "TCVGA";
        SType = "Text";
        Label = "Commissionable Premium Method";
        Index = "1";
    }

    OUT MIR-CVG-ACCT-TYP-CD
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "General Ledger Account Type";
    }

    OUT MIR-CVG-AD-FACE-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "ADB Face Amount";
    }

    OUT MIR-CVG-AD-MULT-FCT
    {
        Signed;
        Length = "3";
        Decimals = "2";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "ADB Multipler";
    }

    OUT MIR-CVG-AD-PREM-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "ADB Premium";
    }

    OUT MIR-CVG-AD-XPRY-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "ADB Expiry Date";
    }

    OUT MIR-CVG-AGT-CPREM-AMT-T[2]
    {
        Length = "13";
        FieldGroup = "Table2";
        DBTableName = "TCVGA";
        SType = "Currency";
        Label = "Commissionable Premium";
        Index = "1";
    }

    OUT MIR-CVG-AGT-SHR-PCT-T[2]
    {
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table2";
        DBTableName = "TCVGA";
        SType = "Percent";
        Label = "Share";
        Index = "1";
    }

   OUT MIR-CVG-AGT-TYP-CD-T[2]
    {
        Length = "1";
        FieldGroup = "Table2";
        DBTableName = "TCVGA";
        CodeSource = "DataModel";
        CodeType = "CVG-AGT-TYP-CD";
        SType = "Text";
        Label = "Agent Type";
        Index = "1";
    }

    OUT MIR-CVG-APP-RECV-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Application Received Date";
    }

    OUT MIR-CVG-APS-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-APS-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Attending Physician Statement";
    }

    OUT MIR-CVG-BASIC-PREM-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Annual Premium";
    }

    OUT MIR-CVG-CLI-ADJ-AGE-T[5]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table5";
        DBTableName = "TCVGC";
        SType = "Number";
        Label = "Adjusted Age";
        Index = "1";
    }

    OUT MIR-CVG-CLI-ISS-AGE-T[5]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table5";
        DBTableName = "TCVGC";
        SType = "Number";
        Label = "Issue Age";
        Index = "1";
    }

    OUT MIR-CVG-CNVR-XPRY-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Conversion Expiry Age";
    }

    OUT MIR-CVG-COLA-PREM-AMT
    {
        Signed;
        Length = "11";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "COLA Premium";
    }

    OUT MIR-CVG-COLA-SELCT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-COLA-SELCT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "COLA";
    }

    OUT MIR-CVG-COMIT-PCT
    {
        Length = "5";
        Decimals = "3";
        DBTableName = "TCVG";
        SType = "Percent";
        Label = "Commitment Interest Rate";
    }

    OUT MIR-CVG-COMIT-RT-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Commitment Letter Indicator";
    }

    OUT MIR-CVG-COMM-TRG-AMT
    {
        Signed;
        Length = "11";
        Decimals = "0";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Annual Commission Target";
    }

    OUT MIR-CVG-CONN-REASN-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-CONN-REASN-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Connected Policy/Coverage Reason";
    }

    OUT MIR-CVG-CSN-REC-CTR
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Number of Reinsurance Cession Record";
    }

    OUT MIR-CVG-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
    }

    OUT MIR-CVG-EKG-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-EKG-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Electro-Cardiogram";
    }

    OUT MIR-CVG-ENHC-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-ENHC-TYP-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Enhancement Indicator";
    }

    OUT MIR-CVG-FACE-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
    } 
#UY3068 Changes Start here 
     
    OUT MIR-CVG-ANTY-CAP-AMT
    {
         Signed;
         Length = "15";
         DBTableName = "TCVG";
         SType = "Currency";
         Label = "Annuity Capital";
    }
#UY3068 Changes end here

    OUT MIR-CVG-FE-DUR
    {
        Length = "3";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Flat Extra Duration";
    }

    OUT MIR-CVG-FE-PREM-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Flat Extra Premium Amount";
    }

    OUT MIR-CVG-FE-REASN-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "RFLAT";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Flat Extra Reason";
    }

    OUT MIR-CVG-FE-UPREM-AMT
    {
        Signed;
        Length = "9";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Flat Extra Dollar Amount/Unit";
    }

    OUT MIR-CVG-GUAR-INT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-GUAR-INT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Guaranteed Interest Type";
    }

    OUT MIR-CVG-GUAR-INT-PCT
    {
        Signed;
        Length = "9";
        Decimals = "6";
        DBTableName = "TCVG";
        SType = "Percent";
        Label = "Guaranteed Interest Rate";
    }

    OUT MIR-CVG-HO-SPCMN-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-HO-SPCMN-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Head Office Specimen";
    }

    OUT MIR-CVG-INCM-BRCKT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-INCM-BRCKT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Income Bracket";
    }

    OUT MIR-CVG-INSPC-RPT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-INSPC-RPT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Inspection Report";
    }

    OUT MIR-CVG-INS-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-INS-TYP-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Type of Insurance";
    }

    OUT MIR-CVG-INT-PAYO-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PLAN-INT-PAYO-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Interest Handling Indicator";
    }

    OUT MIR-CVG-INTRNL-EXAM-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-INTRNL-EXAM-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Medical Internal Exam";
    }

    OUT MIR-CVG-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Issue Date";
    }

    OUT MIR-CVG-JNT-LIFE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-JNT-LIFE-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Joint Type";
    }

    OUT MIR-CVG-LIVES-INSRD-CD
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Number of Lives Insured";
    }

    OUT MIR-CVG-LTA-PREM-AMT
    {
        Signed;
        Length = "11";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "LTA Premium";
    }

    OUT MIR-CVG-LTA-SELCT-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Lifetime Accident Indicator";
    }

    OUT MIR-CVG-LTB-PREM-AMT
    {
        Signed;
        Length = "11";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "LTB Premium";
    }

    OUT MIR-CVG-LTB-SELCT-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Lifetime Benefit Indicator";
    }

    OUT MIR-CVG-MAT-XPRY-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Maturity/Expiry Date";
    }

    OUT MIR-CVG-MAX-COMIT-AMT
    {
        Length = "13";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Commitment Amount";
    }

    OUT MIR-CVG-ME-DUR
    {
        Length = "3";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Mortality/Morbidity Extra Premium Duration";
    }

    OUT MIR-CVG-ME-FCT
    {
        Signed;
        Length = "3";
        Decimals = "2";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Mortality/Morbidity Extra Premium Rating";
    }

    OUT MIR-CVG-ME-PREM-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Mortality/Morbidity Extra Premium Amount";
    }

    OUT MIR-CVG-ME-RAT-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "TRATE";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "True Table Rating";
    }

    OUT MIR-CVG-ME-REASN-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "RMULT";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Mortality/Morbidity Extra Premium Reason";
    }

    OUT MIR-CVG-MISC-RAT-1-CD
    {
        Length = "3";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Miscellaneous Reason 1";
    }

    OUT MIR-CVG-MISC-RAT-2-CD
    {
        Length = "3";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Miscellaneous Reason 2";
    }

    OUT MIR-CVG-MPREM-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Modal Premium";
    }

    OUT MIR-CVG-NMED-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-NMED-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Non-Medical";
    }

    OUT MIR-CVG-NMED-PRVLG-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Non-Medical Priviledge";
    }

    OUT MIR-CVG-NOTI-DEPT-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DEPT";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Notify Department";
    }

    OUT MIR-CVG-NOTI-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Notify date";
    }

    OUT MIR-CVG-NOTI-REASN-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "NOTRE";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Notify Reason";
    }

    OUT MIR-CVG-NXT-CPI-FCT
    {
        Length = "5";
        Decimals = "3";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Next Premium Rate";
    }

    OUT MIR-CVG-NXT-RENW-RT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-NXT-RENW-RT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Next Premium Renewal Rate Indicator";
    }

    OUT MIR-CVG-OCCP-CLAS-CD
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Occupation Class";
    }

    OUT MIR-CVG-ORIG-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "ORIG";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Source of Business";
    }

    OUT MIR-CVG-ORIG-FACE-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Original Face Amount";
    }

    OUT MIR-CVG-OUT-ALLOC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-OUT-ALLOC-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Policy Level Payout Splits";
    }

    OUT MIR-CVG-PAR-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-PAR-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Dividend Option";
    }

    OUT MIR-CVG-PFEE-AMT
    {
        Signed;
        Length = "9";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Flat Policy Fee";
    }

    OUT MIR-CVG-PHYS-EXAM-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-PHYS-EXAM-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Medical Examination";
    }

    OUT MIR-CVG-PMED-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-PMED-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Paramedical";
    }

    OUT MIR-CVG-PREM-CHNG-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Premium Change Date";
    }

#*   RP2009 CHANGES STARTS HERE *
#*   M142W3 CHANGES STARTS HERE *

    OUT MIR-PREM-CHNG-REASN-CD
    {
        Length = "2";
#        CodeSource = "EDIT";
#        CodeType = "PRMCH";
        CodeSource = "DataModel";
        CodeType = "PREM-CHNG-REASN-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Premium Change Reason";
    }
#*   RP2009 CHANGES ENDS HERE *
#*   M142W3 CHANGES ENDS HERE *

    OUT MIR-CVG-PREV-CPI-FCT
    {
        Length = "5";
        Decimals = "3";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Last Premium Rate";
    }

    OUT MIR-CVG-PREV-FACE-AMT
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Last Face Amount";
    }

    OUT MIR-CVG-PRST-RAT-PCT
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TCVG";
        SType = "Percent";
        Label = "Persistency Rating";
    }

    OUT MIR-CVG-RESTR-PREM-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Restrict Premium Calculation Indicator";
    }

    OUT MIR-CVG-ROLOVR-DT-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Cash Flow Rollover Indicator";
    }

    OUT MIR-CVG-RT-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Age";
    }

    OUT MIR-CVG-SALE-SRC-CD
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Source of Sale";
    }

    OUT MIR-CVG-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-SEX-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sex";
    }

    OUT MIR-CVG-SMKR-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SMOKE";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Smoker";
    }

    OUT MIR-CVG-SPND-CSTAT-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Suspended Coverage Status";
    }

    OUT MIR-CVG-STBL-1-CD
    {
        Length = "2";
#* M241A3 changes START here*
#        CodeSource = "EDIT";
#        CodeType = "STB1";
	CodeSource = "CSOM9788";        
	FilterFields = "1";
        FilterField1 = "MIR-PLAN-ID"; 
#* M241A3 changes END here*
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub-table 1";
    }

    OUT MIR-CVG-STBL-2-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub-table 2";
    }

    OUT MIR-CVG-STBL-3-CD
    {
        Length = "40";
#* M241A3 changes START here*
#       CodeSource = "EDIT";
#       CodeType = "STB3";
        CodeSource = "CSOM9789";        
        FilterFields = "1";
        FilterField1 = "MIR-PLAN-ID"; 
#* M241A3 changes END here*
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub-table 3";
    }

    OUT MIR-CVG-STBL-4-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub-table 4";
    }

    OUT MIR-CVG-STRS-EKG-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-STRS-EKG-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Stress Electro-Cardiogram";
    }

    OUT MIR-CVG-SUM-INS-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Sum Insured Amount";
    }

    OUT MIR-CVG-UNIT-VALU-AMT
    {
        Length = "7";
#M245B2 CHANGES START HERE         
#        Decimals = "0";
#M245B2 CHANGES END HERE 
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Unit Value";
    }

    OUT MIR-CVG-UWG-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Underwriting Amount";
    }

    OUT MIR-CVG-UWGDECN-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-UWGDECN-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Decision";
    }

    OUT MIR-CVG-UWGDECN-SUB-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "CODEC";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Decision Type";
    }

    OUT MIR-CVG-UWG-EXCL-1-CD-T[3]
    {
        Length = "40";
        FieldGroup = "Table6";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "EXCL";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Exclusion Code";
        Index = "1";
    }

    OUT MIR-CVG-WP-IND
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-WP-IND";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Waiver of Premium Indicator";
    }
#NVCN01 CHANGES START HERE
    OUT MIR-CVG-WP-TYP-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-WP-TYP-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "WoP Type";
    }
#NVCN01 CHANGES END HERE
    OUT MIR-CVG-WP-MULT-FCT
    {
        Signed;
        Length = "3";
        Decimals = "2";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Waiver of Premium Multiplier";
    }

    OUT MIR-CVG-WP-PREM-AMT
    {
        Signed;
        Length = "11";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Waiver of Premium Amount";
    }

    OUT MIR-CVG-WP-XPRY-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Waiver of Premium Expiry Date";
    }

    OUT MIR-CVG-WTHDR-ORDR-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-WTHDR-ORDR-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Withdrawal Order";
    }

    OUT MIR-CVG-XRAY-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-XRAY-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "X-Ray";
    }

    OUT MIR-DIA-SWP-THRSHD-AMT
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Sweep Threshold Minimum Amount";
    }

    OUT MIR-DIA-SWP-THRSHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DIA-SWP-THRSHD-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sweep Threshold Indicator";
    }

    OUT MIR-DPOS-TRM-DY-DUR
    {
        Length = "3";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Deposit Term Days";
    }

    OUT MIR-DPOS-TRM-MO-DUR
    {
        Length = "3";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Deposit Term Months";
    }

    OUT MIR-DV-AGT-CLI-NM-T[2]
    {
        Length = "51";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Agent Name";
        Index = "1";
    }

    OUT MIR-DV-INSRD-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }

    OUT MIR-DV-INSRD-CLI-NM-T[5]
    {
        Length = "30";
        FieldGroup = "Table5";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
        Index = "1";
    }

    OUT MIR-FYR-COMM-CALC-CD-T[2]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "FYR-COMM-CALC-CD";
        DBTableName = "TCVGA";
        SType = "Text";
        Label = "First Year Commission Method of Payment";
        Index = "1";
    }

    OUT MIR-GIR-OPT-REMN-AMT
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "GIR Maximum Amount";
    }

    OUT MIR-GIR-OPT-REMN-QTY
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "GIR Number of Options Left";
    }

    OUT MIR-GIR-SEND-LTR-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "GIR Send Letter Indicator";
    }

    OUT MIR-GUAR-IMPRD-INT-PCT
    {
        Signed;
        Length = "9";
        Decimals = "6";
        DBTableName = "TCVG";
        SType = "Percent";
        Label = "Impaired Rate";
    }

    OUT MIR-GUAR-INT-END-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Guaranteed Interest End Date";
    }

    OUT MIR-GUAR-INT-PERI-DUR
    {
        Length = "3";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Guaranteed Interest Period";
    }

    OUT MIR-GUAR-INT-STRT-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Guaranteed Interest Start Date";
    }

    OUT MIR-IA-QUOT-NUM
    {
        Length = "6";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Immediate Annuity Quote Number";
    }

    OUT MIR-INSRD-CLI-ID-T[5]
    {
        Length = "10";
        FieldGroup = "Table5";
        DBTableName = "TCVGC";
        SType = "Text";
        Label = "Client ID";
        Index = "1";
    }

    OUT MIR-MAT-XPRY-DT-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Recalculate Maturity/Expiry Date Indicator";
    }

    OUT MIR-MAT-XPRY-REASN-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "MAT-XPRY-REASN-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Maturity/Expiry Reason";
    }

    OUT MIR-MNPMT-TRG-LTD-AMT
    {
        Signed;
        Length = "13";
#M245B2 CHANGES START HERE         
#        Decimals = "0";
#M245B2 CHANGES END HERE 
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Minimum Payment Target";
    }

    OUT MIR-MORT-ASSESS-PCT
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TCVG";
        SType = "Percent";
        Label = "Mortality Assessment Percentage";
    }

    OUT MIR-MORT-XPNS-CHG-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Mortality & Expense Change Date";
    }

    OUT MIR-OUT-ALLOC-AMT-PCT
    {
        Length = "15";
        Decimals = "3";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Share Percent/Amount";
    }

    OUT MIR-OVRID-BASE-AGT-ID-T[2]
    {
        Length = "6";
        FieldGroup = "Table2";
        DBTableName = "TCVGA";
        SType = "Text";
        Label = "Override Key";
        Index = "1";
    }

    OUT MIR-OVRID-ID-T[2]
    {
        Length = "2";
        FieldGroup = "Table2";
        DBTableName = "TCVGA";
        SType = "Text";
        Label = "Override Situation";
        Index = "1";
    }

    OUT MIR-OWN-OCCP-PREM-AMT
    {
        Signed;
        Length = "11";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Own Occupation Definition of Disability (OCC) Premium";
    }

    OUT MIR-OWN-OCCP-SELCT-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Own occupation benefit";
    }

    OUT MIR-PDISAB-PREM-AMT
    {
        Signed;
        Length = "11";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Partial Disability Benefit Premium";
    }

    OUT MIR-PDISAB-SELCT-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Partial Disability Benefit Indicator";
    }

    OUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Plan";
    }

    OUT MIR-PLAN-PERI-PREM-AMT
    {
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Planned Periodic Premium";
    }

    OUT MIR-PMT-LOAD-TRG-AMT
    {
        Signed;
        Length = "11";
        Decimals = "0";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Annual Payment Load Target";
    }

    OUT MIR-PMT-LOAD-TRG-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PMT-LOAD-TRG-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Payment Load Target Mode";
    }

    OUT MIR-POL-APPL-CTL-CD
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Application System Code";
    }

    OUT MIR-POL-APP-NUM
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Number of Applications/Policy";
    }

    OUT MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD"; 
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Premium Mode";
    }

    OUT MIR-POL-BILL-TYP-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Billing Type";
    }

    OUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status Code";
    }
    
    # TDMG07 changes begin
    	    
    OUT MIR-PREM-PMT-CMPLT-IND
    {
    	DisplayOnly;
    	Length = "1";
    	SType = "Indicator";
# 118579 changes begin      
#       Label = "Premium Payment Completion";
	Label = "Base Policy Premium Payment Completion";
# 118579 changes end 
    }
    	    		    
        # TDMG07 changes end 

    OUT MIR-POL-CVG-REC-CTR
    {
        Length = "40";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Coverages";
    }

    OUT MIR-POL-GRS-APREM-AMT
    {
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Annual Premium";
    }

    OUT MIR-POL-MPREM-AMT
    {
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Mode Premium";
    }

    OUT MIR-POL-OPTL-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-OPTL-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Optional Policy";
    }

    OUT MIR-POL-PD-TO-DT-NUM
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Paid to Date";
    }

    OUT MIR-POL-PREM-DSCNT-PCT
    {
        Length = "5";
        Decimals = "3";
        DBTableName = "TPOL";
        SType = "Percent";
        Label = "Discount Percentage";
    }

    OUT MIR-POL-REINS-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-REINS-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Reinsurance";
    }

    OUT MIR-PREV-RENW-RT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PREV-RENW-RT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Last Premium Renewal Rate Indicator";
    }

    OUT MIR-REDC-EP-PREM-AMT
    {
        Signed;
        Length = "11";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "EP/HOSP Premium";
    }

    OUT MIR-REDC-EP-SELCT-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "EP/HOSP Benefit Indicator";
    }

    OUT MIR-REL-CVG-NUM
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Connecting Coverage Number";
    }

    OUT MIR-RENW-COMM-CALC-CD-T[2]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "RENW-COMM-CALC-CD";
        DBTableName = "TCVGA";
        SType = "Text";
        Label = "Renewal Commission Method of Payment";
        Index = "1";
    }

    OUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub-Company";
    }

    OUT MIR-SERV-AGT-ID
    {
        Length = "6";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Servicing Agent ID";
    }

    OUT MIR-SNGL-CASE-AGRE-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Single Case Agreement";
    }

    OUT MIR-ULT-PREM-RT-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Step-Rated Ultimate Rate Age";
    }

    OUT MIR-ULT-PREM-RT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ULT-PREM-RT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Step-rated Ultimate Rate";
    }

    OUT MIR-UWG-AMT-REASN-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "URSN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Underwriting Reason";
    }

    OUT MIR-UWG-REQIR-ESTB-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Underwriting Requirements Established";
    }

    OUT MIR-UWG-USER-DEFN-1-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "UWREQ";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Miscellaneous Underwriting Requirement 1";
    }

    OUT MIR-UWG-USER-DEFN-2-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "UWREQ";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Miscellaneous Underwriting Requirement 2";
    }

    OUT MIR-UWG-USER-DEFN-3-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "UWREQ";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Miscellaneous Underwriting Requirement 3";
    }

    OUT MIR-UWG-USER-DEFN-4-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "UWREQ";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Miscellaneous Underwriting Requirement 4";
    }

    OUT MIR-UWG-USER-DEFN-5-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "UWREQ";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Miscellaneous Underwriting Requirement 5";
    }

    OUT MIR-UW-USER-ID
    {
        Length = "8";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Underwriter's Initial";
    }

    OUT MIR-CVG-MAT-XPRY-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Maturity Age";
    }

    OUT MIR-CVG-MAT-XPRY-DUR
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Maturity Years";
    }

    OUT MIR-CVG-UL-PU-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "UL Paid-Up Date";
    }

    OUT MIR-PLAN-BNFT-TYP-CD
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

    OUT MIR-CVG-SUB-STAT-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBSC";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Sub Status";
    }

#*  PR006I  BMB      Changes for ManuMed rider renewals   *

    OUT MIR-CVG-RENW-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Override Renewal Plan";
    }

#* 018395 CHANGES START HERE

    OUT MIR-CVG-RENW-ACPT-DT
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Renewal Acceptance Date";
    }
#*  018395 CHANGES ENDS HERE   

    OUT MIR-CVG-RENW-STBL-1-CD
    {
        Length = "2";
#* M241A3 changes START here*
#        CodeSource = "EDIT";
#        CodeType = "STB1";
	CodeSource = "CSOM9788";        
	FilterFields = "1";
	FilterField1 = "MIR-PLAN-ID"; 
#* M241A3 changes END here*
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Override Renewal Duration";
    }
    
#UY3028 CHANGES START HERE

    OUT MIR-CVG-UNSECUR-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Unsecured Indicator";
        Index = "1";        
    }
    
    OUT MIR-POL-RENW-DEN-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Renewal Denial Indicator";
        Index = "1";        
    }    

    OUT MIR-ORIG-COVER-PER
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Original Coverage Period";
    }
#UY3028 CHANGES END HERE   
    
    OUT MIR-CVG-RENW-STBL-2-CD
    {
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Override Renewal Benefit Limit";
    }
#*  RPL009 CHANGES START HERE    *
 OUT MIR-CVG-RENW-STBL-3-CD
    {
        DisplayOnly;
        Length = "5";
#* M241A3 changes START here*
#        CodeSource = "EDIT";
#        CodeType = "STB3";
	CodeSource = "CSOM9789";        
	FilterFields = "1";
	FilterField1 = "MIR-PLAN-ID"; 
#* M241A3 changes END here* 
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Override Sub-Table 3";
     }
#*  RPL009 CHANGES ENDS HERE    *

#*  RP2009 CHANGES START HERE    *

    OUT MIR-CVG-RENW-STBL-4-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Override Sub-Table 4";
    }

#*  RP2009 CHANGES END HERE    *


    OUT MIR-CVG-REINS-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Reinsured";
        Index = "1";
    }

#MP29NB changes start       
    OUT MIR-CVG-REINS-CO-ID
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

    OUT MIR-CVG-REINS-TRTY-NUM
    {    
        Length = "3";    
        CodeSource = "EDIT";
        CodeType = "TRTNM";    
        DBTableName = "TCVG";    
        SType = "Text";    
        Label = "Treaty Number";    
        Index = "1";    
    }    
        
    OUT MIR-CVG-REINS-CED-PCT
    {    
        Length = "3";        
        CodeSource = "EDIT";   
        CodeType = "CDPCT";        
        DBTableName = "TCVG";        
        SType = "Text";        
        Label = "Ceding Percentage"; 
        Index = "1";        
    }
    
    OUT MIR-CVG-REINS-CED-AMT
    {
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
    
    OUT MIR-CVG-ILLUS-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "ILLUS";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Illustration Type";
    }

    OUT MIR-SW-REDC-FACE-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Opt 2 Switch, Reduced Face Amount";
    }

    OUT MIR-SW-REDC-EFF-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Opt 2 Switch, Effective Date of Reduced Face Amount";
    }
#**** M142W1 START ****    
    OUT MIR-RENW-FACE-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Renewal Face Amount";
    }

    OUT MIR-RENW-FACE-CHNG-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Effective Date of Renewal Face Amount";
    }
#**** M142W1 END ****    

#**** MFFAN8 START ****
    OUT MIR-CVG-XPCT-ANTY-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Expected Annuity Date";
    }

    OUT MIR-CVG-XPCT-ANTY-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Expected Annuity Age";
    }
#**** MFFAN8 END ****

#* FEID01 Changes begin

    OUT MIR-LIAB-STRT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label ="Liability Commencement date";
    }

#* FEID01 Changes end
#MP211B changes starts

    OUT MIR-CVG-LIEN-DUR
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Lien Duration";
        }
#MP211B changes ends

#MP245J CHANGES STARTS HERE

    OUT MIR-SSTD-AGE-ADD-DUR
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

    OUT MIR-PRIM-1-CVG-NUM
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label ="Base Rider Coverage Number 1";
        Index = "1";
    }
    
    OUT MIR-PRIM-2-CVG-NUM
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label ="Base Rider Coverage Number 2";
        Index = "1";
    }

    OUT MIR-CVG-PRIM-GR-ID
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
    OUT MIR-TAX-QUALF-IND
    {
           Length = "1";
           DBTableName = "TCVG";
           SType = "Indicator";
           Label = "Tax Qualified Indicator"; 
           Index = "1";           
    }
#M271A8 CHANGES END HERE
#TLB015 CHANGES START HERE
    OUT MIR-REINS-TYP-CD
    {
        Length = "2";
        DisplayOnly;
        CodeSource = "EDIT";
        CodeType = "RETYP";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Reinsurance Type";
    }
#TLB015 CHANGES END HERE
#UYS014 CHANGES STARTS HERE
    OUT MIR-INCR-FACE-AMT
      {
          Signed;
          DisplayOnly;
          Length = "16";
          SType = "Currency";
          Label = "Increased Face amount";
      } 
#UY3068 CHANGES START HERE 
    OUT MIR-CVG-PMT-TYP-IND
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
    OUT MIR-PD-GR-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "PD group size";
    }
#UYS133 CHANGES END 

#UY349C CHANGES STARTS HERE    
    OUT MIR-ANTY-TYP-CD
    {
        Length = "2";
        SType = "Selection";
        DBTableName = "TCVG";
        CodeSource = "DataModel";
        CodeType = "CVG-ANTY-TYP-CD";
        Label = "Annuity Type";
    }
        
    OUT MIR-ANTY-STYLE-CD
    {
        Length = "2";
        SType = "Selection";
        DBTableName = "TCVG";
        CodeSource = "DataModel";
        CodeType = "CVG-ANTY-STL";
        Label = "Annuity Style";      
    }

     OUT MIR-CONN-CORP-INSRD-ID
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Connected Corporate Insured ID";
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
    OUT MIR-BNFT-PAYO-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Benefit Payment Date";
    }
    OUT MIR-PMT-CMPLT-IND
    {
        DisplayOnly;
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Single Premium Coverage Indicator";
    }
    OUT MIR-PMT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "P-Type Policy";
    }
    OUT MIR-SURR-ANTY-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Surrender Annuity Amount";
    }
    OUT MIR-SURR-ANTY-CAP-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Surrender Annuity Capital Amount";
    }
    OUT MIR-SURR-ADDL-ANTY-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "90% Additional Annuity Amount";
    }
    OUT MIR-BASIC-ANTY-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Basic Annuity Amount";
    }
    OUT MIR-ADDL-ANTY-AMT
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

