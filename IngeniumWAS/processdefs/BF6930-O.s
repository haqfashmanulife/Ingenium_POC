# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:00 PM EDT

#*******************************************************************************
#*  Component:   BF6930-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01AD25  BMB      Change MIR-CVG-NUM to control display of more than 20 cvgs*
#*                   Focusfield is the more button...                          *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *                                                                      *
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*  MP245J  CTS      ADD NEW FIELD FOR SUBSTANDARD AGE DURATION AS PART OF SPWL*
#*  M251A2  CTS      CHANGES FOR ADDITION OF TAX-DED-CAT-CD                    *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  M319N2  CTS      CHANGES FOR ADDITION OF PREMIUM PER PREMIUM MODE FIELD    *
#*                   -FXWL                                                     *
#*  TDMG07  CTS  SCREEN CHANGES FOR NWL                                        *
#*  118579  CTS      CHANGES DONE TO CORRECT THE FIELD PREMIUM PAYMENT         *
#*  118579           DESCRIPTION                                               *
#*  NV3N01  CTS      CHANGES DONE AS PART OF SULV3                             *
#*******************************************************************************

S-STEP BF6930-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Premcov";
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

    IN MIR-CVG-AD-PREM-AMT-T[20]
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
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Accidental Death Benefit (ADB) Premium";
        Index = "1";
    }

    IN MIR-CVG-BASIC-PREM-AMT-T[20]
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
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Annual Premium";
        Index = "1";
    }

    IN MIR-CVG-COLA-PREM-AMT-T[20]
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
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Cost of Adjustments (COLA) Premium";
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

    IN MIR-CVG-FE-PREM-AMT-T[20]
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
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Flat Extra Premium";
        Index = "1";
    }

    IN MIR-CVG-JNT-LIFE-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-JNT-LIFE-CD";
        SType = "Text";
        Label = "Joint Life Type";
        Index = "1";
    }

    IN MIR-CVG-LTA-PREM-AMT-T[20]
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
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Lifetime Accident (LTA) Premium";
        Index = "1";
    }

    IN MIR-CVG-LTB-PREM-AMT-T[20]
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
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Lifetime Benefits (LTB) Premium";
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

    IN MIR-CVG-ME-PREM-AMT-T[20]
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
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Multiple / Mortality Extra Premium";
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

#M319N2 CHANGES STARTS HERE

    IN MIR-ME-MEMPR-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        FieldGroup = "Table20";
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        CurrencyCode = "MIR-PREM-CRCY-CD";
        Label = "FXWL Modal ME Premium";
        Index = "1";
    }

#M319N2 CHANGES ENDS HERE


    IN MIR-CVG-MPREM-AMT-T[20]
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
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Mode Premium";
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

    IN MIR-CVG-PFEE-AMT-T[20]
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
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Flat Policy Fee";
        Index = "1";
    }
    # TDMG07 changes begin
    
         IN MIR-PREM-PMT-CMPLT-IND
         {
                DisplayOnly;
                Length = "1";
                SType = "Indicator";
# 118579 changes begin      
#               Label = "Premium Payment Completion";
		Label = "Base Policy Premium Payment Completion";
# 118579 changes end 
         }
    		    
   # TDMG07 changes end 

    IN MIR-CVG-RESTR-PREM-IND-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        SType = "Indicator";
        Label = "Automatic premium calculation has been restricted";
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
#      CodeSource = "EDIT";
#     CodeType = "STB3";
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

    IN MIR-CVG-WP-PREM-AMT-T[20]
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
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Waiver of Premium Benefit Premium";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-MPREM-DSCNT-AMT
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
        SType = "Currency";
        Label = "Policy Discount Amount";
    }

    IN MIR-OWN-OCCP-PREM-AMT-T[20]
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
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Own Occupation Definition of Disability Premium";
        Index = "1";
    }

    IN MIR-PDISAB-PREM-AMT-T[20]
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
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Partial Disability Premium";
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

    IN MIR-PLAN-MODE-FEE-AMT
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
        Label = "Flat Charge Amount per Mode";
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

    IN MIR-POL-CVG-REC-CTR
    {
        DisplayOnly;
        Length = "2";
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
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Gross Annual Premium";
    }

#NV3N01 CHANGES BEGIN
    IN MIR-MTHLY-STD-PREM-AMT
    {
        CurrencyCode = "MIR-PREM-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Policy Monthly Standard Premium";
    }

    IN MIR-CVG-STD-PREM-AMT
    {
        CurrencyCode = "MIR-PREM-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Rider Monthly Standard Premium";
    }
#NV3N01 CHANGES END

    IN MIR-POL-MPREM-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Mode Premium Amount";
    }

    IN MIR-POL-PREM-DSCNT-PCT
    {
        DisplayOnly;
        Signed;
        Length = "7";
        Decimals = "3";
        SType = "Percent";
        Label = "Policy Discount Percentage";
    }

    IN MIR-REDC-EP-PREM-AMT-T[20]
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
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Reduced Elimination Period in Event of Hospitalization Premium";
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
#M245B2 CHANGES START HERE     
    INOUT MIR-POL-CRCY-CD
        {
   
          Length = "2";
          SType = "Hidden";
          Label = "Currency";
    }
#M245B2 CHANGES END HERE 
#* M251A2 changes START here*    

    IN MIR-TAX-DED-CAT-CD-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "TAX-DED-CAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Tax Deduction Category";
        Index = "1";
    }
#* M251A2 changes ENDS here*   
#M271O1 CHANGES START HERE  
         
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 
}

