# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:37 PM EDT

#*******************************************************************************
#*  Component:   BF1252-I.s                                                    *
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
#*  TLB015  CTS      REINSURANCE TYPE                                          *
#*******************************************************************************

S-STEP BF1252-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-CLI-UWGDECN-CD";
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


    INOUT MIR-AGE-RAT-REASN-CD-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "ARST";
        SType = "Selection";
        Label = "Reason";
        Index = "1";
    }

    INOUT MIR-CLI-UWGDECN-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CLI-UWGDECN-CD";
        SType = "Selection";
        Label = "Client Decision";
    }

    INOUT MIR-CLI-UWGDECN-TYP-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "CLDEC";
        SType = "Selection";
        Label = "Decision Type";
    }

    INOUT MIR-CVG-AD-FACE-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
#R11584 CHANGES START HERE
#        CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-POL-CRCY-CD-T[]";
#R11584 CHANGES END HERE
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "ADB Amount";
        Index = "1";
    }

    INOUT MIR-CVG-AD-MULT-FCT-T[20]
    {
        Signed;
        Length = "3";
        Decimals = "2";
        FieldGroup = "Table20";
        SType = "Number";
        Label = "ADB Rating Multiplier";
        Index = "1";
    }

    INOUT MIR-CVG-COLA-SELCT-CD-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-COLA-SELCT-CD";
        SType = "Selection";
        Label = "Cost of Living Adjustment Benefit (COLA)";
        Index = "1";
    }

    INOUT MIR-CVG-ENHC-TYP-CD-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-ENHC-TYP-CD";
        SType = "Selection";
        Label = "Coverage Enhancement";
        Index = "1";
    }

    INOUT MIR-CVG-FACE-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
#R11584 CHANGES START HERE
#        CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-POL-CRCY-CD-T[]";
#R11584 CHANGES END HERE
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    INOUT MIR-CVG-FE-DUR-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Flat Extra Premium - Duration";
        Index = "1";
    }

    INOUT MIR-CVG-FE-REASN-CD-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "RFLAT";
        SType = "Selection";
        Label = "Flat Extra Premium - Reason";
        Index = "1";
    }

    INOUT MIR-CVG-FE-UPREM-AMT-T[20]
    {
#M245B2 CHANGES START HERE
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
#R11951 CHANGES START HERE      
      # CurrencyCode = "MIR-PREM-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD-T[]";
#R11951 CHANGES END HERE        
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        Signed;
        Length = "9";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Dollar Amount/Unit";
        Index = "1";
    }

    INOUT MIR-CVG-LTA-SELCT-IND-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        SType = "Indicator";
        Label = "Lifetime accident (benefit provided; result of accident)";
        Index = "1";
    }

    INOUT MIR-CVG-LTB-SELCT-IND-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        SType = "Indicator";
        Label = "Lifetime benefits (result of either accident or sickness)";
        Index = "1";
    }

    INOUT MIR-CVG-ME-DUR-T[20]
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CVG-ME-DUR";
        SType = "Selection";
        Label = "Multiple Rating Duration";
        Index = "1";
    }

    INOUT MIR-CVG-ME-FCT-T[20]
    {
        Signed;
        Length = "3";
        Decimals = "2";
        FieldGroup = "Table20";
        SType = "Number";
        Label = "Rating";
        Index = "1";
    }

    INOUT MIR-CVG-ME-RAT-CD-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "TRATE";
        SType = "Selection";
        Label = "True Table Rating";
        Index = "1";
    }

    INOUT MIR-CVG-ME-REASN-CD-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "RMULT";
        SType = "Selection";
        Label = "Multiple Rating Reason";
        Index = "1";
    }

    IN MIR-CVG-NUM-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    INOUT MIR-CVG-RT-AGE-T[20]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table20";
        SType = "Number";
        Label = "Rate Age";
        Index = "1";
    }

    INOUT MIR-CVG-SEX-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-SEX-CD";
        SType = "Selection";
        Label = "Sex";
        Index = "1";
    }

    INOUT MIR-CVG-SMKR-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "SMOKE";
        SType = "Selection";
        Label = "Smoker";
        Index = "1";
    }

    INOUT MIR-CVG-STBL-1-CD-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
#* M241A3 changes START here*
        CodeSource = "CSOM9D27";        
	FilterFields = "1";
        FilterField1 = "MIR-PLAN-ID-T"; 
