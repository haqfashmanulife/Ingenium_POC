# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:39 PM EDT

#*******************************************************************************
#*  Component:   BF1364FB-O.s                                                  *
#*  Description: FXWL 3DD WAIVER CHANGES                                       *
#*                                                                             *
#*******************************************************************************
#*                                                                             *
#*  M319A3  CTS      INITIAL VERSION                                           *
#*  Q91588  CTS      FIX FOR FXWL WAIVER CHANGES                               *
#*  Q91714  CTS      FIX FOR FXWL WAIVER VIRTUAL UNDO CHANGES                  *
#*  MPC115  CTS      DELAY INTEREST CALCULATION FOR FXWL WAIVER CHANGES        *
#*  UY3146  CTS      ADDED NEW FIELD IN WAIVER SCREEN                          * 
#*******************************************************************************

S-STEP BF1364FB-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Waiver";
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

    IN MIR-APPL-CTL-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-CVG-NUM
    {
        DisplayOnly;
        Length = "2";
        DefaultConstant = "00";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-DV-WP-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-WP-TYP-CD";
        SType = "Text";
        Label = "Waiver Type";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }    

    IN MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
#Q91588 CHANGES START HERE
        #CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        CodeType = "DV-PAYO-MTHD-CD";
#Q91588 CHANGES END HERE        
        SType = "Text";
        Label = "Pay Out Method";	
    } 
        
        IN MIR-DV-HO-RECV-DT
        {
            Length = "10";
            SType = "Date";
            Label = "Head Office Received Date";
        }
        
        IN MIR-DV-PAYO-JPY-BNFT-CD
        {
            Length = "1";
            CodeSource = "DataModel";
            CodeType = "PAYO-JPY-BNFT-CD";
            SType = "Text";
            Label = "JPY Benefit Rider";
        }  

    
    IN MIR-UNEARN-PREM-AMT
    {   
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Length = "15"; 
        SType = "Currency"; 
        Label = "Unearned Premium"; 
     }
     
    IN MIR-OVR-SHRT-PREM-AMT
    {   
        CurrencyCode = "MIR-PMT-CRCY-CD";
        DisplayOnly;
        Length = "15"; 
        SType = "Currency"; 
        Label = "Excess/Shortage in Premium"; 
    }
    
    IN MIR-POL-BT-SUSP-AMT
    {   
        CurrencyCode = "MIR-PMT-CRCY-CD";
        DisplayOnly;
        Length = "15"; 
        SType = "Currency"; 
        Label = "Bank Transfer Suspense"; 
    }
    
    IN MIR-POL-PD-SUSP-AMT
    {   
        CurrencyCode = "MIR-PMT-CRCY-CD";
        DisplayOnly;
        Length = "15"; 
        SType = "Currency"; 
        Label = "Payroll Deduction Suspense"; 
    }
    
    IN MIR-POL-CC-SUSP-AMT
    {   
        CurrencyCode = "MIR-PMT-CRCY-CD";
        DisplayOnly;
        Length = "15"; 
        SType = "Currency"; 
        Label = "Cash Collection Suspense"; 
    }
 #UY3146 CHANGES START HERE 
	IN MIR-POL-CNVR-BAL-AMT
    {   
        CurrencyCode = "MIR-PMT-CRCY-CD";
        DisplayOnly;
        Length = "15"; 
        SType = "Currency"; 
        Label = "Converted Balance Payout Amount"; 
    }
 #UY3146 CHANGES END HERE
     
    IN MIR-TOT-PAYOUT-AMT
    {   
        CurrencyCode = "MIR-PAYO-CRCY-CD";
        DisplayOnly;
        Length = "15"; 
        SType = "Currency"; 
        Label = "Total Payout amount"; 
    }
    
    IN MIR-PAYE-CLI-FRST-NM 
    {
        Length = "25";
        SType = "Text";
        Label = "Payee's First Name";
    }
        
    IN MIR-PAYE-CLI-LAST-NM 
    {
        Length = "25";
        SType = "Text";
        Label = "Payee's Last Name";
    }
        
    IN MIR-PAYE-CO-NM 
    {
        Length = "50";
        SType = "Text";
        Label = "Company Name";
    }
        
    IN MIR-CLI-ADDR-LOC-CD 
    {
        Length = "8";
        SType = "Text";
        Label = "Address Code";
    }
             
    IN MIR-CLI-PSTL-CD 
    {
        DisplayOnly;
        Length = "9";
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
        Label = "MRF Indicator";
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
    
    IN MIR-BNK-ID
    {
        Length = "4";
        SType = "Text";
        Label = "Bank Number";
    }
        
    IN MIR-BNK-BR-ID
    {
        Length = "5";
        SType = "Text";
        Label = "Branch Number";
    }
        
    IN MIR-BNK-ACCT-ID
    {
        Length = "17";
        SType = "Text";
        Label = "Bank Account Number";
    }
        
    IN MIR-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        SType = "Text";
        Label = "Account Holder Name";
    }
        
    IN MIR-BNK-ACCT-TYP-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        SType = "Selection";
        Label = "Account Type";
    }
    
    IN MIR-PAYO-CRCY-CD
    {
             
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
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
#Q91714 CHANGES START HERE
    IN MIR-DV-UNDO-VALID-CD
    {
            Length = "1";
            SType="Hidden";
    }
 #Q91714 CHANGES END HERE 
 #MPC115 CHANGES START HERE
     IN MIR-DLAY-INT-STRT-DT
     {
         Length = "10";
         SType = "Date";
         Label = "Head Office Received Date";
     }
#MPC115 CHANGES END HERE    
} 
