# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9321-I.s                                                    *
#*  Description: Firm Banking Disbursement Create-Input                        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  M245K2  CTS      INITIAL VERSION                                           *
#*  FFF10P  CTS      NOMURA ONLINE CHANGES                                     *
#*  UYS044  CTS      CANCELLATION, CANCELLATION REVERSAL SCREEN                *
#*                    NOT TAKEN,NOT TAKEN REVERSAL SCREEN CHANGES               *
#*******************************************************************************

P-STEP BF9321-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9321";
        BusinessFunctionName = "Firm Banking Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM9321";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-XCHG-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Remittance Date";
    }
    
    INOUT MIR-FBNK-CAT-CD
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "FBNK-CAT-CD";
        SType = "Text";
        Label = "Operation Category";
    }
    
    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }
    
    INOUT MIR-ORIG-PMT-CRCY-CD
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "CRCYT";
        SType = "Selection";
        Label = "Currency";
    }
    
    INOUT MIR-JRNL-DT 
    {
     
        Length = "10";
        SType = "Date";
        Label = "Remittance Date";
    }

    INOUT MIR-FBNK-REMIT-DT 
    {
	DisplayOnly;
	Length = "10";
	SType = "Date";
	Label = "Remittance Date";
    }

    INOUT MIR-REMIT-CRCY-CD
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "CRCYT";
        SType = "Selection";
        Label = "Currency";
    }
    
    IN MIR-POL-ID
    {
        Key;
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Policy ID";
    }
    
    INOUT MIR-FB-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Insured Client ID";
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
        Label = "Bank Number";
    }

    INOUT MIR-BNK-NM
    {
        Length = "36";
        SType = "Text";
        Label = "Bank Name";
    }

    INOUT MIR-BNK-BR-ID
    {
        Length = "5";
        SType = "Text";
        Label = "Branch Number";
    }

    INOUT MIR-BNK-BR-NM
    {
        Length = "36";
        SType = "Text";
        Label = "Branch Name";
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
        Label = "Account Number";
    }

    INOUT MIR-ACCT-HLDR-NM
    {
        Length = "50";
        SType = "Text";
        Label = "Account Holder Name";
    }   
    
    
    INOUT MIR-BNFT-PMT-AMT 
    {
	Length = "18";
	SType = "Currency";
	Label = "Payment Amount";
    }
 
  
    INOUT MIR-PAYE-CLI-FRST-NM 
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "Payee's First Name";
    }

    INOUT MIR-PAYE-CLI-LAST-NM 
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "Payee's Last Name";
    }

    INOUT MIR-PAYE-CO-NM 
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Company Name";
    }

    INOUT MIR-CLI-ADDR-LOC-CD 
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Address Code";
    }
     
    INOUT MIR-CLI-PSTL-CD 
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Postal Code";
    }

    INOUT MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    INOUT MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }
    
    INOUT MIR-CREAT-TYP-CD
    {    
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FBNK-PAYO-MTHD-CD";
        SType = "Selection";
        Label = "Payout Method";
    }
    INOUT MIR-DLAY-INT-CALC-DT 
    {
        Length = "10";
        SType = "Date";
        Label = "Delay Interest Period start Date";
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
