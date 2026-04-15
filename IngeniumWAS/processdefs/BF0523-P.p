# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:22 PM EDT

#*******************************************************************************
#*  Component:   BF0523-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  UY3060  CTS      Dividend Processing Stream3 related changes               *
#*******************************************************************************

P-STEP BF0523-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0523";
        BusinessFunctionName = "Dividend Surrender- Dividends on Deposit";
        BusinessFunctionType = "Surrdd";
        MirName = "CCWM0671";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-DV-ACCT-TRXN-AMT
    {
#UY3060 Mandatory;   
        Signed;
        Length = "13";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Amount";
    }

    IN MIR-DV-CHQ-CREAT-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Request cheque";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "THI";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "THI";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-POL-TRXN-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "THI";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }
#UY3060 START     
    INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        SType = "Selection";
        DBTableName = "Derived";
        Label = "Pay Out Method";
    }    

    INOUT MIR-PAYE-CLI-LAST-NM
    {
        Label = "Payee's Last Name";
        Length = "25";
        SType = "Text";
    }
    
    INOUT MIR-PAYE-CLI-FRST-NM
    {
        Label = "Payee's First Name";
        Length = "25";
        SType = "Text";
    }
    
    INOUT MIR-PAYE-CO-NM
    {
        Label = "Company Name";
        Length = "50";
        SType = "Text";
    }
    
    INOUT MIR-CLI-ADDR-LOC-CD
    {
        Label = "Address Code";
        Length = "8";
        SType = "Text";
    }
    
    INOUT MIR-CLI-PSTL-CD
    {
        Label = "Postal Code";
        Length = "8";
        SType = "Text";
    }
    
    INOUT MIR-DV-CLI-ADDR
    {
        Label = "Kanji Address";
        Length = "75";
        SType = "Text";
        DisplayOnly;
    }
    
    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }

    INOUT MIR-CLI-ADDR-ADDL-TXT
    {
        Label = "Samakata-bu";
        Length = "60";
        SType = "Text";
    }        

    INOUT MIR-MRF-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "MRF Indicator";
    }
   
    INOUT MIR-BNK-ID
    {       
       Label = "Bank Number";
       Length = "4";
       SType = "Text";
    }
    
    OUT MIR-BNK-NM
    { 
       Label = "Bank Name";
       Length = "75";
       SType = "Text";
    } 
    
    INOUT MIR-BNK-BR-ID
    {       
        Label = "Branch Number";
        Length = "3";
        SType = "Text";
    }
    
    INOUT MIR-BNK-BR-NM
    {
       Label = "Branch Name";
       Length = "50";
       SType = "Text";
    }
    
    INOUT MIR-BNK-ACCT-TYP-CD
    {
       Length = "3";
       CodeSource = "EDIT";
       CodeType = "FBACC";
       SType = "Selection";
       Label = "Account Type";
    }
    INOUT MIR-BNK-ACCT-ID
    {
       Label = "Bank Account Number";
       Length = "17";
       SType = "Text";
    }
    
    INOUT MIR-BNK-ACCT-HLDR-NM
    {
       Label = "Account Holder Name";
       Length = "50";
       SType = "Text";
    }
    
   OUT 	MIR-POL-DIV-OPT-CD
    {
        CodeSource = "DataModel";
        CodeType = "POL-DIV-OPT-CD";
        DBTableName = "TPOL";
        Label = "Policy Dividend Option";
        Length = "40";
        SType = "Text";
    }

    OUT MIR-POL-DOD-ACUM-AMT
    {
        Length = "15";      
        SType = "Currency";   
        Label = "Accumulated Dividend Amount";   
    } 

    OUT MIR-DIV-ACUM-INT-AMT
    {
        Length = "15";      
        SType = "Currency";   
        Label = "Accumulated Interest Amount:";   
    }  

    OUT MIR-DIV-INT-RT-ID
    {
        Length = "4";      
        Decimals = "2";
        SType = "Percent";   
        Label = "Dividend Interest Rate:";   
    } 

    OUT MIR-DIV-PMT-AMT
    {
        Length = "15";      
        SType = "Currency";   
        Label = "Cumulative Dividend Amount:";   
    }
#UY3060 ENDS 
}

