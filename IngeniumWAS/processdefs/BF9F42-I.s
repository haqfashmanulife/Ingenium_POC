# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT
#*******************************************************************************
#*  Component:   BF9F42-I.s                                                    *
#*  Description: For LINOUTC overlapping Purchase List                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP310A   CTS      INITIAL VERSION - NB IMPROVEMENTS                        *
#*  109518   CTS      CHANGES DONE FOR LINK SCREEN CHECK                       *
#*  110345  CTS       CHANGES DONE FOR UW COMMENT HISTORY FIELD                *
#*  MP310K  CTS       CHANGES DONE FOR MP310 PRODUCTION ISSUE                  *
#*  UY403B   CTS      INGENIUM LINC COMPANY CHECK SCREEN CHANGES               *
#*  TLB003   CTS      CHANGES FOR TLB NB                                       *
#*  26878B   CTS      INGENIUM DONE FOR ADDITION OF NEW FIELDS                 *
#*  27676A   CTS      CHANGES DONE FOR LINC ITEMS AND TIMES                    *
#*******************************************************************************

S-STEP BF9F42-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        FocusField = "MIR-DEL-IND-T[1]";
        FocusFrame = "ContentFrame";
        DelEmptyRows;
        Type = "Input";
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
        SType="Hidden";
    }
  
    OUT index
    {
        SType = "Hidden";
    }
  
    IN MIR-POL-ID
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
    }
  
    IN MIR-CLI-ID
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Hidden";
        Label = "Client Id";
    }
  
    IN MIR-POL-APP-FORM-ID
    {
        DisplayOnly;
        Label = "Application Number";
        Length = "11";
        DBTableName = "TLINC";
        SType = "Text";
    }
  
    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Label = "Policy Holder Name";
        Length = "75";
        DBTableName = "TLINC";
        SType = "Text";
    }
    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        DBTableName = "TLINC";
        Label = "Insured Name";
    }
#MP310K CHANGES START HERE
#    INOUT MIR-DEL-IND-T[20]
    INOUT MIR-DEL-IND-T[30]
    {
        Length = "01";
        SType = "Indicator";
        DBTableName = "TLNCC";
        Label = "Delete";
        Index = "1";
    } 
#    IN MIR-CO-ID-T[20]
    IN MIR-CO-ID-T[30]
    {
        DisplayOnly;
        Label = "Company Code";
        Length = "02";
        DBTableName = "TLNCC";
        SType = "Text";
        Index = "1";
    }
#    IN MIR-CO-NM-T[20]
    IN MIR-CO-NM-T[30]
    {
        DisplayOnly;
        Label = "Company Name";
        Length = "36";
        DBTableName = "TLNCC";
        SType = "Text";
        Index = "1";
    }
#    IN MIR-ORD-DB-AMT-T[20]
    IN MIR-ORD-DB-AMT-T[30]
    {
        DisplayOnly;
        Label = "Death face amount";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
        Index = "1";
    }
#    IN MIR-ACC-DB-AMT-T[20]
    IN MIR-ACC-DB-AMT-T[30]
    {
        DisplayOnly;
#27676A CHANGES START HERE
#       Label = "Accidental death face amount";
        Label = "Accidental Death Face Additional Amount";
#27676A CHANGES END HERE
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
        Index = "1";
    }    
#    IN MIR-MEDIC-BNFT-DLY-AMT-T[20]
    IN MIR-MEDIC-BNFT-DLY-AMT-T[30]
    {
        DisplayOnly;
        Label = "Hospitalization Daily Benefit";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
        Index = "1";
    }
#    IN MIR-ACC-BNFT-DLY-AMT-T[20]
    IN MIR-ACC-BNFT-DLY-AMT-T[30]
    {
        DisplayOnly;
        Label = "Accident daily benefit";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
        Index = "1";
    }
#    IN MIR-POL-OWN-CLI-NM-T[20]
    IN MIR-POL-OWN-CLI-NM-T[30]
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        DBTableName = "TLNCC";
        Label = "Policy Holder Name";
        Index = "1";
    }
#    IN MIR-INSRD-CLI-ADDR-T[20]
    IN MIR-INSRD-CLI-ADDR-T[30]
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        DBTableName = "TLNCC";
        Label = "Insured Address";
        Index = "1";
    }
