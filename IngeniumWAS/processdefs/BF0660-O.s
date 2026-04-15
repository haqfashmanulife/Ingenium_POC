# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:27 PM EDT

#*******************************************************************************
#*  Component:   BF0660-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  PR006I  BMB      Changes for ManuMed rider renewals                        *
#*  RP2009  CTS      CHANGES FOR MEDICAL RE-PRICING                            *
#*  AIF128  CTS      ADDED THE RENEWAL SUBTABLE 4 CODE
#*  RPL009  CTS      CHANGES FOR LIMITED PAY                                   *
#*  MP161J  CTS      CHANGES TO ADD WAIVER OF PREMIUM INDICATOR                *
#*  M142W1  CTS      CHANGES TO ADD OVERRIDE FACE AMOUNT                       *
#*  MP211B  CTS      ADD NEW FIELDS FOR LIEN DURATION.                         *
#*  Q31317  CTS      ADDITION OF GROUP ID FIELD                                *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  Q51116  CTS      FOREIGN CURRENCY FORMATTING                               *
#*  M271A2  CTS      CHANGES DONE FOR TAX INDICATOR AS PART OF FRA             *
#*  018395  CTS      CHANGES DONE FOR TRAD RIDER RENEWAL                       *
#*  UYS014  CTS      ADDITION OF NEW FIELD FOR INCREASING FACE AMOUNT          *
#*  UY3047  CTS      ADDED NEW FIELD AS PART OF ANNUITY STREAM 3 CHANGES       *
#*******************************************************************************

S-STEP BF0660-O
{
    ATTRIBUTES
    {
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

    IN MIR-PCHST-EFF-IDT-NUM
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
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

    IN MIR-AGE-RAT-REASN-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "ARST";
        SType = "Text";
        Label = "Reason";
    }

    IN MIR-CVG-AD-FACE-AMT
    {
#Q51116 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#Q51116 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "ADB Amount";
    }

    IN MIR-CVG-AD-MULT-FCT
    {
        DisplayOnly;
        Signed;
        Length = "3";
        Decimals = "2";
        SType = "Number";
        Label = "ADB Rating Multiplier";
    }

    IN MIR-CVG-COLA-SELCT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-COLA-SELCT-CD";
        SType = "Text";
        Label = "Cost of Living Adjustment Benefit (COLA)";
    }

    IN MIR-CVG-ENHC-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-ENHC-TYP-CD";
        SType = "Text";
        Label = "Coverage Enhancement";
    }

    IN MIR-CVG-FACE-AMT
    {
#Q51116 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#Q51116 CHANGES END HERE     
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
        Label = "Flat Extra Premium - Duration";
    }

    IN MIR-CVG-FE-REASN-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "RFLAT";
        SType = "Text";
        Label = "Flat Extra Premium - Reason";
    }

    IN MIR-CVG-FE-UPREM-AMT
    {
#Q51116 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#Q51116 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "9";
        SType = "Currency";
        Label = "Flat Extra Rate";
    }

    IN MIR-CVG-INT-PAYO-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "PLAN-INT-PAYO-CD";
        SType = "Text";
        Label = "Interest Handling Indicator";
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
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-JNT-LIFE-CD";
        SType = "Text";
        Label = "Joint Life Type";
    }

    IN MIR-CVG-LIVES-INSRD-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Number of Lives Insured";
    }

    IN MIR-CVG-LTA-SELCT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Lifetime accident (benefit provided; result of accident)";
    }

    IN MIR-CVG-LTB-SELCT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Lifetime benefits (result of either accident or sickness)";
    }

    IN MIR-CVG-ME-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Multiple Rating Duration";
    }

    IN MIR-CVG-ME-FCT
    {
        DisplayOnly;
        Signed;
        Length = "3";
        Decimals = "2";
        SType = "Number";
        Label = "Multiple Rating Factor";
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
        Label = "Multiple Rating Reason";
    }

    IN MIR-CVG-PAR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-PAR-CD";
        SType = "Text";
        Label = "Dividend Option";
    }

    IN MIR-CVG-RT-AGE
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Rate Age";
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
        Length = "5";
#* M241A3 changes START here* 
        CodeSource = "CSOM9789";        
        FilterFields = "1";
        FilterField1 = "MIR-PLAN-ID";
#     CodeSource = "EDIT";
#     CodeType = "STB3";
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

    IN MIR-CVG-WP-MULT-FCT
    {
        DisplayOnly;
        Signed;
        Length = "3";
        Decimals = "2";
        SType = "Number";
        Label = "Waiver of Premium Multiplier";
    }
#* MP161J CHANGES START HERE
    IN MIR-CVG-WP-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Waiver of Premium Indicator";
    }    
