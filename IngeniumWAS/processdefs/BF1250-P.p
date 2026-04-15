# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:36 PM EDT

#*******************************************************************************
#*  Component:   BF1250-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  P00859  FB       Add MIR-CVG-REINS-IND and MIR-CVG-REINS-CO-ID             *
#*  MP8SPM  SC       Special Premium                                           *
#*  MP29NB  CTS      ADDED MIR VARIABLES FOR TREATY NUMBER,CEDING PERCENTAGE   *
#*  MP29NB           AND CEDING AMOUNT.                                        *
#*  MP211B  CTS      ADD NEW FIELDS FOR LIEN DURATION.                         *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  MP245J  CTS      ADD NEW FIELD FOR SUBSTANDARD AGE DURATION AS PART OF SPWL*
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  R11584  CTS      CHANGES DONE FOR CURRENCY CODE DISPLAY IN AMOUNT FIELDS   *
#*  R11951  CTS      CHANGES DONE TO FIX PATHFINDER ERROR LOGS                 *
#*  MP270F  CTS      AIS UNDERWRITING DECISION CHANGES IN UNDERWRITING SCREENS *
#*  M319O1  CTS      FXWL Foreign Currency Formatting                          *
#*  TLB015  CTS      REINSURANCE TYPE                                          *
#*******************************************************************************

P-STEP BF1250-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1250";
        BusinessFunctionName = "Underwriter Decision Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM1250";
    }


    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    OUT MIR-AGE-RAT-REASN-CD-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "ARST";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Reason";
        Index = "1";
    }

    OUT MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }

    OUT MIR-CLI-SMKR-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SMKR-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Smoker";
    }

    OUT MIR-CLI-UWGDECN-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CLI-UWGDECN-CD";
        DBTableName = "TCLI";
        SType = "Selection";
        Label = "Underwriting Decision";
    }

    OUT MIR-CLI-UWGDECN-TYP-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "CLDEC";
        DBTableName = "TCLI";
        SType = "Selection";
        Label = "Decision Type";
    }

    OUT MIR-CVG-AD-FACE-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "ADB Amount";
        Index = "1";
    }

    OUT MIR-CVG-AD-MULT-FCT-T[20]
    {
        Signed;
        Length = "3";
        Decimals = "2";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "ADB Rating Multiplier";
        Index = "1";
    }

    OUT MIR-CVG-COLA-SELCT-CD-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-COLA-SELCT-CD";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Cost of Living Adjustment Benefit (COLA)";
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
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-ENHC-TYP-CD";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Coverage Enhancement";
        Index = "1";
    }

    OUT MIR-CVG-FACE-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    OUT MIR-CVG-FE-DUR-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Flat Extra Premium - Duration";
        Index = "1";
    }

    OUT MIR-CVG-FE-REASN-CD-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "RFLAT";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Flat Extra Premium - Reason";
        Index = "1";
    }

    OUT MIR-CVG-FE-UPREM-AMT-T[20]
    {
        Signed;
        Length = "9";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Dollar Amount/Unit";
        Index = "1";
    }

    OUT MIR-CVG-LIVES-INSRD-CD-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Number of Lives Insured";
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

    OUT MIR-CVG-ME-DUR-T[20]
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CVG-ME-DUR";
        SType = "Selection";
        Label = "Multiple Rating Duration";
        Index = "1";
    }

    OUT MIR-CVG-ME-FCT-T[20]
    {
        Signed;
        Length = "3";
        Decimals = "2";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Rating";
        Index = "1";
    }

    OUT MIR-CVG-ME-RAT-CD-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "TRATE";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "True Table Rating";
        Index = "1";
    }

    OUT MIR-CVG-ME-REASN-CD-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "RMULT";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Multiple Rating Reason";
        Index = "1";
    }

    OUT MIR-CVG-NUM-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-CVG-PREV-FACE-AMT-T[20]
    {
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Last Face Amount";
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
        SType = "Selection";
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
        SType = "Selection";
        Label = "Smoker";
        Index = "1";
    }

    OUT MIR-CVG-SPND-CSTAT-CD-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Suspended Coverage Status";
        Index = "1";
    }

    OUT MIR-CVG-STBL-1-CD-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
#* M241A3 changes START here*
#       CodeSource = "EDIT";
#       CodeType = "STB1";
 	CodeSource = "CSOM9D29";        
	FilterFields = "2";
        FilterField1 = "MIR-PLAN-ID-T"; 
        FilterField2 = "MIR-CVG-STBL-1-CD-T";
