# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:33 PM EDT

#*******************************************************************************
#*  Component:   BF1008-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B10919  CTS      Changed the array size of the fields from 6 to 10         *
#*  Q88087  CTS      Currency Code Changes                                     *
#*  TLB041  CTS      CORPORATE POLICY HOLDER NAME & ADDRESS EXPANSION          *
#*  UYS133  CTS      Addition of PD group size field                           *
#*******************************************************************************

S-STEP BF1008-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Owndtl";
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
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-CLI-SUSP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Suspense Amount";
    }

    IN MIR-DV-APL-LOAN-AMT-T[10]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END        
        Label = "Policy loan";
        Index = "1";
    }

    IN MIR-DV-CFN-APROX-AMT-T[10]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END        
        Label = "Approximate Fund Value";
        Index = "1";
    }

    IN MIR-DV-LOAN-DSCNT-AMT-T[10]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END        
        Label = "MIR-DV-LOAN-DSCNT-AMT-T";
        Index = "1";
    }

    IN MIR-DV-LOAN-REPAY-AMT-T[10]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END          
        Label = "Policy loan";
        Index = "1";
    }

    IN MIR-DV-POL-CSV-AMT-T[10]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END
        Label = "Cash Surrender Value";
        Index = "1";
    }

    IN MIR-DV-POL-JNT-OWN-IND-T[10]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table10";
        SType = "Indicator";
        Label = "Joint Owner";
        Index = "1";
    }

    IN MIR-INSRD-CLI-ID-T[10]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Client Number of Lives Insured";
        Index = "1";
    }

    IN MIR-LOAN-AMT-T[10]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END        
        Label = "APL amt";
        Index = "1";
    }

    IN MIR-POL-BILL-MODE-CD-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Premium Mode";
        Index = "1";
    }

    IN MIR-POL-BILL-TO-DT-NUM-T[10]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Billed to Date";
        Index = "1";
    }

    IN MIR-POL-BILL-TYP-CD-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Text";
        Label = "Billing Type";
        Index = "1";
    }

    IN MIR-POL-CSTAT-CD-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
        Index = "1";
    }

    IN MIR-POL-GRS-APREM-AMT-T[10]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END        
        Label = "Gross Annual Premium";
        Index = "1";
    }

    IN MIR-POL-ID-BASE-T[10]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    IN MIR-POL-ID-SFX-T[10]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    IN MIR-POL-ISS-EFF-DT-T[10]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table10";
        SType = "Date";
        Label = "Policy Issue Date";
        Index = "1";
    }

    IN MIR-POL-MISC-SUSP-AMT-T[10]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END        
        Label = "Miscellaneous Suspense";
        Index = "1";
    }

    IN MIR-POL-MPREM-AMT-T[10]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        SType = "Currency";
#Q88087  CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";   
#Q88087  CHANGES END
        Label = "Mode Premium Amount";
        Index = "1";
    }

    IN MIR-POL-OS-DISB-AMT-T[10]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END
        Label = "Outstanding Disbursements";
        Index = "1";
    }

    IN MIR-POL-PD-TO-DT-NUM-T[10]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Paid to Date";
        Index = "1";
    }

    IN MIR-POL-PREM-DSCNT-PCT-T[10]
    {
        DisplayOnly;
        Signed;
        Length = "7";
        Decimals = "3";
        FieldGroup = "Table10";
        SType = "Percent";
        Label = "Policy Discount Percentage";
        Index = "1";
    }

    IN MIR-POL-PREM-SUSP-AMT-T[10]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table10";
        SType = "Currency";
#Q88087 CHANGES BEGIN
        CurrencyCode = "MIR-PREM-CRCY-CD-T[10]";
#Q88087 CHANGES END
        Label = "Premium Suspense";
        Index = "1";
    }

    IN MIR-POL-SPND-IND-T[10]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table10";
        SType = "Indicator";
        Label = "Suspend Status";
        Index = "1";
    }

    IN MIR-SBSDRY-CO-ID-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        #TLB041 CHANGES START HERE
        #Length = "75";
        Length = "100";
        #TLB041 CHANGES END HERE
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
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
    IN MIR-PD-GR-TYP-CD-T[10]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        SType = "Text";
        Label = "PD group size";
        Index = "1";
    }
#UYS133 CHANGES END
}

