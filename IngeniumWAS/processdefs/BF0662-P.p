 # Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:26 PM EDT

#*******************************************************************************
#*  Component:   BF0662-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  PR006I  BMB      Changes for ManuMed rider renewals                        *
#*  MM0217  BMB      CVG-ISS-DT not being passed back correctly                *
#*  RP2009   CTS      added renw-subtable-4 code and ignore error checkbox     *
#*  RPL009   CTS      added renw-subtable-3 code and ignore error checkbox     *
#*  MP161J  CTS      CHANGES TO ADD WAIVER OF PREMIUM INDICATOR                *
#*  M142W1  CTS      CHANGES TO ADD OVERRIDE FACE AMOUNT                       *
#*  MP211B  CTS      ADD NEW FIELDS FOR LIEN DURATION.                         *
#*  M213L1  CTS      CHANGES FOR RUM                                           *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  MP245J  CTS      ADD NEW FIELD FOR SUBSTANDARD AGE DURATION AS PART OF SPWL*
#*  Q50820  CTS      CHANGES TO REMOVE THE FIELD SUBSTANDARD AGE DURATION      *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  M271A2  CTS      CHAGES DONE FOR TAX INDICATOR AS PART OF FRA              *
#*  018395  CTS      CHANGES DONE FOOR TRAD RIDER RENEWAL                      * 
#*  UYS014  CTS      ADDITION OF NEW FIELD FOR INCREASING FACE AMOUNT          *
#*  UY3047  CTS      ADDED NEW FIELD AS PART OF ANNUITY STREAM 3 CHANGES       *
#*******************************************************************************

P-STEP BF0662-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0662";
        BusinessFunctionName = "Coverage Change Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM0660";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-AGE-RAT-REASN-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "ARST";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Reason";
    }

    INOUT MIR-CVG-AD-FACE-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "ADB Amount";
    }

    INOUT MIR-CVG-AD-MULT-FCT
    {
        Signed;
        Length = "3";
        Decimals = "2";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "ADB Rating Multiplier";
    }

    INOUT MIR-CVG-COLA-SELCT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-COLA-SELCT-CD";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Cost of Living Adjustment Benefit (COLA)";
    }

    INOUT MIR-CVG-ENHC-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-ENHC-TYP-CD";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Coverage Enhancement";
    }

    INOUT MIR-CVG-FACE-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
    }

    INOUT MIR-CVG-FE-DUR
    {
        Length = "3";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Flat Extra Premium - Duration";
    }

    INOUT MIR-CVG-FE-REASN-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "RFLAT";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Flat Extra Premium - Reason";
    }

    INOUT MIR-CVG-FE-UPREM-AMT
    {
        Signed;
        Length = "9";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Dollar Amount/Unit";
    }

    INOUT MIR-CVG-INT-PAYO-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "PLAN-INT-PAYO-CD";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Interest Handling Indicator";
    }

    INOUT MIR-CVG-JNT-LIFE-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-JNT-LIFE-CD";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Joint Life Type";
    }

    INOUT MIR-CVG-LIVES-INSRD-CD
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Number of Lives Insured";
    }

    INOUT MIR-CVG-LTA-SELCT-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Lifetime accident (benefit provided; result of accident)";
    }

    INOUT MIR-CVG-LTB-SELCT-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Lifetime benefits (result of either accident or sickness)";
    }

    INOUT MIR-CVG-ME-DUR
    {
        Length = "3";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Multiple Rating Duration";
    }

    INOUT MIR-CVG-ME-FCT
    {
        Signed;
        Length = "3";
        Decimals = "2";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Rating";
    }

    INOUT MIR-CVG-ME-RAT-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "TRATE";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "True Table Rating";
    }

    INOUT MIR-CVG-ME-REASN-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "RMULT";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Multiple Rating Reason";
    }

    INOUT MIR-CVG-PAR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-PAR-CD";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Dividend Option";
    }

    INOUT MIR-CVG-RT-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Rate Age";
    }

    INOUT MIR-CVG-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-SEX-CD";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Sex";
    }

    INOUT MIR-CVG-SMKR-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SMOKE";
        DBTableName = "TCVG";
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
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Sub-table 1";
    }

    INOUT MIR-CVG-STBL-2-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Sub-table 2";
    }

    INOUT MIR-CVG-STBL-3-CD
    {
        Length = "5";
#* M241A3 changes START here*
#        CodeSource = "EDIT";
#        CodeType = "STB3";
        CodeSource = "CSOM9789";        
	FilterFields = "1";
        FilterField1 = "MIR-PLAN-ID"; 
#* M241A3 changes END here*
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Sub-table 3";
    }

    INOUT MIR-CVG-STBL-4-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Sub-table 4";
    }

    INOUT MIR-CVG-WP-MULT-FCT
    {
        Signed;
        Length = "3";
        Decimals = "2";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Waiver of Premium Multiplier";
    }
#* MP161J CHANGES START HERE
    INOUT MIR-CVG-WP-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Waiver of Premium Indicator";
    }