#* M241A3 changes END here*
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Sub-table 1";
        Index = "1";
    }

    OUT MIR-CVG-STBL-2-CD-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Sub-table 2";
        Index = "1";
    }

    OUT MIR-CVG-STBL-3-CD-T[20]
    {
        Length = "5";
        FieldGroup = "Table20";
#* M241A3 changes START here*
        CodeSource = "CSOM9D30";        
        FilterFields = "2";
        FilterField1 = "MIR-PLAN-ID-T";
        FilterField2 = "MIR-CVG-STBL-3-CD-T";
#       CodeSource = "EDIT";
#       CodeType = "STB3";
#* M241A3 changes END here*
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Sub-table 3";
        Index = "1";
    }

    OUT MIR-CVG-STBL-4-CD-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Sub-table 4";
        Index = "1";
    }

    OUT MIR-CVG-SUPP-BNFT-CD-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-SUPP-BNFT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Supplementary Benefit";
        Index = "1";
    }

    OUT MIR-CVG-UWG-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Underwriting Amount";
        Index = "1";
    }

    OUT MIR-CVG-UWGDECN-CD-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-UWGDECN-CD";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Coverage Decision";
        Index = "1";
    }

    OUT MIR-CVG-UWGDECN-SUB-CD-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "CODEC";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Reason";
        Index = "1";
    }

    OUT MIR-CVG-UWG-EXCL-1-CD-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "EXCL";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "First";
        Index = "1";
    }

    OUT MIR-CVG-UWG-EXCL-2-CD-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "EXCL";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Second";
        Index = "1";
    }

    OUT MIR-CVG-UWG-EXCL-3-CD-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "EXCL";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Third";
        Index = "1";
    }

    OUT MIR-CVG-WP-MULT-FCT-T[20]
    {
        Signed;
        Length = "3";
        Decimals = "2";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Waiver of Premium Multiplier";
        Index = "1";
    }

    OUT MIR-DV-CLI-INSRD-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Age";
    }

    OUT MIR-DV-INSRD-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Client Name";
    }

    OUT MIR-LINK-POL-ISS-IND-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Linked Policy";
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

    OUT MIR-POL-ID-BASE-T[20]
    {
        Length = "9";
        FieldGroup = "Table20";
        KeyColumn;
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    OUT MIR-POL-ID-SFX-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    OUT MIR-POL-OPTL-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "POL-OPTL-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Optional Policy";
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

    OUT MIR-UWG-AMT-REASN-CD-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "URSN";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Reason for Modifying UW Amount";
        Index = "1";
    }

    OUT MIR-UW-USER-1-ID
    {
        Length = "8";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "1st Underwriter Initials";
    }

    OUT MIR-UW-USER-2-ID
    {
        Length = "8";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "2nd Underwriter Initials";
    }

    OUT MIR-CVG-REINS-IND-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Reinsured";
        Index = "1";
    }
       
#MP29NB changes start
    OUT MIR-CVG-REINS-CO-ID-T[20]
    {
#       Length = "1";
        Length = "2";
        FieldGroup = "Table20";
#        CodeSource = "DataModel";
#        CodeType = "CVG-REINS-CO-ID";
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

#MP211B CHANGES STARTS

    OUT MIR-CVG-LIEN-DUR-T[20]
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Lien Duration";
        Index = "1";
    }
#MP211B CHANGES ENDS 
#M245B2 CHANGES START HERE     
#R11584 CHANGES START HERE     
#    INOUT MIR-POL-CRCY-CD
    INOUT MIR-POL-CRCY-CD-T[20]
#R11584 CHANGES END HERE
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
         
#R11951 CHANGES STARTS HERE
#   INOUT MIR-PREM-CRCY-CD
   INOUT MIR-PREM-CRCY-CD-T[20]
#R11951 CHANGES ENDS HERE
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#MP270F CHANGES START HERE
    OUT MIR-CLIU-POL-ID-T[20]
    {
        Length = "10";
        FieldGroup = "Table21";
        DBTableName = "TCLIU";
        SType = "Text";
        Label = "Policy Id";

    }

    OUT MIR-CLIU-AIS-UWGDECN-CD-T[20]
    {
        Length = "2";
        FieldGroup = "Table21";
        CodeSource = "DataModel";
        CodeType = "AIS-UWGDECN-CD";        
        DBTableName = "TCLIU";
        SType = "Text";
        Label = "AIS Underwriting Decision";

    }
#MP270F CHANGES ENDS HERE 
#M319O1 CHANGES STARTS HERE
INOUT MIR-PMT-CRCY-CD-T[20]
  {   
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
   } 
#M319O1 CHANGES END HERE 
#TLB015 CHANGES STARTS HERE
    OUT MIR-REINS-TYP-CD-T[20]
     {
        Length = "2";
        FieldGroup = "Table20";    
        CodeSource = "EDIT";   
        CodeType = "RETYP";    
        DBTableName = "TCVG";    
        SType = "Text";    
        Label = "Reinsurance Type";    
        Index = "1";    
    }
#TLB015 CHANGES ENDS HERE
}
