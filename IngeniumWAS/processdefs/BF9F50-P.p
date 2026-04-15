# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF9F50-P.p                                                    *
#*  Description: For Updating a Underwrite's Final Decision                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP310A   CTS      INITIAL VERSION - NB IMPROVEMENTS                        *
#*  MP310B   CTS      CHANGES AS PER MP310B                                    *
#*  109519   CTS      CHANGES DONE FOR THE UW SCREEN                           *
#*  TV2003  CTS      SULV2 NEW BUSINESS CHANGES                                *
#*  TLB015   CTS      REINSURANCE TYPE                                          *
#*  TLB003   CTS      CHANGES FOR NEW BUSINESS                                  *
#*  TL1010   CTS      ADDED BULKBUNDLEAPP FIELD                                *
#*  S23056  CTS      BUG FIX FOR REPRINT POPULATION AS PART OF UYS003          *
#*  CD200B  CTS      CERBERUS NEW BUSINESS XML UPLOAD DAY2 CHNGSS              *
#*  NVCN01  CTS      CHANGES DONE AS PART OF ONTARIO XML UPLOAD                *
#*******************************************************************************

P-STEP BF9F50-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9F50";
        BusinessFunctionName = "UW Summary Inquiry";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM9F50";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;
    
# 109519 CHANGES START HERE
#   INOUT MIR-CLI-ID
    IN MIR-CLI-ID
# 109519 CHANGES ENDS HERE    
    {
        Key;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Id";
    }
# 109519 CHANGES START HERE    
#    INOUT MIR-POL-ID
    IN MIR-POL-ID
# 109519 CHANGES ENDS HERE        
    {
        Length = "10";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }
#MP310B - CHANGES ENDS HERE.
    INOUT MIR-USER-ID
    {
       Length = "10";
       DBTableName = "TUWFD";
       SType = "Text";
       Label = "User ID";
    }
    INOUT MIR-SEQ-NUM
    {
      Length = "2";
      DBTableName = "TUWFD";
      SType = "Text";
      Label = "Sequence Number";
    }
    INOUT MIR-APP-TYP-CD
    {
      Length = "10";
      DBTableName = "TUWFD";
      SType = "Text";
      Label = "Application Type";
    }
#MP310B - CHANGES ENDS HERE.
    OUT MIR-CLI-KANA-FULL-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name(Kana)";
    }
    
    OUT MIR-POL-APP-UPLD-DT-T[10]
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Upload Date";
        Index = "1";
        }
    OUT MIR-PDTL-POL-ID-T [10]
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";
    }
    OUT MIR-PDTL-PLAN-ID-T[10]
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Product Application Type";
        Index = "1";
    }
    OUT MIR-PDTL-POL-CSTAT-CD-T[10]
    {
        Length = "40";
        DBTableName = "TPOL";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
        Index = "1";
    }
    OUT MIR-PDTL-POL-MPREM-AMT-T [10]
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Modal Premium";
        Index = "1";
    }
    OUT MIR-PDTL-POL-SNDRY-AMT-T[10]
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Sundry Payment Amount";
        Index = "1";        
    }
    # TLB003 CHANGES START HERE
        OUT MIR-ASSIGN-BUNDLE-APP-IND-T[10]
        {
            Length = "1";    
            SType = "Indicator";
            Label = "Bundle Application Indicator";
            Index = "1";  
        }
    # TLB003 CHANGES ENDS HERE    

    OUT MIR-CVG-NUM-T[55]
    {
        Length = "02";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }
    OUT MIR-CVG-POL-ID-T[55]
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";       
    }
    OUT MIR-CVG-PLAN-ID-T[55]
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Rider Name";
        Index = "1";           
    }
    OUT MIR-PLAN-ID-T[55]
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Rider Name";
        Index = "1";           
    }
    OUT MIR-CVG-FACE-AMT-T[55]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";       
    }
    OUT MIR-CVG-STBL-1-CD-T [55]
    {
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
    OUT MIR-CVG-STBL-3-CD-T [55]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "CSOM9D28";        
        FilterFields = "2";
        FilterField1 = "MIR-PLAN-ID-T"; 
     	FilterField2 = "MIR-CVG-STBL-3-CD-T";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub-table3";
        Index = "1";
    }
    OUT MIR-CVG-WP-IND-T [55]
    {
        Length = "1";
        DBTableName = "TCVG";    
        SType = "Indicator";
        Label = "3DD";
        Index = "1";          
    }
