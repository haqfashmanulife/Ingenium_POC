# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9D11-P.p                                                    *
#*  Description: Survival Benefit / Deferral Benefit Chargeback Details        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP302M  CTS      Initial Version                                           *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *    
#*  UY323A  CTS      MEDICAL CLAIM PAYMENT                                     *
#*******************************************************************************

P-STEP BF9D11-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9D11";
        BusinessFunctionName = "Survival Benefit / Deferral Benefit Chargeback Details";
        BusinessFunctionType = "List";
        MirName = "CCWM9D11";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLM-ID
    {
        Length = "8";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Master Claim ID";
    }
    INOUT MIR-POL-ID
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy No.";
    }
    INOUT MIR-DV-INS-CLI-NM
    {
        Length = "75";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Insured Name";
    }
    INOUT MIR-CLMA-CLM-STAT-CD
    {
        Length = "4";
        CodeSource = "DataModel";
	CodeType = "CLMA-CLM-STAT-CD";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Master Claim Status";
    }
    INOUT MIR-CLMA-INSRD-CLI-ID
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Insured Client Id";
    }
    INOUT MIR-CLI-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Birth Date";
    }
    INOUT MIR-CLI-SEX-CD
    {
        Length = "1";
        CodeSource = "DataModel";
	CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }
    INOUT MIR-INS-MORAL-RISK-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Insured Moral Risk";
    }
    INOUT MIR-CLAIM-NOTE-IND 
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Claim Note";
    }
    INOUT MIR-LIFE-INS-CLM-IND 
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Life Insurance Claim in Progress";
    }
    INOUT MIR-CLMA-ASSOC-CLM-ID
    {
        Length = "8";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Associated Master Claim";
    }
    INOUT MIR-CLMA-HIST-CLM-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Historical Claim";
    }
    #UYSDMC CHANGES STARTS HERE
    INOUT MIR-CLMA-USYS-CLM-IND
    {    
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Unisys Claim";
    }
    #UYSDMC CHANGES ENDS HERE
    OUT MIR-PLAN-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Rider Name";
    }
    OUT MIR-SERV-BR-ID
    {
        Length = "5";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "RO Servicing Branch";
    }
    OUT MIR-BNFT-STAT-CD
    {
        Length = "4";
        CodeSource = "DataModel";
	CodeType = "CLBN-BNFT-STAT-CD";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Benefit Claim Status";
    }
    OUT MIR-POL-ID-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Policy No";
        Index = "1";
    }
    OUT MIR-CLM-ID-T[20]
    {
        Length = "8";
        FieldGroup = "Table20";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Claim ID";
        Index = "1";
    }
    OUT MIR-BNFT-NM-T[20]
    {
        Length = "5";
        FieldGroup = "Table20";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "BENNM";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Benefit Name";
        Index = "1";
    }
    OUT MIR-CVG-NUM-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        DBTableName = "TCLBD";
        SType = "Text";
        Label = "Coverage No";
        Index = "1";
    }
    OUT MIR-EVNT-STRT-DT-T[20] 
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCLBD";
        SType = "Date";
        Label = "Start Date";
        Index = "1";
    }
    OUT MIR-EVNT-END-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCLBD";
        SType = "Date";
        Label = "End Date";
        Index = "1";
    }
    OUT MIR-EVNT-UNIT-QTY-T[20]
    {
        Length = "6";
        FieldGroup = "Table20";
        DBTableName = "TCLBD";
        SType = "Text";
        Label = "No of Days";
        Index = "1";
    }
    OUT MIR-CV-EVNT-UNIT-QTY-T[20]
    {
        Length = "6";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Target Days";
        Index = "1";
    }
    OUT MIR-CVG-FACE-AMT-T[20]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount at the end of 5 yrs";
        Index = "1";
    }
    OUT MIR-DV-DED-AMT-T[20]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Deduction Amount";
        Index = "1";
    }        
    OUT MIR-SRVH-SRVBEN-AMT
    {
        Signed;
        Length = "16";
        DBTableName = "TSRVH";
        SType = "Currency";
        Label = "Paid Survival Benefit/Deferral Benefit Amount (A)";
    }
    OUT MIR-RECALC-SRVBEN-AMT
    {
        Signed;
        Length = "16";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Recalculated Survival Benefit/Deferral Benefit Amount (B)";
    }
    OUT MIR-SRVBEN-CHRGBCK-AMT
    {
        Signed;
        Length = "16";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Survial Benefit/Deferral Benefit Chargeback Amount (A-B)";
    } 
	
#UY323A CHANGES STARTS HERE
    INOUT MIR-HLTBEN-CHRGBCK-AMT
    {
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "Health Congratulatory Benefit Chargeback Amount";
    }  
    
    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "process code";
    }
#UY323A CHANGES ENDS HERE    
    
}