#     CodeSource = "EDIT";
#     CodeType = "STB1";
#* M241A3 changes END here*
        SType = "Selection";
        Label = "Sub-table 1";
        Index = "1";
    }

    INOUT MIR-CVG-STBL-2-CD-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Selection";
        Label = "Sub-table 2";
        Index = "1";
    }

    INOUT MIR-CVG-STBL-3-CD-T[20]
    {
        Length = "5";
        FieldGroup = "Table20";
#* M241A3 changes START here*
        CodeSource = "CSOM9D28";        
	FilterFields = "1";
        FilterField1 = "MIR-PLAN-ID-T"; 
#       CodeSource = "EDIT";
# 	 CodeType = "STB3";
#* M241A3 changes END here*
        SType = "Selection";
        Label = "Sub-table 3";
        Index = "1";
    }

    INOUT MIR-CVG-STBL-4-CD-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "STB4";
        SType = "Selection";
        Label = "Sub-table 4";
        Index = "1";
    }

    INOUT MIR-CVG-UWG-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-GLOB-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Underwriting Amount";
        Index = "1";
    }

    INOUT MIR-CVG-UWGDECN-CD-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-UWGDECN-CD";
        SType = "Selection";
        Label = "Coverage Decision";
        Index = "1";
    }

    INOUT MIR-CVG-UWGDECN-SUB-CD-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "CODEC";
        SType = "Selection";
        Label = "Reason";
        Index = "1";
    }

    INOUT MIR-CVG-UWG-EXCL-1-CD-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "EXCL";
        SType = "Selection";
        Label = "First";
        Index = "1";
    }

    INOUT MIR-CVG-UWG-EXCL-2-CD-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "EXCL";
        SType = "Selection";
        Label = "Second";
        Index = "1";
    }

    INOUT MIR-CVG-UWG-EXCL-3-CD-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "EXCL";
        SType = "Selection";
        Label = "Third";
        Index = "1";
    }

    INOUT MIR-CVG-WP-MULT-FCT-T[20]
    {
        Signed;
        Length = "3";
        Decimals = "2";
        FieldGroup = "Table20";
        SType = "Number";
        Label = "Waiver of Premium Multiplier";
        Index = "1";
    }

    INOUT MIR-OWN-OCCP-SELCT-IND-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        SType = "Indicator";
        Label = "Own occupation benefit";
        Index = "1";
    }

    INOUT MIR-PDISAB-SELCT-IND-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        SType = "Indicator";
        Label = "Partial disability benefit";
        Index = "1";
    }

    INOUT MIR-PLAN-ID-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Selection";
        Label = "Type of Plan";
        Index = "1";
    }

    IN MIR-POL-ID-BASE-T[20]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table20";
        KeyColumn;
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    IN MIR-POL-ID-SFX-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    INOUT MIR-REDC-EP-SELCT-IND-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        SType = "Indicator";
        Label = "Reduced elimination period for hospitalization Confinement (EP/HOSP)";
        Index = "1";
    }

    INOUT MIR-UWG-AMT-REASN-CD-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "URSN";
        SType = "Selection";
        Label = "Reason for Modifying UW Amount";
        Index = "1";
    }

    IN MIR-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-LINK-POL-ISS-IND-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        SType = "Indicator";
        Label = "Linked Policy";
        Index = "1";
    }

    IN MIR-POL-OPTL-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "POL-OPTL-CD";
        SType = "Text";
        Label = "Optional Policy";
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

    IN MIR-CVG-LIVES-INSRD-CD-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Number of Lives Insured";
        Index = "1";
    }

    IN MIR-CVG-PREV-FACE-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
#R11584 CHANGES START HERE
#        CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-POL-CRCY-CD-T[]";
#R11584 CHANGES END HERE
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Last Face Amount";
        Index = "1";
    }

    IN MIR-CVG-SPND-CSTAT-CD-T[20]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Text";
        Label = "Suspended Coverage Status";
        Index = "1";
    }

    IN MIR-CVG-SUPP-BNFT-CD-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-SUPP-BNFT-CD";
        SType = "Text";
        Label = "Supplementary Benefit";
        Index = "1";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Client Name";
    }

    IN MIR-UW-USER-1-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "1st Underwriter Initials";
    }

    IN MIR-UW-USER-2-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "2nd Underwriter Initials";
    }

    IN MIR-DV-CLI-INSRD-AGE
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Client Age";
    }

    IN MIR-CLI-SEX-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Client Sex";
    }

    IN MIR-CLI-SMKR-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SMKR-CD";
        SType = "Text";
        Label = "Smoker/Non-Smoker Code";
    }

    INOUT MIR-CVG-REINS-IND-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Reinsured";
        Index = "1";
    }

#MP29NB changes start  
    INOUT MIR-CVG-REINS-CO-ID-T[20]
    {
       Length = "1";
#        Length = "2";
        FieldGroup = "Table20";
#        CodeSource = "DataModel";
#        CodeType = "CVG-REINS-CO-ID";
        CodeSource = "EDIT";
        CodeType = "REINS";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Reinsurance Company";
        Index = "1";
    }
    
    INOUT MIR-CVG-REINS-TRTY-NUM-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "TRTNM";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Treaty Number";
        Index = "1";
    }
    
    INOUT MIR-CVG-REINS-CED-PCT-T[20]
     {
        Length = "1";    
        FieldGroup = "Table20";    
        CodeSource = "EDIT";   
        CodeType = "CDPCT";    
        DBTableName = "TCVG";    
        SType = "Selection";    
        Label = "Ceding Percentage";
        Index = "1";    
    }

    INOUT MIR-CVG-REINS-CED-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
#R11951 CHANGES START HERE
      # CurrencyCode = "MIR-PREM-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD-T[]";
#R11951 CHANGES END HERE        
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
#MP211B changes starts
    INOUT MIR-CVG-LIEN-DUR-T[20]
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        SType = "Selection";
        Label = "Lien Duration";
        Index = "1";
    }
#MP211B changes ends
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
#M245B2 CHANGES START HERE 
    INOUT MIR-GLOB-CRCY-CD
     {   
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
                
    } 
#M245B2 CHANGES END HERE 

#MP245J CHANGES STARTS HERE

    INOUT MIR-SSTD-AGE-ADD-DUR-T[20]
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
         
#R11951 CHANGES START HERE    
#   INOUT MIR-PREM-CRCY-CD
    INOUT MIR-PREM-CRCY-CD-T[20]
#R11951 CHANGES END HERE    
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 
#MP270F CHANGES START HERE
    IN MIR-CLIU-POL-ID-T[20]
    {    
        Length = "10";
        FieldGroup = "Table21";
        DBTableName = "TCLIU";
        SType = "Text";
        Label = "Policy Id";

    }

    IN MIR-CLIU-AIS-UWGDECN-CD-T[20]
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
#TLB015 CHANGES STARTS HERE
    INOUT MIR-REINS-TYP-CD-T[20]
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
}

