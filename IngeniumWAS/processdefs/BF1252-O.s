# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:37 PM EDT

#*******************************************************************************
#*  Component:   BF1252-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  P00859  FB       Add MIR-CVG-REINS-IND and MIR-CVG-REINS-CO-ID             *
#*  MP8SPM  SC       Special Premium                                           *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *                                                                     *
#*  MP245J  CTS      ADD NEW FIELD FOR SUBSTANDARD AGE DURATION AS PART OF SPWL*
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  R11584  CTS      CHANGES DONE FOR CURRENCY CODE DISPLAY IN AMOUNT FIELDS   *
#*  R11951  CTS      CHANGES DONE TO FIX PATHFINDER ERROR LOGS                 *
#*  MP270F  CTS      AIS UNDERWRITING DECISION CHANGES IN UNDERWRITING SCREENS *
#*******************************************************************************

S-STEP BF1252-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
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

    IN MIR-AGE-RAT-REASN-CD-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "ARST";
        SType = "Text";
        Label = "Reason";
        Index = "1";
    }

    IN MIR-CLI-UWGDECN-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CLI-UWGDECN-CD";
        SType = "Text";
        Label = "Client Decision";
    }

    IN MIR-CLI-UWGDECN-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "CLDEC";
        SType = "Text";
        Label = "Decision Type";
    }

    IN MIR-CVG-AD-FACE-AMT-T[20]
    {
#R11951 CHANGES START HERE
        CurrencyCode = "MIR-POL-CRCY-CD-T[]";
#R11951 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "ADB Amount";
        Index = "1";
    }

    IN MIR-CVG-AD-MULT-FCT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "3";
        Decimals = "2";
        FieldGroup = "Table20";
        SType = "Number";
        Label = "ADB Rating Multiplier";
        Index = "1";
    }

    IN MIR-CVG-COLA-SELCT-CD-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-COLA-SELCT-CD";
        SType = "Text";
        Label = "Cost of Living Adjustment Benefit (COLA)";
        Index = "1";
    }

    IN MIR-CVG-ENHC-TYP-CD-T[20]
    {
        DisplayOnly;
        Length = "1";
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
#R11584 CHANGES START HERE
#        CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-POL-CRCY-CD-T[]";
#R11584 CHANGES END HERE
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    IN MIR-CVG-FE-DUR-T[20]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Flat Extra Premium - Duration";
        Index = "1";
    }

    IN MIR-CVG-FE-REASN-CD-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "RFLAT";
        SType = "Text";
        Label = "Flat Extra Premium - Reason";
        Index = "1";
    }

    IN MIR-CVG-FE-UPREM-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
#R11584 CHANGES START HERE
#        CurrencyCode = "MIR-POL-CRCY-CD";
#R11951 CHANGES START HERE
#       CurrencyCode = "MIR-POL-CRCY-CD-T[]";
        CurrencyCode = "MIR-PREM-CRCY-CD-T[]";
#R11951 CHANGES END HERE        
#R11584 CHANGES END HERE
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "9";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Dollar Amount/Unit";
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

    IN MIR-CVG-ME-DUR-T[20]
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CVG-ME-DUR";
        SType = "Text";
        Label = "Multiple Rating Duration";
        Index = "1";
    }

    IN MIR-CVG-ME-FCT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "3";
        Decimals = "2";
        FieldGroup = "Table20";
        SType = "Number";
        Label = "Rating";
        Index = "1";
    }

    IN MIR-CVG-ME-RAT-CD-T[20]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "TRATE";
        SType = "Text";
        Label = "True Table Rating";
        Index = "1";
    }

    IN MIR-CVG-ME-REASN-CD-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "RMULT";
        SType = "Text";
        Label = "Multiple Rating Reason";
        Index = "1";
    }

    IN MIR-CVG-NUM-T[20]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Coverage Number";
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
        Length = "2";
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
        Length = "3";
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
        SType = "Text";
        Label = "Sub-table 3";
        Index = "1";
    }

    IN MIR-CVG-STBL-4-CD-T[20]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "STB4";
        SType = "Text";
        Label = "Sub-table 4";
        Index = "1";
    }

    IN MIR-CVG-UWG-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-GLOB-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Underwriting Amount";
        Index = "1";
    }

    IN MIR-CVG-UWGDECN-CD-T[20]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-UWGDECN-CD";
        SType = "Text";
        Label = "Coverage Decision";
        Index = "1";
    }

    IN MIR-CVG-UWGDECN-SUB-CD-T[20]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "CODEC";
        SType = "Text";
        Label = "Reason";
        Index = "1";
    }

    IN MIR-CVG-UWG-EXCL-1-CD-T[20]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "EXCL";
        SType = "Text";
        Label = "First";
        Index = "1";
    }

    IN MIR-CVG-UWG-EXCL-2-CD-T[20]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "EXCL";
        SType = "Text";
        Label = "Second";
        Index = "1";
    }

    IN MIR-CVG-UWG-EXCL-3-CD-T[20]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "EXCL";
        SType = "Text";
        Label = "Third";
        Index = "1";
    }

    IN MIR-CVG-WP-MULT-FCT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "3";
        Decimals = "2";
        FieldGroup = "Table20";
        SType = "Number";
        Label = "Waiver of Premium Multiplier";
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

    IN MIR-REDC-EP-SELCT-IND-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        SType = "Indicator";
        Label = "Reduced elimination period for hospitalization Confinement (EP/HOSP)";
        Index = "1";
    }

    IN MIR-UWG-AMT-REASN-CD-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "URSN";
        SType = "Text";
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
        CurrencyCode = "MIR-GLOB-CRCY-CD";
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

    IN MIR-DV-CLI-INSRD-AGE
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Client Age";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Client Name";
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
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-REINS-CO-ID";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Reinsurance Company";
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
#M245B2 CHANGES START HERE 
#R11584 CHANGES START HERE
#    IN MIR-POL-CRCY-CD
    IN MIR-POL-CRCY-CD-T[20]
#R11584 CHANGES END HERE
       {   
            Length = "2";
            SType = "Hidden";
            Label = "Currency";
   } 
#R11951 CHANGES START HERE         
    IN MIR-PREM-CRCY-CD-T[20]  
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    } 
#R11951 CHANGES END HERE      
      IN MIR-GLOB-CRCY-CD
        {
     
          Length = "2";
          SType = "Hidden";
          Label = "Currency";
        }   
#M245B2 CHANGES END HERE 
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
}

