# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:09 PM EDT

#*******************************************************************************
#*  Component:   BF9321-I.s                                                    *
#*  Description: Firm Banking Disbursement Create-Input                        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  M245K2  CTS      INITIAL VERSION                                           *
#*  FFF10P  CTS      NOMURA ONLINE CHANGES                                     *
#*  UYS044  CTS      CANCELLATION, CANCELLATION REVERSAL SCREEN                *
#*                   NOT TAKEN,NOT TAKEN REVERSAL SCREEN CHANGES               *
#*******************************************************************************

S-STEP BF9321-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-FBNK-STAT-CD";
        FocusFrame = "ContentFrame";
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
 
    INOUT MIR-POL-ID   
    {  
        Key;  
        DisplayOnly;  
        Length = "9";  
        SType = "Text";  
        Label = "Policy Number";  
    }
    
    INOUT MIR-FBNK-CAT-CD   
    {  
        Key;  
        Length = "5";  
        CodeSource = "DataModel";  
        CodeType = "FBNK-CAT-CD";  
        SType = "Selection";  
        Label = "Operation Category";  
    }
    
    INOUT MIR-ORIG-PMT-CRCY-CD
    {
        Key;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "CRCY";
        SType = "Selection";
        Label = "Currency";
    }
    
    INOUT MIR-JRNL-DT 
    {
        DefaultSession = "LSIR-PRCES-DT";       
        Length = "10";
        SType = "Date";
        Label = "Remittance Date";
    }
           
    INOUT MIR-BNFT-PMT-AMT 
    {
	CurrencyCode="MIR-ORIG-PMT-CRCY-CD";   	
	Length = "18";
	SType = "Currency";
	Label = "Outstanding Amount";
    }
    
    INOUT MIR-REMIT-CRCY-CD
    {
        Key;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "CRCY";
        SType = "Selection";
        Label = "Currency";
    }
    
    INOUT MIR-XCHG-EFF-DT 
    {
        Key;
        Length = "10";
        SType = "Date";
        Label = "Exchange Effective Date";
    }
          
    INOUT MIR-DLAY-INT-CALC-DT 
    {
        Length = "10";
        SType = "Date";
        Label = "Delay Interest Period start Date";
    }       

#FFF10P CHANGES STARTS HERE 
    INOUT MIR-MRF-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "MRF Indicator";
    }
#FFF10P CHANGES ENDS HERE 

    INOUT MIR-BNK-ID
    {
        Length = "4";
        SType = "Text";
        Label = "Bank ID";
    }

    INOUT MIR-BNK-BR-ID
    {
        Length = "5";
        SType = "Text";
        Label = "Branch ID";
    }

    INOUT MIR-ACCT-TYP-CD
    {
        Length = "3";
        SType = "Selection";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        Label = "Account Type";
    }

    INOUT MIR-BNK-ACCT-ID
    {
        Length = "17";
        SType = "Text";
        Label = "Bank Account Number";
    }

    INOUT MIR-ACCT-HLDR-NM
    {
        Length = "50";
        SType = "Text";
        Label = "Account Holder Name";
    }  
	
    IN MIR-BNK-NM 
    {
	DisplayOnly;
	Length = "36";
	SType = "Text";
	Label = "Bank Name";
    }

    IN MIR-BNK-BR-NM 
    {
	DisplayOnly;
	Length = "36";
	SType = "Text";
	Label = "Branch Name";
    }
# UYS044 CHANGES STARTS HERE 
    INOUT MIR-TAX-CLAS-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TAX-CLAS-CD";
        SType = "Selection"; 
	Label = "Chosho Classification";
    }
# UYS044 CHANGES END HERE 
}