#NVCN01 START
    OUT MIR-CVG-WP-TYP-CD-T[55]
    {
        Length = "6";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-WP-TYP-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "WoP Type";
        Index = "1";
    }
#NVCN01 END
    OUT MIR-CVG-RT-AGE-T[55]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Age";
        Index = "1";
    }
    OUT MIR-CVG-CSTAT-CD-T[55]
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
    OUT MIR-CVG-UWGDECN-CD-T[55]
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
    OUT MIR-UW-TYP-CD-T [10]
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
    OUT MIR-SLCTN-POL-ID-T [10]
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";      
        FieldGroup = "Table21";             
    }
    OUT MIR-STCKR-ID-T [10]
    {
        Length = "11";
        DBTableName = "TCLIU";
        SType = "Text";
        Label = "Sticker Number";
        Index = "1";  
        FieldGroup = "Table21";             
    }
    OUT MIR-UW-UPLD-IND-T[10]
    {
        Length = "1";
        DBTableName = "TCLIU";
        SType = "Indicator";
        Label = "Underwriting Upload Indicator";
        Index = "1"; 
        FieldGroup = "Table21";             
    }
    OUT MIR-UW-UPLD-DT-T[10]
    {
        Length = "10";
        DBTableName = "TCLIU";
        SType = "Date";
        Label = "Underwriting Upload Date";
        Index = "1";   
        FieldGroup = "Table21";     
    }
    # TL1010 CHANGES STARTS HERE
    OUT MIR-BULK-BUNDLE-APP-T[10]
    {
        Length = "18";
        SType = "Text";
        Label = "BulkBundleApp";
        Index = "1";
    }
    # TL1010 CHANGES ENDS HERE
    OUT MIR-MED-MIN-BLOOD-RT
    {
        Length = "03";
        DBTableName = "TAPPV";
        SType = "Text";
        Label = "Minimum BP";
    }
    OUT MIR-MED-MAX-BLOOD-RT
    {
        Length = "03";
        DBTableName = "TAPPV";
        SType = "Text";
        Label = "Maximum BP";
    }
    OUT MIR-PDTL-POL-OWNER-T [10]
    {
        Length = "75";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client Name";
        Index = "1";         
    }
    INOUT MIR-AMEX-SEQ-NUM-T[10]
    {
        Length = "2";
        DBTableName = "TAMEX";
        SType = "Hidden";
        Label = "Sequence Number";
        Index = "1";
    }
    OUT MIR-CVG-REINS-IND-T[55]
    {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Reinsured";
        Index = "1";
    }
    OUT MIR-CVG-REINS-CO-ID-T[55]
    {
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "REINS";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Reinsurance Company";
        Index = "1";
    }
    OUT MIR-CVG-REINS-TRTY-NUM-T[55]
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
    OUT MIR-CVG-REINS-CED-PCT-T[55]
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
    OUT MIR-CVG-REINS-ME-FCT-T[55]
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
    OUT MIR-CVG-REINS-LIEN-T[55]
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
    OUT MIR-DTH-PREV-DIS-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Previous Disease";
    }
    OUT MIR-DTH-CRNT-DIS-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Current Disease";
    }
    OUT MIR-DTH-BLD-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Build";
    }
    OUT MIR-DTH-PULSE-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Pulse";
    }
    OUT MIR-DTH-BD-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - BP";
    }
    OUT MIR-DTH-URINE-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Urine";
    }
    OUT MIR-DTH-BLOOD-SUGAR-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Sugar";
    }
    OUT MIR-DTH-LIVER-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Liver";
    }
    OUT MIR-DTH-LIPID-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Lipid";
    }
    OUT MIR-DTH-ANEM-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Anemia";
    }
    OUT MIR-DTH-ECG-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - ECG";
    }
    OUT MIR-DTH-OTHR-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Other";
    }
    OUT MIR-DTH-CORR-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Merit";
    }

    OUT MIR-DTH-TOT-AMT
    {
        Length = "05";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Total";
    }
    OUT MIR-DTH-MR-CD
    {
        Length = "04";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - MR";
    }
