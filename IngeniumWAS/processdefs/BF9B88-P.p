# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:38 PM EDT

#*******************************************************************************
#*  Component:   BF9B88-P.p                                                    *
#*  Description: Trial calculation for Birth Date/Sex Modification             *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M319A5  CTS      Initial Version                                           *
#*  UYS91B  CTS  POLICY LIST ON INSURED RELATION                               *
#*******************************************************************************

P-STEP BF9B88-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9B88";
        BusinessFunctionName = "Trial calc for Birth Date/ Sex Mod";
        BusinessFunctionType = "TrlBthSx";
        MirName = "CCWM9B88";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
    }
    
    INOUT MIR-HO-RCVD-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Head Office Received Date";
    }

    INOUT MIR-RECPT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Receipt Date";
    }
    
    INOUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Issue Date";
    }
    
    INOUT MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DV-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Premium Mode";
    }
    
    INOUT MIR-POL-MPREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        CurrencyCode = "MIR-PREM-CRCY-CD";        
        Label = "Modal Premium";
    }
    
    INOUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Plan";
    }

    INOUT MIR-INSRD-CLI-ID
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Insured Client ID";
    }
        
    INOUT MIR-INSRD-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }
    
    INOUT MIR-INSRD-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TCVGC";
        SType = "Number";
        Label = "Issue Age";
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
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }
    
    INOUT MIR-NEW-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }
             
    INOUT MIR-NEW-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Birth Date"; 
    }    
     
    OUT MIR-NEW-INSRD-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "Derived";
        SType = "Number";
        Label = "New Issue Age";
    }

    OUT MIR-NEW-POL-MPREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        CurrencyCode = "MIR-PREM-CRCY-CD";           
        Label = "New Modal Premium";
    }
    
    OUT MIR-XCES-PREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        CurrencyCode = "MIR-PREM-CRCY-CD";        
        Label = "Excess Premium";
    }
    
    OUT MIR-SHRT-PREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        CurrencyCode = "MIR-PREM-CRCY-CD";         
        Label = "Shortage Premium";
    }
    
    OUT MIR-XCES-PREM-PMT-CRCY-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        CurrencyCode = "MIR-PMT-CRCY-CD";          
        Label = "Excess Premium (JPY)";
    }
    
    OUT MIR-SHRT-PREM-PMT-CRCY-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        CurrencyCode = "MIR-PMT-CRCY-CD";    
        Label = "Shortage Premium (JPY)";
    }    
    
    OUT MIR-PAY-IN-RT
    {
        Signed;
        Length = "18";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Pay-In-yen Rate";
    }   
    
    OUT MIR-PAY-OUT-RT
    {
        Signed;
        Length = "18";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Pay-Out-yen Rate";
    }     
    
    OUT MIR-PAY-IN-XCHNG-EFF-DT  
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Exchange Effective date to JPY"; 
    }         
    
    OUT MIR-PAY-OUT-XCHNG-EFF-DT  
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Exchange Effective date to JPY"; 
    }       
    
    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }
    
    INOUT MIR-DV-UNDO-VALID-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Undo Indicator";
    }    
    
    INOUT MIR-PREM-CRCY-CD
    {
	Length = "2";
	SType = "Hidden";
	Label = "Currency";
    }      
    
    INOUT MIR-PMT-CRCY-CD
    {
	Length = "2";
	SType = "Hidden";
	Label = "Currency";
    }        
# UYS91B CHANGES START HERE
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
        
    OUT MIR-PLAN-ID-T[10]
    {
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Plan Name";
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
        Label = "Coverage Status";
        Index = "1";
     }    
# UYS91B CHANGES END HERE	
}

