# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:52 PM EDT

#*******************************************************************************
#*  Component:   BF6925-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01PR21  TMC      Added UL Paid-up Date                                     *
#*  01AD25  BMB      Change MIR-CVG-NUM to control display of more than 20 cvgs*
#*  02PR55  RNL      Added MAT-XPRY-REASN-CD                                   *
#*  M00025  MAW      Added MIR-CVG-SUB-STAT-CD-T                               *
#*  MFPCC1  CECIL    ADD FIELD ILLUSTRATION TYPE                               *
#*  MFFAN8  MC       ADD EXPECTED ANNUITY AGE AND DATE                         *                                                                            *
#*  IPPDRC  JE       ADDITIONAL ITEMS FOR IP/DD RIDER INQUIRY SUPPORT          *
#*  MP29NB  CTS      ADDED MIR VARIABLES FOR REINSURANCE                       *
#*  FEID01  CTS      ADD LIAB-ISS-CUT-OFF-DT for for LCD Issue Date Calculation*
#*  FEID01           - Online Screen Changes                                   *
#*  MP161L  CTS      ADDED FIELD 3DD WAIVER OF PREMIUM INDICATOR               *
#*  MP176Q  CTS      ONLINE CHANGES FOR CALL CENTER INQUIRY SCREEN             *
#*  MP211B  CTS      ADD NEW FIELDS FOR LIEN DURATION.                         *
#*  MP213S  CTS      ONLINE CHANGES FOR CALL CENTER INQUIRY SCREEN             *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*  MP245J  CTS      ADD NEW FIELD FOR SUBSTANDARD AGE DURATION AS PART OF SPWL*
#*  M24573  CTS      ADD NEW FIELD FOR BASIC BENEFIT RATE                      *
#*  TDMG07  CTS      SCREEN CHANGES FOR NWL                                    *
#*  118579  CTS      CHANGES DONE TO CORRECT THE FIELD PREMIUM PAYMENT         *
#*  118579           DESCRIPTION                                               *
#*  TLB015  CTS      REINSURANCE TYPE                                          *
#*  UYS014  CTS      ADDITION OF NEW FIELD FOR INCREASING FACE AMOUNT          *
#*  29746F  CTS      CHANGES AS PART OF CERBERUS NEW BUSINESS                  *
#*  29746K  CTS      CHANGES AS PART OF CERBERUS INQUIRY CALL CENTRE 
#*  UY3068  CTS      ADDITION OF NEW FIELDS AS PART OF STREAM3 FA REDCUTION    *
#*  UY304A  CTS      CALL CENTER SCREEN ENHANCEMENT          *
#*  UY3049  CTS      ANNUITY PAYMENT SCREEN                                    *
#*  NVCN01  CTS      CHANGES DONE AS PART OF ONTARIO XML UPLOAD                *
#*******************************************************************************

P-STEP BF6925-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "6925";
        BusinessFunctionName = "Policy Inquiry - Coverage Detail";
        BusinessFunctionType = "Covdtl";
        MirName = "CCWM6925";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

#MP176Q CHANGES STARTS    	
    IN MIR-CALL-CENTR-IND 
    
    {
        SType = "Hidden";
    }
    
#MP176Q CHANGES END
#01AD25 - Add in the coverage number
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
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
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

    OUT MIR-AGE-RAT-REASN-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "ARST";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Reason";
        Index = "1";
    }

    OUT MIR-CONN-CVG-NUM-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Connected Coverage Number";
        Index = "1";
    }

    OUT MIR-CVG-ACCT-TYP-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Account Type";
        Index = "1";
    }

    OUT MIR-CVG-AD-FACE-AMT-T[20]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "ADB Amount";
        Index = "1";
    }

    OUT MIR-CVG-AD-MULT-FCT-T[20]
    {
        Signed;
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "ADB Rating Multiplier";
        Index = "1";
    }

    OUT MIR-CVG-APP-CMPLT-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Application Completion Date";
        Index = "1";
    }

    OUT MIR-CVG-APP-RECV-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Application Received Date";
        Index = "1";
    }

    OUT MIR-CVG-COLA-SELCT-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-COLA-SELCT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Cost of Living Adjustment Benefit (COLA)";
        Index = "1";
    }

    OUT MIR-CVG-COLFND-IND-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Coverage is a loan collateral fund";
        Index = "1";
    }
     
