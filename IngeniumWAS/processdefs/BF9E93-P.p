# Converted from PathFINOUTder 2.2 to 3.0 Jun 18, 2004 3:13:35 PM EDT

#*******************************************************************************
#*  Component:   BF9E93-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3094  CTS      INOUTITIAL VERSION                                           *
#*******************************************************************************

P-STEP BF9E93-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9E93";
        BusinessFunctionName = "Term type quote";
        BusinessFunctionType = "QuoteTerm";
        MirName = "CCWM9E93";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        DBTableName = "Derived";
        Label = "Process State";
    }
    IN MIR-DV-UNDO-VALID-CD
    {
        Length = "1";
        SType="Hidden";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Number";
    }
 
    INOUT MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Process Date";
    
    }

    INOUT MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Policyholder Name";
    }

    INOUT MIR-POL-BILL-MODE-CD
    {       
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Billing Mode";
    } 

    
    INOUT MIR-LOAN-REPAY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Policy Loan Balance";
    }

    INOUT MIR-NO-ACC-BNFT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Non Accidental Benefit";
    }  

    INOUT MIR-LOAN-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Policy Loan Interest";
    }
    
    INOUT MIR-PRE-PAY-INT-AMT
    { 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Pre pay interest";
    }
    
    INOUT MIR-SHRT-PREM-AMT
    { 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Short prem amt";
    }

    
    INOUT MIR-OVR-PAID-PREM-AMT
    {
    
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Over paid premium";
    }
    
    INOUT MIR-SHRT-INT-AMT
    {
    
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Short interest amount";
    }   
   
    INOUT MIR-UNEARN-LOAN-INT-AMT
    {   
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Unearned Loan interest";
    }
    
    INOUT MIR-LOAN-XCES-SHRT-AMT
    {  
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Excess interest";
    }
    
    INOUT MIR-HLT-BNFT-AMT
    {   
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Health Congradulatory benefit";
    }

    INOUT MIR-DIV-AMT
     {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Dividend Amount";
     }    
    INOUT MIR-DEFR-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Deffered amt";
    }
    INOUT MIR-INC-SRV-BNFT-AMT
    {   
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Inc Sur ben amt";
    }
    INOUT MIR-SRV-BNFT-AMT
    {   
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Survival benefit amt";
    }
    
    INOUT MIR-REMIT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "total remittance amt";
    }

}

    