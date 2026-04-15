# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF9F52-O.s                                                    *
#*  Description: For Updating a Underwrite's Final Decision                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP310A   CTS      INITIAL VERSION - NB IMPROVEMENTS                        *
#*  TV2003   CTS      SULV2 NEW BUSINESS CHANGES                               *
#*  TLB015   CTS      REINSURANCE TYPE                                         *
#*  TLB003  CTS      CHANGES FOR NEW BUSINESS                                 *
#*  TL1010   CTS      ADDED BULKBUNDLEAPP FIELD                                *

#*  S23056  CTS      BUG FIX FOR REPRINT POPULATION AS PART OF UYS003          *
#*  CD200B  CTS      CERBERUS NEW BUSINESS XML UPLOAD DAY 2.0 CHANGES          *
#*  NVCN01  CTS      CHANGES DONE AS PART OF ONTARIO XML UPLOAD                *
#*******************************************************************************

S-STEP BF9F52-O
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

    INOUT MIR-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client Id";
    }
    INOUT MIR-POL-ID
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
    }
    IN MIR-CLI-KANA-FULL-NM
    {
        DisplayOnly;
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name(Kana)";
    }
    IN MIR-POL-APP-UPLD-DT-T [10]
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Upload Date";
    }
    IN MIR-PDTL-POL-ID-T [10]
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
    }
    IN MIR-PDTL-PLAN-ID-T [10]
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Product Application Type";
    }
    IN MIR-PDTL-POL-CSTAT-CD-T[10]
    {
        DisplayOnly;
        Length = "40";
        DBTableName = "TPOL";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
    }
    IN MIR-PDTL-POL-MPREM-AMT-T [10]
    {
        CurrencyCode = "MIR-POL-CRCY-CD-1-T[]";    
        DisplayOnly;
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Modal Premium";
        Index = "1";
    }
    IN MIR-PDTL-POL-SNDRY-AMT-T [10]
    {
        CurrencyCode = "MIR-POL-CRCY-CD-1-T[]";
        DisplayOnly;
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Sundry Amount";
        Index = "1";
    }
    # TLB003 CHANGES START HERE
    IN MIR-ASSIGN-BUNDLE-APP-IND-T [10]
    {
        DisplayOnly;     
        Length = "1";
        SType = "Indicator";
        Label = "Bundle Application Indicator";
        Index = "1";  
    }
    # TLB003 CHANGES ENDS HERE      

    IN MIR-CVG-POL-ID-T[55]
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";       
    }
    IN MIR-CVG-NUM-T[55]
    {
        DisplayOnly;
        Length = "02";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }
    IN MIR-CVG-PLAN-ID-T[55]
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Rider Name";
        Index = "1";
    }
    IN MIR-PLAN-ID-T[55]
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Rider Name";
        Index = "1";
    }
    IN MIR-CVG-FACE-AMT-T[55]
    {
        CurrencyCode = "MIR-POL-CRCY-CD-2-T[]";
        DisplayOnly;
        Signed;
        Length = "16";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }
    IN MIR-CVG-STBL-1-CD-T [55]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "CSOM9D29";        
        FilterFields = "2";
        FilterField1 = "MIR-PLAN-ID-T"; 
     	FilterField2 = "MIR-CVG-STBL-1-CD-T";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub-table1";
        Index = "1";
    }
    IN MIR-CVG-STBL-3-CD-T [55]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "CSOM9D30";        
        FilterFields = "2";
        FilterField1 = "MIR-PLAN-ID-T"; 
     	FilterField2 = "MIR-CVG-STBL-3-CD-T";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub-table3";
        Index = "1";
    }    
    IN MIR-CVG-WP-IND-T [55]
    {
        DisplayOnly;
        Length = "1";
        DBTableName = "TCVG";    
        SType = "Indicator";
        Label = "3DD";
        Index = "1";
    }
#NVCN01 START
    IN MIR-CVG-WP-TYP-CD-T[55]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-WP-TYP-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "WoP Type";
        Index = "1";
    }
