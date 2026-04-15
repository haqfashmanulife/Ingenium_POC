#*******************************************************************************
#*  Component:   BF9F99Upt-I.s                                                 *        
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*                                                                             *
#*  CA0002  CTS      INITIAL VERSION                                           *
#*  105528  CTS      FIX DONE FOR BANK ACCOUNT NUMBER AND COMMENT FIELD        *
#*  105658  CTS      FIX DONE FOR PREMIUM CRVY CD DETAILS                      *
#*  105703  CTS      FIX DONE FOR BANK ACC ID DETAILS                          *
#*  M29665  CTS      FIX DONE FOR ONE LEDGER CR CHANGES 		       *
#*******************************************************************************

S-STEP BF9F99Upt-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        FocusField = "MIR-BNK-ID-1";
        FocusFrame = "ContentFrame";
        Type = "Input";
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

    OUT index
    {
        SType="Hidden";
    }
    
    IN MIR-PROD-APP-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PROD-APP-TYP";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Product Application Type";
    }

   IN MIR-POL-APP-FORM-ID
   {    
        DisplayOnly;
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
        DisplayOnly;
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
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Billing Method";
    }
    
    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }
    
    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }
    
    IN MIR-SERV-AGT-ID
    {
        DisplayOnly;
        Length = "6";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Servicing Agent ID";
    }
    
    IN MIR-DV-SERV-AGT-NM
    {
        DisplayOnly;
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Servicing Agent Name";
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
        DBTableName = "TBNKB";
        Length = "36";
        SType = "Text";
        Label = "Bank Name";
    } 
        
    IN MIR-BNK-BR-ID
    {   
        DisplayOnly;
        DBTableName = "TBNKB";
        Length = "3";
        SType = "Text";
        Label = "Branch Number";
    }
        
    IN MIR-BNK-BR-NM
    {
        DisplayOnly;
        DBTableName = "TBNKB";
        Length = "36";
        SType = "Text";
        Label = "Branch Name";
    }
        
    IN MIR-BNK-ACCT-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
#M29665 CHANGES START HERE        
#        CodeType = "ACTYP";
         CodeType = "FBACC";
#M29665 CHANGES END HERE
        SType = "Text";
        Label = "Account Type";
    }
        
    IN MIR-BNK-ACCT-ID
    {
        DisplayOnly;
#105528 CHANGES START HERE    
        #Length = "17";
#105703 CHANGES START HERE    
        #Length = "7";	
        Length = "17";
#105703 CHANGES END HERE	
#105528 CHANGES END HERE
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Account Number";
    }
        
    IN MIR-BNK-ACCT-HLDR-NM
    {
        DisplayOnly;
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
            
    INOUT MIR-BNK-ACCT-TYP-CD-1
    {
        Length = "40";
        CodeSource = "EDIT";
#M29665 CHANGES START HERE           
#       CodeType = "ACTYP";
        CodeType = "FBACC";         
#M29665 CHANGES END HERE           
        SType = "Selection";
        Label = "Account Type";
    }
            
    INOUT MIR-BNK-ACCT-ID-1
    {
#105528 CHANGES START HERE    
        #Length = "17";
#105703 CHANGES START HERE    
        #Length = "7";	
        Length = "17";
#105703 CHANGES END HERE	
#105528 CHANGES END HERE
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Account Number";
    }
#105658 CHANGES START HERE             
    #IN MIR-BNK-ACCT-HLDR-NM-1
    INOUT MIR-BNK-ACCT-HLDR-NM-1
#105658 CHANGES END HERE  
    {
        DisplayOnly;
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Account Holder Name(Kana)";
    }
    
    INOUT MIR-POL-COMNT-TXT
    {
#105528 CHANGES START HERE        
        #Length = "237";
        Length = "60";
#105528 CHANGES END HERE
        SType = "Text";
        Label = "Comments";
    }
    
    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }
}