#* MP161J CHANGES END HERE

    INOUT MIR-INSRD-CLI-ID-T[5]
    {
        Length = "10";
        FieldGroup = "Table5";
        DBTableName = "TCVGC";
        SType = "Text";
        Label = "Client Number of Lives Insured";
        Index = "1";
    }

    INOUT MIR-OWN-OCCP-SELCT-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Own occupation benefit";
    }

    INOUT MIR-PDISAB-SELCT-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Partial disability benefit";
    }

    INOUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Type of Plan";
    }

    INOUT MIR-REDC-EP-SELCT-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Reduced elimination period for hospitalization Confinement (EP/HOSP)";
    }

    INOUT MIR-REL-CVG-NUM
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Connecting Coverage";
    }

    INOUT MIR-ULT-PREM-RT-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Ultimate Rate Age";
    }

    INOUT MIR-ULT-PREM-RT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ULT-PREM-RT-CD";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Ultimate Rate";
    }

    IN MIR-CVG-NUM
    {
        Key;
        Length = "2";
        DBTableName = "TCVG";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }

    IN MIR-PCHST-EFF-IDT-NUM
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TPHST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

# MM0217 - changed location, change to 'IN' and added 'Key' for this field

    IN MIR-CVG-ISS-EFF-DT
    {
        Key;
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Issue Date";
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

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

#*  PR006I  BMB      Changes for ManuMed rider renewals   *

    INOUT MIR-CVG-RENW-PLAN-ID
    {
        Length = "40";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Override Renewal Plan";
    }

    INOUT MIR-CVG-RENW-STBL-1-CD
    {
        Length = "2";
#* M241A3 changes START here*
        CodeSource = "CSOM9788";        
        FilterFields = "1";
        FilterField1 = "MIR-PLAN-ID";
#    CodeSource = "EDIT";
#       CodeType = "STB1";
#* M241A3 changes END here*
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Override Renewal Duration";
    }

    INOUT MIR-CVG-RENW-STBL-2-CD
    {
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Override Renewal Benefit Limit";
    }

#* RP2009 CHNAGES START HERE

    INOUT MIR-CVG-RENW-STBL-4-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Override Sub Table 4";
    }

# RPL009 CHANGES START HERE**************************
    INOUT MIR-CVG-RENW-STBL-3-CD
    {
        Length = "5";
#* M241A3 changes START here*
        CodeSource = "CSOM9789";        
	FilterFields = "1";
        FilterField1 = "MIR-PLAN-ID";
#        CodeSource = "EDIT";
#        CodeType = "STB3";
#* M241A3 changes START here*
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Override Sub Table 3";
    }
# RPL009 CHANGES END HERE *******************************

#RPL009 ADDING SELECTION BOX CHANGES START HERE*********
 INOUT MIR-SPCL-ST-HOSP-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Request for Short Term Hospitalization ";
    }

#RPL009 CHANGES END HERE******************

    INOUT MIR-IGNORE-ERROR-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Ignore Error";
    }

# M142W1 CHANGES START HERE**************************
    INOUT MIR-RENW-FACE-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Override Face Amount";
    }
# M142W1 CHANGES END HERE *******************************    
    INOUT MIR-CVG-PREM-CHNG-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Hidden";
        Label = "Premium Change Date";
    }
    
#MP211B changes starts  
    
    INOUT MIR-CVG-LIEN-DUR
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Lien Duration";
    }
    
#MP211B changes ends

#Q50820 CHANGES START HERE
#MP245J CHANGES STARTS HERE
#
#    INOUT MIR-SSTD-AGE-ADD-DUR
#    {
#        DisplayOnly;
#        Length = "2";
#        Decimals = "0";
#        DBTableName = "TCVG";
#        SType = "Number";
#        Label = "Substandard Age Duration";
#    }
#
#MP245J CHANGES ENDS HERE
#Q50820 CHANGES END HERE

#M213L1 CHANGES STARTS HERE 

    INOUT MIR-CVG-PRIM-GR-ID
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Group ID";
    }

#M213L1 CHANGES ENDS HERE    
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
#M271A2 CHANGES START HERE
    
    INOUT MIR-TAX-QUALF-IND
    {
         Length = "1";
         DBTableName = "TCVG";
         SType = "Indicator";
         Label = "Tax Qualified Indicator"; 
     }
#M271A2 CHANGES ENDS HERE
#018395 CHANGES START HERE

    INOUT MIR-CVG-RENW-ACPT-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Renewal Acceptance Date";
    }
#018395 CHANGES END HERE
#UYS014 CHANGES START HERE
   OUT MIR-INCR-FACE-AMT
   {
        DisplayOnly;
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "Increased Face amount";
    }   
#UYS014 CHANGES ENDS HERE
#UY3047 CHANGES STARTS HERE    
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
    
    INOUT MIR-ANTY-PMT-DUR
    {
        Length = "3";
        SType = "Selection";
        DBTableName = "TCVG";
        CodeSource = "DataModel";
        CodeType = "ANTY-PMT-TRM";
        Label = "Annuity Payment Term";      
    }
#UY3047 CHANGES ENDS
}

