# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:35 PM EDT

#*******************************************************************************
#*  Component:   BF9F92-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  CA0002  CTS      INITIAL VERSION                                           *
#*  105528  CTS      FIX DONE FOR BANK ACCOUNT NUMBER AND COMMENT FIELD        *
#*  105658  CTS      FIX DONE FOR PREMIUM CURRENCY CODE                        *
#*  105703  CTS      FIX DONE FOR BANK ACCOUNT NUMBER                          *
#*  M29665  CTS      FIX DONE FOR ONE LEDGER CR CHANGES 		       *
#*******************************************************************************

P-STEP BF9F92-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9F92";
        BusinessFunctionName = "CWA Refund / Rejection Request ÅEChannel Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM9F92";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-PROD-APP-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PROD-APP-TYP";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Product Application Type";
    }

   INOUT MIR-POL-APP-FORM-ID
   {    
        Key;
        Mandatory;
        Length = "15";
        SType = "Text";
        Label = "Application Number";
    } 
    
    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }
    
    INOUT MIR-POL-ID
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
    }
   
    INOUT MIR-POL-MPREM-AMT
    {
        Signed;
        Length = "15";
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
    
    INOUT MIR-POL-BILL-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Billing Method";
    }
    
    INOUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }
    
    INOUT MIR-DV-INSRD-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }
    
    INOUT MIR-SERV-AGT-ID
    {
        Length = "6";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Servicing Agent ID";
    }
    
    INOUT MIR-DV-SERV-AGT-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Servicing Agent Name";
    }
    
    INOUT MIR-BNK-ID
    {       
        Length = "4";
        SType = "Text";
        Label = "Bank Number";
    }
    
    INOUT MIR-BNK-NM
    { 
        DBTableName = "TBNKB";
        Length = "36";
        SType = "Text";
        Label = "Bank Name";
    } 
        
   INOUT MIR-BNK-BR-ID
    {   
        DBTableName = "TBNKB";
        Length = "3";
        SType = "Text";
        Label = "Branch Number";
    }
        
    INOUT MIR-BNK-BR-NM
    {
        DBTableName = "TBNKB";
        Length = "36";
        SType = "Text";
        Label = "Branch Name";
    }
        
    INOUT MIR-BNK-ACCT-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
#M29665 CHANGES START HERE            
#       CodeType = "ACTYP";
	CodeType = "FBACC";         
#M29665 CHANGES END HERE  
        DBTableName = "TBNKA";
        Label = "Account Type";
    }
        
    INOUT MIR-BNK-ACCT-ID
    {
#105528 CHANGES START HERE    
        #Length = "17";
#105703 CHANGES STARTS          
        #Length = "7";
        Length = "17";        
#105703 CHANGES ENDS          
#105528 CHANGES END HERE
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Account Number";
    }
        
    INOUT MIR-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Account Holder Name(Kana)";
    }
    
    INOUT MIR-BNK-ID-1
    {      
        Length = "4";
        SType = "Text";
        Label = "Bank Number";
    }
    
    INOUT MIR-BNK-NM-1
    { 
        Length = "36";
        SType = "Text";
        Label = "Bank Name";
    } 
            
    INOUT MIR-BNK-BR-ID-1
    {   
        Length = "3";
        SType = "Text";
        Label = "Branch Number";
    }
            
    INOUT MIR-BNK-BR-NM-1
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
        DBTableName = "TBNKA";        
        SType = "Selection";
        Label = "Account Type";
    }
            
    INOUT MIR-BNK-ACCT-ID-1
    {
#105528 CHANGES START HERE    
        #Length = "17";
#105703 CHANGES STARTS          
        #Length = "7";
        Length = "17";        
#105703 CHANGES ENDS         
#105528 CHANGES END HERE
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Account Number";
    }
            
    INOUT MIR-BNK-ACCT-HLDR-NM-1
    {
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
}
