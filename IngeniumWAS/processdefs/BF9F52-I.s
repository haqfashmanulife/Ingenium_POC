# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF9F52-I.s                                                    *
#*  Description: For Updating a Underwrite's Final Decision                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP310A   CTS      INITIAL VERSION - NB IMPROVEMENTS                        *
#*  TV2003   CTS      SULV2 NEW BUSINESS CHANGES                               *
#*  110068   CTS      CHANGES FOR THE REQUIREMENT DROP DOWN                    *
#*  TLB015   CTS      REINSURANCE TYPE                                         *
#*  TLB003  CTS      CHANGES FOR NEW BUSINESS                                  *
#*  TL1010   CTS      ADDED BULKBUNDLEAPP FIELD                                *

#*  S23056  CTS      BUG FIX FOR REPRINT POPULATION AS PART OF UYS003          *
#*  CD200B  CTS      CERBERUS NEW BUSINESS XML UPLOAD DAY 2.0 CHANGES          *
#*  NVCN01  CTS      CHANGES DONE AS PART OF ONTARIO XML UPLOAD                *
#*******************************************************************************

S-STEP BF9F52-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-PDTL-POL-SNDRY-AMT-T [1]";
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

    IN MIR-CLI-ID
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client Id";
    }
    IN MIR-POL-ID
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
        SType = "Text";
        Label = "Upload Date";
        Index = "1";
    }
    IN MIR-PDTL-POL-ID-T [10]
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";
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
        Index = "1";
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
        Index = "1";
    }
    IN MIR-PDTL-POL-MPREM-AMT-T [10]
    {
        CurrencyCode = "MIR-POL-CRCY-CD-1-T[]";    
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
    INOUT MIR-CVG-WP-IND-T [55]
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "3DD";
        Index = "1";
    }
#NVCN01 CHANGES START
    INOUT MIR-CVG-WP-TYP-CD-T[55]
    {
        Length = "6";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "WPIND";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "WoP Type";
        Index = "1";
    }
#NVCN01 CHANGES END
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
    INOUT MIR-CVG-UWGDECN-CD-T[55]
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
    IN MIR-SLCTN-POL-ID-T [10]
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";  
        FieldGroup = "Table21";        
    }
    IN MIR-STCKR-ID-T [10]
    {
        DisplayOnly;
        Length = "11";
        DBTableName = "TCLIU";
        SType = "Text";
        Label = "Sticker Number";
        Index = "1"; 
        FieldGroup = "Table21";        
    }
    INOUT MIR-UW-TYP-CD-T [10]
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UW-TYP-CD";
        DBTableName = "TCLIU";
        SType = "Selection";
        Label = "Selection Method";
        Index = "1"; 
        FieldGroup = "Table21";        
    }
    INOUT MIR-UW-UPLD-IND-T [10]
    {
        Length = "1";
        DBTableName = "TCLIU";
        SType = "Indicator";
        Label = "Underwriting Upload Indicator";
        Index = "1";        
        FieldGroup = "Table21";        
    }
    INOUT MIR-UW-UPLD-DT-T [10]
    {
        Length = "10";
        DBTableName = "TCLIU";
        SType = "Date";
        Label = "Underwriting Upload Date";
        Index = "1";        
        FieldGroup = "Table21";        
    }
    # TL1010 CHANGES STARTS HERE
    IN MIR-BULK-BUNDLE-APP-T [10]
    {
        Length = "18";
        SType = "Text";
        Label = "BulkBundleApp";
        Index = "1";
    }
    # TL1010 CHANGES ENDS HERE
    INOUT MIR-MED-MIN-BLOOD-RT
    {
        Length = "03";
        DBTableName = "TAPPV";
        SType = "Text";
        Label = "Minimum BP";
    }
    INOUT MIR-MED-MAX-BLOOD-RT
    {
        Length = "03";
        DBTableName = "TAPPV";
        SType = "Text";
        Label = "Maximum BP";
    }
    IN MIR-PDTL-POL-OWNER-T [10]
    {
        Length = "75";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client Name";
        Index = "1";
    }
    INOUT MIR-CVG-REINS-IND-T[55]
    {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Reinsured";
        Index = "1";
    }
    INOUT MIR-CVG-REINS-CO-ID-T[55]
    {
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "REINS";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Reinsurance Company";
        Index = "1";
    }
    INOUT MIR-CVG-REINS-TRTY-NUM-T[55]
    {
        Length = "3";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "TRTNM";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Treaty Number";
        Index = "1";
    }
    INOUT MIR-CVG-REINS-CED-PCT-T[55]
    {
        Length = "3";    
        FieldGroup = "Table20";    
        CodeSource = "EDIT";    
        CodeType = "CDPCT";    
        DBTableName = "TCVG";    
        SType = "Selection";    
        Label = "Ceding Percentage";
        Index = "1";    
    }
    INOUT MIR-CVG-REINS-ME-FCT-T[55]
    {
        Signed;
        Length = "4";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Mortality Ratio";
        Index = "1";
    }
    INOUT MIR-CVG-REINS-LIEN-T[55]
    {
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Lien";
        Index = "1";   
    }
    INOUT MIR-CVG-REINS-CED-AMT-T[55]
    {
        Length = "15";
        Decimals = "2";
        FieldGroup = "Table20";
        DBTableName = "Derived";    
        SType = "Hidden";
        Label = "Ceded Amount";
        Index = "1";
    }
    INOUT MIR-DTH-PREV-DIS-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Previous Disease";
    }
    INOUT MIR-DTH-CRNT-DIS-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Current Disease";
    }
    INOUT MIR-DTH-BLD-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Build";
    }
    INOUT MIR-DTH-PULSE-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Pulse";
    }
    INOUT MIR-DTH-BD-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - BP";
    }
    INOUT MIR-DTH-URINE-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Urine";
    }
    INOUT MIR-DTH-BLOOD-SUGAR-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Sugar";
    }
    INOUT MIR-DTH-LIVER-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Liver";
    }
    INOUT MIR-DTH-LIPID-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Lipid";
    }
    INOUT MIR-DTH-ANEM-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Anemia";
    }
    INOUT MIR-DTH-ECG-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - ECG";
    }
    INOUT MIR-DTH-OTHR-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Other";
    }
    INOUT MIR-DTH-CORR-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Correction";
    }
    INOUT MIR-DTH-TOT-AMT
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Total";
    }