#    IN MIR-LINC-ISSUE-DT-T [20]
    IN MIR-LINC-ISSUE-DT-T [30]
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TLNCC";
        SType = "Date";
        Label = "Issue date";
        Index = "1";
    }
#    IN MIR-LINC-APP-REG-DT-T [20]
    IN MIR-LINC-APP-REG-DT-T [30]
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TLNCC";
        SType = "Date";
        Label = "Date of registration application";
        Index = "1";
    }
#    IN MIR-LINC-COM-USE-T [20]
    IN MIR-LINC-COM-USE-T [30]
#MP310K CHANGES ENDS HERE
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        DBTableName = "TLNCC";
        Label = "Column for each company use 1";
        Index = "1";
    }
#27676A CHANGES START HERE
    IN MIR-LS-DIS-BNFT-AMT-T[30]
    {
        DisplayOnly;
        Label = "Lifestyle Disease Daily Benefit";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
        Index = "1";
    }
    IN MIR-FDIS-HOSP-BNFT-AMT-T[30]
    {
        DisplayOnly;
        Label = "Female Disease Daily Benefit";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
        Index = "1";
    }
    IN MIR-OTHR-HOSP-BNFT-AMT-T[30]
    {
        DisplayOnly;
        Label = "Other Hospitalization Daily Benefit";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
        Index = "1";
    }
    IN MIR-HOSP-LMPSM-AMT-T[30]
    {
        DisplayOnly;
        Label = "Hospitalization Lump Sum Benefit";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
        Index = "1";
    }
    IN MIR-MEDIC-BNFT-QTY-T[30]
    {
        DisplayOnly;
        Label = "Advanced Medical Benefit Count";
        Length = "02";
        DBTableName = "TLNCC";
        SType = "TEXT";
        Index = "1";
    }
    IN MIR-CNCR-BNFT-AMT-T[30]
    {
        DisplayOnly;
        Label = "Cancer Lump Sum Benefit";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
        Index = "1";
    }
    IN MIR-IP-BNFT-AMT-T[30]
    {
        DisplayOnly;
        Label = "Living Income Protection Monthly Benefit";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
        Index = "1";
    }
    IN MIR-AD-BNFT-AMT-T[30]
    {
        DisplayOnly;
        Label = "Accidental Death Benefit Amount";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
        Index = "1";
    }
#27676A CHANGES ENDS HERE

     IN MIR-TOT-DB-AMT
    {
        DisplayOnly;
#27676A CHANGES START HERE	
#        Label = "Total Death Benefit";
        Label = "Total Death Face Amount";
#27676A CHANGES END HERE
        Length = "17";
        DBTableName = "TLINC";
        SType = "Currency";
    }
    IN MIR-TOT-ACC-DB-AMT
    {
        DisplayOnly;
#27676A CHANGES START HERE
#        Label = "Total Accidental Death Benefit";       
        Label = "Total Accidental Death Face Additional Amount";
#27676A CHANGES END HERE
        Length = "17";
        DBTableName = "TLINC";
        SType = "Currency";
    }
    IN MIR-TOT-HOSP-BNFT-AMT
    {
        DisplayOnly;
#27676A CHANGES START HERE       
#        Label = "Total Hospitalization benefit";       
        Label = "Total Hospitalization Daily Amount";
#27676A CHANGES END HERE
        Length = "17";
        DBTableName = "TLINC";
        SType = "Currency";
    }
    IN MIR-TOT-ACC-BNFT-AMT
    {
        DisplayOnly;
#27676A CHANGES START HERE       
#        Label = "Total Accidental Hospitalization benefit";       
        Label = "Total Accidental Hospitalization Amount";
#27676A CHANGES END HERE 
        Length = "17";
        DBTableName = "TLINC";
        SType = "Currency";
    }
