# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:09 PM EDT

#*******************************************************************************
#*  Component:   BF9D11-O.s                                                    *
#*  Description: Survival Benefit/Deferral Benefit Chargeback Details          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP302M  CTS      Initial Version                                           *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *
#*  UY323A  CTS      MEDICAL CLAIM PAYMENT                                     *
#*******************************************************************************

S-STEP BF9D11-O
{
    ATTRIBUTES
    {
    BusinessFunctionType = "List";
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
    SType="Hidden";
    }
    
    OUT index
    {
    SType = "Hidden";
    }

    IN MIR-CLM-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Master Claim ID";
    }
    IN MIR-DV-INS-CLI-NM
    {
        
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }
    IN MIR-CLMA-CLM-STAT-CD
    {
        DisplayOnly;
        Length = "4";
        CodeSource = "DataModel";
    CodeType = "CLMA-CLM-STAT-CD";
        SType = "Text";
        Label = "Master Claim Status";
    }
    IN MIR-CLMA-INSRD-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Insured Client Id";
    }
    IN MIR-CLI-BTH-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Birth Date";
    }
    IN MIR-CLI-SEX-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
    CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
    }
    IN MIR-INS-MORAL-RISK-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Insured Moral Risk";
    }
    IN MIR-CLAIM-NOTE-IND 
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Claim Note";
    }
    IN MIR-LIFE-INS-CLM-IND 
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Life Insurance Claim in Progress";
    }
    IN MIR-CLMA-ASSOC-CLM-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Associated Master Claim";
    }
    IN MIR-CLMA-HIST-CLM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Historical Claim";
    }
    #UYSDMC CHANGES STARTS HERE
    IN MIR-CLMA-USYS-CLM-IND
    {    
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Unisys Claim";
    }
    #UYSDMC CHANGES ENDS HERE
    IN MIR-PLAN-ID
    {
        DisplayOnly;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Rider Name";
    }
    IN MIR-SERV-BR-ID
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "RO Servicing Branch";
    }
    IN MIR-BNFT-STAT-CD
    {
        DisplayOnly;
        Length = "4";
        CodeSource = "DataModel";
    CodeType = "CLBN-BNFT-STAT-CD";
        SType = "Text";
        Label = "Benefit Claim Status";
    }
    IN MIR-POL-ID-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Policy No";
        Index = "1";
    }
    IN MIR-CLM-ID-T[20]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Claim ID";
        Index = "1";
    }
    IN MIR-BNFT-NM-T[20]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table20";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "BENNM";
        SType = "Text";
        Label = "Benefit Name";
        Index = "1";
    }
    IN MIR-CVG-NUM-T[20]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Coverage No";
        Index = "1";
    }
    IN MIR-EVNT-STRT-DT-T[20] 
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Start Date";
        Index = "1";
    }
    IN MIR-EVNT-END-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "End Date";
        Index = "1";
    }
    IN MIR-EVNT-UNIT-QTY-T[20]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "No of Days";
        Index = "1";
    }
    IN MIR-CV-EVNT-UNIT-QTY-T[20]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Target Days";
        Index = "1";
    }
    IN MIR-CVG-FACE-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "16";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Face Amount at the end of 5 yrs";
        Index = "1";
    }
    IN MIR-DV-DED-AMT-T[20]
    {
        DisplayOnly;
        Signed;
        Length = "16";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Deduction Amount";
        Index = "1";
    }        
    IN MIR-SRVH-SRVBEN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "Paid Survival Benefit/Deferral Benefit Amount (A)";
    }
    IN MIR-RECALC-SRVBEN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "Recalculated Survival Benefit/Deferral Benefit Amount (B)";
    }
    IN MIR-SRVBEN-CHRGBCK-AMT
    {
        DisplayOnly;
        Signed;
        Length = "16";
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