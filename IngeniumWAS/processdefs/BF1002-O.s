# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:33 PM EDT

#*******************************************************************************
#*  Component:   BF1002-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  MP245J  CTS      ADD NEW FIELD FOR SUBSTANDARD AGE DURATION AS PART OF SPWL*
#*  Q51537  CTS      CHANGES FOR CURRENCY HANDLING TO HANDLE DIFFERENT PRODUCTS*
#*  Q61577   CTS     FIX FOR CURRENCY CODE OF MODE PREMIUM                     *
#*  UYS133  CTS      Addition of PD group size field                           *
#*******************************************************************************

S-STEP BF1002-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Insdtl";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-CLI-ID";
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

    INOUT MIR-CLI-ID
    {
        Key;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-AGT-ID-T[6]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Commissionable Agent Number";
        Index = "1";
    }

    IN MIR-CLI-ID-T[6]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    IN MIR-CSN-AD-FACE-AMT-T[6]
    {
#M245B2 CHANGES START HERE        
#Q51537 CHANGES STARTS HERE
#        CurrencyCode = "MIR-POL-CRCY-CD";  
        CurrencyCode = "MIR-POL-CRCY-CD-T[6]";  
#Q51537 CHANGES STOPS HERE
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Accidental Death (AD) Face Amount";
        Index = "1";
    }

    IN MIR-CVG-AD-FACE-AMT-T[6]
    {
#M245B2 CHANGES START HERE        
#Q51537 CHANGES STARTS HERE
#        CurrencyCode = "MIR-POL-CRCY-CD";  
        CurrencyCode = "MIR-POL-CRCY-CD-T[6]";  
#Q51537 CHANGES STOPS HERE
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "ADB Amount";
        Index = "1";
    }

    IN MIR-CVG-AD-MULT-FCT-T[6]
    {
        DisplayOnly;
        Signed;
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table6";
        SType = "Number";
        Label = "ADB Rating Multiplier";
        Index = "1";
    }

    IN MIR-CVG-CSTAT-CD-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    IN MIR-CVG-FACE-AMT-T[6]
    {
#M245B2 CHANGES START HERE        
#Q51537 CHANGES STARTS HERE
#        CurrencyCode = "MIR-POL-CRCY-CD";  
        CurrencyCode = "MIR-POL-CRCY-CD-T[6]";  
#Q51537 CHANGES STOPS HERE
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    IN MIR-CVG-FE-PREM-AMT-T[6]
    {
#M245B2 CHANGES START HERE        
#Q51537 CHANGES STARTS HERE
#        CurrencyCode = "MIR-POL-CRCY-CD";  
        CurrencyCode = "MIR-POL-CRCY-CD-T[6]";  
#Q51537 CHANGES STOPS HERE
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Flat Extra Premium";
        Index = "1";
    }

    IN MIR-CVG-FE-REASN-CD-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "RFLAT";
        SType = "Text";
        Label = "Flat Extra Premium - Reason";
        Index = "1";
    }

    IN MIR-CVG-ISS-EFF-DT-T[6]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table6";
        SType = "Date";
        Label = "Issue Date";
        Index = "1";
    }

    IN MIR-CVG-LIVES-INSRD-CD-T[6]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Number of Lives Insured";
        Index = "1";
    }

    IN MIR-CVG-ME-FCT-T[6]
    {
        DisplayOnly;
        Signed;
        Length = "6";
        Decimals = "2";
        FieldGroup = "Table6";
        SType = "Number";
        Label = "Rating";
        Index = "1";
    }

    IN MIR-CVG-ME-RAT-CD-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "TRATE";
        SType = "Text";
        Label = "True Table Rating";
        Index = "1";
    }

#MP245J CHANGES STARTS HERE

    IN MIR-SSTD-AGE-ADD-DUR-T[6]
    {
        DisplayOnly;
        FieldGroup = "Table6";
        Length = "2";
        Decimals = "0";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Substandard Age Duration";
    }

#MP245J CHANGES ENDS HERE

    IN MIR-CVG-ME-REASN-CD-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "RMULT";
        SType = "Text";
        Label = "Multiple Rating Reason";
        Index = "1";
    }

    IN MIR-CVG-MPREM-AMT-T[6]
    {
#M245B2 CHANGES START HERE        
#Q51537 CHANGES STARTS HERE
#        CurrencyCode = "MIR-POL-CRCY-CD";  
#Q61577 CHANGES STARTS HERE
#        CurrencyCode = "MIR-POL-CRCY-CD-T[6]";  
        CurrencyCode = "MIR-PREM-CRCY-CD-T[6]";  
#Q61577 CHANGES STARTS HERE
#Q51537 CHANGES STOPS HERE
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Mode Premium";
        Index = "1";
    }

    IN MIR-CVG-NUM-T[6]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-CVG-RT-AGE-T[6]
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table6";
        SType = "Number";
        Label = "Rate Age";
        Index = "1";
    }

    IN MIR-CVG-SPND-CSTAT-CD-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Text";
        Label = "Suspended Coverage Status";
        Index = "1";
    }

    IN MIR-CVG-SUM-INS-AMT-T[6]
    {
#M245B2 CHANGES START HERE        
#Q51537 CHANGES STARTS HERE
#        CurrencyCode = "MIR-POL-CRCY-CD";  
        CurrencyCode = "MIR-POL-CRCY-CD-T[6]";  
#Q51537 CHANGES STOPS HERE
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Sum Insured Amount";
        Index = "1";
    }

    IN MIR-CVG-WP-MULT-FCT-T[6]
    {
        DisplayOnly;
        Signed;
        Length = "6";
        Decimals = "2";
        FieldGroup = "Table6";
        SType = "Number";
        Label = "Waiver of Premium Multiplier";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }

    IN MIR-DV-REINS-TOT-AMT-T[6]
    {
#M245B2 CHANGES START HERE        
#Q51537 CHANGES STARTS HERE
#        CurrencyCode = "MIR-POL-CRCY-CD";  
        CurrencyCode = "MIR-POL-CRCY-CD-T[6]";  
#Q51537 CHANGES STOPS HERE
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Total Reinsurance Amount";
        Index = "1";
    }

    IN MIR-PLAN-ID-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Type of Plan";
        Index = "1";
    }

    IN MIR-POL-BILL-MODE-CD-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Premium Mode";
        Index = "1";
    }

    IN MIR-POL-BILL-TYP-CD-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Text";
        Label = "Billing Type";
        Index = "1";
    }

    IN MIR-POL-ID-BASE-T[6]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    IN MIR-POL-ID-SFX-T[6]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    IN MIR-POL-PD-TO-DT-NUM-T[6]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Paid to Date";
        Index = "1";
    }

    IN MIR-SBSDRY-CO-ID-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

#M245B2 CHANGES START HERE
#Q51537 CHANGES STARTS HERE
#     INOUT MIR-POL-CRCY-CD
     INOUT MIR-POL-CRCY-CD-T[6]
#Q51537 CHANGES STOPS HERE
     {
         
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
     }
#M245B2 CHANGES END HERE       
#Q61577 CHANGES STARTS HERE
     INOUT MIR-PREM-CRCY-CD-T[6]
     {
         
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
     }
#Q61577 CHANGES END HERE 
#UYS133 CHANGES START
    IN MIR-PD-GR-TYP-CD-T[6]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        SType = "Text";
        Label = "PD group size";
        Index = "1";
    }
#UYS133 CHANGES END
}

