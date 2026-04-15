# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:38 PM EDT

#*******************************************************************************
#*  Component:   BF9E54-O.s                                                    *
#*  Description: Deferment Processing - Confirm  Transaction                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3093  30JUN23  Intial Version                                            *
#*  UY3066  04JAN24  CHANGES DONE AS PART OF SAVINGS RIDER                     *
#*******************************************************************************

S-STEP BF9E54-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Prcesdef";
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

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Policyholder Name";
    }

    IN MIR-JRNL-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Journal Date";       
    } 
    
    # UY3066 CHANGES START     
    
    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Policy Id";
    }

    # UY3066 CHANGES END

    IN MIR-DV-HO-RECV-DT
    {
        DisplayOnly;    
        Length = "10";
        SType = "Date";
        Label = "Head Office Received Date";		
    }
   
    IN MIR-TOT-PD-PREM-AMT
    {
        DisplayOnly;           
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Premium Paid for the Policy";
    } 

    IN MIR-APPL-CTL-PRCES-DT
    {
        DisplayOnly;    
        Length = "10";
        SType = "Date";
        Label = "Company Received Date";
        
    }  

    IN MIR-POL-BILL-MODE-CD
    {      
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "PLAN-BILL-MODE-CD";
        SType = "Text";
        Label = "Billing Mode";
    } 

    IN MIR-EVNT-ACTV-CD
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "DEFR-ACTV-TYP-CD";
        SType = "Text";
        Label = "Activity Type";
    }

    IN MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        DisplayOnly;          
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        SType = "Text";
        Label = "Pay Out Method";	
    } 

    IN MIR-MAT-DEFR-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Maturity Amount(Deferment Amount)";
    }
   
    IN MIR-DEFR-INT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Deferment Interest";
    }

    IN MIR-POL-MAT-DT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Maturity Date(Deferment Start Date)";
    }
   
    IN MIR-DEFR-INT-CAP-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Next Deferment Interest Capitalization Date";       
    }   
    
    IN MIR-DEFR-MAT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Deferment End Date";       
    }

    IN MIR-TOT-DEFR-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Total Deferment Amount";
    }

    IN MIR-REMIT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Total Remittance Amount";
    }    
  
    IN MIR-PAYEE-NM-TXT
    {
        DisplayOnly;
        Label = "Kanji Payee Name:";
        Length = "50";
        SType = "Text";
    }  

    IN MIR-CLI-PSTL-CD
    {
        DisplayOnly;
        Length = "09";
        SType = "Text";
        Label = "Postal Code";     
    }
    
    IN MIR-DV-CLI-ADDR 
    {
       DisplayOnly;
       Length = "50";
       SType = "Text";
       Label = "Kanji Address";
    }
    
    IN MIR-CLI-ADDR-ADDL-TXT
    {
        Length = "60";
        SType = "Text";
        Label = "Samakata-bu";
    }

    IN MIR-MRF-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "MRF";
    }    
    
    IN MIR-BNK-ID
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank Number";
    }

    IN MIR-BNK-NM 
    {
        DisplayOnly;
        Length = "36";
        SType = "Text";
        Label = "Bank Name";
    }

    IN MIR-BNK-BR-ID
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Branch Number";
    }

    IN MIR-BNK-BR-NM
    {
        DisplayOnly;
        Length = "36";
        SType = "Text";
        Label = "Branch Name";
    }   

    IN MIR-BNK-ACCT-TYP-CD
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

    IN MIR-BNK-ACCT-HLDR-NM
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Account Holder Name";
    }
  
  }          