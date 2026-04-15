# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF9F42-P.p                                                    *
#*  Description: For Updating a Underwrite's Final Decision                    *
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

P-STEP BF9F42-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9F42";
        BusinessFunctionName = "Linc Overlapping Purchase List";
        BusinessFunctionType = "Update";
        MirName = "NCWM9F40";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;
    
    INOUT MIR-POL-ID
    {
        Length = "10";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID";        
        SType = "Text";
        Label = "Policy ID";
    }
    INOUT MIR-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Id";
    }

    INOUT MIR-POL-APP-FORM-ID
    {
          Label = "Application Number";
          Length = "11";
          DBTableName = "TLINC";
          SType = "Text";
    }
      
    INOUT MIR-DV-OWN-CLI-NM
    {
        Label = "Policy Holder Name";
        Length = "75";
        DBTableName = "TLINC";
        SType = "Text";
    }
    INOUT MIR-DV-INSRD-CLI-NM
    {
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
#    INOUT MIR-CO-ID-T[20]
    INOUT MIR-CO-ID-T[30]
    {
        DisplayOnly;
        Label = "Company Code";
        Length = "02";
        DBTableName = "TLNCC";
        SType = "Text";
        Index = "1";
    }
#    INOUT MIR-CO-NM-T[20]
    INOUT MIR-CO-NM-T[30]
    {
        Label = "Company Name";
        Length = "36";
        DBTableName = "TLNCC";
        SType = "Text";
        Index = "1";
    }
#    INOUT MIR-ORD-DB-AMT-T[20]   
    INOUT MIR-ORD-DB-AMT-T[30]
    {
        Label = "Death face amount";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
        Index = "1";
    }
#    INOUT MIR-ACC-DB-AMT-T[20]
    INOUT MIR-ACC-DB-AMT-T[30]
    {
#27676A CHANGES START HERE
#       Label = "Accidental death face amount";
        Label = "Accidental Death Face Additional Amount";
#27676A CHANGES END HERE
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
        Index = "1";
    } 
#    INOUT MIR-MEDIC-BNFT-DLY-AMT-T[20]   
    INOUT MIR-MEDIC-BNFT-DLY-AMT-T[30]
    {
        Label = "Hospitalization Daily Benefit";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
        Index = "1";
    }
#    INOUT MIR-ACC-BNFT-DLY-AMT-T[20] 
    INOUT MIR-ACC-BNFT-DLY-AMT-T[30]
    {
        Label = "Accident daily benefit";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
        Index = "1";
    }
#    INOUT MIR-POL-OWN-CLI-NM-T[20]
    INOUT MIR-POL-OWN-CLI-NM-T[30]
    {
        Length = "75";
        SType = "Text";
        DBTableName = "TLNCC";
        Label = "Policy Holder Name";
        Index = "1";
    }
#    INOUT MIR-INSRD-CLI-ADDR
    INOUT MIR-INSRD-CLI-ADDR-T[30]
    {
        Length = "50";
        SType = "Text";
        DBTableName = "TLNCC";
        Label = "Insured Address";
        Index = "1";
    }
#    INOUT MIR-LINC-ISSUE-DT-T [20]
    INOUT MIR-LINC-ISSUE-DT-T [30]
    {
        Length = "10";
        DBTableName = "TLNCC";
        SType = "Date";
        Label = "Issue date";
        Index = "1";
    }
#    INOUT MIR-LINC-APP-REG-DT-T [20]
    INOUT MIR-LINC-APP-REG-DT-T [30]
    {
        Length = "10";
        DBTableName = "TLNCC";
        SType = "Date";
        Label = "Date of registration application";
        Index = "1";
    }
#    INOUT MIR-LINC-COM-USE-T [20]
    INOUT MIR-LINC-COM-USE-T [30]
#MP310K CHANGES ENDS HERE
    {
        Length = "40";
        SType = "Text";
        DBTableName = "TLNCC";
        Label = "Column for each company use 1";
        Index = "1";
    }
#27676A CHANGES START HERE
    INOUT MIR-LS-DIS-BNFT-AMT-T[30]
    {
        Label = "Lifestyle Disease Daily Benefit";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
        Index = "1";
    }
    INOUT MIR-FDIS-HOSP-BNFT-AMT-T[30]
    {
        Label = "Female Disease Daily Benefit";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
        Index = "1";
    }
    INOUT MIR-OTHR-HOSP-BNFT-AMT-T[30]
    {
        Label = "Other Hospitalization Daily Benefit";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
        Index = "1";
    }
    INOUT MIR-HOSP-LMPSM-AMT-T[30]
    {
        Label = "Hospitalization LumpSum Benefit";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
        Index = "1";
    }
    INOUT MIR-MEDIC-BNFT-QTY-T[30]
    {
        Label = "Advanced Medical Benefit Count";
        Length = "02";
        DBTableName = "TLNCC";
        SType = "TEXT";
        Index = "1";
    }
    INOUT MIR-CNCR-BNFT-AMT-T[30]
    {
        Label = "Cancer Lump Sum Benefit";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
        Index = "1";
    }
    INOUT MIR-IP-BNFT-AMT-T[30]
    {
        Label = "Living Income Protection Monthly Benefit";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
        Index = "1";
    }
    INOUT MIR-AD-BNFT-AMT-T[30]
    {
        Label = "Accidental Death Benefit Amount";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
        Index = "1";
    }
#27676A CHANGES ENDS HERE

    INOUT MIR-TOT-DB-AMT
    {
#27676A CHANGES START HERE	
#        Label = "Total Death Benefit";
        Label = "Total Death Face Amount";
#27676A CHANGES END HERE
        Length = "17";
        DBTableName = "TLINC";
        SType = "Currency";
    }
    INOUT MIR-TOT-ACC-DB-AMT
    {
#27676A CHANGES START HERE
#        Label = "Total Accidental Death Benefit";       
        Label = "Total Accidental Death Face Additional Amount";
#27676A CHANGES END HERE
        Length = "17";
        DBTableName = "TLINC";
        SType = "Currency";
    }
    INOUT MIR-TOT-HOSP-BNFT-AMT
    {
#27676A CHANGES START HERE       
#        Label = "Total Hospitalization benefit";       
        Label = "Total Hospitalization Daily Amount";
#27676A CHANGES END HERE
        Length = "17";
        DBTableName = "TLINC";
        SType = "Currency";
    }
    INOUT MIR-TOT-ACC-BNFT-AMT
    {
#27676A CHANGES START HERE       
#        Label = "Total Accidental Hospitalization benefit";       
        Label = "Total Accidental Hospitalization Amount";
#27676A CHANGES END HERE 
        Length = "17";
        DBTableName = "TLINC";
        SType = "Currency";
    }
#27676A CHANGES START HERE
    INOUT MIR-TOT-LS-DIS-BNFT-AMT
    {
        Label = "Total Lifestyle Disease Daily Amount";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
    }
    INOUT MIR-TOT-FDIS-HOSP-BNFT-AMT
    {
        Label = "Total Female Disease Daily Benefit Amount";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
    }
    INOUT MIR-TOT-OTHR-HOSP-BNFT-AMT
    {
        Label = "Total Other Hospitalization Daily Amount";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
    }
    INOUT MIR-TOT-HOSP-LMPSM-AMT
    {
        Label = "Total Hospitalization Lump Sum Amount";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
    }
    INOUT MIR-TOT-MEDIC-BNFT-QTY
    {
        Label = "Total Advanced Medical Count";
        Length = "02";
        DBTableName = "TLNCC";
        SType = "TEXT";
    }
    INOUT MIR-TOT-CNCR-BNFT-AMT
    {
        Label = "Total Cancer Lump Sum Amount";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
    }
    INOUT MIR-TOT-IP-BNFT-AMT
    {
        Label = "Total Living Income Protection Monthly Amount";
        Length = "17";
        DBTableName = "TLNCC";
        SType = "Currency";
    }
    INOUT MIR-TOT-AD-BNFT-AMT
    {
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
#    INOUT MIR-UW-USER-NM-T[5]
    INOUT MIR-UW-USER-NM-T[30]
    {
        DisplayOnly;
        Length = "15";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "USER";
        Index = "1";
    }
#    INOUT MIR-UW-CREAT-DT-T[5]
    INOUT MIR-UW-CREAT-DT-T[30]
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TUWFD";
        SType = "Date";
        Label = "Creation Day";
        Index = "1";
    }
#    INOUT MIR-UW-DECISN-CD-T[5]
    INOUT MIR-UW-DECISN-CD-T[30]
    {
        DisplayOnly;
        Length = "01";
        CodeSource = "EDIT";
        CodeType = "UWDCD";
        DBTableName = "TUWFD";
        SType = "Text";
        Label = "Acceptance / Refusal";
    }
#    INOUT MIR-UW-COMNTS-T[5]
    INOUT MIR-UW-COMNTS-T[30]
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
    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
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
        DisplayOnly;
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
    INOUT MIR-MANL-JDGMNT-S-AMT-T[30]
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
    INOUT MIR-MANL-TOT-BNFT-AMT
    {
        DisplayOnly;
        Label = "Total Benefit Amount";
        Length = "17";
        SType = "Currency";
    }
    INOUT MIR-MANL-TOT-JDGMNT-S-AMT
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
    INOUT MIR-MANL-CNVR-ANN-SALE-AMT
    {
        DisplayOnly;
        Label = "Face Amount converted To Annual Sales";
        Length = "17";
#TLB003 CHANGES START HERE
#TLB003 SType = "Currency";
        SType = "Text";
#TLB003 CHANGES END HERE
    }
    INOUT MIR-MANL-UW-JDGMNT-CD
    {
        DisplayOnly;
        Label = "Underwriting Judgment Of Annual Sales";
        Length = "2";
        SType = "Text";
    }
    INOUT MIR-MANL-MIN-ANN-SALE-AMT
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
        Length = "02";
        SType = "Text";
    }
    INOUT MIR-MANL-CNVR-ANN-INCM-AMT
    {
        DisplayOnly;
        Label = "Face Amount converted To Annual Income";
        Length = "17";
#TLB003 CHANGES START HERE
#TLB003 SType = "Currency";
        SType = "Text";
#TLB003 CHANGES END HERE
    }
    INOUT MIR-MANL-UW-JDGMNT-INCM-CD
    {
        DisplayOnly;
        Label = "Underwriting Judgment Of Annual Income";
        Length = "2";
        SType = "Text";
    }
    INOUT MIR-MANL-MIN-ANN-INCM-AMT
    {
        DisplayOnly;
        Label = "Minimum Annual Income Required";
        Length = "17";
#TLB003 CHANGES START HERE
#TLB003 SType = "Currency";
        SType = "Text";
#TLB003 CHANGES END HERE
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
    INOUT MIR-MANL-SEQ-NUM-T[30]
    {
        Length = "03";
        DBTableName = "TLNCC";
        SType = "Hidden";
        Index = "1";
    }
    INOUT MIR-MANL-SAVE-INS-TYP-CD-T[30]
    {
        DBTableName = "TLNCC";
        SType = "Hidden";
        Index = "1";
    }
    INOUT MIR-MANL-SAVE-COEFF-FCT-T[30]
    {
        DBTableName = "TLNCC";
        SType = "Hidden";
        Index = "1";
    }
    INOUT MIR-SAVE-MANL-CO-ID-T[30]
    {
        DBTableName = "TLNCC";
        SType = "Hidden";
        Index = "1";
    }
#UY403B CHANGES ENDS HERE

#26878B CHANGES START HERE
    INOUT MIR-OWN-ANN-INCM-AMT
    {
        DisplayOnly;
        DBTableName = "TCLII";
        Label = "Policyholder Annual Income";
        Length = "09";
        SType = "Number";
    }

    INOUT MIR-OWN-FIN-ASSET-AMT
    {
        DisplayOnly;
        DBTableName = "TCLII";
        Label = "Policyholder Total Financial Assets";
        Length = "09";
        SType = "Number";
    }
#26878B CHANGES END HERE
}