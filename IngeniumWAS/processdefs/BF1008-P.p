# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:33 PM EDT

#*******************************************************************************
#*  Component:   BF1008-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016053  6.1      Changes for Money flow                                    *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  M00011  ROC      OUTSTANDING DISBURSEMENTS, ADD FIELDS:                    *
#*                      OS-DISB-SURR-AMT, OS-DISB-MAT-AMT, OS-DISB-DTH-AMT     *
#*                      OS-DISB-CLM-AMT, OS-DISB-AD-AMT                        *
#*  Q88087  CTS      Currency Code Changes                                     *
#*  TLB041  CTS      CORPORATE POLICY HOLDER NAME & ADDRESS EXPANSION          *
#*  UYS133  CTS      Addition of PD group size field                           *
#*******************************************************************************

P-STEP BF1008-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1008";
        BusinessFunctionName = "Client Inquiry - Owner Details";
        BusinessFunctionType = "Owndtl";
        MirName = "CCWM5050";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Key;
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    OUT MIR-CLI-SUSP-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TCLI";
        SType = "Currency";
#Q88087 CHANGES BEGIN
	CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END 
        Label = "Unallocated Customer Funds";
    }

    OUT MIR-DV-APL-LOAN-AMT-T[10]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        DBTableName = "Derived";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END         
        Label = "Policy loan";
        Index = "1";
    }

    OUT MIR-DV-CFN-APROX-AMT-T[10]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        DBTableName = "Derived";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END         
        Label = "Approximate Fund Value";
        Index = "1";
    }

    OUT MIR-DV-LOAN-DSCNT-AMT-T[10]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        DBTableName = "Derived";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END         
        Label = "MIR-DV-LOAN-DSCNT-AMT-T";
        Index = "1";
    }

    OUT MIR-DV-LOAN-REPAY-AMT-T[10]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        DBTableName = "Derived";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END         
        Label = "Policy loan";
        Index = "1";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        #TLB041 CHANGES START HERE 
        #Length = "75";
        Length = "100";
	#TLB041 CHANGES END HERE
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-POL-CSV-AMT-T[10]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        DBTableName = "Derived";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END         
        Label = "Cash Surrender Value";
        Index = "1";
    }

    OUT MIR-DV-POL-JNT-OWN-IND-T[10]
    {
        Length = "1";
        FieldGroup = "Table10";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Joint Owner";
        Index = "1";
    }

    OUT MIR-INSRD-CLI-ID-T[10]
    {
        Length = "10";
        FieldGroup = "Table10";
        DBTableName = "TCVGC";
        SType = "Text";
        Label = "Client Number of Lives Insured";
        Index = "1";
    }

    OUT MIR-LOAN-AMT-T[10]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        DBTableName = "TPOLL";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END         
        Label = "APL amt";
        Index = "1";
    }

    OUT MIR-POL-BILL-MODE-CD-T[10]
    {
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Premium Mode";
        Index = "1";
    }

    OUT MIR-POL-BILL-TO-DT-NUM-T[10]
    {
        Length = "10";
        FieldGroup = "Table10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Billed to Date";
        Index = "1";
    }

    OUT MIR-POL-BILL-TYP-CD-T[10]
    {
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Billing Type";
        Index = "1";
    }

    OUT MIR-POL-CSTAT-CD-T[10]
    {
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
        Index = "1";
    }

    OUT MIR-POL-GRS-APREM-AMT-T[10]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        DBTableName = "TPOL";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END         
        Label = "Gross Annual Premium";
        Index = "1";
    }

    OUT MIR-POL-ID-BASE-T[10]
    {
        Length = "9";
        FieldGroup = "Table10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    OUT MIR-POL-ID-SFX-T[10]
    {
        Length = "1";
        FieldGroup = "Table10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    OUT MIR-POL-ISS-EFF-DT-T[10]
    {
        Length = "10";
        FieldGroup = "Table10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Issue Date";
        Index = "1";
    }

    OUT MIR-POL-MISC-SUSP-AMT-T[10]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        DBTableName = "TPOL";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END         
        Label = "Miscellaneous Suspense";
        Index = "1";
    }

    OUT MIR-POL-MPREM-AMT-T[10]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        DBTableName = "TPOL";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END         
        Label = "Mode Premium Amount";
        Index = "1";
    }

    OUT MIR-POL-OS-DISB-AMT-T[10]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        DBTableName = "TPOL";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END         
        Label = "Outstanding Disbursements";
        Index = "1";
    }
     
    OUT MIR-OS-DISB-SURR-AMT-T[10]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        DBTableName = "TPOL";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END         
        Label = "Outstanding Disbursements - Surrender";
        Index = "1";
    }

    OUT MIR-OS-DISB-MAT-AMT-T[10]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        DBTableName = "TPOL";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END         
        Label = "Outstanding Disbursements - Maturity";
        Index = "1";
    }

    OUT MIR-OS-DISB-DTH-AMT-T[10]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        DBTableName = "TPOL";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END         
        Label = "Outstanding Disbursements - Death";
        Index = "1";
    }

    OUT MIR-OS-DISB-CLM-AMT-T[10]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        DBTableName = "TPOL";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END         
        Label = "Outstanding Disbursements - Claims";
        Index = "1";
    }

    OUT MIR-OS-DISB-AD-AMT-T[10]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        DBTableName = "TPOL";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END         
        Label = "Outstanding Disbursements - Accidental Death";
        Index = "1";
    }

    OUT MIR-POL-PD-TO-DT-NUM-T[10]
    {
        Length = "10";
        FieldGroup = "Table10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Paid to Date";
        Index = "1";
    }

    OUT MIR-POL-PREM-DSCNT-PCT-T[10]
    {
        Signed;
        Length = "7";
        Decimals = "3";
        FieldGroup = "Table10";
        DBTableName = "TPOL";
        SType = "Percent";
        Label = "Policy Discount Percentage";
        Index = "1";
    }

    OUT MIR-POL-PREM-SUSP-AMT-T[10]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        DBTableName = "TPOL";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END         
        Label = "Premium Suspense";
        Index = "1";
    }

    OUT MIR-POL-SPND-IND-T[10]
    {
        Length = "1";
        FieldGroup = "Table10";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Suspend Status";
        Index = "1";
    }

    OUT MIR-SBSDRY-CO-ID-T[10]
    {
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

    OUT MIR-DV-TOT-POL-ACUM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END         
        Label = "Client Total Accumulation Value";
    }

    OUT MIR-DV-POL-ACUM-AMT-T[10]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        DBTableName = "Derived";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END         
        Label = "Total Accumulation Value";
        Index = "1";
    }

    OUT MIR-DV-TOT-POL-SURR-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END         
        Label = "Total Full Policy Surrender Value";
    }

    OUT MIR-DV-POL-SURR-AMT-T[10]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        DBTableName = "Derived";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END         
        Label = "Full Policy Surrender Value";
        Index = "1";
    }

    OUT MIR-DV-TOT-MAX-LOAN-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END         
        Label = "Total Maximum Loan Amount Available";
    }

    OUT MIR-DV-MAX-LOAN-AMT-T[10]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        DBTableName = "Derived";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END         
        Label = "Maximum Loan Amount Available";
        Index = "1";
    }

#Q88087 CHANGES BEGINS     
     INOUT MIR-PREM-CRCY-CD-T[10]
     {
          
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
     } 
#Q88087 CHANGES ENDS
#UYS133 CHANGES START
    OUT MIR-PD-GR-TYP-CD-T[10]
    {
        Length = "1";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "PD group size";
        Index = "1";
    }
#UYS133 CHANGES END
}

