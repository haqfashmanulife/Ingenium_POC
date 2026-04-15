
# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:09 PM EDT

#*******************************************************************************
#*  Component:   BF9321-O.s                                                    *
#*  Description: Firm Banking Disbursement Create-Confirm                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  M245K2  CTS      INITIAL VERSION                                           *
#*  FFF10P  CTS      NOMURA ONLINE CHANGES                                     *
#*  UYS044  CTS      CANCELLATION, CANCELLATION REVERSAL SCREEN                *
#*                   NOT TAKEN,NOT TAKEN REVERSAL SCREEN CHANGES               *
#*******************************************************************************

S-STEP BF9321-O
{
    ATTRIBUTES
    {
	BusinessFunctionType = "Retrieve";
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

    IN MIR-POL-ID 
    {
	Key;
	DisplayOnly;
	Length = "9";
	SType = "Text";
	Label = "Policy ID";
    }
   
    IN MIR-FBNK-CAT-CD 
    {
    	DisplayOnly;
    	Length = "5";
    	CodeSource = "DataModel";
    	CodeType = "FBNK-CAT-CD";
    	SType = "Text";
    	Label = "Operation Category";
    }
    
    IN MIR-ORIG-PMT-CRCY-CD
    {
       
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "CRCY";
        SType = "Text";
        Label = "Currency Of Outstanding Amount";
    }
    
    IN MIR-JRNL-DT 
    {
        Length = "10";
        SType = "Date";
        Label = "Remittance Date";
    }
       
    IN MIR-BNFT-PMT-AMT 
    {
	CurrencyCode="MIR-ORIG-PMT-CRCY-CD";   	
	Length = "18";
	SType = "Currency";
	Label = "Outstanding Amount";
    }
    
    IN MIR-REMIT-CRCY-CD
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "CRCY";
        SType = "Text";
        Label = "Payout Currency";
    }
    
    IN MIR-XCHG-EFF-DT 
    {
        Key;
        Length = "10";
        SType = "Date";
        Label = "Exchange Effective Date";
    }
    IN MIR-DLAY-INT-CALC-DT 
    {
        Length = "10";
        SType = "Date";
        Label = "Delay Interest Period start Date";
    }       
#FFF10P CHANGES STARTS HERE     
    IN MIR-MRF-IND 
    {
	DisplayOnly;
	Length = "1";
	SType = "Indicator";
	Label = "MRF Checkbox";
    }
#FFF10P CHANGES ENDS HERE 
    
    IN MIR-BNK-ID 
    {
	DisplayOnly;
	Length = "4";
	SType = "Text";
	Label = "Bank ID";
    }
    IN MIR-BNK-BR-ID 
    {
	DisplayOnly;
	Length = "5";
	SType = "Text";
	Label = "Branch ID";
    }
       
    IN MIR-ACCT-TYP-CD 
    {
	DisplayOnly;
	Length = "3";
	CodeSource = "EDIT";
	CodeType = "FBACC";
	SType = "Text";
	Label = "Account Type";
    }
    IN MIR-BNK-ACCT-ID 
    {
	DisplayOnly;
	Length = "17";
	SType = "Text";
	Label = "Account Number";
    }

    IN MIR-ACCT-HLDR-NM 
    {
	DisplayOnly;
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
    IN MIR-FBNK-REMIT-DT 
    {
	DisplayOnly;
	Length = "10";
	SType = "Date";
	Label = "Remittance Date";
    }
# UYS044 CHANGES STARTS HERE 
    IN MIR-TAX-CLAS-CD
    {
	DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TAX-CLAS-CD";
        SType = "Text"; 
	Label = "Chosho Classification";
    }
# UYS044 CHANGES END HERE 
}