#110141 Changes Starts
#    INOUT MIR-DTH-MR-CD
    IN MIR-DTH-MR-CD
#110141 Changes Ends
    {
        Length = "04";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - MR";
    }
#110141 Changes Starts
#    INOUT MIR-DTH-TOT-TVI-AMT
#TV2003    IN MIR-DTH-TOT-TVI-AMT
#110141 Changes Ends
#TV2003    {
#TV2003        Length = "05";
#TV2003        DBTableName = "TUWFD";
#TV2003        SType = "Text";
#TV2003        Label = "Death - Total(TVI)";
#TV2003    }
#TV2003    INOUT MIR-DTH-MR-TVI-CD
#TV2003    {
#TV2003        Length = "04";
#TV2003        DBTableName = "TUWFD";
#TV2003        SType = "Text";
#TV2003        Label = "Death - MR(TVI)";
#TV2003    }
#TV2003    INOUT MIR-DTH-MR-DUR
#TV2003    {
#TV2003        Length = "03";
#TV2003        DBTableName = "TUWFD";
#TV2003        SType = "Text";
#TV2003        Label = "Death - MR Duration(TVI)";
#TV2003    }
    IN MIR-DTH-AGE-DUR
    {
        Length = "02";
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
    INOUT MIR-CON-PREV-DIS-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - Previous";
    }
    INOUT MIR-CON-CRNT-DIS-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - Current";
    }
    INOUT MIR-CON-BLD-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - Build";
    }
    INOUT MIR-CON-PULSE-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - Pulse";
    }
    INOUT MIR-CON-BD-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - BD";
    }
    INOUT MIR-CON-URINE-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - Urine";
    }
    INOUT MIR-CON-BLOOD-SUGAR-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - Sugar";
    }
    INOUT MIR-CON-LIVER-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - Liver";
    }
    INOUT MIR-CON-LIPID-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - Lipid";
    }
    INOUT MIR-CON-ANEM-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - Anemia";
    }
    INOUT MIR-CON-ECG-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - ECG";
    }
    INOUT MIR-CON-OTHR-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - Other";
    }
    INOUT MIR-CON-CORR-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - Correction";
    }
    INOUT MIR-CON-TOT-AMT
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - Total";
    }
    IN MIR-CON-MR-CD
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "S - MR";
    }