#27676A CHANGES START HERE
    IN MIR-TOT-LS-DIS-BNFT-AMT
    {
        DisplayOnly;
        Label = "Total Lifestyle Disease Daily Amount";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
    }
    IN MIR-TOT-FDIS-HOSP-BNFT-AMT
    {
        DisplayOnly;
        Label = "Total Female Disease Daily Benefit Amount";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
    }
    IN MIR-TOT-OTHR-HOSP-BNFT-AMT
    {
        DisplayOnly;
        Label = "Total Other Hospitalization Daily Amount";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
    }
    IN MIR-TOT-HOSP-LMPSM-AMT
    {
        DisplayOnly;
        Label = "Total Hospitalization Lump Sum Amount";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
        Index = "1";
    }
    IN MIR-TOT-MEDIC-BNFT-QTY
    {
        DisplayOnly;
        Label = "Total Advanced Medical Count";
        Length = "02";
        DBTableName = "TLNCC";
        SType = "TEXT";
    }
    IN MIR-TOT-CNCR-BNFT-AMT
    {
        DisplayOnly;
        Label = "Total Cancer Lump Sum Amount";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
    }
    IN MIR-TOT-IP-BNFT-AMT
    {
        DisplayOnly;
        Label = "Total Living Income Protection Monthly Amount";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
    }
    IN MIR-TOT-AD-BNFT-AMT
    {
        DisplayOnly;
        Label = "Total Accidental Death Amount";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
    }
#27676A CHANGES ENDS HERE    
 
    INOUT MIR-SAME-POL-HLDR-AMT
    {
        Label = "Same Policy Holder";
        DBTableName = "TLINC";
#109518 CHANGES START HERE
#        Length = "17";
         Length = "9";
#109518 CHANGES ENDS HERE         
        SType = "Currency";
    }
    INOUT MIR-OTHR-CO-AMT
    {
        Label = "Other Company";
        DBTableName = "TLINC";
#109518 CHANGES START HERE
#        Length = "17";
         Length = "9";
#109518 CHANGES ENDS HERE         
        SType = "Currency";
    }
    INOUT MIR-INDV-POL-AMT
    {
        Label = "Individual Policy";
        DBTableName = "TLINC";
#109518 CHANGES START HERE
#        Length = "17";
         Length = "9";
#109518 CHANGES ENDS HERE 
        SType = "Currency";
    }
    INOUT MIR-ANN-INC-AMT
    {
        Label = "Annual Income";
        DBTableName = "TLINC";
#109518 CHANGES START HERE
#        Length = "17";
         Length = "9";
#109518 CHANGES ENDS HERE 
        SType = "Currency";
    }
    INOUT MIR-ANN-SAL-AMT
    {
        Label = "Annual Sales";
        DBTableName = "TLINC";
#109518 CHANGES START HERE
#        Length = "17";
         Length = "9";
#109518 CHANGES ENDS HERE 
        SType = "Currency";
    }
    INOUT MIR-ANN-INC-MUL-IND
    {
        Label = "Annual Income Multiplier Indicator";
        Length = "01";
        DBTableName = "TLINC";
        SType = "YesNoUnanswered";
    }
    INOUT MIR-ANN-SAL-CRT-IND
    {
        Label = "Annual Sales Criterian Indicator";
        Length = "01";
        DBTableName = "TLINC";
        SType = "YesNoUnanswered";
    }   
#109518 CHANGES START HERE   
    INOUT MIR-ANN-INC-FCT
    {
        Label = "Annual Income Multiplier";
        Length = "3";
        Decimals = "0";
        DBTableName = "TLINC";
        SType = "Number";
    }
    INOUT MIR-ANN-SAL-FCT
    {
        Label = "Annual Sales Criterian";
        Length = "3";
        Decimals = "0";
        DBTableName = "TLINC";
        SType = "Number";
    }
#109518 CHANGES ENDS HERE     
    INOUT MIR-INT-REGL-YES-IND
    {
        Label = "Internal Regulations Applied";
        Length = "01";
        DBTableName = "TLINC";
        SType = "YesNoUnanswered";
    }
    INOUT MIR-INT-REGL-NO-IND
    {
        Label = "No Internal Regulations Applied";
        Length = "01";
        DBTableName = "TLINC";
        SType = "YesNoUnanswered";
    }
    INOUT MIR-INS-CRT-IND
    {
        Label = "Insured amount exceed indicator(Unknown is No)";
        Length = "01";
        DBTableName = "TLINC";
        SType = "Indicator";
    }
    INOUT MIR-CO-INFM-IND
    {
        Label = "Company Information";
        Length = "01";
        DBTableName = "TLINC";
        SType = "YesNoUnanswered";
    }
    INOUT MIR-CO-SCOR-IND
    {
        Label = "Company Score";
        Length = "01";
        DBTableName = "TLINC";
        SType = "YesNoUnanswered";
    }
    INOUT MIR-CPTL-DFCT-IND
    {
        Label = "Capital Deficit";
        Length = "01";
        DBTableName = "TLINC";
        SType = "YesNoUnanswered";
    }
    INOUT MIR-DFCT-CNSC-IND
    {
        Label = "Consecutive Deficits";
        Length = "01";
        DBTableName = "TLINC";
        SType = "YesNoUnanswered";
    }
    