#NVCN01 ENDS
    IN MIR-CVG-RT-AGE-T[55]
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Age";
        Index = "1";
    }
    IN MIR-CVG-CSTAT-CD-T[55]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }
    IN MIR-CVG-UWGDECN-CD-T[55]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-UWGDECN-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Decision";
        Index = "1";
    }
    IN MIR-SLCTN-POL-ID-T [10]
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
    }
    IN MIR-STCKR-ID-T [10]
    {
        DisplayOnly;
        Length = "11";
        DBTableName = "TCLIU";
        SType = "Text";
        Label = "Sticker Number";
    }
    IN MIR-UW-TYP-CD-T [10]
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UW-TYP-CD";
        DBTableName = "TCLIU";
        SType = "Text";
        Label = "Selection Method";
    }
    IN MIR-UW-UPLD-IND-T [10]
    {
        DisplayOnly;
        Length = "1";
        DBTableName = "TCLIU";
        SType = "Indicator";
        Label = "Underwriting Upload Indicator";
    }
    IN MIR-UW-UPLD-DT-T [10]
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TCLIU";
        SType = "Date";
        Label = "Underwriting Upload Date";
    }
    # TL1010 CHANGES STARTS HERE
    IN MIR-BULK-BUNDLE-APP-T [10]
    {
        DisplayOnly;
        Length = "18";
        SType = "Text";
        Label = "BulkBundleApp";
        Index = "1";
    }
    # TL1010 CHANGES ENDS HERE
    IN MIR-MED-MIN-BLOOD-RT
    {
        DisplayOnly;
        Length = "03";
        DBTableName = "TAPPV";
        SType = "Text";
        Label = "Minimum BP";
    }
    IN MIR-MED-MAX-BLOOD-RT
    {
        DisplayOnly;
        Length = "03";
        DBTableName = "TAPPV";
        SType = "Text";
        Label = "Maximum BP";
    }
    IN MIR-PDTL-POL-OWNER-T [10]
    {
        DisplayOnly;
        Length = "75";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client Name";
    }
    IN MIR-CVG-REINS-IND-T[55]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Reinsured";
        Index = "1";
    }
    IN MIR-CVG-REINS-CO-ID-T[55]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "REINS";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Reinsurance Company";
        Index = "1";
    }
    IN MIR-CVG-REINS-TRTY-NUM-T[55]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "TRTNM";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Treaty Number";
        Index = "1";
    }
    IN MIR-CVG-REINS-CED-PCT-T[55]
    {
        DisplayOnly;
        Length = "3";    
        FieldGroup = "Table20";    
        CodeSource = "EDIT";    
        CodeType = "CDPCT";    
        DBTableName = "TCVG";    
        SType = "Text";    
        Label = "Ceding Percentage";
        Index = "1";    
    }
    IN MIR-CVG-REINS-ME-FCT-T[55]
    {
        Signed;
        Length = "4";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "MR";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Mortality Ratio";
        Index = "1";
    }
    IN MIR-CVG-REINS-LIEN-T[55]
    {
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Lien";
        Index = "1";   
    }
    IN MIR-DTH-PREV-DIS-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Previous Disease";
    }
    IN MIR-DTH-CRNT-DIS-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Current Disease";
    }
    IN MIR-DTH-BLD-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Build";
    }
    IN MIR-DTH-PULSE-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Pulse";
    }
    IN MIR-DTH-BD-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - BP";
    }
    IN MIR-DTH-URINE-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Urine";
    }
    IN MIR-DTH-BLOOD-SUGAR-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Sugar";
    }
    IN MIR-DTH-LIVER-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Liver";
    }
    IN MIR-DTH-LIPID-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Lipid";
    }
    IN MIR-DTH-ANEM-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Anemia";
    }
    IN MIR-DTH-ECG-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - ECG";
    }
    IN MIR-DTH-OTHR-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Other";
    }
    IN MIR-DTH-CORR-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Correction";
    }
    IN MIR-DTH-TOT-AMT
    {
        Length = "05";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Total";
    }
    IN MIR-DTH-MR-CD
    {
        Length = "04";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - MR";
    }
#TV2003    IN MIR-DTH-TOT-TVI-AMT
#TV2003    {
#TV2003        Length = "05";
#TV2003        DBTableName = "TUWFD";
#TV2003        SType = "Text";
#TV2003        Label = "Death - Total(TVI)";
#TV2003    }
#TV2003    IN MIR-DTH-MR-TVI-CD
#TV2003    {
#TV2003        Length = "04";
#TV2003        DBTableName = "TUWFD";
#TV2003        SType = "Text";
#TV2003        Label = "Death - MR(TVI)";
#TV2003    }
#TV2003    IN MIR-DTH-MR-DUR
#TV2003    {
#TV2003        Length = "03";
#TV2003        DBTableName = "TUWFD";
#TV2003        SType = "Text";
#TV2003        Label = "Death - MR Duration(TVI)";
#TV2003    }
    IN MIR-DTH-AGE-DUR
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Age Add Duration";
    }
#CD200B CHANGES START HERE 	
    IN MIR-DTH-AGE-DUR-3CI
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Age Add Duration(3CI)";
    }