#TV2003    OUT MIR-DTH-TOT-TVI-AMT
#TV2003    {
#TV2003        Length = "05";
#TV2003        DBTableName = "TUWFD";
#TV2003        SType = "Text";
#TV2003        Label = "Death - Total(TVI)";
#TV2003    }
#TV2003    OUT MIR-DTH-MR-TVI-CD
#TV2003    {
#TV2003        Length = "04";
#TV2003        DBTableName = "TUWFD";
#TV2003        SType = "Text";
#TV2003        Label = "Death - MR(TVI)";
#TV2003    }
#TV2003    OUT MIR-DTH-MR-DUR
#TV2003    {
#TV2003        Length = "03";
#TV2003        DBTableName = "TUWFD";
#TV2003        SType = "Text";
#TV2003        Label = "Death - MR Duration(TVI)";
#TV2003    }
    OUT MIR-DTH-AGE-DUR
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Age Add Duration";
    }
#CD200B CHANGES START HERE    
    OUT MIR-DTH-AGE-DUR-3CI
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Death - Age Add Duration(3CI)";
    }
#CD200B CHANGES ENDS HERE 
    OUT MIR-CON-PREV-DIS-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - Previous";
    }
    OUT MIR-CON-CRNT-DIS-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - Current";
    }
    OUT MIR-CON-BLD-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - Build";
    }
    OUT MIR-CON-PULSE-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - Pulse";
    }
    OUT MIR-CON-BD-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - BD";
    }
    OUT MIR-CON-URINE-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - Urine";
    }
    OUT MIR-CON-BLOOD-SUGAR-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - Sugar";
    }
    OUT MIR-CON-LIVER-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - Liver";
    }
    OUT MIR-CON-LIPID-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - Lipid";
    }
    OUT MIR-CON-ANEM-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - Anemia";
    }
    OUT MIR-CON-ECG-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - ECG";
    }
    OUT MIR-CON-OTHR-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - Other";
    }
    OUT MIR-CON-CORR-CD
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - Merit";
    }
    OUT MIR-CON-TOT-AMT
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "CVG-LIEN-DUR";
        DBTableName = "TUWFD";
        SType = "Selection";
        Label = "S - Total";
    }
    OUT MIR-CON-MR-CD
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "S - MR";
    }
#TV2003    OUT MIR-CON-TOT-TVI-AMT
#TV2003    {
#TV2003        Length = "03";
#TV2003        DBTableName = "TUWFD";
#TV2003        SType = "Text";
#TV2003        Label = "S - Total(TVI)";
#TV2003    }
#TV2003    OUT MIR-CON-MR-TVI-CD
#TV2003    {
#TV2003        Length = "04";
#TV2003        DBTableName = "TUWFD";
#TV2003        SType = "Text";
#TV2003        Label = "S - MR(TVI)";
#TV2003    }
#TV2003    OUT MIR-CON-MR-DUR
#TV2003    {
#TV2003        Length = "01";
#TV2003        DBTableName = "TUWFD";
#TV2003        SType = "Text";
#TV2003        Label = "S - MR Duration(TVI)";
#TV2003    }
    OUT MIR-CON-AGE-DUR
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "S - Age Add Duration";
    }
#CD200B CHANGES START HERE
    OUT MIR-CON-AGE-DUR-3CI
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "S - Age Add Duration(3CI)";
    }
