#*******************************************************************************
#*  Component:   BF9562VIR-O.s                                                 *
#*  Description: Inquiry - Policy Loan Repayment Screen                        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  UYS043  CTS      CHANGES MADE AS PART OF VIRTUAL QUOTE SCREEN              *
#*                                                                             *
#*******************************************************************************

S-STEP BF9562VIR-O
{
ATTRIBUTES
{
BusinessFunctionType = "Retrieve";
DelEmptyRows;
FocusField = "OKButton";
FocusFrame = "ButtonFrame";
Type = "Output";
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

     IN MIR-POL-ID-BASE 
     {
        Key;
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Policy ID";
     }

    IN MIR-POL-ID-SFX
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-TRXN-TYP-CD
    { 
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LRPCD";
        SType = "Text";
        Label = "Transaction Reason";
    }
    
    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }
    
    IN MIR-OWN-NM
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Owner Name";
    }
 
    IN MIR-GRS-AMT
    {
         DisplayOnly;
         Length = "15";
         SType = "Currency";
	CurrencyCode = "MIR-POL-CRCY-CD";       
         Label = "Gross Amount";
    }
    
    IN MIR-LPAY-AMT
    { 
        DisplayOnly;
        Length = "15";
        SType = "Currency";
	CurrencyCode = "MIR-POL-CRCY-CD";      
        Label = "Loan Repayment";
    }
    
    IN MIR-LOAN-SHRT-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
	CurrencyCode = "MIR-POL-CRCY-CD";      
        Label = "Short Interest";
    }
    
    IN MIR-LOAN-INT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
	CurrencyCode = "MIR-POL-CRCY-CD";
        Label = "Loan Interest";
    }
    
    IN MIR-LOAN-XCES-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
	CurrencyCode = "MIR-POL-CRCY-CD";       
        Label = "Excess Interest";
    }

    IN MIR-BEFORE-REPAY-LBAL-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
	CurrencyCode = "MIR-POL-CRCY-CD"; 
        Label = "Loan balance before Repayment";
    }
    
    IN MIR-AFTR-REPAY-LBAL-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
	CurrencyCode = "MIR-POL-CRCY-CD";       
        Label = "Loan balance after Repayment";
    } 
    IN MIR-DV-GRS-AMT-POL-CRCY
    {
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         CurrencyCode = "MIR-POL-CRCY-CD";
         Label = "Gross Amount(Pol Crcy)";
    }

    IN MIR-DV-GRS-YEN-AMT
    {
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         CurrencyCode = "MIR-PMT-CRCY-CD";
         Label = "Gross Amount(Yen)";
    }   
   
   IN MIR-JPY-XCHNG-EFF-DT
    { 
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Exchange Effective date to JPY";
    }
    IN MIR-JPY-XCHNG-RT
    { 
        DisplayOnly;
        Length = "7";
        Decimals = "2";
        DBTableName = "TCXRT";
        SType = "Text";
        Label = "Exchange rate to JPY";     
    } 
    
     IN MIR-POL-CRCY-CD
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

     IN MIR-INPUT-AMT
     {
         DisplayOnly;
         Length = "15";
         SType = "Currency";
     	 CurrencyCode = "MIR-POL-CRCY-CD";       
         Label = "Input Amount Before Quote";
     }

     IN MIR-AFTR-GRS-AMT
     {
         DisplayOnly;
         Length = "15";
         SType = "Currency";
     	 CurrencyCode = "MIR-POL-CRCY-CD";       
         Label = "Gross Amount After Quote";
     }
     
     IN MIR-AFTR-LPAY-AMT
     {
         DisplayOnly;
         Length = "15";
         SType = "Currency";
     	 CurrencyCode = "MIR-POL-CRCY-CD";       
         Label = "Loan Repayment After Quote";
     }
     
     IN MIR-LOAN-UNPAY-INT-AMT
     {
         DisplayOnly;
         Length = "15";
         SType = "Currency";
      	 CurrencyCode = "MIR-POL-CRCY-CD";       
         Label = "Loan Unpaid Interest After Quote";
     }
     IN MIR-LOAN-UNEARN-INT-AMT 
     {
         DisplayOnly;
         Length = "15";
         SType = "Currency";
       	 CurrencyCode = "MIR-POL-CRCY-CD";       
         Label = "Loan Unearned Interest After Quote";
     }
     
     IN MIR-LOAN-SHRT-INT-AMT 
     {
         DisplayOnly;
         Length = "15";
         SType = "Currency";
       	 CurrencyCode = "MIR-POL-CRCY-CD";       
         Label = "Short Interest Before Quote";
     }
     
     IN MIR-LOAN-ADJ-SHRT-INT-AMT
     {
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         CurrencyCode = "MIR-POL-CRCY-CD";       
         Label = "Adjusted Short Interest After Quote";
     }
     IN MIR-LOAN-XCES-INT-AMT
     {
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         CurrencyCode = "MIR-POL-CRCY-CD";       
         Label = "Excess Interest Before Quote";
     }
     IN MIR-LOAN-ADJ-XCES-INT-AMT 
     {
         DisplayOnly;
         Length = "15";
         SType = "Currency";
       	 CurrencyCode = "MIR-POL-CRCY-CD";       
         Label = "Adjusted Excess Interest After Quote";
     }
     IN MIR-AFTR-LOAN-SHRT-INT-AMT
     {
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         CurrencyCode = "MIR-POL-CRCY-CD";       
         Label = "Short Interest After Quote";
     }
     IN MIR-AFTR-LOAN-XCES-INT-AMT
     {
         DisplayOnly;
         Length = "15";
         SType = "Currency";
       	 CurrencyCode = "MIR-POL-CRCY-CD";       
         Label = "Excess Interest After Quote";
     }
     IN MIR-CRNT-PERI-INT-AMT
     {
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         CurrencyCode = "MIR-POL-CRCY-CD";       
         Label = "[Ref.]Interest for the current period in interest deposit";
     }
     IN MIR-TOT-INCM-AMT
     {
         DisplayOnly;
         Length = "15";
         SType = "Currency";
       	 CurrencyCode = "MIR-POL-CRCY-CD";       
         Label = "Total Income After Quote";
     }
     IN MIR-TOT-XPNS-AMT
     {
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         CurrencyCode = "MIR-POL-CRCY-CD";       
         Label = "Total Expense After Quote";
     }
    IN MIR-APPL-CTL-PRCES-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Process Date";
    }
    
    
    IN MIR-VIR-ACTV-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Active";
    }
    
    
    IN MIR-VIR-LOAN-AMT
    {   
        DisplayOnly;    
    
        Signed;
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "13";
        SType = "Currency";
        Label = "Policy loan balance:";
    }  
    
    IN MIR-VIR-INT-STR-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Interest start date";
    }  
    

    IN MIR-VIR-SEI-ASS-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Seizure assignment";
    }       


}
     