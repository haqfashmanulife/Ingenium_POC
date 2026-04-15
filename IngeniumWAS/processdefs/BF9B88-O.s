# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:39 PM EDT

#*******************************************************************************
#*  Component:   BF9B88-O.s                                                    *
#*  Description: Trial calculation for Birth Date/Sex Modification             *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M319A5  CTS      Initial Version                                           *
#*******************************************************************************

S-STEP BF9B88-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "TrlBthSx";
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

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
    }
    
    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
    }
        
    IN MIR-HO-RCVD-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Head Office Received Date";
    }
    
    IN MIR-RECPT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Receipt Date";
    }
        
    IN MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Issue Date";
    }
        
    IN MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DV-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Premium Mode";
    }
        
    IN MIR-POL-MPREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        CurrencyCode = "MIR-PREM-CRCY-CD";         
        Label = "Mode Premium";
    }
        
    IN MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Plan";
    }
    
    IN MIR-INSRD-CLI-ID
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Insured Client ID";
    }
    
    IN MIR-INSRD-CLI-NM
    {
         Length = "75";
         DBTableName = "Derived";
         SType = "Text";
         Label = "Insured Name";
    }
        
    IN MIR-INSRD-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TCVGC";
        SType = "Number";
        Label = "Issue Age";
    }    
        
    IN MIR-CLI-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Birth Date"; 
    }    
        
    IN MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }
        
    IN MIR-NEW-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }
                 
    IN MIR-NEW-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Birth Date"; 
    }    
         
    IN MIR-NEW-INSRD-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "Derived";
        SType = "Number";
        Label = "New Issue Age";
    }
    
    IN MIR-NEW-POL-MPREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        CurrencyCode = "MIR-PREM-CRCY-CD";         
        Label = "New Modal Premium";
    }
        
    IN MIR-XCES-PREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        CurrencyCode = "MIR-PREM-CRCY-CD";         
        Label = "Excess Premium";
    }
        
    IN MIR-SHRT-PREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        CurrencyCode = "MIR-PREM-CRCY-CD";         
        Label = "Shortage Premium";
    }
        
    IN MIR-XCES-PREM-PMT-CRCY-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        CurrencyCode = "MIR-PMT-CRCY-CD";         
        Label = "Excess Premium (JPY)";
    }
        
    IN MIR-SHRT-PREM-PMT-CRCY-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        CurrencyCode = "MIR-PMT-CRCY-CD";        
        Label = "Shortage Premium (JPY)";
    }    
        
    IN MIR-PAY-IN-RT
    {
        Signed;
        Length = "18";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Pay-In-yen Rate";
    }   
        
    IN MIR-PAY-OUT-RT
    {
        Signed;
        Length = "18";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Pay-Out-yen Rate";
    }     
        
    IN MIR-PAY-IN-XCHNG-EFF-DT  
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Exchange Effective date to JPY"; 
    }         
        
    IN MIR-PAY-OUT-XCHNG-EFF-DT  
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Exchange Effective date to JPY"; 
    }  
    
    IN MIR-PREM-CRCY-CD
    {
	Length = "2";
	SType = "Hidden";
	Label = "Currency";
    }      
    
    IN MIR-PMT-CRCY-CD
    {
	Length = "2";
	SType = "Hidden";
	Label = "Currency";
    }      

}

