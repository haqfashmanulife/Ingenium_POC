# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:59 PM EDT

#*******************************************************************************
#*  Component:   BF6925-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01PR21  TMC      Added UL Paid-up Date                                     *
#*  01AD25  BMB      Change MIR-CVG-NUM to control display of more than 20 cvgs*
#*                   Focusfield is the more button...                          *
#*  02PR55  RNL      Added MAT-XPRY-REASN-CD                                   *
#*  M00025  MAW      Added MIR-CVG-SUB-STAT-CD-T                               *
#*  MFPCC1  CECIL    ADD FIELD ILLUSTRATION TYPE                               *
#*  MFFAN8  MC       ADD EXPECTED ANNUITY AGE AND DATE                         *
#*  MP29NB  CTS      ADDED MIR VARIABLES FOR REINSURANCE                       *
#*  FEID01  CTS      ADD LIAB-ISS-CUT-OFF-DT for for LCD Issue Date Calculation*
#*  FEID01           - Online Screen Changes                                   *
#*  MP211B  CTS      ADD NEW FIELDS FOR LIEN DURATION.                         *
#*  M213K1  CTS      CHANGES FOR ADDING NEW FIELD  GROUP ID  AS PART RUM       *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*  MP245J  CTS      ADD NEW FIELD FOR SUBSTANDARD AGE DURATION AS PART OF SPWL*
#*  M24573  CTS      ADD NEW FIELD FOR BASIC BENEFIT RATE                      *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  Q61551  CTS      FRA CURRENCY CODE CHANGES                                 *
#*  TDMG07  CTS      SCREEN CHANGES FOR NWL                                    *
#*  118579  CTS      CHANGES DONE TO CORRECT THE FIELD PREMIUM PAYMENT         *
#*  118579           DESCRIPTION                                               *
#*  TLB015  CTS      REINSURANCE CHANGES                                       *
#*  UYS014  CTS      ADDITION OF NEW FIELD FOR INCREASING FACE AMOUNT          *
#*  S23388  CTS      FIX TO DISPLAY CURRECNY CODE                              * 
#*  UY3068  CTS      ADDITION OF NEW FIELDS AS PART OF STREAM3 FA REDUCTION    *
#*  UY304A  CTS      CALL CENTER SCREEN ENHANCEMENT                            *
#*  UY3049  CTS      ANNUITY PAYMENT SCREEN                                    *
#*  NVCN01  CTS      CHANGES DONE AS PART OF ONTARIO XML UPLOAD                *
#*******************************************************************************

S-STEP BF6925-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Covdtl";
        Type = "Output";
        DelEmptyRows;
        FocusField = "moreButton";
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

#01AD25 - Allow changes to the coverage number
    INOUT MIR-CVG-NUM
    {
        Length = "2";
        DBTableName = "TCVG";
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

    IN MIR-AGE-RAT-REASN-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "ARST";
        SType = "Text";
        Label = "Reason";
        Index = "1";
    }

    IN MIR-CONN-CVG-NUM-T[20]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Connected Coverage Number";
        Index = "1";
    }

    IN MIR-CVG-ACCT-TYP-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Account Type";
        Index = "1";
    }

    IN MIR-CVG-AD-FACE-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "16";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "ADB Amount";
        Index = "1";
    }

    IN MIR-CVG-AD-MULT-FCT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table20";
        SType = "Number";
        Label = "ADB Rating Multiplier";
        Index = "1";
    }

    IN MIR-CVG-APP-CMPLT-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Application Completion Date";
        Index = "1";
    }

    IN MIR-CVG-APP-RECV-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Application Received Date";
        Index = "1";
    }

    IN MIR-CVG-COLA-SELCT-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-COLA-SELCT-CD";
        SType = "Text";
        Label = "Cost of Living Adjustment Benefit (COLA)";
        Index = "1";
    }

    IN MIR-CVG-COLFND-IND-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        SType = "Indicator";
        Label = "Coverage is a loan collateral fund";
        Index = "1";
    }
#UY3068 CHANGES START HERE
    IN MIR-CVG-PMT-TYP-IND-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "P-Type Policy";
        Index = "1";
    } 
	
	IN MIR-CVG-PMT-CMPLT-IND-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Single Premium Coverage Indicator";
        Index = "1";
    } 
      
    IN MIR-CVG-ADJ-DP1-AMT-T[20]
    { 
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table20";
		DBTableName = "TCVG";
        SType = "Currency";
        Label = "Delta P1";
        Index = "1";
    }

    IN MIR-CVG-ADJ-D2P1-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table20";
		DBTableName = "TCVG";
        SType = "Currency";
        Label = "2nd Delta P1";
        Index = "1";
    }
    IN MIR-CVG-ADJ-DP2-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table20";
		DBTableName = "TCVG";
        SType = "Currency";
        Label = "Delta P2";
        Index = "1";
    }
    IN MIR-CVG-ADJ-D2P2-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table20";
		DBTableName = "TCVG";
        SType = "Currency";
        Label = "2nd Delta P2";
        Index = "1";
    }