#CD200B CHANGES ENDS HERE
    OUT MIR-MEDIC-PREV-DIS-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Previous";
    }
    OUT MIR-MEDIC-CRNT-DIS-CD
    {

        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Current";
    }
    OUT MIR-MEDIC-BLD-CD
    {
        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Build";
    }
    OUT MIR-MEDIC-PULSE-CD
    {

        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Pulse";
    }
    OUT MIR-MEDIC-BD-CD
    {

        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - BD";
    }
    OUT MIR-MEDIC-URINE-CD
    {

        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Urine";
    }
    OUT MIR-MEDIC-BLOOD-SUGAR-CD
    {

        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Sugar";
    }
    OUT MIR-MEDIC-LIVER-CD
    {

        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Liver";
    }
    OUT MIR-MEDIC-LIPID-CD
    {

        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Lipid";
    }
    OUT MIR-MEDIC-ANEM-CD
    {

        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Anemia";
    }
    OUT MIR-MEDIC-ECG-CD
    {

        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - ECG";
    }
    OUT MIR-MEDIC-OTHR-CD
    {

        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Other";
    }
    OUT MIR-MEDIC-CORR-CD
    {

        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Merit";
    }
    OUT MIR-MEDIC-TOT-AMT
    {

        Length = "05";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Total";
    }
    OUT MIR-MEDIC-MR-CD
    {

        Length = "04";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - MR";
    }
#TV2003    OUT MIR-MEDIC-TOT-TVI-AMT
#TV2003    {
#TV2003        Length = "05";
#TV2003        DBTableName = "TUWFD";
#TV2003        SType = "Text";
#TV2003        Label = "Hospital - Total(TVI)";
#TV2003    }
#TV2003    OUT MIR-MEDIC-MR-TVI-CD
#TV2003    {
#TV2003        Length = "04";
#TV2003        DBTableName = "TUWFD";
#TV2003        SType = "Text";
#TV2003        Label = "Hospital - MR(TVI)";
#TV2003    }
#TV2003    OUT MIR-MEDIC-MR-DUR
#TV2003    {
#TV2003        Length = "03";
#TV2003        DBTableName = "TUWFD";
#TV2003        SType = "Text";
#TV2003        Label = "Hospital - MR Duration(TVI)";
#TV2003    }
    OUT MIR-MEDIC-AGE-DUR
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Age Add Duration";
    }
#CD200B CHANGES START HERE
    OUT MIR-MEDIC-AGE-DUR-3CI
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Hospital - Age Add Duration(3CI)";
    }
#CD200B CHANGES ENDS HERE    
    OUT MIR-EXCL-FLD1
    {
        Length = "16";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Exclusion - field1";
    }
    OUT MIR-EXCL-FLD2
    {
        Length = "16";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Exclusion - field2";
    }
    OUT MIR-EXCL-FLD3
    {
        Length = "16";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Exclusion - field3";
    }
    OUT MIR-EXCL-FLD4
    {
        Length = "16";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Exclusion - field4";
    }
    OUT MIR-EXCL-FLD5
    {
        Length = "16";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Exclusion - field5";
    }
    OUT MIR-EXCL-FLD6
    {
        Length = "16";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Exclusion - field6";
    }
    OUT MIR-EXCL-FLD7
    {
        Length = "32";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Exclusion - field7";
    }
    OUT MIR-EXCL-FLD8
    {
        Length = "32";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Exclusion - field8";
    }
    OUT MIR-EXCL-FLD9
    {
        Length = "32";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Exclusion - field9";
    }
    OUT MIR-EXCL-FLD10
    {
        Length = "32";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Exclusion - field10";
    }
# S23056 CHANGES STARTS    
    OUT MIR-SCOND-DT-TIME-TXT
    {
        Length = "16";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Print Date";  
    }
