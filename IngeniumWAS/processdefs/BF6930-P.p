# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:52 PM EDT

#*******************************************************************************
#*  Component:   BF6930-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01AD25  BMB      Change MIR-CVG-NUM to control display of more than 20 cvgs*
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *                                                                           *
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*  MP245J  CTS      ADD NEW FIELD FOR SUBSTANDARD AGE DURATION AS PART OF SPWL*
#*  M251A2  CTS      CHANGES FOR ADDITION OF TAX-DED-CAT-CD                    *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  M319N2  CTS      ADDED NEW FIELD FOR PREMIUM PER PREMIUM MODE AS PART OF   *
#*                   FXWL                                                      *
#*  TDMG07  CTS      SCREEN CHANGES FOR NWL                                    *
#*  118579  CTS      CHANGES DONE TO CORRECT THE FIELD PREMIUM PAYMENT         *
#*  118579           DESCRIPTION                                               *
#*  NV3N01  CTS      CHANGES DONE AS PART OF SULV3                             *
#*******************************************************************************

P-STEP BF6930-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "6930";
        BusinessFunctionName = "Policy Inquiry - Coverage Premiums";
        BusinessFunctionType = "Premcov";
        MirName = "CCWM6930";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

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

    OUT MIR-CVG-AD-PREM-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Accidental Death Benefit (ADB) Premium";
        Index = "1";
    }

    OUT MIR-CVG-BASIC-PREM-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Annual Premium";
        Index = "1";
    }

    OUT MIR-CVG-COLA-PREM-AMT-T[20]
    {
        Signed;
        Length = "11";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Cost of Adjustments (COLA) Premium";
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

    OUT MIR-CVG-FE-PREM-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Flat Extra Premium";
        Index = "1";
    }

    OUT MIR-CVG-JNT-LIFE-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-JNT-LIFE-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Joint Life Type";
        Index = "1";
    }

    OUT MIR-CVG-LTA-PREM-AMT-T[20]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Lifetime Accident (LTA) Premium";
        Index = "1";
    }

    OUT MIR-CVG-LTB-PREM-AMT-T[20]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Lifetime Benefits (LTB) Premium";
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

    OUT MIR-CVG-ME-PREM-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Multiple / Mortality Extra Premium";
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

#M319N2 CHANGES STARTS HERE

    OUT MIR-ME-MEMPR-AMT-T[20]
    {
        Signed;
        FieldGroup = "Table20";
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "FXWL Modal ME Premium";
        Index = "1";
    }

#M319N2 CHANGES ENDS HERE

    OUT MIR-CVG-MPREM-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Mode Premium";
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

    OUT MIR-CVG-PFEE-AMT-T[20]
    {
        Signed;
        Length = "11";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Flat Policy Fee";
        Index = "1";
    }

    OUT MIR-CVG-RESTR-PREM-IND-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Automatic premium calculation has been restricted";
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
#      CodeSource = "EDIT";
#      CodeType = "STB3";
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

    OUT MIR-CVG-WP-PREM-AMT-T[20]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Waiver of Premium Benefit Premium";
        Index = "1";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-MPREM-DSCNT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Policy Discount Amount";
    }

    OUT MIR-OWN-OCCP-PREM-AMT-T[20]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Own Occupation Definition of Disability Premium";
        Index = "1";
    }

    OUT MIR-PDISAB-PREM-AMT-T[20]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Partial Disability Premium";
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

    OUT MIR-PLAN-MODE-FEE-AMT
    {
        Signed;
        Length = "11";
        DBTableName = "TPH";
        SType = "Currency";
        Label = "Flat Charge Amount per Mode";
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
#       Label = "Premium Payment Completion";
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

    OUT MIR-POL-GRS-APREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Gross Annual Premium";
    }

#NV3N01 CHANGES BEGIN
    OUT MIR-MTHLY-STD-PREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Policy Monthly Standard Premium";
    }

    OUT MIR-CVG-STD-PREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Rider Monthly Standard Premium";
    }
#NV3N01 CHANGES END

    OUT MIR-POL-MPREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Mode Premium Amount";
    }

    OUT MIR-POL-PREM-DSCNT-PCT
    {
        Signed;
        Length = "7";
        Decimals = "3";
        DBTableName = "TPOL";
        SType = "Percent";
        Label = "Policy Discount Percentage";
    }

    OUT MIR-REDC-EP-PREM-AMT-T[20]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Reduced Elimination Period in Event of Hospitalization Premium";
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
#M245B2 CHANGES START HERE     
    INOUT MIR-POL-CRCY-CD
            {
       
              Length = "2";
              SType = "Hidden";
              Label = "Currency";
        }
#M245B2 CHANGES END HERE 
#* M251A2 changes START here*    

    OUT MIR-TAX-DED-CAT-CD-T[20]
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