#UY3068 CHANGES START HERE
    OUT MIR-CVG-PMT-TYP-IND-T[20]
    {
        DisplayOnly;
        Length = "1";
        Index = "1";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "P-Type Policy";
    }
       
    OUT MIR-CVG-ADJ-DP1-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Delta P1";
        Index = "1";
    }
     
    OUT MIR-CVG-ADJ-D2P1-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "2nd Delta P1";
        Index = "1";
    }
     
    OUT MIR-CVG-ADJ-DP2-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Delta P2";
        Index = "1";
    }
     
    OUT MIR-CVG-ADJ-D2P2-AMT-T[20]
    { 
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "2nd Delta P2";
        Index = "1";
    } 

    OUT MIR-CVG-PMT-CMPLT-IND-T[20]
    {
        DisplayOnly;                                     
        Length = "1";
        Index = "1";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Single Premium Coverage Indicator";
    }
    
#UY3068 CHANGES END HERE
    OUT MIR-CVG-CSN-REC-CTR-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Number of Reinsurance on Coverage";
        Index = "1";
    }

    OUT MIR-CVG-CSTAT-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    OUT MIR-CVG-ENHC-TYP-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-ENHC-TYP-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Enhancement";
        Index = "1";
    }

    OUT MIR-CVG-FACE-AMT-T[20]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    } 
#UY3068 CHANGES START HERE 

    OUT MIR-CVG-ANTY-CAP-AMT-T[20]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Annuity Capital";
        Index = "1";
    }

#UY3068 CHANGES END HERE

#M24573 CHANGES START HERE
    OUT MIR-BASIC-BNFT-RT-T[20]
    {
       
        Signed;
        Length = "15";
        Decimals = "6";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Basic Benefit rate";
        Index = "1";
    }    
#M24573 CHANGES END HERE    
    OUT MIR-CVG-FE-DUR-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Flat Extra Premium - Duration";
        Index = "1";
    }

    OUT MIR-CVG-FE-UPREM-AMT-T[20]
    {
        Signed;
        Length = "11";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Dollar Amount/Unit";
        Index = "1";
    }

    OUT MIR-CVG-INS-TYP-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "PLAN-INS-TYP-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Type of Insurance";
        Index = "1";
    }

    OUT MIR-CVG-INT-PAYO-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "PLAN-INT-PAYO-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Interest Handling Indicator";
        Index = "1";
    }

    OUT MIR-CVG-ISS-EFF-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Issue Date";
        Index = "1";
    }

    OUT MIR-CVG-LTA-SELCT-IND-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Lifetime accident (benefit provided; result of accident)";
        Index = "1";
    }

    OUT MIR-CVG-LTB-SELCT-IND-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Lifetime benefits (result of either accident or sickness)";
        Index = "1";
    }

    OUT MIR-CVG-MAT-XPRY-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Coverage Maturity / Expiry Date";
        Index = "1";
    }

    OUT MIR-CVG-ME-DUR-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Multiple Rating Duration";
        Index = "1";
    }

    OUT MIR-CVG-ME-FCT-T[20]
    {
        Signed;
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Rating";
        Index = "1";
    }

    OUT MIR-CVG-ME-RAT-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "TRATE";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "True Table Rating";
        Index = "1";
    }

    OUT MIR-CVG-NUM-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-CVG-NXT-RENW-RT-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-NXT-RENW-RT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Next Renewal Rate";
        Index = "1";
    }
    
#MP29NB changes start
    OUT MIR-CVG-REINS-IND-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Reinsured";
        Index = "1";
    }
       
    OUT MIR-CVG-REINS-CO-ID-T[20]
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
    
    OUT MIR-CVG-REINS-TRTY-NUM-T[20]
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
    
    OUT MIR-CVG-REINS-CED-PCT-T[20]
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
    
    OUT MIR-CVG-REINS-CED-AMT-T[20]
    {
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

    OUT MIR-CVG-ORIG-FACE-AMT-T[20]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Original Face Amount Applied For";
        Index = "1";
    }

    OUT MIR-CVG-PAR-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-PAR-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Dividend Option";
        Index = "1";
    }

    OUT MIR-CVG-PREM-CHNG-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Premium Change Date";
        Index = "1";
    }

    OUT MIR-CVG-PREV-CSTAT-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Previous Coverage Status";
        Index = "1";
    }

    OUT MIR-CVG-RT-AGE-T[20]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Rate Age";
        Index = "1";
    }

    OUT MIR-CVG-SEX-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-SEX-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    OUT MIR-CVG-SMKR-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "SMOKE";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Smoker";
        Index = "1";
    }

    OUT MIR-CVG-SPND-CSTAT-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Suspended Coverage Status";
        Index = "1";
    }

    OUT MIR-CVG-STAT-PRCES-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Last Status Change Date";
        Index = "1";
    }

    OUT MIR-CVG-STBL-1-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