#UY3068 CHANGES END HERE 
    IN MIR-CVG-CSN-REC-CTR-T[20]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Number of Reinsurance on Coverage";
        Index = "1";
    }

    IN MIR-CVG-CSTAT-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    IN MIR-CVG-ENHC-TYP-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-ENHC-TYP-CD";
        SType = "Text";
        Label = "Coverage Enhancement";
        Index = "1";
    }

    IN MIR-CVG-FACE-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "16";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    } 
#UY3068 CHANGES START HERE 
    IN MIR-CVG-ANTY-CAP-AMT-T[20]
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "16";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Annuity Capital";
        Index = "1";
    } 
#UY3068 CHANGES END HERE

#M24573 CHANGES START HERE
    IN MIR-BASIC-BNFT-RT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        Decimals = "6";
        FieldGroup = "Table20";
        SType = "Number";
        Label = "Basic Benefit rate";
        Index = "1";
    }    
#M24573 CHANGES END HERE
    IN MIR-CVG-FE-DUR-T[20]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Flat Extra Premium - Duration";
        Index = "1";
    }

    IN MIR-CVG-FE-UPREM-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "11";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Dollar Amount/Unit";
        Index = "1";
    }

    IN MIR-CVG-INS-TYP-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "PLAN-INS-TYP-CD";
        SType = "Text";
        Label = "Type of Insurance";
        Index = "1";
    }

    IN MIR-CVG-INT-PAYO-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "PLAN-INT-PAYO-CD";
        SType = "Text";
        Label = "Interest Handling Indicator";
        Index = "1";
    }

    IN MIR-CVG-ISS-EFF-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Issue Date";
        Index = "1";
    }

    IN MIR-CVG-LTA-SELCT-IND-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        SType = "Indicator";
        Label = "Lifetime accident (benefit provided; result of accident)";
        Index = "1";
    }

    IN MIR-CVG-LTB-SELCT-IND-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        SType = "Indicator";
        Label = "Lifetime benefits (result of either accident or sickness)";
        Index = "1";
    }

    IN MIR-CVG-MAT-XPRY-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Coverage Maturity / Expiry Date";
        Index = "1";
    }

    IN MIR-CVG-ME-DUR-T[20]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Multiple Rating Duration";
        Index = "1";
    }

    IN MIR-CVG-ME-FCT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table20";
        SType = "Number";
        Label = "Rating";
        Index = "1";
    }

    IN MIR-CVG-ME-RAT-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "TRATE";
        SType = "Text";
        Label = "True Table Rating";
        Index = "1";
    }

    IN MIR-CVG-NUM-T[20]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        KeyColumn;
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-CVG-NXT-RENW-RT-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-NXT-RENW-RT-CD";
        SType = "Text";
        Label = "Next Renewal Rate";
        Index = "1";
    }

#MP29NB changes start
    IN MIR-CVG-REINS-IND-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Reinsured";
        Index = "1";
    }
       
    IN MIR-CVG-REINS-CO-ID-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "REINS";
        DBTableName = "TCVG";
        SType = "Text";    
        Label = "Reinsurance Company";
        Index = "1";
    }
    
    IN MIR-CVG-REINS-TRTY-NUM-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";    
        CodeSource = "EDIT";
        CodeType = "TRTNM";
        DBTableName = "TCVG";
        SType = "Text";   
        Label = "Treaty Number";
        Index = "1";
    }
    
    IN MIR-CVG-REINS-CED-PCT-T[20]
    {
        Length = "3";           
        FieldGroup = "Table20";        
        CodeSource = "EDIT";   
        CodeType = "CDPCT";    
        DBTableName = "TCVG";           
        SType = "Text";    
        Label = "Ceding Percentage";
        Index = "1";    
    }
    
    IN MIR-CVG-REINS-CED-AMT-T[20]
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
        FieldGroup = "Table20";     
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "Ceded Amount"; 
        Index = "1";
    }  
