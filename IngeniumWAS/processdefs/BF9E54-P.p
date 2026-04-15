# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:38 PM EDT

#*******************************************************************************
#*  Component:   BF9E54P.p                                                     *
#*  Description: Deferment Processing Screen                                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3093  02JUL23  Intial Version                                            *
#*  UY3066  04JAN24  CHANGES DONE AS PART OF SAVINGS RIDER                     * 
#*******************************************************************************

P-STEP BF9E54-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9E54";
        BusinessFunctionName = "Deferment Processing ";
        BusinessFunctionType = "Prcesdef";
        MirName = "CCWM9E43";
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
    
    INOUT MIR-DV-UNDO-VALID-CD
    {
        Length = "1";
        SType="Hidden";
    }

    # UY3066 CHANGES START 

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
    }

    # UY3066 CHANGES END 

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Company Received Date";
    }
    
    INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        SType = "Selection";
        DBTableName = "Derived";
        Label = "Payout Method";
    }
    
    INOUT MIR-JRNL-DT
    {
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
        
    }
    
    INOUT MIR-DV-HO-RECV-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Head Office Received Date";
    } 

    INOUT MIR-PRCES-DT
    {
      
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";       
    }    

    INOUT MIR-EVNT-ACTV-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DEFR-ACTV-TYP-CD";
        SType = "Selection";
        Label = "Activity Type";
    }    

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        SType = "Text";
        Label = "Policyholder Name";
    }    

    OUT MIR-TOT-PD-PREM-AMT
    {
        Length = "17";
        Signed;
        SType = "Currency";
        Label = "Total Premium Paid for the Policy";
    }      

    OUT MIR-POL-BILL-MODE-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "PLAN-BILL-MODE-CD";
        SType = "Text";
        Label = "Billing Mode";
    }     

    INOUT MIR-PAYE-CLI-LAST-NM
    {
        Length = "25";
        DBTableName = "CLNM";
        SType = "Text";
        Label = "Payee's Last Name";
    }
    
    INOUT MIR-PAYE-CLI-FRST-NM
    {
        Length = "25";
        DBTableName = "CLNM";
        SType = "Text";
        Label = "Payee's First Name";
    }

    INOUT MIR-PAYE-CO-NM
    {
        Length = "50";
        DBTableName = "CLNC";
        SType = "Text";
        Label = "Company Name";
    }

    INOUT MIR-CLI-ADDR-LOC-CD
    {
        Length = "8";
        DBTableName = "CLIA";
        SType = "Text";
        Label = "Address Code";
    }

    INOUT MIR-CLI-PSTL-CD
    {
        Length = "9";
        DBTableName = "CLIA";
        SType = "Text";
        Label = "Postal Code";
    }

    INOUT MIR-DV-CLI-ADDR
    {
        Length = "50";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Kanji Address";
    }

    INOUT MIR-CLI-ADDR-ADDL-TXT
    {
        Length = "60";
        DBTableName = "CLIA";
        SType = "Text";
        Label = "Samakata-bu";
    }

    INOUT MIR-MRF-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "MRF Indicator";
    }   
    
    INOUT MIR-BNK-ID
    {
        Length = "4";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Number";
    }

    OUT MIR-BNK-NM
    {
        Length = "36";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Name";
    }
     
    INOUT MIR-BNK-BR-ID
    {
        Length = "5";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch Number";
    }
 
    OUT MIR-BNK-BR-NM
    {
        Length = "36";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch Name";
    } 
  
    INOUT MIR-BNK-ACCT-TYP-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        DBTableName = "TCLRL";
        SType = "Selection";
        Label = "Account Type";
    }
  
    INOUT MIR-BNK-ACCT-ID
    {
        Length = "17";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Bank Account Number";
    }
   
    INOUT MIR-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Account Holder Name";
    }

    OUT MIR-MAT-DEFR-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Maturity Amount(Deferment Amount)";
    }
    
    OUT MIR-DEFR-INT
    {
        Length = "15";
        SType = "Currency";
        Label = "Deferment Interest";
    }
    
    OUT MIR-POL-MAT-DT 
    {
        Length = "10";
        SType = "Date";
        Label = "Maturity Date(Deferment Start Date)";
    }
   
    OUT MIR-DEFR-INT-CAP-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Next Deferment Interest Capitalization Date";       
    }   
     
    OUT MIR-DEFR-MAT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Deferment End Date";       
    }

    INOUT MIR-TOT-DEFR-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Total Deferment Amount";
    } 

    INOUT MIR-REMIT-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Total Remittance Amount";
    }    
 
    OUT MIR-PAYEE-NM-TXT
    {
        DisplayOnly;		
        Label = "Kanji Payee Name:";
        Length = "50";
        SType = "Text";
    }     
  }   