#CD200B CHANGES ENDS HERE     
  
    IN MIR-DTH-PREV-DIS-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Death - Previous";
    }
  
    IN MIR-DTH-BLD-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Death - Build";
    }
  
    IN MIR-DTH-CRNT-DIS-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Death - Current";
    }
  
    IN MIR-DTH-PULSE-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Death - PULSE";
    }
  
    IN MIR-DTH-BD-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Death - BD";
    }
  
    IN MIR-DTH-URINE-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Death - URINE";
    }
  
    IN MIR-DTH-BLOOD-SUGAR-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Death - BLOOD SUGAR";
    }
  
    IN MIR-DTH-LIVER-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Death - LIVER";
    }
  
    IN MIR-DTH-LIPID-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Death - LIPID";
    }
  
    IN MIR-DTH-ANEM-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Death - ANEM";
    }
  
    IN MIR-DTH-ECG-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Death - ECG";
    }
    IN MIR-DTH-OTHR-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "DTH- OTHR";
    }
    IN MIR-DTH-CORR-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "DTH- Correction";
    }
    IN MIR-DTH-MR-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "DTH- MR";
    }
    IN MIR-DTH-TOT-AMT-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "DTH- TOT-AMT";
    }
    IN MIR-DTH-MR-TVI-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "DTH- MR(TVI)";
    }
    IN MIR-DTH-TOT-TVI-AMT-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "DTH- TOT-AMT(TVI)";
    }
    IN MIR-DTH-MR-DUR-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "DTH- MR DUR(TVI)";
    }
    IN MIR-DTH-AGE-DUR-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "DTH- Age Add Duration";
    }
    IN MIR-CON-PREV-DIS-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "S - Previous";
    }
    IN MIR-CON-CRNT-DIS-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "S - Current";
    }
    IN MIR-CON-BLD-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "S - Build";
    }
    IN MIR-CON-PULSE-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "S - Pulse";
    }
    IN MIR-CON-BD-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "S - BD";
    }
    IN MIR-CON-URINE-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "S - Urine";
    }
    IN MIR-CON-BLOOD-SUGAR-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "S - Sugar";
    }
    IN MIR-CON-LIVER-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "S - Liver";
    }
    IN MIR-CON-LIPID-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "S - Lipid";
    }
    IN MIR-CON-ANEM-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "S - Anemia";
    }
    IN MIR-CON-ECG-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "S - ECG";
    }
    IN MIR-CON-OTHR-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "S - Other";
    }
    IN MIR-CON-CORR-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "S - Correction";
    }
    IN MIR-CON-TOT-AMT
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "S - Total";
    }
    IN MIR-CON-MR-CD
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "S - MR";
    }
#TV2003    IN MIR-CON-TOT-TVI-AMT
#TV2003    {
#TV2003        Length = "03";
#TV2003        DBTableName = "TUWFD";
#TV2003        SType = "Text";
#TV2003        Label = "S - Total(TVI)";
#TV2003    }
#TV2003    IN MIR-CON-MR-TVI-CD
#TV2003    {
#TV2003        Length = "04";
#TV2003        DBTableName = "TUWFD";
#TV2003        SType = "Text";
#TV2003        Label = "S - MR(TVI)";
#TV2003    }
#TV2003    IN MIR-CON-MR-DUR
#TV2003    {
#TV2003        Length = "01";
#TV2003        DBTableName = "TUWFD";
#TV2003        SType = "Text";
#TV2003        Label = "S - MR Duration(TVI)";
#TV2003    }
    IN MIR-CON-AGE-DUR
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "S - Age Add Duration";
    }
#CD200B CHANGES START HERE
	IN MIR-CON-AGE-DUR-3CI
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "S - Age Add Duration(3CI)";
    }
#CD200B CHANGES ENDS HERE
    IN MIR-CON-PREV-DIS-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "S- Previous";
    }

    IN MIR-CON-BLD-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "S- Build";
    }
  
    IN MIR-CON-CRNT-DIS-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "S- Current";
    }
  
    IN MIR-CON-PULSE-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "S- PULSE";
    }
  
    IN MIR-CON-BD-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "S- BD";
    }

    IN MIR-CON-URINE-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "S- URINE";
    }

    IN MIR-CON-BLOOD-SUGAR-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "S- BLOOD SUGAR";
    }

    IN MIR-CON-LIVER-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "S- LIVER";
    }

    IN MIR-CON-LIPID-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "S- LIPID";
    }
  
    IN MIR-CON-ANEM-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "S- ANEM";
    }
  
    IN MIR-CON-ECG-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "S- ECG";
    }
    
    IN MIR-CON-OTHR-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "CON- OTHR";
    }
    IN MIR-CON-CORR-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "CON- Correction";
    }
    IN MIR-CON-MR-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "CON- MR";
    }
    IN MIR-CON-TOT-AMT-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "CON- TOT-AMT";
    }
    IN MIR-CON-MR-TVI-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "CON- MR(TVI)";
    }
    IN MIR-CON-TOT-TVI-AMT-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "CON- TOT-AMT(TVI)";
    }
    IN MIR-CON-MR-DUR-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "CON- MR DUR(TVI)";
    }
    IN MIR-CON-AGE-DUR-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "CON- Age Add Duration";
    }
    IN MIR-MEDIC-PREV-DIS-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Previous";
    }
    IN MIR-MEDIC-CRNT-DIS-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Current";
    }
    IN MIR-MEDIC-BLD-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Build";
    }
    IN MIR-MEDIC-PULSE-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Pulse";
    }
    IN MIR-MEDIC-BD-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - BD";
    }
    IN MIR-MEDIC-URINE-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Urine";
    }
    IN MIR-MEDIC-BLOOD-SUGAR-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Sugar";
    }
    IN MIR-MEDIC-LIVER-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Liver";
    }
    IN MIR-MEDIC-LIPID-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Lipid";
    }
    IN MIR-MEDIC-ANEM-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Anemia";
    }
    IN MIR-MEDIC-ECG-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - ECG";
    }
    IN MIR-MEDIC-OTHR-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Other";
    }
    IN MIR-MEDIC-CORR-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Correction";
    }
    IN MIR-MEDIC-TOT-AMT
    {
        Length = "05";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Total";
    }
    IN MIR-MEDIC-MR-CD
    {
        Length = "04";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - MR";
    }