#110345 CHANGES START HERE
#    IN MIR-UW-USER-NM-T[5]
    IN MIR-UW-USER-NM-T[30]
    {
        DisplayOnly;
        Length = "15";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "USER";
        Index = "1";
    }
#    IN MIR-UW-CREAT-DT-T[5]
    IN MIR-UW-CREAT-DT-T[30]
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TUWFD";
        SType = "Date";
        Label = "Creation Day";
        Index = "1";
    }
#    IN MIR-UW-DECISN-CD-T[5]
    IN MIR-UW-DECISN-CD-T[30]
    {
        DisplayOnly;
        Length = "01";
        CodeSource = "EDIT";
        CodeType = "UWDCD";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Acceptance / Refusal";
    }
#    IN MIR-UW-COMNTS-T[5]
    IN MIR-UW-COMNTS-T[30]
    {
        DisplayOnly;
        Length = "200";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Underwriter Comment Column ";
        Index = "1";
     }
#110345 CHANGES END HERE
    INOUT MIR-ACCPT-UW1-IND
    {
        Length = "01";
        CodeSource = "EDIT";
        CodeType = "UWDCD";
        DBTableName = "TEDIT";
        SType = "Selection";
        Label = "Acceptance / Refusal";
    }
    INOUT MIR-UW-COMNT-TXT
    {
        Length = "200";
        DBTableName = "TUWFD";
        SType = "TextArea";
        Label = "Underwriter Comment";
     }

