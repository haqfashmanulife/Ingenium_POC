# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:23 PM EDT

#*******************************************************************************
#*  Component:   BF9F99-P.p                                                    *
#*  Description: CWA REFUND APPROVAL/REJECTION LISTSCREEN                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  CA0002  CTS      Intial version                                            *
#*  105528  CTS      FIX DONE FOR BANK ACCOUNT NUMBER AND COMMENT FIELD        *
#*  105658  CTS      FIX DONE FOR PREMIUM CURRENCY CODE                        *
#*  105703  CTS      FIX DONE FOR BANK ACC ID DETAILS                          *
#*  M29665  CTS      FIX DONE FOR ONE LEDGER CR CHANGES 		       *
#*******************************************************************************

P-STEP BF9F99-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9F99";
        BusinessFunctionName = "CWA Refund/Rejection request List";
        BusinessFunctionType = "List";
        MirName = "CCWM9F99";
    }


    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-REJ-RQST-DT
    {
        Key;
        Length = "10";
        SType = "Date";
        Label = "Rejection Request Date";
    }

    INOUT MIR-POL-CHNL-CD
    {       
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CHNL-CD";
        SType = "Selection";
        Label = "Channel";
    }
           
    INOUT MIR-OPER-CAT-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "OPER-CAT-CD";
        SType = "Selection";
        Label = "Operation Category code";
    }
      
    INOUT MIR-SRCH-RSLT-CNT
    {
        Length = "3";
        SType = "Number";
        Label = "Search result count";
    }

    INOUT MIR-APPL-ID-T[10] 
    {
       DisplayOnly;
       FieldGroup = "Table10";
       Index = "1";
       Label = "Application Number";
       Length = "30";
       SType = "Text";
    }

    INOUT MIR-POL-ID-T[10] 
    {
      DisplayOnly;
      Length = "10";
      FieldGroup = "Table10";
      Index = "1";
      SType = "Text";
      Label = "Policy Number";
    }

    OUT MIR-CLI-OWN-GIV-NM-T[10]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Owner Name";
        Index = "1";
    }

    INOUT MIR-POL-CWA-SUSP-AMT-T[10]
    {
        DisplayOnly;
        Length = "19";
        FieldGroup = "Table10";
        SType = "Decimal";
        Index = "1";
        Label = "Cash refund suspense amount";
    }

    INOUT MIR-POL-CRCY-CD-T[10]
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Index = "1";
        Label = "Currency ";
    }

    INOUT MIR-SEQ-NUM-T[10]
    {
        Length = "3";
        SType = "Hidden";
        Label = "SEQ NUM";
    }
    
    INOUT MIR-RFND-COMNT-IND-T[10]
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Index = "1";
        Label = "Comment Y/N";
    }

    INOUT MIR-RFND-STAT-CD-T[10]
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RFND-STAT-CD";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }
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
        Length = "15";
        SType = "Text";
        Label = "Application Number";
    } 
    
    IN MIR-POL-ID
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-SEQ-NUM
    {
        Length = "3";
        SType = "Hidden";
        Label = "Seq num";
    }   
    INOUT MIR-POL-MPREM-AMT
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
 #       Length = "7";
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
 #       Length = "7";
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
    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }
    INOUT MIR-RECORD-CTR
    {
        Length = "3";
        SType = "Hidden";
        Label = "Rec Count";
    }
    
    INOUT MIR-RECORD-CTR-N
    {
        Length = "3";
        SType = "Hidden";
        Label = "Rec Count";
    }              
}