#TV2003    INOUT MIR-CON-TOT-TVI-AMT
#TV2003    {
#TV2003        Length = "03";
#TV2003        DBTableName = "TUWFD";
#TV2003        SType = "Text";
#TV2003        Label = "S - Total(TVI)";
#TV2003    }
#TV2003    INOUT MIR-CON-MR-TVI-CD
#TV2003    {
#TV2003        Length = "04";
#TV2003        DBTableName = "TUWFD";
#TV2003        SType = "Text";
#TV2003        Label = "S - MR(TVI)";
#TV2003    }
#TV2003    INOUT MIR-CON-MR-DUR
#TV2003    {
#TV2003        Length = "01";
#TV2003        DBTableName = "TUWFD";
#TV2003        SType = "Text";
#TV2003        Label = "S - MR Duration(TVI)";
#TV2003    }
    INOUT MIR-CON-AGE-DUR
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "S - Age Add Duration";
    }
#CD200B CHANGES START HERE
    INOUT MIR-CON-AGE-DUR-3CI
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "S - Age Add Duration(3CI)";
    }
#CD200B CHANGES ENDS HERE
    INOUT MIR-MEDIC-PREV-DIS-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Previous";
    }
    INOUT MIR-MEDIC-CRNT-DIS-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Current";
    }
    INOUT MIR-MEDIC-BLD-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Build";
    }
    INOUT MIR-MEDIC-PULSE-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Pulse";
    }
    INOUT MIR-MEDIC-BD-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - BD";
    }
    INOUT MIR-MEDIC-URINE-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Urine";
    }
    INOUT MIR-MEDIC-BLOOD-SUGAR-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Sugar";
    }
    INOUT MIR-MEDIC-LIVER-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Liver";
    }
    INOUT MIR-MEDIC-LIPID-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Lipid";
    }
    INOUT MIR-MEDIC-ANEM-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Anemia";
    }
    INOUT MIR-MEDIC-ECG-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - ECG";
    }
    INOUT MIR-MEDIC-OTHR-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Other";
    }
    INOUT MIR-MEDIC-CORR-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Correction";
    }

    INOUT MIR-MEDIC-TOT-AMT
    {
        Length = "03";
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
#TV2003    INOUT MIR-MEDIC-TOT-TVI-AMT
#TV2003    {
#TV2003        Length = "05";
#TV2003        DBTableName = "TUWFD";
#TV2003        SType = "Text";
#TV2003        Label = "Hospital - Total(TVI)";
#TV2003    }
#TV2003    INOUT MIR-MEDIC-MR-TVI-CD
#TV2003    {
#TV2003        Length = "04";
#TV2003        DBTableName = "TUWFD";
#TV2003        SType = "Text";
#TV2003        Label = "Hospital - MR(TVI)";
#TV2003    }
#TV2003    INOUT MIR-MEDIC-MR-DUR
#TV2003    {
#TV2003        Length = "03";
#TV2003        DBTableName = "TUWFD";
#TV2003        SType = "Text";
#TV2003        Label = "Hospital - MR Duration(TVI)";
#TV2003    }
    INOUT MIR-MEDIC-AGE-DUR
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Age Add Duration";
    }
#CD200B CHANGES START HERE	
    INOUT MIR-MEDIC-AGE-DUR-3CI
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Age Add Duration(3CI)";
    }
#CD200B CHANGES ENDS HERE	
    INOUT MIR-EXCL-FLD1
    {
        Length = "8";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Exclusion - field1";
    }
    INOUT MIR-EXCL-FLD2
    {
        Length = "8";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Exclusion - field2";
    }
    INOUT MIR-EXCL-FLD3
    {
        Length = "8";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Exclusion - field3";
    }
    INOUT MIR-EXCL-FLD4
    {
        Length = "8";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Exclusion - field4";
    }
    INOUT MIR-EXCL-FLD5
    {
        Length = "8";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Exclusion - field5";
    }
    INOUT MIR-EXCL-FLD6
    {
        Length = "8";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Exclusion - field6";
    }
    INOUT MIR-EXCL-FLD7
    {
        Length = "16";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Exclusion - field7";
    }
    INOUT MIR-EXCL-FLD8
    {
        Length = "16";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Exclusion - field8";
    }
    INOUT MIR-EXCL-FLD9
    {
        Length = "16";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Exclusion - field9";
    }
    INOUT MIR-EXCL-FLD10
    {
        Length = "16";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Exclusion - field10";
    }
# S23056 CHANGES START    
    INOUT MIR-SCOND-DT-TIME-TXT
    {
        DisplayOnly;
        Length = "16";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Print Date";
        Index = "1";
    }    
