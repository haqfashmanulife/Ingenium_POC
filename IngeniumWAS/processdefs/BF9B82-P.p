# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:38 PM EDT

#*******************************************************************************
#*  Component:   BF9B82-P.p                                                    *
#*  Description: Birth Date/ Sex Modification Process                          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS91B  CTS      Initial Version                                           *
#*  S22587  CTS      FIX FOR MIR DV STAT NOT GETTING PASSED IN NXT SCREEN      *
#*  S24382  CTS      FIX FOR OWNER NAE NOT GETTING POPULATED IN FB CNF SCREEN  *
#*******************************************************************************

P-STEP BF9B82-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9B82";
        BusinessFunctionName = "Birth Date/ Sex Modification Process";
        BusinessFunctionType = "BthSxChng";
        MirName = "CCWM9B82";
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
    
    INOUT MIR-CO-RECV-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Company Received Date";
    }

    INOUT MIR-EFF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }     

    INOUT MIR-JRNL-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Journal Date";
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

#S24382 CHANGES START	
    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        CurrencyCode = "MIR-DV-OWN-CLI-NM";        
        Label = "Owner Name";
    }
#S24382 CHANGES END
    OUT MIR-SHRT-PREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        CurrencyCode = "MIR-PREM-CRCY-CD";         
        Label = "Shortage Premium";
    }
    
    OUT MIR-XCES-CWA-PREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        CurrencyCode = "MIR-PREM-CRCY-CD";          
        Label = "Excess of CWA";
    }
        
    OUT MIR-SHRT-CWA-PREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        CurrencyCode = "MIR-PREM-CRCY-CD";          
        Label = "Shortage of CWA";
    }
        
    OUT MIR-XCES-ME-PREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        CurrencyCode = "MIR-PREM-CRCY-CD";   
        Label = "Excess of Subsequent premium";
    }
        
    OUT MIR-SHRT-ME-PREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        CurrencyCode = "MIR-PREM-CRCY-CD";   
        Label = "Shortage of Subsequent premium";
    }
       
#S22587 CHANGES START
#    OUT MIR-DV-TRNXT-PAYO-MTHD-CD
    INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
#S22587 CHANGES END HERE	
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        SType = "Selection";
        DBTableName = "Derived";
        Label = "Pay Out Method";
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

    INOUT MIR-BNK-ID
    {
        Length = "4";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank ID";
    }

    INOUT MIR-BNK-BR-ID
    {
        Length = "5";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch ID";
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

    INOUT MIR-BNK-ACCT-TYP-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        DBTableName = "TCLRL";
        SType = "Selection";
        Label = "Account Type";
    }
	
    INOUT MIR-PAYE-CLI-FRST-NM
    {
        Length = "25";
        DBTableName = "CLNM";
        SType = "Text";
        Label = "Payee's First Name";
    }

    INOUT MIR-PAYE-CLI-LAST-NM
    {
       Length = "25";
       DBTableName = "CLNM";
       SType = "Text";
       Label = "Payee's Last Name";
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

    INOUT MIR-CLI-ADDR-ADDL-TXT
    {
       Length = "60";
       DBTableName = "CLIA";
       SType = "Text";
       Label = "Samakata-bu";
    }

    INOUT MIR-DV-CLI-ADDR
    {
       Length = "50";
       DBTableName = "Derived";
       SType = "Text";
       Label = "Kanji Address";
    }

    OUT MIR-BNK-NM
    {
      Length = "36";
      DBTableName = "TBNKB";
      SType = "Text";
      Label = "Bank Name";
    }

    OUT MIR-BNK-BR-NM
    {
      Length = "36";
      DBTableName = "TBNKB";
      SType = "Text";
      Label = "Bank Branch Name";
    }
   
}