#* M241A3 changes START here*
        CodeSource = "CSOM9D29";        
	FilterFields = "2";
        FilterField1 = "MIR-PLAN-ID-T";
        FilterField2 = "MIR-CVG-STBL-1-CD-T";        
#        CodeSource = "EDIT";
#        CodeType = "STB1";
#* M241A3 changes END here*
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub-table 1";
        Index = "1";
    }

    OUT MIR-CVG-STBL-2-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub-table 2";
        Index = "1";
    }

    OUT MIR-CVG-STBL-3-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
#* M241A3 changes START here*
        CodeSource = "CSOM9D30";        
	FilterFields = "2";
        FilterField1 = "MIR-PLAN-ID-T";
        FilterField2 = "MIR-CVG-STBL-3-CD-T";        
#    CodeSource = "EDIT";
#   CodeType = "STB3";
#* M241A3 changes END here*
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub-table 3";
        Index = "1";
    }

    OUT MIR-CVG-STBL-4-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub-table 4";
        Index = "1";
    }
  #* MP213S Changes Begin
    OUT MIR-CVG-PRIM-GR-ID-T[20]
   {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Group ID";
        Index = "1";        
   }
   
    OUT MIR-GR-ID-TYP-CD-T[20]
   {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Hidden";
        Label = "Group ID";
        Index = "1";        
   }   
 #* MP213S changes end   
 #*  MP161L- Screen Changes start   
    OUT MIR-DV-3DD-WP-IND-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "3DDW";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "3DD Waiver of Premium";
        Index = "1";
    }
 #*  MP161L- Screen Changes end  
#NVCN01 START
    OUT MIR-CVG-WP-TYP-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-WP-TYP-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "WoP Type";
        Index = "1";
    }
#NVCN01 ENDS 
    OUT MIR-CVG-SUM-INS-AMT-T[20]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Sum Insured Amount";
        Index = "1";
    }

    OUT MIR-CVG-UL-PU-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "UL Paid-up Date";
        Index = "1";
    }

    OUT MIR-CVG-UNIT-TYP-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-UNIT-TYP-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Unit Type";
        Index = "1";
    }

    OUT MIR-CVG-UWG-AMT-T[20]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Underwriting Amount";
        Index = "1";
    }

    OUT MIR-CVG-WP-IND-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "WP Ind";
        Index = "1";
    }

    OUT MIR-CVG-WP-MULT-FCT-T[20]
    {
        Signed;
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Waiver of Premium Multiplier";
        Index = "1";
    }

    OUT MIR-CVG-WTHDR-ORDR-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-WTHDR-ORDR-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Withdrawal Order";
        Index = "1";
    }

    OUT MIR-DV-DPOS-TRM-DY-DUR-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Deposit Term Days";
        Index = "1";
    }

    OUT MIR-DV-DPOS-TRM-MO-DUR-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Deposit Term Months";
        Index = "1";
    }

    OUT MIR-DV-INSRD-CLI-NM-T[20]
    {
        Length = "75";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured's Name";
        Index = "1";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-INSRD-CLI-ID-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVGC";
        SType = "Text";
        Label = "Client Number of Lives Insured";
        Index = "1";
    }

    OUT MIR-MAT-XPRY-REASN-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "MAT-XPRY-REASN-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Maturity/Expiry Reason";
        Index = "1";
    }

    OUT MIR-OWN-OCCP-SELCT-IND-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Own occupation benefit";
        Index = "1";
    }

    OUT MIR-PDISAB-SELCT-IND-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Partial disability benefit";
        Index = "1";
    }

    OUT MIR-PLAN-ID-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Type of Plan";
        Index = "1";
    }

    OUT MIR-PLAN-PKG-ADB-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "PLAN-PKG-ADB-CD";
        DBTableName = "TPACK";
        SType = "Text";
        Label = "Embedded ADB";
        Index = "1";
    }

    OUT MIR-PLAN-PKG-WP-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "PLAN-PKG-WP-CD";
        DBTableName = "TPACK";
        SType = "Text";
        Label = "Embedded WP";
        Index = "1";
    }

    OUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
    }
    
    # TDMG07 changes begin
        
    OUT MIR-PREM-PMT-CMPLT-IND
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

    OUT MIR-POL-CVG-REC-CTR
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Coverages";
    }

    OUT MIR-PREV-RENW-RT-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "PREV-RENW-RT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Last Renewal Rate";
        Index = "1";
    }

    OUT MIR-REDC-EP-SELCT-IND-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Reduced elimination period for hospitalization Confinement (EP/HOSP)";
        Index = "1";
    }

    OUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
    }

    OUT MIR-ULT-PREM-RT-AGE-T[20]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Ultimate Rate Age";
        Index = "1";
    }

    OUT MIR-ULT-PREM-RT-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "ULT-PREM-RT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Ultimate Rate";
        Index = "1";
    }

    OUT MIR-ADDL-PLAN-MAND-IND-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "ADDL-PLAN-MAND-IND";
        DBTableName = "TPACK";
        SType = "Text";
        Label = "Plan Type";
        Index = "1";
    }

    OUT MIR-CVG-SUB-STAT-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "SUBSC";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Sub Status";
        Index = "1";
    }

    #  MFPCC1   CECIL   06MAY2004  Add field Illustration Type
    OUT MIR-CVG-ILLUS-CD-T[20]
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "ILLUS";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Illustration Type";
    }