# S23056 CHANGES END    
    IN MIR-EXCL-POL-ID-T[10]
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
        Action = "SelectItem";
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

    INOUT MIR-CLI-UWGDECN-CD
    {
        Length = "2";
        Mandatory;
        CodeSource = "DataModel";
        CodeType = "CLI-UWGDECN-CD";
        DBTableName = "TCLI";
        SType = "Selection";
        Label = "Client Decision";
    }
    INOUT MIR-MLJ-HLTH-ASSESS-CD
    {
        Length = "02";
        DBTableName = "TUWFD";
        CodeSource = "EDIT";
        CodeType = "CLDEC";
        SType = "Selection";
        Label = "MLJ DECISION";
    }
    INOUT MIR-REINS-HLTH-ASSESS-CD
    {
        Length = "02";
        DBTableName = "TUWFD";
        CodeSource = "EDIT";
        CodeType = "CLDEC";
        SType = "Selection";
        Label = "REINS DECISION";
    }
    INOUT MIR-BLOOD-TXT
    {
        Length = "100";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Blood";
    }
    INOUT MIR-ECG-TXT
    {
        Length = "100";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "ECG";
    }
    INOUT MIR-BLOOD-TEST-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Blood test";
    }
    INOUT MIR-ECG-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "ECG";
    }
    INOUT MIR-HLTH-CHK-RSLT-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Results of Health check up";
    }
    INOUT MIR-MEDIC-RPT-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Medical report";
    }
    INOUT MIR-ADDL-SELF-DSCLSRE-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Additional Self Disclosure";
    }
    INOUT MIR-DEDCT-SELF-DSCLSRE-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Dedicated Additional Self Disclosure";
    }
    INOUT MIR-EXIST-SELF-DSCLSRE-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Existing Policy Self Disclosure";
    }
    INOUT MIR-PRE-ISS-RPT-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Pre-issue Report Indicator";
    }
    INOUT MIR-HLTH-RPT-RESP-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Doctor/Interviewer/Corporate Health Report";
    }
    INOUT MIR-PRLM-UW-RSLT-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Results of Preliminary Underwriting";
    }
    INOUT MIR-MEDIC-BNFT-RPT-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Medical Report for the benefit (Claim)";
    }
    INOUT MIR-INCMPLT-DOC-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Response to Incomplete documentation";
    }
    INOUT MIR-SCR-WRITN-PLDG-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Scrivener's Written Pledge";
    }
    INOUT MIR-EXIST-POL-DOC-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Documents of existing policy";
    }
    INOUT MIR-OTHRS-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Others";
    }
    INOUT MIR-OTHRS-DESC-TXT
    {
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
    INOUT MIR-UW-COMNT-TXT
    {
        Length = "200";
        DBTableName = "TUWFD";
        SType = "TextArea";
        Label = "Underwriter Comment column";
     }
    INOUT MIR-REASN-1-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Reason Code -1";
    }
    INOUT MIR-REASN-2-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Reason Code -2";
    }
    INOUT MIR-REASN-3-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Reason Code -3";
    }

    INOUT MIR-REASN-4-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Reason Code -4";
    }
    INOUT MIR-REASN-5-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Reason Code -5";
    }
    INOUT MIR-FRST-DFCT-1-CD
    {
        Length = "07";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -1";
    }
    INOUT MIR-FRST-DFCT-2-CD
    {
        Length = "06";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -2";
    }
    INOUT MIR-FRST-ELAPS-YRS-DUR
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Elapsed Years";
    }
    INOUT MIR-FRST-SURGY-1-CD
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 1";
    }
    INOUT MIR-FRST-SURGY-2-CD
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 2";
    }
    INOUT MIR-FRST-SURGY-3-CD
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 3";
    }
    INOUT MIR-FRST-ADDL-INFO-TXT
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Additional Info";
    }
    INOUT MIR-SEC-DFCT-1-CD
    {
        Length = "07";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -1";
    }
    INOUT MIR-SEC-DFCT-2-CD
    {
        Length = "06";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -2";
    }
    INOUT MIR-SEC-ELAPS-YRS-DUR
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Elapsed Years";
    }
    INOUT MIR-SEC-SURGY-1-CD
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 1";
    }
    INOUT MIR-SEC-SURGY-2-CD
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 2";
    }
    INOUT MIR-SEC-SURGY-3-CD
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 3";
    }
    INOUT MIR-SEC-ADDL-INFO-TXT
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Additional Info";
    }
    INOUT MIR-THRD-DFCT-1-CD
    {
        Length = "07";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -1";
    }
    INOUT MIR-THRD-DFCT-2-CD
    {
        Length = "06";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -2";
    }
    INOUT MIR-THRD-ELAPS-YRS-DUR
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Elapsed Years";
    }
    INOUT MIR-THRD-SURGY-1-CD
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 1";
    }
    INOUT MIR-THRD-SURGY-2-CD
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 2";
    }
    INOUT MIR-CI-THRD-SURGY-3-CD
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Surgery Code - 3";
    }
    INOUT MIR-THRD-SURGY-3-CD
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 3";
    }
    INOUT MIR-THRD-ADDL-INFO-TXT
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Additional Info";
    }
    INOUT MIR-FRTH-DFCT-1-CD
    {
                   
        Length = "07";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -1";
    }
    INOUT MIR-FRTH-DFCT-2-CD
    {
        Length = "06";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -2";
    }
    INOUT MIR-FRTH-ELAPS-YRS-DUR
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Elapsed Years";
    }
    INOUT MIR-FRTH-SURGY-1-CD
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 1";
    }
    INOUT MIR-FRTH-SURGY-2-CD
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 2";
    }
    INOUT MIR-FRTH-SURGY-3-CD
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 3";
    }
    INOUT MIR-FRTH-ADDL-INFO-TXT
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Additional Info";
    }
    INOUT MIR-FIFTH-DFCT-1-CD
    {
                   
        Length = "07";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -1";
    }
    INOUT MIR-FIFTH-DFCT-2-CD
    {
        Length = "06";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -2";
    }
    INOUT MIR-FIFTH-ELAPS-YRS-DUR
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Elapsed Years";
    }
    INOUT MIR-FIFTH-SURGY-1-CD
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 1";
    }
    INOUT MIR-FIFTH-SURGY-2-CD
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 2";
    }
    INOUT MIR-FIFTH-SURGY-3-CD
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 3";
    }

    INOUT MIR-FIFTH-ADDL-INFO-TXT
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Additional Info";
    }

    INOUT MIR-SIXTH-DFCT-1-CD
    {
        Length = "07";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -1";
    }

    INOUT MIR-SIXTH-DFCT-2-CD
    {
        Length = "06";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -2";
    }

    INOUT MIR-SIXTH-ELAPS-YRS-DUR
    {
                   
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Elapsed Years";
    }

    INOUT MIR-SIXTH-SURGY-1-CD
    {
                   
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 1";
    }

    INOUT MIR-SIXTH-SURGY-2-CD
    {
                   
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 2";
    }

    INOUT MIR-SIXTH-SURGY-3-CD
    {
                   
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 3";
    }

    INOUT MIR-SIXTH-ADDL-INFO-TXT
    {
                   
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Additional Info";
    }

    INOUT MIR-SVNTH-DFCT-1-CD
    {
                   
        Length = "07";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -1";
    }

    INOUT MIR-SVNTH-DFCT-2-CD
    {
                   
        Length = "06";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -2";
    }

    INOUT MIR-SVNTH-ELAPS-YRS-DUR
    {
                   
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Elapsed Years";
    }

    INOUT MIR-SVNTH-SURGY-1-CD
    {
                   
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 1";
    }

    INOUT MIR-SVNTH-SURGY-2-CD
    {
                   
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 2";
    }

    INOUT MIR-SVNTH-SURGY-3-CD
    {
                   
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 3";
    }

    INOUT MIR-SVNTH-ADDL-INFO-TXT
    {
                   
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Additional Info";
    }

    INOUT MIR-EIGTH-DFCT-1-CD
    {
                   
        Length = "07";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -1";
    }

    INOUT MIR-EIGTH-DFCT-2-CD
    {
                   
        Length = "06";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -2";
    }

    INOUT MIR-EIGTH-ELAPS-YRS-DUR
    {
                   
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Elapsed Years";
    }

    INOUT MIR-EIGTH-SURGY-1-CD
    {
                   
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 1";
    }

    INOUT MIR-EIGTH-SURGY-2-CD
    {
                   
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 2";
    }

    INOUT MIR-EIGTH-SURGY-3-CD
    {
                   
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 3";
    }
    INOUT MIR-EIGTH-ADDL-INFO-TXT
    {
                   
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Additional Info";
    }
    INOUT MIR-NINTH-DFCT-1-CD
    {
                   
        Length = "07";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -1";
    }

    INOUT MIR-NINTH-DFCT-2-CD
    {
                   
        Length = "06";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -2";
    }
    INOUT MIR-NINTH-ELAPS-YRS-DUR
    {
                   
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Elapsed Years";
    }
    INOUT MIR-NINTH-SURGY-1-CD
    {
                   
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 1";
    }
    INOUT MIR-NINTH-SURGY-2-CD
    {
                   
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 2";
    }
    INOUT MIR-NINTH-SURGY-3-CD
    {
                   
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 3";
    }
    INOUT MIR-NINTH-ADDL-INFO-TXT
    {
                   
        Length = "20";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Additional Info";
    }
    IN MIR-REQIR-ID-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table3";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement";
        Index = "1";
    }

    IN MIR-REQIR-CAT-CD-T[20]
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

    IN MIR-REQIR-COMNT-INFO-TXT-T[20]
    {
        DisplayOnly;
        Length = "200";
        DBTableName = "TREQT";
        SType = "TextArea";
        Label = "Comment";
        Index = "1";
    }
    INOUT MIR-CPREQ-STAT-CD-T[20]
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CPREQ-STAT-CD";
        DBTableName = "TREQT";
        SType = "Selection";
        Label = "Requirement Status";
        Index = "1";
        
    }
    IN MIR-USER-ID-T[20]
    {
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
        Length = "40";
        FieldGroup = "Table3";
        CodeSource = "EDIT";
        CodeType = "REQTC";
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
        Length = "200";
        DBTableName = "TREQT";
        SType = "TextArea";
        Label = "Comment";
        Index = "1";
    }
    INOUT MIR-ISS-CPREQ-STAT-CD-T[20]
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CPREQ-STAT-CD";
        DBTableName = "TREQT";
        SType = "Selection";
        Label = "Requirement Status";
        Index = "1";
    }