#* MP161J CHANGES END HERE

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-INSRD-CLI-ID-T[5]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table5";
        KeyColumn;
        SType = "Text";
        Label = "Client Number of Lives Insured";
        Index = "1";
    }

    IN MIR-OWN-OCCP-SELCT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Own occupation benefit";
    }

    IN MIR-PDISAB-SELCT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Partial disability benefit";
    }

    IN MIR-PLAN-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Type of Plan";
    }

    IN MIR-REDC-EP-SELCT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Reduced elimination period for hospitalization Confinement (EP/HOSP)";
    }

    IN MIR-REL-CVG-NUM
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Connecting Coverage";
    }

    IN MIR-ULT-PREM-RT-AGE
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Ultimate Rate Age";
    }

    IN MIR-ULT-PREM-RT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ULT-PREM-RT-CD";
        SType = "Text";
        Label = "Ultimate Rate";
    }

#*  PR006I  BMB      Changes for ManuMed rider renewals   *

    IN MIR-CVG-RENW-PLAN-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "CSOM9188";
        FilterFields = "3";
        FilterField1 = "MIR-PLAN-ID";
        FilterField2 = "MIR-CVG-PREM-CHNG-DT";
        FilterField3 = "MIR-CVG-RENW-PLAN-ID";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Override Renewal Plan";
    }

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

#*RP2009 CHANGES START HERE

    INOUT MIR-CVG-PREM-CHNG-DT
    {
        Length = "10";
        SType = "Hidden";
        Label = "Premium Change Date";
    }

#*AIF128 CHANGES START HERE

    IN MIR-CVG-RENW-STBL-4-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Override Sub Table 4";
    }
#*AIF128 CHANGES END HERE

#* RPL009 CHANGES START HERE *
    IN MIR-CVG-RENW-STBL-3-CD
    {
        DisplayOnly;
        Length = "5";
#* M241A3 changes START here* 
        CodeSource = "CSOM9789";        
	FilterFields = "1";
        FilterField1 = "MIR-PLAN-ID";
#       CodeSource = "EDIT";
#       CodeType = "STB3";
#* M241A3 changes END here* 
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Override Sub Table 3";
    }
#* RPL009 CHANGES END HERE*

#*RPL009 changes start for adding selection box*
    IN MIR-SPCL-ST-HOSP-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Request for Short Term Hospitalization";
    }

#*RPL009 changes end here for selection box*

# M142W1 CHANGES START HERE *************
    IN MIR-RENW-FACE-AMT
    {
#Q51116 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#Q51116 CHANGES END HERE     
        DisplayOnly;
	Signed;
	Length = "15";
	SType = "Currency";
       	Label = "Override Face Amount";
    }
# M142W1 CHANGES END HERE******************
#MP211B changes starts

    IN MIR-CVG-LIEN-DUR
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
#Q31317 CHANGES STARTS HERE         
#        SType = "Selection";
         SType = "Text";
#Q31317 CHANGES ENDS HERE         
        Label = "Lien Duration";
    }

#MP211B changes ends

#Q31317 CHANGES STARTS HERE 

    IN MIR-CVG-PRIM-GR-ID
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Group ID";
    }
#Q31317 CHANGES ENDS HERE 

#Q51116 CHANGES START HERE       
       INOUT MIR-POL-CRCY-CD
        {
           Length = "2";           
           SType = "Hidden";
           Label = "Currency";
    }
#Q51116 CHANGES END HERE  

#M271A2 CHANGES START HERE
    
    IN MIR-TAX-QUALF-IND
    {
         DisplayOnly;
         Length = "1";
         DBTableName = "TCVG";
         SType = "Indicator";
         Label = "Tax Qualified Indicator"; 
     }
#M271A2 CHANGES ENDS HERE

#018395 CHANGES START HERE

    IN MIR-CVG-RENW-ACPT-DT
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Renewal Acceptance Date";
    }
#018395 CHANGES END HERE
#UYS014 CHANGES STARTS HERE
   IN MIR-INCR-FACE-AMT
   {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "Increased Face amount";
    }   
#UYS014 CHANGES ENDS HERE
#UY3047 CHANGES STARTS HERE   
    IN MIR-ANTY-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        CodeSource = "DataModel";
        CodeType = "CVG-ANTY-TYP-CD";
        Label = "Annuity Type";
    }
         
    IN MIR-ANTY-STYLE-CD
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        CodeSource = "DataModel";
        CodeType = "CVG-ANTY-STL";
        Label = "Annuity Style";      
    }
        
    IN MIR-ANTY-PMT-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        CodeSource = "DataModel";
        CodeType = "ANTY-PMT-TRM";
        Label = "Annuity Payment Term";      
    }
#UY3047 CHANGES ENDS HERE
}