#MP29NB changes ends    

    IN MIR-CVG-ORIG-FACE-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE         
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Original Face Amount Applied For";
        Index = "1";
    }

    IN MIR-CVG-PAR-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-PAR-CD";
        SType = "Text";
        Label = "Dividend Option";
        Index = "1";
    }

    IN MIR-CVG-PREM-CHNG-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Premium Change Date";
        Index = "1";
    }

    IN MIR-CVG-PREV-CSTAT-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Text";
        Label = "Previous Coverage Status";
        Index = "1";
    }

    IN MIR-CVG-RT-AGE-T[20]
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table20";
        SType = "Number";
        Label = "Rate Age";
        Index = "1";
    }

    IN MIR-CVG-SEX-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-SEX-CD";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    IN MIR-CVG-SMKR-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "SMOKE";
        SType = "Text";
        Label = "Smoker";
        Index = "1";
    }

    IN MIR-CVG-SPND-CSTAT-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Text";
        Label = "Suspended Coverage Status";
        Index = "1";
    }

    IN MIR-CVG-STAT-PRCES-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Last Status Change Date";
        Index = "1";
    }

    IN MIR-CVG-STBL-1-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
#* M241A3 changes START here*
        CodeSource = "CSOM9D29";        
        FilterFields = "2";
        FilterField1 = "MIR-PLAN-ID-T"; 
        FilterField2 = "MIR-CVG-STBL-1-CD-T";        
#       CodeSource = "EDIT";
#       CodeType = "STB1";
#* M241A3 changes END here*
        SType = "Text";
        Label = "Sub-table 1";
        Index = "1";
    }

    IN MIR-CVG-STBL-2-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Text";
        Label = "Sub-table 2";
        Index = "1";
    }

    IN MIR-CVG-STBL-3-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
#* M241A3 changes START here*
        CodeSource = "CSOM9D30";        
        FilterFields = "2";
        FilterField1 = "MIR-PLAN-ID-T"; 
        FilterField2 = "MIR-CVG-STBL-3-CD-T";
#    CodeSource = "EDIT";
#    CodeType = "STB3";
#* M241A3 changes END here*
        SType = "Text";
        Label = "Sub-table 3";
        Index = "1";
    }

    IN MIR-CVG-STBL-4-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "STB4";
        SType = "Text";
        Label = "Sub-table 4";
        Index = "1";
    }

    IN MIR-CVG-SUM-INS-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
#Q61551 CHANGES START HERE
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
      # CurrencyCode = "MIR-PREM-CRCY-CD";
        CurrencyCode = "MIR-POL-CRCY-CD";
#M271O1 CHANGES END HERE 
#Q61551 CHANGES ENDS HERE         
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Sum Insured Amount";
        Index = "1";
    }

    IN MIR-CVG-UL-PU-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "UL Paid-up Date";
        Index = "1";
    }

    IN MIR-CVG-UNIT-TYP-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-UNIT-TYP-CD";
        SType = "Text";
        Label = "Unit Type";
        Index = "1";
    }

    IN MIR-CVG-UWG-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-GLOB-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Underwriting Amount";
        Index = "1";
    }

    IN MIR-CVG-WP-IND-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        SType = "Indicator";
        Label = "WP Ind";
        Index = "1";
    }
#NVCN01 START
    IN MIR-CVG-WP-TYP-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-WP-TYP-CD";
        SType = "Text";
        Label = "WoP Type";
        Index = "1";
    }