#UY403B CHANGES START HERE
    INOUT MIR-MANL-DEL-IND-T[30]
    {
        Length = "01";
        SType = "Indicator";
        DBTableName = "TLNCC";
        Label = "Delete";
        Index = "1";
    }
    INOUT MIR-MANL-POL-TYP-CD-T[30]
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-TYP-CD";
        SType = "Selection";
        Label = "Policy Type";
        Index = "1";        
    }
    INOUT MIR-MANL-CO-ID-T[30]
    {
        DisplayOnly;
        Label = "Company Code";
        Length = "02";
        DBTableName = "TLNCC";
        SType = "Text";
        Index = "1";
    }
    INOUT MIR-MANL-CO-NM-T[30]
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "CNMCD";
        SType = "Selection";
        Label = "Company Name";
        Index = "1";
    }
    INOUT MIR-MANL-ORD-DB-AMT-T[30]
    {
        Label = "Death Face Amount";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
        Index = "1";
    }
    INOUT MIR-MANL-POL-OWN-CLI-NM-T[30]
    {
        Length = "75";
        SType = "Text";
        DBTableName = "TLNCC";
        Label = "Policy Holder Name";
        Index = "1";
    }
    INOUT MIR-MANL-INS-TYP-CD-T[30]
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "INS-TYP-CD";
        SType = "Selection";
        Label = "Insurance Type";
        Index = "1";        
    }
    INOUT MIR-MANL-COEFF-FCT-T[30]
    {    
        Label = "Coefficient";
        Length = "3";
        Decimals = "2";
        SType = "Number";
        Index = "1";        
    }
    IN MIR-MANL-JDGMNT-S-AMT-T[30]
    {
        DisplayOnly;
        Label = "Judgment S";
        Length = "17";
        SType = "Currency";
        Index = "1";  
    }
    INOUT MIR-MANL-CNTNU-CNSDR-CD-T[30]
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CNTNU-CNSDR-CD";
        SType = "Selection";
        Label = "Continuation Consideration";
        Index = "1";        
    }
    IN MIR-MANL-TOT-BNFT-AMT
    {
        DisplayOnly;
        Label = "Total Benefit Amount";
        Length = "17";
        SType = "Currency";
    }
    IN MIR-MANL-TOT-JDGMNT-S-AMT
    {
        DisplayOnly;
        Label = "Total Judgment S";
        Length = "17";
        SType = "Currency";
    }    
    INOUT MIR-MANL-ANN-SALE-AMT
    {
        Label = "Annual Sales";
        DBTableName = "TLNCC";
#TLB003 CHANGES START HERE
#TLB003 Length = "17";
        Length = "09";
#TLB003 SType = "Currency";
        SType = "Number";
#TLB003 CHANGES END HERE
    }
    IN MIR-MANL-CNVR-ANN-SALE-AMT
    {
        DisplayOnly;
        Label = "Face Amount converted To Annual Sales";
        Length = "17";
#TLB003 CHANGES START HERE
#TLB003 SType = "Currency";
        SType = "Text";
#TLB003 CHANGES END HERE
    }
    IN MIR-MANL-UW-JDGMNT-CD
    {
        DisplayOnly;
        Label = "Underwriting Judgment Of Annual Sales";
        Length = "2";
        SType = "Text";
    }
    IN MIR-MANL-MIN-ANN-SALE-AMT
    {
        DisplayOnly;
        Label = "Minimum Annual Sales Required";
        Length = "17";
#TLB003 CHANGES START HERE
#TLB003 SType = "Currency";
        SType = "Text";
#TLB003 CHANGES END HERE
    }
    INOUT MIR-MANL-ANN-INCM-AMT
    {
#26878B CHANGES START HERE
#       Label = "Annual Income";
        Label = "Insured Annual Income";
#26878B CHANGES END HERE
        DBTableName = "TLNCC";        
#TLB003 CHANGES START HERE
#TLB003 Length = "17";
        Length = "09";
#TLB003 SType = "Currency";
        SType = "Number";
#TLB003 CHANGES END HERE
    }
    INOUT MIR-MANL-ANN-INCM-FCT
    {
        Label = "Annual Income Ratio";
        DBTableName = "TLNCC";        
        Length = "02";
        SType = "Text";
    }
    IN MIR-MANL-CNVR-ANN-INCM-AMT
    {
        DisplayOnly;
        Label = "Face Amount converted To Annual Income";
        Length = "17";
#TLB003 CHANGES START HERE
#TLB003 SType = "Currency";
        SType = "Text";
#TLB003 CHANGES END HERE
    }
    IN MIR-MANL-UW-JDGMNT-INCM-CD
    {
        DisplayOnly;
        Label = "Underwriting Judgment Of Annual Income";
        Length = "2";
        SType = "Text";
    }
    IN MIR-MANL-MIN-ANN-INCM-AMT
    {
        DisplayOnly;
        Label = "Minimum Annual Income Required";
        Length = "17";
#TLB003 CHANGES START HERE
#TLB003 SType = "Currency";
        SType = "Text";
#TLB003 CHANGES END HERE
    }
    INOUT MIR-MANL-SEQ-NUM-T[30]
    {
        Length = "03";
        DBTableName = "TLNCC";
        SType = "Hidden";
        Index = "1";
    }
    INOUT MIR-MANL-UW-COMNT-1-TXT
    {
        Length = "400";
        DBTableName = "TUWFD";
        SType = "TextArea";
        Label = "Underwriter Comment Column";
     }
    INOUT MIR-MANL-UW-COMNT-2-TXT
    {
        Length = "400";
        DBTableName = "TUWFD";
        SType = "TextArea";
        Label = "Underwriter Comment Column";
     }
#UY403B CHANGES ENDS HERE

#26878B CHANGES START HERE
    INOUT MIR-OWN-ANN-INCM-AMT
    {
	    DBTableName = "TCLII";
        Label = "Policyholder Annual Income";
        Length = "09";
        SType = "Number";
    }

    INOUT MIR-OWN-FIN-ASSET-AMT
    {
        DBTableName = "TCLII";
        Label = "Policyholder Total Financial Assets";
        Length = "09";
        SType = "Number";
    }
#26878B CHANGES END HERE
}