#* MFFAN8 START ****
    OUT MIR-CVG-XPCT-ANTY-AGE-T[20]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Expected Annuity Age";
        Index = "1";
    }

    OUT MIR-CVG-XPCT-ANTY-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Expected Annuity Date";
        Index = "1";
    }
#* MFFAN8 END ****

# IPDDRC                               Converted Face Amount
    OUT MIR-CVG-NUM2-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-PLAN-ID2-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Type of Plan";
        Index = "1";
    }

    OUT MIR-CVG-PCFA-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Present Converted Face Amount";
        Index = "1";
    }

    OUT MIR-CVG-DV-PCFA-NXT2-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Converted Face Amount at Next MV + 2 Years";
        Index = "1";
    }

    OUT MIR-CVG-ACFA-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Average Converted Face Amount";
        Index = "1";
    }

    OUT MIR-CVG-DV-PCFA-GPD-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Converted Face Amount for Guaranteed Period";
        Index = "1";
    }

#* FEID01 Changes begin

    OUT MIR-LIAB-STRT-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label ="Liability Commencement date";
    }

#* FEID01 changes end
#MP211B changes starts  
    
    OUT MIR-CVG-LIEN-DUR-T[20]
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Lien Duration";
    }
    
#MP211B changes ends
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

#MP245J CHANGES STARTS HERE

    OUT MIR-SSTD-AGE-ADD-DUR-T[20]
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
#M271O1 CHANGES START HERE  
         
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE
#TLB015 CHANGES STARTS HERE
    OUT MIR-REINS-TYP-CD-T[20]
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
    OUT MIR-INCR-FACE-AMT-T[20]
    {
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
    OUT MIR-CVG-ADJ-DV1-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Delta V1";
        Index = "1";
    }
    OUT MIR-CVG-ADJ-DV2-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Delta V2";
        Index = "1";
    }
    OUT MIR-CVG-CNVR-DUR-T[20]
    {
        Length = "5";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Conversion Duration";
        Index = "1";
    }
#UY304A CHANGES ENDS HERE
#29746F CHANGES START HERE
    OUT MIR-JPY-PAYO-IND
    {
       Length = "1";
       DBTableName = "TPOL";
       SType = "Text";
       Label = "JPY Payout Rider";
    }
    OUT MIR-PAYO-BNK-ID
    {
       Length = "4";
       DBTableName = "TCLIB";
       SType = "Text";
       Label = "Payout Bank Name";
    }
    OUT MIR-PAYO-BNK-BR-ID
    {
       Length = "5";
       DBTableName = "TCLIB";
       SType = "Text";
       Label = "Payout Bank Branch";
    }
    OUT MIR-PAYO-BNK-ACCT-TYP-CD
    {
       Length = "3";
       CodeSource = "EDIT";
       CodeType = "FBACC";     
       DBTableName = "TBNKA";
       SType = "Text";
       Label = "Deposit Type";
    }
    OUT MIR-PAYO-BNK-ACCT-ID
    {
       Length = "17";
       DBTableName = "TCLIB";
       SType = "Text";
       Label = "Account No"; 
    }
    OUT MIR-PAYO-BNK-ACCT-HLDR-NM
    {
       Length = "50";
       DBTableName = "TBNKA";
       SType = "Text";
       Label = "Account Holder Name";
    }
#29746F CHANGES ENDS HERE
#29746K CHANGES STARTS HERE
 
    OUT MIR-PAYO-BNK-NM
    {
       Length = "75";
       SType = "Text";
       Label = "Bank Name";
}
    OUT MIR-PAYO-BNK-BR-NM
    {
       Length = "75";
       SType = "TEXT";
       Label = "Bank Branch";
    }
    OUT MIR-PAYO-CLI-ID
    {
       Length = "10";
       SType = "TEXT";
       Label = "Client ID";
    }
#29746K CHANGES ENDS HERE
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