#TV2003    IN MIR-MEDIC-TOT-TVI-AMT
#TV2003    {
#TV2003        Length = "05";
#TV2003        DBTableName = "TUWFD";
#TV2003        SType = "Text";
#TV2003        Label = "Hospital - Total(TVI)";
#TV2003    }
#TV2003    IN MIR-MEDIC-MR-TVI-CD
#TV2003    {
#TV2003        Length = "04";
#TV2003        DBTableName = "TUWFD";
#TV2003        SType = "Text";
#TV2003        Label = "Hospital - MR(TVI)";
#TV2003    }
#TV2003    IN MIR-MEDIC-MR-DUR
#TV2003    {
#TV2003        Length = "03";
#TV2003        DBTableName = "TUWFD";
#TV2003        SType = "Text";
#TV2003        Label = "Hospital - MR Duration(TVI)";
#TV2003    }
    IN MIR-MEDIC-AGE-DUR
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Age Add Duration";
    }
#CD200B CHANGES START HERE
    IN MIR-MEDIC-AGE-DUR-3CI
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Age Add Duration(3CI)";
    }
#CD200B CHANGES ENDS HERE	
    IN MIR-MEDIC-PREV-DIS-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "MEDIC - Previous";
    }
  
    IN MIR-MEDIC-BLD-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "MEDIC - Build";
    }
  
    IN MIR-MEDIC-CRNT-DIS-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "MEDIC - Current";
    }
 
    IN MIR-MEDIC-PULSE-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "MEDIC - PULSE";
    }
  
    IN MIR-MEDIC-BD-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "MEDIC - BD";
    }
  
    IN MIR-MEDIC-URINE-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "MEDIC - URINE";
    }

    IN MIR-MEDIC-BLOOD-SUGAR-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "MEDIC - BLOOD SUGAR";
    }
  
    IN MIR-MEDIC-LIVER-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "MEDIC - LIVER";
    }
  
      IN MIR-MEDIC-LIPID-CHNG-IND
      {
            Length = "01";
            DBTableName = "Derived";
            SType = "Indicator";
            Label = "MEDIC - LIPID";
      }
  
      IN MIR-MEDIC-ANEM-CHNG-IND
      {
            Length = "01";
            DBTableName = "Derived";
            SType = "Indicator";
            Label = "MEDIC - ANEM";
      }
  
      IN MIR-MEDIC-ECG-CHNG-IND
      {
            Length = "01";
            DBTableName = "Derived";
            SType = "Indicator";
            Label = "MEDIC - ECG";
      }
    IN MIR-MEDIC-OTHR-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "MEDIC- OTHR";
    }
    IN MIR-MEDIC-CORR-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "MEDIC- Correction";
    }
    IN MIR-MEDIC-MR-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "MEDIC- MR";
    }
    IN MIR-MEDIC-TOT-AMT-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "MEDIC-TOT-AMT";
    }
    IN MIR-MEDIC-MR-TVI-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "MEDIC- MR(TVI)";
    }
    IN MIR-MEDIC-TOT-TVI-AMT-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "MEDIC- TOT-AMT(TVI)";
    }
    IN MIR-MEDIC-MR-DUR-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "MEDIC- MR DUR(TVI)";
    }
    IN MIR-MEDIC-AGE-DUR-CHNG-IND
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "MEDIC- Age Add Duration";
    }
  
      IN MIR-EXCL-FLD1
      {
            Length = "16";
            DBTableName = "TUWFD";
            SType = "Text";
            Label = "Exclusion - field1";
      }
      IN MIR-EXCL-FLD2
      {
            Length = "16";
            DBTableName = "TUWFD";
            SType = "Text";
            Label = "Exclusion - field2";
      }
      IN MIR-EXCL-FLD3
      {
            Length = "16";
            DBTableName = "TUWFD";
            SType = "Text";
            Label = "Exclusion - field3";
      }
      IN MIR-EXCL-FLD4
      {
            Length = "16";
            DBTableName = "TUWFD";
            SType = "Text";
            Label = "Exclusion - field4";
      }
      IN MIR-EXCL-FLD5
      {
            Length = "16";
            DBTableName = "TUWFD";
            SType = "Text";
            Label = "Exclusion - field5";
      }
      IN MIR-EXCL-FLD6
      {
            Length = "16";
            DBTableName = "TUWFD";
            SType = "Text";
            Label = "Exclusion - field6";
      }
      IN MIR-EXCL-FLD7
      {
            Length = "32";
            DBTableName = "TUWFD";
            SType = "Text";
            Label = "Exclusion - field7";
      }
      IN MIR-EXCL-FLD8
      {
            Length = "32";
            DBTableName = "TUWFD";
            SType = "Text";
            Label = "Exclusion - field8";
      }
      IN MIR-EXCL-FLD9
      {
            Length = "32";
            DBTableName = "TUWFD";
            SType = "Text";
            Label = "Exclusion - field9";
      }
      IN MIR-EXCL-FLD10
      {
            Length = "32";
            DBTableName = "TUWFD";
            SType = "Text";
            Label = "Exclusion - field10";
      }

      IN MIR-EXCL-FLD1-CHNG-IND
      {
            Length = "01";
            DBTableName = "Derived";
            SType = "Indicator";
            Label = "EXCL- field1";
      }
  
      IN MIR-EXCL-FLD2-CHNG-IND
      {
            Length = "01";
            DBTableName = "Derived";
            SType = "Indicator";
            Label = "EXCL- field2";
      }
  
      IN MIR-EXCL-FLD3-CHNG-IND
      {
            Length = "01";
            DBTableName = "Derived";
            SType = "Indicator";
            Label = "EXCL- field3";
      }
  
      IN MIR-EXCL-FLD4-CHNG-IND
      {
            Length = "01";
            DBTableName = "Derived";
            SType = "Indicator";
            Label = "EXCL- field4";
      }
  
      IN MIR-EXCL-FLD5-CHNG-IND
      {
            Length = "01";
            DBTableName = "Derived";
            SType = "Indicator";
            Label = "EXCL- field5";
      }
  
      IN MIR-EXCL-FLD6-CHNG-IND
      {
            Length = "01";
            DBTableName = "Derived";
            SType = "Indicator";
            Label = "EXCL- field6";
      }
  
      IN MIR-EXCL-FLD7-CHNG-IND
      {
            Length = "01";
            DBTableName = "Derived";
            SType = "Indicator";
            Label = "EXCL- field7";
      }
  
      IN MIR-EXCL-FLD8-CHNG-IND
      {
            Length = "01";
            DBTableName = "Derived";
            SType = "Indicator";
            Label = "EXCL- field8";
      }
  
      IN MIR-EXCL-FLD9-CHNG-IND
      {
            Length = "01";
            DBTableName = "Derived";
            SType = "Indicator";
            Label = "EXCL- field9";
      }
  
      IN MIR-EXCL-FLD10-CHNG-IND
      {
            Length = "01";
            DBTableName = "Derived";
            SType = "Indicator";
            Label = "EXCL- field10";
      }