# 109514 CHANGES START HERE
#    INOUT MIR-ISS-USER-ID-T[20]
    IN MIR-ISS-USER-ID-T[20]
# 109514 CHANGES ENDS HERE    
    {
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

    IN MIR-ISS-POL-ID-T[20]
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";
    }
    INOUT MIR-NEW-UW-REQIR-CAT-CD-T[15]
    {
        Length = "5";
        CodeSource = "EDIT";
#110168 changes starts here
#        CodeType = "URCAT";
         CodeType = "RQCAT";
#110168 changes ends here
        SType = "Selection";
        Label = "Category";
        Index = "1";
    }
    INOUT MIR-NEW-UW-REQIR-ID-T[15]
    {
        Length = "5";
        CodeSource = "NSOM9F35";
        FilterFields = "1";
        FilterField1 = "MIR-NEW-UW-REQIR-CAT-CD-T";
        SType = "Selection";
        Label = "Requirement";
        Index = "1";
    }

    INOUT MIR-NEW-UW-REQIR-COMNT-TXT-T[15]
    {
        Length = "200";
        CodeSource = "NSOM9F31";
        FilterFields = "1";
        FilterField1 = "MIR-NEW-UW-REQIR-ID-T";
        SType = "Text";
        Label = "Comment:";
        Index = "1";
    }
    INOUT MIR-NEW-ISS-POL-ID-T[5]
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";
    }
   INOUT MIR-NEW-ISS-REQIR-ID-T[5]
    {
        Length = "5";
        CodeSource = "NSOM9F30";
        FilterFields = "1";
        FilterField1 = "MIR-NEW-ISS-REQIR-CAT-CD-T";
        SType = "Selection";
        Label = "Requirement";
        Index = "1";
    }

    INOUT MIR-NEW-ISS-REQIR-CAT-CD-T[5]
    {
        Length = "5";
        CodeSource = "EDIT";
#110168 changes starts here
#        CodeType = "IRCAT";
         CodeType = "RQCAT";
#110168 changes ends here

        DBTableName = "TREQT";
        SType = "Selection";
        Label = "Category";
        Index = "1";
    }
# 109514 CHANGES START HERE
# INOUT MIR-NEW-ISS-REQIR-COMNT-TXT-T[5]
    INOUT MIR-NEW-ISS-REQIR-COMNT-TXT-T[5]
# 109514 CHANGES ENDS HERE    
    {
        Length = "200";
        CodeSource = "NSOM9F32";
        FilterFields = "1";
        FilterField1 = "MIR-NEW-ISS-REQIR-ID-T";        
        SType = "Text";
        Label = "Comment:";
        Index = "1";
    }
    IN MIR-POL-CRCY-CD-1-T[10]
    {   
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
                
    } 
    IN MIR-POL-CRCY-CD-2-T[55]
    {   
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
                
    }
#TLB015 CHANGES STARTS HERE
    INOUT MIR-REINS-TYP-CD-T[55]
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