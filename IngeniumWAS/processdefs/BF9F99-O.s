# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:36 PM EDT

#*******************************************************************************
#*  Component:   BF9F99-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  CA0002  CTS      INITIAL VERSION                                           *
#*  105528  CTS      FIX DONE FOR BANK ACCOUNT NUMBER AND COMMENT FIELD        *
#*  105658  CTS      FIX DONE FOR PREMIUM CURRENCY CODE                        *
#*  105703  CTS      FIX DONE FOR BANK ACC ID DETAILS                          *
#*******************************************************************************

S-STEP BF9F99-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Output";
        DelEmptyRows;
        FocusField = "ApproveReverseCancel";
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

    IN MIR-PROD-APP-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PROD-APP-TYP";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Product Application Type";
    }

   IN MIR-POL-APP-FORM-ID
   {    
        Key;
        Mandatory;
        Length = "15";
        SType = "Text";
        Label = "Application Number";
    } 
    
    IN MIR-POL-ID
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
    }

   
    IN MIR-POL-MPREM-AMT
    {
        Signed;
        Length = "15";
   # 105658 CHANGES STARTS
        CurrencyCode = "MIR-PREM-CRCY-CD";
   # 105658 CHANGES ENDS        
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Premium";
    }

   # 105658 CHANGES STARTS    
   INOUT MIR-PREM-CRCY-CD
    {       
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    } 
   # 105658 CHANGES ENDS 
    
    IN MIR-POL-BILL-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Billing Method";
    }
    
    IN MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }
    
    IN MIR-DV-INSRD-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }
    
    IN MIR-SERV-AGT-ID
    {
        Length = "6";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Servicing Agent ID";
    }
    
    IN MIR-DV-SERV-AGT-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Servicing Agent Name";
    }
    
    IN MIR-BNK-ID
    {       
        Length = "4";
        SType = "Text";
        Label = "Bank Number";
    }
    
    IN MIR-BNK-NM
    { 
        DBTableName = "TBNKB";
        Length = "36";
        SType = "Text";
        Label = "Bank Name";
    } 
        
   IN MIR-BNK-BR-ID
    {   
        DBTableName = "TBNKB";
        Length = "3";
        SType = "Text";
        Label = "Branch Number";
    }
        
    IN MIR-BNK-BR-NM
    {
        DBTableName = "TBNKB";
        Length = "36";
        SType = "Text";
        Label = "Branch Name";
    }
        
    IN MIR-BNK-ACCT-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        SType = "Text";
        Label = "Account Type";
    }
        
    IN MIR-BNK-ACCT-ID
    {
#105528 CHANGES START HERE    
        #Length = "17";
#105703 CHANGES STARTS	
 #       Length = "7";
        Length = "17";
#105703 ENDS HERE 
#105528 CHANGES END HERE
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Account Number";
    }
        
    IN MIR-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Account Holder Name(Kana)";
    }
    
    IN MIR-BNK-ID-1
    {      
        Length = "4";
        SType = "Text";
        Label = "Bank Number";
    }
    
    IN MIR-BNK-NM-1
    { 
        Length = "36";
        SType = "Text";
        Label = "Bank Name";
    } 
            
    IN MIR-BNK-BR-ID-1
    {   
        Length = "3";
        SType = "Text";
        Label = "Branch Number";
    }
            
    IN MIR-BNK-BR-NM-1
    {
        Length = "36";
        SType = "Text";
        Label = "Branch Name";
    }
            
    IN MIR-BNK-ACCT-TYP-CD-1
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        SType = "Selection";
        Label = "Account Type";
    }
            
    IN MIR-BNK-ACCT-ID-1
    {
#105528 CHANGES START HERE    
        #Length = "17";
#105703 CHANGES STARTS	
 #       Length = "7";
        Length = "17";
#105703 ENDS HERE 
#105528 CHANGES END HERE
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Account Number";
    }
            
    IN MIR-BNK-ACCT-HLDR-NM-1
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Account Holder Name(Kana)";
    }
    
    IN MIR-POL-COMNT-TXT
    {
#105528 CHANGES START HERE        
        #Length = "237";
        Length = "60";
#105528 CHANGES END HERE
        SType = "Text";
        Label = "Comments";
    }
}