# S23056 CHANGES START    
    IN MIR-SCOND-DT-TIME-TXT
    {
        DisplayOnly;
        Length = "16";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Print Date";
    }  
# S23056 CHANGES END     
    IN MIR-EXCL-POL-ID-T[10]
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
    }
    IN MIR-PROD-APP-TYP-CD-T[10]
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-PROD-APP-TYP";     
        DBTableName = "TEDIT";
        SType = "Text";
        Label = "Product Application Type";
    }
    IN MIR-AMEND-CRTE-EXCL-IND-T[10]
    {
        DisplayOnly;
        Length = "01";
        DBTableName = "TAMEX";
        SType = "Text";
        Label = "Amendment Create(Exclusion)";
    }    
    IN MIR-AMEND-CRTE-IND-T[10]
    {
        DisplayOnly;
        Length = "01";
        DBTableName = "TAMEX";
        SType = "Text";
        Label = "Amendment Create(Amendment)";
    }

    IN MIR-CLI-UWGDECN-CD
    {
         DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CLI-UWGDECN-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client Decision";
    }
    IN MIR-MLJ-HLTH-ASSESS-CD
    {
         DisplayOnly;
          Length = "02";
          DBTableName = "TUWFD";
          CodeSource = "EDIT";
          CodeType = "CLDEC";
          SType = "Text";
          Label = "MLJ DECISION";
    }
    IN MIR-REINS-HLTH-ASSESS-CD
    {
         DisplayOnly;
          Length = "02";
          DBTableName = "TUWFD";
          CodeSource = "EDIT";
          CodeType = "CLDEC";
          SType = "Text";
          Label = "REINS DECISION";
    }
    IN MIR-BLOOD-TXT
    {
         DisplayOnly;
          Length = "100";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "Blood";
    }
    IN MIR-ECG-TXT
    {
         DisplayOnly;
          Length = "100";
          DBTableName = "TUWFD";
          SType = "Text";
          Label = "ECG";
    }
    IN MIR-BLOOD-TEST-IND
    {
         DisplayOnly;
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Blood test";
    }
    IN MIR-ECG-IND
    {
         DisplayOnly;
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "ECG";
    }
    IN MIR-HLTH-CHK-RSLT-IND
    {
         DisplayOnly;
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Results of Health check up";
    }
    IN MIR-MEDIC-RPT-IND
    {
         DisplayOnly;
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Medical report";
    }
    IN MIR-ADDL-SELF-DSCLSRE-IND
    {
         DisplayOnly;
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Additional Self Disclosure";
    }
    IN MIR-DEDCT-SELF-DSCLSRE-IND
    {
         DisplayOnly;
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Dedicated Additional Self Disclosure";
    }
    IN MIR-EXIST-SELF-DSCLSRE-IND
    {
         DisplayOnly;
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Existing Policy Self Disclosure";
    }
    IN MIR-PRE-ISS-RPT-IND
    {
         DisplayOnly;
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Pre-issue Report Indicator";
    }
    IN MIR-HLTH-RPT-RESP-IND
    {
         DisplayOnly;
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Doctor/Interviewer/Corporate Health Report";
    }
    IN MIR-PRLM-UW-RSLT-IND
    {
         DisplayOnly;
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Results of Preliminary Underwriting";
    }
    IN MIR-MEDIC-BNFT-RPT-IND
    {
         DisplayOnly;
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Medical Report for the benefit (Claim)";
    }
    IN MIR-INCMPLT-DOC-IND
    {
         DisplayOnly;
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Response to Incomplete documentation";
    }
    IN MIR-SCR-WRITN-PLDG-IND
    {
         DisplayOnly;
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Scrivener's Written Pledge";
    }
    IN MIR-EXIST-POL-DOC-IND
    {
         DisplayOnly;
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Documents of existing policy";
    }
    IN MIR-OTHRS-IND
    {
         DisplayOnly;
          Length = "01";
          DBTableName = "TUWFD";
          SType = "Indicator";
          Label = "Others";
    }
    IN MIR-OTHRS-DESC-TXT
    {
         DisplayOnly;
          Length = "50";
          DBTableName = "TUWFD";
          SType = "TextArea";
          Label = "Comment";
    }
    IN MIR-UW-USER-NM-T [30]
    {
        DisplayOnly;
        Length = "15";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "USER";
        Index = "1";
    }
    IN MIR-UW-CREAT-DT-T [30]
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Creation Day";
        Index = "1";
    }
    IN MIR-UW-NOTE-T [30]
    {
        DisplayOnly;
        Length = "200";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "UW Note";
        Index = "1";
     }
    IN MIR-UW-COMNT-TXT
    {
        Length = "200";
        DBTableName = "TUWFD";
        SType = "TextArea";
        Label = "Underwriter Comment column";
     }

    IN MIR-DISABL-NOT-COVD-IND
    {
     DisplayOnly;
     Label = "Specific disability not covered";
     Length = "01";
     SType = "Indicator";
    }
    INOUT MIR-DISABL-NOT-COVD-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Specific disability not covered";
    }

    IN MIR-REASN-1-CD-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Reason Code -1";
    }
  IN MIR-REASN-1-CD
  {
     DisplayOnly;
     Label = "Reason Code -1";
     Length = "03";
     SType = "Text";
  }


    IN MIR-REASN-2-CD-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Reason Code -2";
    }

  IN MIR-REASN-2-CD
  {
     DisplayOnly;
     Label = "Reason Code -2";
     Length = "03";
     SType = "Text";
  }

    IN MIR-REASN-3-CD-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Reason Code -3";
    }

  IN MIR-REASN-3-CD
  {
     DisplayOnly;
     Label = "Reason Code -3";
     Length = "03";
     SType = "Text";
  }

    IN MIR-REASN-4-CD-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Reason Code -4";
    }

  IN MIR-REASN-4-CD
  {
     DisplayOnly;
     Label = "Reason Code -4";
     Length = "03";
     SType = "Text";
  }

    IN MIR-REASN-5-CD-CHNG-IND
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Reason Code -5";
    }


  IN MIR-REASN-5-CD
  {
     DisplayOnly;
     Label = "Reason Code -5";
     Length = "03";
     SType = "Text";
  }

    INOUT MIR-CI-FRST-DFCT-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -1";
    }
  IN MIR-FRST-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }

    INOUT MIR-CI-FRST-DFCT-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -2";
    }
  IN MIR-FRST-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }


    INOUT MIR-CI-FRST-ELAPS-YRS-DUR
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Elapsed Years";
    }
  IN MIR-FRST-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-FRST-SURGY-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 1";
    }
  IN MIR-FRST-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-FRST-SURGY-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 2";
    }
  IN MIR-FRST-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-FRST-SURGY-3-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 3";
    }
  IN MIR-FRST-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-FRST-ADDL-INFO-TXT
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Additional Info";
    }

  IN MIR-FRST-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-SEC-DFCT-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -1";
    }

  IN MIR-SEC-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }

    INOUT MIR-CI-SEC-DFCT-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -2";
    }

  IN MIR-SEC-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }

    INOUT MIR-CI-SEC-ELAPS-YRS-DUR
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Elapsed Years";
    }

  IN MIR-SEC-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-SEC-SURGY-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 1";
    }

  IN MIR-SEC-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-SEC-SURGY-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 2";
    }

  IN MIR-SEC-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-SEC-SURGY-3-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 3";
    }

  IN MIR-SEC-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-SEC-ADDL-INFO-TXT
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Reason Code -5";
    }

  IN MIR-SEC-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-THRD-DFCT-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -1";
    }

  IN MIR-THRD-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }

    INOUT MIR-CI-THRD-DFCT-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -2";
    }
  IN MIR-THRD-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }

    INOUT MIR-CI-THRD-ELAPS-YRS-DUR
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Elapsed Years";
    }
  IN MIR-THRD-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-THRD-SURGY-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 1";
    }

  IN MIR-THRD-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-THRD-SURGY-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 2";
    }
  IN MIR-THRD-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-THRD-SURGY-3-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 3";
    }

  IN MIR-THRD-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-THRD-ADDL-INFO-TXT
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Additional Info";
    }

  IN MIR-THRD-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-FRTH-DFCT-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Reason Code -5";
    }

  IN MIR-FRTH-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }

    INOUT MIR-CI-FRTH-DFCT-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -2";
    }

  IN MIR-FRTH-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }

    INOUT MIR-CI-FRTH-ELAPS-YRS-DUR
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Elapsed Years";
    }

  IN MIR-FRTH-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-FRTH-SURGY-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 1";
    }

  IN MIR-FRTH-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-FRTH-SURGY-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 2";
    }

  IN MIR-FRTH-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-FRTH-SURGY-3-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 3";
    }

  IN MIR-FRTH-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-FRTH-ADDL-INFO-TXT
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Additional Info";
    }

  IN MIR-FRTH-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-FIFTH-DFCT-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -1";
    }
  IN MIR-FIFTH-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }


    INOUT MIR-CI-FIFTH-DFCT-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -2";
    }
  IN MIR-FIFTH-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }


    INOUT MIR-CI-FIFTH-ELAPS-YRS-DUR
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Elapsed Years";
    }
  IN MIR-FIFTH-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-FIFTH-SURGY-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 1";
    }
  IN MIR-FIFTH-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-FIFTH-SURGY-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 2";
    }
  IN MIR-FIFTH-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-FIFTH-SURGY-3-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 3";
    }
  IN MIR-FIFTH-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-FIFTH-ADDL-INFO-TXT
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Additional Info";
    }
  IN MIR-FIFTH-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-SIXTH-DFCT-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -1";
    }
  IN MIR-SIXTH-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }

    INOUT MIR-CI-SIXTH-DFCT-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -2";
    }
  IN MIR-SIXTH-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }

    INOUT MIR-CI-SIXTH-ELAPS-YRS-DUR
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Elapsed Years";
    }
  IN MIR-SIXTH-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-SIXTH-SURGY-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 1";
    }
  IN MIR-SIXTH-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-SIXTH-SURGY-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 2";
    }
  IN MIR-SIXTH-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-SIXTH-SURGY-3-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 3";
    }
  IN MIR-SIXTH-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-SIXTH-ADDL-INFO-TXT
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Additional Info";
    }
  IN MIR-SIXTH-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-SVNTH-DFCT-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -1";
    }
  IN MIR-SVNTH-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }

    INOUT MIR-CI-SVNTH-DFCT-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -2";
    }
  IN MIR-SVNTH-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }


    INOUT MIR-CI-SVNTH-ELAPS-YRS-DUR
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Elapsed Years";
    }
  IN MIR-SVNTH-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-SVNTH-SURGY-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 1";
    }

  IN MIR-SVNTH-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-SVNTH-SURGY-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 2";
    }

  IN MIR-SVNTH-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-SVNTH-SURGY-3-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 3";
    }

  IN MIR-SVNTH-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-SVNTH-ADDL-INFO-TXT
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Additional Info";
    }
  IN MIR-SVNTH-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-EIGTH-DFCT-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -1";
    }
  IN MIR-EIGTH-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }

    INOUT MIR-CI-EIGTH-DFCT-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -2";
    }

  IN MIR-EIGTH-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }

    INOUT MIR-CI-EIGTH-ELAPS-YRS-DUR
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Elapsed Years";
    }

  IN MIR-EIGTH-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-EIGTH-SURGY-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 1";
    }
  IN MIR-EIGTH-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-EIGTH-SURGY-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 2";
    }
  IN MIR-EIGTH-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-EIGTH-SURGY-3-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 3";
    }
  IN MIR-EIGTH-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-EIGTH-ADDL-INFO-TXT
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Additional Info";
    }
  IN MIR-EIGTH-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-NINTH-DFCT-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -1";
    }
  IN MIR-NINTH-DFCT-1-CD
  {
     DisplayOnly;
     Label = "Defect Code -1";
     Length = "07";
     SType = "Text";
  }

    INOUT MIR-CI-NINTH-DFCT-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Defect Code -2";
    }
  IN MIR-NINTH-DFCT-2-CD
  {
     DisplayOnly;
     Label = "Defect Code -2";
     Length = "06";
     SType = "Text";
  }

    INOUT MIR-CI-NINTH-ELAPS-YRS-DUR
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Elapsed Years";
    }
  IN MIR-NINTH-ELAPS-YRS-DUR
  {
     DisplayOnly;
     Label = "Elapsed Years";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-NINTH-SURGY-1-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 1";
    }
  IN MIR-NINTH-SURGY-1-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 1";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-NINTH-SURGY-2-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 2";
    }
  IN MIR-NINTH-SURGY-2-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 2";
     Length = "02";
     SType = "Text";
  }

    INOUT MIR-CI-NINTH-SURGY-3-CD
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Surgery Code - 3";
    }

  IN MIR-NINTH-SURGY-3-CD
  {
     DisplayOnly;
     Label = "Surgery Code - 3";
     Length = "02";
     SType = "Text";
  }


    INOUT MIR-CI-NINTH-ADDL-INFO-TXT
    {
          Length = "01";
          DBTableName = "Derived";
          SType = "Indicator";
          Label = "Additional Info";
    }
  IN MIR-NINTH-ADDL-INFO-TXT
  {
     DisplayOnly;
     Label = "Additional Info";
     Length = "20";
     SType = "Text";
  }

    IN MIR-REQIR-ID-T[20]
    {
         DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TREQT";
        SType = "Selection";
        Label = "Requirement";
    }

    IN MIR-REQIR-CAT-CD-T[20]
    {
         DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "RQCAT";
        DBTableName = "TREQT";
        SType = "Selection";
        Label = "Category";
    }

    IN MIR-REQIR-COMNT-INFO-TXT-T[20]
    {
         DisplayOnly;
        Length = "200";
        DBTableName = "TREQT";
        SType = "TextArea";
        Label = "Comment:";
    }
    IN MIR-CPREQ-STAT-CD-T[20]
    {
         DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CPREQ-STAT-CD";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Requirement Status";
        Index = "1";
    }
    IN MIR-USER-ID-T[20]
    {
         DisplayOnly;
        Length = "8";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Updated By";
        Index = "1";
    }
    
    IN MIR-CPREQ-SEQ-NUM-T[20]
    {
         DisplayOnly;
        Length = "3";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

   IN MIR-ISS-REQIR-ID-T[20]
    {
         DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Requirement";
     Index = "1";
    }
    IN MIR-ISS-REQIR-CAT-CD-T[20]
    {
         DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "RQCAT";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Category";
        Index = "1";
    }
    IN MIR-ISS-REQIR-COMNT-TXT-T[20]
    {
         DisplayOnly;
        Length = "400";
        DBTableName = "TREQT";
        SType = "TextArea";
        Label = "Comment:";
        Index = "1";
    }
    IN MIR-ISS-CPREQ-STAT-CD-T[20]
    {
         DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CPREQ-STAT-CD";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Requirement Status";
        Index = "1";
    }
    IN MIR-ISS-USER-ID-T[20]
    {
         DisplayOnly;
        Length = "8";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Updated By";
        Index = "1";
    }

    IN MIR-ISS-CPREQ-SEQ-NUM-T[20]
    {
         DisplayOnly;
        Length = "3";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    IN MIR-ISS-POL-ID-T [20]
    {
       DisplayOnly;
       Length = "10";
       DBTableName = "TPOL";
       SType = "Text";
       Label = "Policy ID";
    }
   IN MIR-NEW-UW-REQIR-ID-T[15]
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TREQT";
        SType = "Selection";
        Label = "Requirement";
        Index = "1";
    }

    IN MIR-NEW-UW-REQIR-CAT-CD-T [15]
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "URCAT";
        DBTableName = "TREQT";
        SType = "Selection";
        Label = "Category";
        Index = "1";
    }

    IN MIR-NEW-UW-REQIR-COMNT-TXT-T[15]
    {
        DisplayOnly;
        Length = "400";
        DBTableName = "TREQT";
        SType = "TextArea";
        Label = "Comment:";
        Index = "1";        
    }
    IN MIR-NEW-ISS-POL-ID-T [5]
    {
       DisplayOnly;
       Length = "10";
       DBTableName = "TPOL";
       SType = "Text";
       Label = "Policy ID";
        Index = "1";
    }
   IN MIR-NEW-ISS-REQIR-ID-T[5]
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Requirement";
        Index = "1";
    }

    IN MIR-NEW-ISS-REQIR-CAT-CD-T[5]
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "IRCAT";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Category";
        Index = "1";
    }

    IN MIR-NEW-ISS-REQIR-COMNT-TXT-T[5]
    {
         DisplayOnly;
        Length = "400";
        DBTableName = "TREQT";
        SType = "TextArea";
        Label = "Comment:";
        Index = "1";
    }
    INOUT MIR-POL-CRCY-CD-1-T[10]
     {   
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
                
    } 
    INOUT MIR-POL-CRCY-CD-2-T[55]
     {   
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
                
    }
#TLB015 CHANGES STARTS HERE
    IN MIR-REINS-TYP-CD-T[55]
    {
        DisplayOnly;
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