#NVCN01 ENDS
    IN MIR-CVG-WP-MULT-FCT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table20";
        SType = "Number";
        Label = "Waiver of Premium Multiplier";
        Index = "1";
    }

    IN MIR-CVG-WTHDR-ORDR-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-WTHDR-ORDR-CD";
        SType = "Text";
        Label = "Withdrawal Order";
        Index = "1";
    }

    IN MIR-DV-DPOS-TRM-DY-DUR-T[20]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Deposit Term Days";
        Index = "1";
    }

    IN MIR-DV-DPOS-TRM-MO-DUR-T[20]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Deposit Term Months";
        Index = "1";
    }

    IN MIR-DV-INSRD-CLI-NM-T[20]
    {
        DisplayOnly;
        Length = "75";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Insured's Name";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-INSRD-CLI-ID-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Client Number of Lives Insured";
        Index = "1";
    }

    IN MIR-MAT-XPRY-REASN-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "MAT-XPRY-REASN-CD";
        SType = "Text";
        Label = "Maturity/Expiry Reason";
        Index = "1";
    }

    IN MIR-OWN-OCCP-SELCT-IND-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        SType = "Indicator";
        Label = "Own occupation benefit";
        Index = "1";
    }

    IN MIR-PDISAB-SELCT-IND-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        SType = "Indicator";
        Label = "Partial disability benefit";
        Index = "1";
    }

    IN MIR-PLAN-ID-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Type of Plan";
        Index = "1";
    }

    IN MIR-PLAN-PKG-ADB-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "PLAN-PKG-ADB-CD";
        SType = "Text";
        Label = "Embedded ADB";
        Index = "1";
    }

    IN MIR-PLAN-PKG-WP-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "PLAN-PKG-WP-CD";
        SType = "Text";
        Label = "Embedded WP";
        Index = "1";
    }

    IN MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
    }
    # TDMG07 changes begin
    
    IN MIR-PREM-PMT-CMPLT-IND
     {
         DisplayOnly;
         Length = "1";
         SType = "Indicator";
# 118579 changes begin      
#        Label = "Premium Payment Completion";
         Label = "Base Policy Premium Payment Completion";
# 118579 changes end               
     }
    		    
    # TDMG07 changes end 
    


    IN MIR-POL-CVG-REC-CTR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Coverages";
    }

    IN MIR-PREV-RENW-RT-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "PREV-RENW-RT-CD";
        SType = "Text";
        Label = "Last Renewal Rate";
        Index = "1";
    }

    IN MIR-REDC-EP-SELCT-IND-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        SType = "Indicator";
        Label = "Reduced elimination period for hospitalization Confinement (EP/HOSP)";
        Index = "1";
    }

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

    IN MIR-ULT-PREM-RT-AGE-T[20]
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table20";
        SType = "Number";
        Label = "Ultimate Rate Age";
        Index = "1";
    }

    IN MIR-ULT-PREM-RT-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "ULT-PREM-RT-CD";
        SType = "Text";
        Label = "Ultimate Rate";
        Index = "1";
    }

    IN MIR-CVG-SUB-STAT-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "SUBSC";
        SType = "Text";
        Label = "Coverage Sub Status";
        Index = "1";
    }

    #  MFPCC1   CECIL   06MAY2004  Add field Illustration Type
    IN MIR-CVG-ILLUS-CD-T[20]
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "ILLUS";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Illustration Type";
    }

#* MFFAN8 START ****
    IN MIR-CVG-XPCT-ANTY-AGE-T[20]
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table20";
        SType = "Number";
        Label = "Expected Annuity Age";
        Index = "1";
    }

    IN MIR-CVG-XPCT-ANTY-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Expected Annuity Date";
        Index = "1";
    }
#* MFFAN8 END ****

#* FEID01 Changes begin

    IN MIR-LIAB-STRT-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label ="Liability Commencement date";
    }

#* FEID01 changes end
#MP211B changes starts  
    
    IN MIR-CVG-LIEN-DUR-T[20]
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Lien Duration";
    }
#MP211B changes ends

#MP245J CHANGES STARTS HERE

    IN MIR-SSTD-AGE-ADD-DUR-T[20]
    {
        DisplayOnly;
        FieldGroup = "Table20";
        Length = "2";
        Decimals = "0";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Substandard Age Duration";
    }

#MP245J CHANGES ENDS HERE

#* M213K1 Changes begin            
    
    IN MIR-CVG-PRIM-GR-ID-T[20]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
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
#TLB015 CHANGES STARTS HERE
    IN MIR-REINS-TYP-CD-T[20]
    {
        Length = "2";
        DisplayOnly;
        FieldGroup = "Table20";        
        CodeSource = "EDIT";   
        CodeType = "RETYP";    
        DBTableName = "TCVG";           
        SType = "Text";    
        Label = "Reinsurance Type";
        Index = "1";    
    }
#TLB015 CHANGES ENDS HERE
#UYS014 CHANGES STARTS HERE
    IN MIR-INCR-FACE-AMT-T[20]
    {
#S23388 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#S23388 CHANGES END HERE 
        Signed;
        DisplayOnly;        
        Length = "16";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Increased Face amount";
        Index = "1";  
        }
#UYS014 CHANGES ENDS HERE    
#UY304A CHANGES STARTS HERE
    IN MIR-CVG-ADJ-DV1-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Delta V1";
        Index = "1";
    }
    IN MIR-CVG-ADJ-DV2-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Delta V2";
        Index = "1";
    }
    IN MIR-CVG-CNVR-DUR-T[20]
    {
        Length = "5";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Conversion Duration";
        Index = "1";
    }    
#UY304A CHANGES ENDS HERE
# UY3049 CHANGES STARTS
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
# UY3049 CHANGES ENDS
}