# S23056 CHANGES END        
    OUT MIR-EXCL-POL-ID-T [10]
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
    }
    OUT MIR-PROD-APP-TYP-CD-T [10]
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-PROD-APP-TYP";        
        DBTableName = "TEDIT";
        SType = "Text";
        Label = "Product Application Type";
    }
    OUT MIR-AMEND-CRTE-EXCL-IND-T [10]
    {
        Length = "01";
        DBTableName = "TAMEX";
        SType = "Text";
        Label = "Amendment Create(Exclusion)";
    }    
    OUT MIR-AMEND-CRTE-IND-T [10]
    {
        Length = "01";
        DBTableName = "TAMEX";
        SType = "Text";
        Label = "Amendment Create(Amendment)";
    }
    OUT MIR-CLI-UWGDECN-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CLI-UWGDECN-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client Decision";
    }
    OUT MIR-MLJ-HLTH-ASSESS-CD
    {
        Length = "02";
        DBTableName = "TUWFD";
        CodeSource = "EDIT";
        CodeType = "CLDEC";
        SType = "Selection";
        Label = "MLJ DECISION";
    }
    OUT MIR-REINS-HLTH-ASSESS-CD
    {
        Length = "02";
        DBTableName = "TUWFD";
        CodeSource = "EDIT";
        CodeType = "CLDEC";
        SType = "Selection";
        Label = "REINS DECISION";
    }
    OUT MIR-BLOOD-TXT
    {

        Length = "100";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Blood";
    }
    OUT MIR-ECG-TXT
    {

        Length = "100";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "ECG";
    }
    OUT MIR-BLOOD-TEST-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Blood test";
    }
    OUT MIR-ECG-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "ECG";
    }
    OUT MIR-HLTH-CHK-RSLT-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Results of Health check up";
    }
    OUT MIR-MEDIC-RPT-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Medical report";
    }
    OUT MIR-ADDL-SELF-DSCLSRE-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Additional Self Disclosure";
    }
    OUT MIR-DEDCT-SELF-DSCLSRE-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Dedicated Additional Self Disclosure";
    }
    OUT MIR-EXIST-SELF-DSCLSRE-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Existing Policy Self Disclosure";
    }
    OUT MIR-PRE-ISS-RPT-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Pre-issue Report Indicator";
    }
    OUT MIR-HLTH-RPT-RESP-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Doctor/Interviewer/Corporate Health Report";
    }
    OUT MIR-PRLM-UW-RSLT-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Results of Preliminary Underwriting";
    }
    OUT MIR-MEDIC-BNFT-RPT-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Medical Report for the benefit (Claim)";
    }
    OUT MIR-INCMPLT-DOC-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Response to Incomplete documentation";
    }
    OUT MIR-SCR-WRITN-PLDG-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Scrivener's Written Pledge";
    }
    OUT MIR-EXIST-POL-DOC-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Documents of existing policy";
    }
    OUT MIR-OTHRS-IND
    {
        Length = "01";
        DBTableName = "TUWFD";
        SType = "Indicator";
        Label = "Others";
    }
    OUT MIR-OTHRS-DESC-TXT
    {
        Length = "50";
        DBTableName = "TUWFD";
        SType = "TextArea";
        Label = "Comment";
    }
    OUT MIR-UW-USER-NM-T [30]
    {
        Length = "15";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "USER";
        Index = "1";
    }
    OUT MIR-UW-CREAT-DT-T [30]
    {
        Length = "10";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Creation Day";
        Index = "1";
    }
    OUT MIR-UW-NOTE-T [30]
    {
        Length = "200";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "UW Note";
        Index = "1";
     }
    OUT MIR-UW-COMNT-TXT
    {
        Length = "200";
        DBTableName = "TUWFD";
        SType = "TextArea";
        Label = "Underwriter Comment column";
     }
    OUT MIR-REASN-1-CD
    {

        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Reason Code -1";
    }
    OUT MIR-REASN-2-CD
    {

        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Reason Code -2";
    }
    OUT MIR-REASN-3-CD
    {

        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Reason Code -3";
    }

    OUT MIR-REASN-4-CD
    {

        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Reason Code -4";
    }
    OUT MIR-REASN-5-CD
    {

        Length = "03";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Reason Code -5";
    }
    
    OUT MIR-FRST-DFCT-1-CD
    {
        Length = "07";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -1";
    }
    
    OUT MIR-FRST-DFCT-2-CD
    {
        Length = "06";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -2";
    }
    
    OUT MIR-FRST-ELAPS-YRS-DUR
    {
        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Elapsed Years";
    }
    
    OUT MIR-FRST-SURGY-1-CD
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 1";
    }
    OUT MIR-FRST-SURGY-2-CD
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 2";
    }
    OUT MIR-FRST-SURGY-3-CD
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 3";
    }
    OUT MIR-FRST-ADDL-INFO-TXT
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Additional Info";
    }
    OUT MIR-SEC-DFCT-1-CD
    {

        Length = "07";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -1";
    }
    OUT MIR-SEC-DFCT-2-CD
    {

        Length = "06";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -2";
    }
    OUT MIR-SEC-ELAPS-YRS-DUR
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Elapsed Years";
    }
    OUT MIR-SEC-SURGY-1-CD
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 1";
    }
    OUT MIR-SEC-SURGY-2-CD
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 2";
    }
    OUT MIR-SEC-SURGY-3-CD
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 3";
    }
    OUT MIR-SEC-ADDL-INFO-TXT
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Additional Info";
    }
    OUT MIR-THRD-DFCT-1-CD
    {

        Length = "07";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -1";
    }
    OUT MIR-THRD-DFCT-2-CD
    {

        Length = "06";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -2";
    }
    OUT MIR-THRD-ELAPS-YRS-DUR
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Elapsed Years";
    }
    OUT MIR-THRD-SURGY-1-CD
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 1";
    }
    OUT MIR-THRD-SURGY-2-CD
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 2";
    }
    OUT MIR-CI-THRD-SURGY-3-CD
    {
        Length = "01";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Surgery Code - 3";
    }
    OUT MIR-THRD-SURGY-3-CD
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 3";
    }
    OUT MIR-THRD-ADDL-INFO-TXT
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Additional Info";
    }
    OUT MIR-FRTH-DFCT-1-CD
    {

        Length = "07";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -1";
    }
    OUT MIR-FRTH-DFCT-2-CD
    {

        Length = "06";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -2";
    }
    OUT MIR-FRTH-ELAPS-YRS-DUR
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Elapsed Years";
    }
    OUT MIR-FRTH-SURGY-1-CD
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 1";
    }
    OUT MIR-FRTH-SURGY-2-CD
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 2";
    }
    OUT MIR-FRTH-SURGY-3-CD
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 3";
    }
    OUT MIR-FRTH-ADDL-INFO-TXT
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Additional Info";
    }
    OUT MIR-FIFTH-DFCT-1-CD
    {

        Length = "07";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -1";
    }
    OUT MIR-FIFTH-DFCT-2-CD
    {

        Length = "06";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -2";
    }
    OUT MIR-FIFTH-ELAPS-YRS-DUR
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Elapsed Years";
    }
    OUT MIR-FIFTH-SURGY-1-CD
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 1";
    }
    OUT MIR-FIFTH-SURGY-2-CD
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 2";
    }
    OUT MIR-FIFTH-SURGY-3-CD
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 3";
    }

    OUT MIR-FIFTH-ADDL-INFO-TXT
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Additional Info";
    }

    OUT MIR-SIXTH-DFCT-1-CD
    {

        Length = "07";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -1";
    }

    OUT MIR-SIXTH-DFCT-2-CD
    {

        Length = "06";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -2";
    }

    OUT MIR-SIXTH-ELAPS-YRS-DUR
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Elapsed Years";
    }

    OUT MIR-SIXTH-SURGY-1-CD
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 1";
    }

    OUT MIR-SIXTH-SURGY-2-CD
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 2";
    }

    OUT MIR-SIXTH-SURGY-3-CD
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 3";
    }

    OUT MIR-SIXTH-ADDL-INFO-TXT
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Additional Info";
    }

    OUT MIR-SVNTH-DFCT-1-CD
    {

        Length = "07";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -1";
    }

    OUT MIR-SVNTH-DFCT-2-CD
    {

        Length = "06";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -2";
    }

    OUT MIR-SVNTH-ELAPS-YRS-DUR
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Elapsed Years";
    }

    OUT MIR-SVNTH-SURGY-1-CD
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 1";
    }

    OUT MIR-SVNTH-SURGY-2-CD
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 2";
    }

    OUT MIR-SVNTH-SURGY-3-CD
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 3";
    }

    OUT MIR-SVNTH-ADDL-INFO-TXT
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Additional Info";
    }

    OUT MIR-EIGTH-DFCT-1-CD
    {

        Length = "07";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -1";
    }

    OUT MIR-EIGTH-DFCT-2-CD
    {

        Length = "06";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -2";
    }

    OUT MIR-EIGTH-ELAPS-YRS-DUR
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Elapsed Years";
    }

    OUT MIR-EIGTH-SURGY-1-CD
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 1";
    }

    OUT MIR-EIGTH-SURGY-2-CD
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 2";
    }

    OUT MIR-EIGTH-SURGY-3-CD
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 3";
    }
    OUT MIR-EIGTH-ADDL-INFO-TXT
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Additional Info";
    }
    OUT MIR-NINTH-DFCT-1-CD
    {

        Length = "07";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -1";
    }

    OUT MIR-NINTH-DFCT-2-CD
    {

        Length = "06";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Defect Code -2";
    }
    OUT MIR-NINTH-ELAPS-YRS-DUR
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Elapsed Years";
    }
    OUT MIR-NINTH-SURGY-1-CD
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 1";
    }
    OUT MIR-NINTH-SURGY-2-CD
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 2";
    }
    OUT MIR-NINTH-SURGY-3-CD
    {

        Length = "02";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Surgery Code - 3";
    }
    OUT MIR-NINTH-ADDL-INFO-TXT
    {

        Length = "20";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Additional Info";
    }
    OUT MIR-REQIR-ID-T[20]
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Requirement";
        Index = "1";
    }

    OUT MIR-REQIR-CAT-CD-T[20]
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "RQCAT";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Category";
        Index = "1";
    }

    OUT MIR-REQIR-COMNT-INFO-TXT-T[20]
    {
        Length = "200";
        DBTableName = "TREQT";
        SType = "TextArea";
        Label = "Comment";
        Index = "1";
    }
    OUT MIR-CPREQ-STAT-CD-T[20]
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CPREQ-STAT-CD";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Requirement Status";
        Index = "1";
    }
    OUT MIR-USER-ID-T[20]
    {
        Length = "8";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Updated By";
        Index = "1";
    }

    OUT MIR-CPREQ-SEQ-NUM-T[20]
    {
        Length = "3";
        DBTableName = "TREQT";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

   OUT MIR-ISS-REQIR-ID-T[20]
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Requirement";
        Index = "1";
    }
    OUT MIR-ISS-REQIR-CAT-CD-T[20]
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "RQCAT";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Category";
        Index = "1";
    }
    OUT MIR-ISS-REQIR-COMNT-TXT-T[20]
    {
        Length = "200";
        DBTableName = "TREQT";
        SType = "TextArea";
        Label = "Comment";
        Index = "1";
    }
    OUT MIR-ISS-CPREQ-STAT-CD-T[20]
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CPREQ-STAT-CD";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Requirement Status";
        Index = "1";
    }
    OUT MIR-ISS-USER-ID-T[20]
    {
        Length = "8";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Updated By";
        Index = "1";
    }

    OUT MIR-ISS-CPREQ-SEQ-NUM-T[20]
    {
        Length = "3";
        DBTableName = "TREQT";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-ISS-POL-ID-T [20]
    {
       Length = "10";
       DBTableName = "TPOL";
       SType = "Text";
       Label = "Policy ID";
        Index = "1";
    }
   OUT MIR-NEW-UW-REQIR-ID-T[15]
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Requirement";
        Index = "1";        
    }

    OUT MIR-NEW-UW-REQIR-CAT-CD-T[15]
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "URCAT";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Category";
        Index = "1";
    }

    OUT MIR-NEW-UW-REQIR-COMNT-TXT-T[15]
    {
        Length = "200";
        DBTableName = "TREQT";
        SType = "TextArea";
        Label = "Comment";
        Index = "1";        
    }
    OUT MIR-NEW-ISS-POL-ID-T [5]
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";       
    }
   OUT MIR-NEW-ISS-REQIR-ID-T[5]
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Requirement";
        Index = "1";
    }

    OUT MIR-NEW-ISS-REQIR-CAT-CD-T[5]
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "IRCAT";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Category";
        Index = "1";        
    }

    OUT MIR-NEW-ISS-REQIR-COMNT-TXT-T[5]
    {
        Length = "200";
        DBTableName = "TREQT";
        SType = "TextArea";
        Label = "Comment";
        Index = "1";
    }
    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
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
    INOUT MIR-POL-CTR
    {   
        Length = "2";
        SType = "Hidden";
        Label = "Policy Counter";
    }
#TLB015 CHANGES STARTS HERE
    OUT MIR-REINS-TYP-CD-T[55]
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