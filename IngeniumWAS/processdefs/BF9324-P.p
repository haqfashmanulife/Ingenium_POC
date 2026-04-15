# Converted from PathFinder 2.0 to 2.2 on Jan 15, 2004 11:05:01 AM EST

#*******************************************************************************
#*  Component:   BF9324-P.p                                                    *
#*  Description: Firm Banking Table (FBNK) List step                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* HAC002  HIN/CL   FIRM BANKING - ONLINE            (HAC002A)                 *
#* MP4FB1  SC       FIRM BANKING REMITTANCE                                    *
#* EN4044  CTS      FIRM BANKING SCREEN - ADD 5 NEW FIELDS                     *
#* EN4631  CTS      FIRM BANKING SCREEN - ACCOUNT NUMBER ADDED                 *
#* EN4995  CTS      CHANGES FOR NEW SEARCH CRITERIA WITH ACCT ID AND           *
#* EN4995  CTS      REMITTANCE DATE                                            *
#* M245K2  CTS      ADD PAYOUT METHOD FIELDS IN TABLE                          *
#*******************************************************************************

P-STEP BF9324-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9324";
        BusinessFunctionName = "Firm Banking List";
        BusinessFunctionType = "List";
        MirName = "CCWM9324";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

# *******************************************************
#    TABLE SEARCH KEYS                                  *
# *******************************************************

    INOUT MIR-FBNK-REMIT-DT
    {
        Key;
        Length = "10";
        SType = "Date";
        Label = "Remittance Date";
    }
    
    INOUT MIR-FBNK-REF-ID
    {
        Key;
        Length = "10";
        SType = "Text";
        DefaultSession = "MIR-CLM-ID";          
        Label = "Master Claim ID";
    }
    
    INOUT MIR-POL-ID
    {
        Key;
        Length = "10";
        SType = "Text";
        Label = "Policy ID";
    }
    
    INOUT MIR-FB-CLI-ID
    {
        Key;
        Length = "10";
        SType = "Text";
        Label = "Insured Client ID";
    }
    
    INOUT MIR-FBNK-CAT-CD
    {
# MP4FB1                
        Key;
        Length = "5";
        SType = "Text";
        DefaultSession = "MIR-FBNK-CAT-CD";     
        Label = "Transaction Type";
    
# MP4FB1SType = "Hidden";
    }
# EN4631
# EN4995 CHANGES BEGIN
#    INOUT MIR-FBNK-ACCT-ID
    INOUT MIR-BNK-ACCT-ID
# EN4995 CHANGES END
    {
        Key;
        Length = "17";
        SType = "Text";
        Label = "Account Number";
    }
# EN4631
# *******************************************************
#    TABLE SEARCH KEYS - PREV                           *
# *******************************************************

    INOUT MIR-PREV-FBNK-REMIT-DT
    {
        SType = "Hidden";
    }     
    
    INOUT MIR-PREV-FBNK-REF-ID
    {
        SType = "Hidden";
    }     

    INOUT MIR-PREV-POL-ID 
    {
        SType = "Hidden";
    }     

    INOUT MIR-PREV-CLI-ID
    {
        SType = "Hidden";
    }     

#MP4FB1

    INOUT MIR-PREV-FBNK-CAT-CD
    {
        SType = "Hidden";
    }     

# EN4631
# EN4995 CHANGES BEGIN
#    INOUT MIR-PREV-FBNK-ACCT-ID
    INOUT MIR-PREV-BNK-ACCT-ID
# EN4995 CHANGES END
    {
        SType = "Hidden";
    }
# EN4631

# *******************************************************
#    TABLE SEARCH KEYS - MORE                           *
# *******************************************************

    INOUT MIR-MORE-FBNK-IDT-NUM
    {
        SType = "Hidden";
    }     

    INOUT MIR-MORE-FBNK-REF-ID
    {
        SType = "Hidden";
    }     

    INOUT MIR-MORE-POL-ID
    {
        SType = "Hidden";
    }     

    INOUT MIR-MORE-CLI-ID
    {
        SType = "Hidden";
    }     

#MP4FB1
    INOUT MIR-MORE-FBNK-CAT-CD 
    {
        SType = "Hidden";
    }  
    
# EN4631
# EN4995 CHANGES BEGIN
#    INOUT MIR-MORE-FBNK-ACCT-ID
    INOUT MIR-MORE-BNK-ACCT-ID
# EN4995 CHANGES END
    {
        SType = "Hidden";
    }
# EN4631    

    INOUT MIR-MORE-FBNK-SEQ-NUM
    {
        SType = "Hidden";
    }     

# *******************************************************
#    SCREEN OUTPUT TABLE RECORD                         *
# *******************************************************

#MP4FB1

    OUT MIR-FBNK-CAT-CD-T[50]
    {
        KeyColumn;
        FieldGroup = "Table1";
        Length = "05";
        SType = "Text";
        CodeSource = "DataModel";
        CodeType = "FBNK-CAT-CD";        
        Label = "Transaction Type";
        Index = "1";
    }

    OUT MIR-FBNK-REF-ID-T[50]
    {
        KeyColumn;
        FieldGroup = "Table1";
        Length = "10";
        SType = "Text";
        Label = "Master Claim ID";
        Index = "1";
    }        
    
    OUT MIR-POL-ID-T[50]
    {
        FieldGroup = "Table1";
        Length = "10";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";
    }       

    OUT MIR-SERV-BR-ID-T[50]
    {
        FieldGroup = "Table1";
        Length = "05";
        SType = "Text";
        Label = "Servicing Agent's Branch Code";
        Index = "1";
    }       

    OUT MIR-FB-CLI-ID-T[50]
    {
        FieldGroup = "Table1";
        Length = "10";
        SType = "Text";
        Label = "Insured Client ID";
        Index = "1";
    } 

    OUT MIR-DV-INS-CLI-NM-T[50]
    {
        FieldGroup = "Table1";
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
        Index = "1";
    } 

    OUT MIR-KANJI-PAYE-NM-T[50]
    {
        FieldGroup = "Table1";
        Length = "50";
        SType = "Text";
        Label = "Kanji Payee Name";
        Index = "1";
    } 

    OUT MIR-FBNK-REMIT-DT-T[50]
    {
        FieldGroup = "Table1";
        Length = "10";
        SType = "Date";
        Label = "Remittance Date";
        Index = "1";
    }

    OUT MIR-FBNK-SEQ-NUM-T[50]
    {
        FieldGroup = "Table1";
        Length = "03";
        SType = "Number";
        Label = "Sequence Number";
        Index = "1";
    }
    
    OUT MIR-REMI-AMT-T[50]
    {
        FieldGroup = "Table1";
        Length = "15";
        SType = "Currency";
        Label = "Remittance Amount";
        Index = "1";
    }     

    OUT MIR-FBNK-STAT-CD-T[50]
    {
        FieldGroup = "Table1";
        Length = "01";
        SType = "Text";
        CodeSource = "DataModel";
        CodeType = "FBNK-STAT-CD";        
        Label = "Firm Banking Status";
        Index = "1";
    }

    OUT MIR-FBNK-FAIL-RSN-TXT-T[50]
    {
        FieldGroup = "Table1";
        Length = "01";
        SType = "Text";
        Label = "Fail Reason";
        Index = "1";
    }

    OUT MIR-FBNK-RE-REMIT-DT-T[50]
    {
        FieldGroup = "Table1";
        Length = "10";
        SType = "Date";
        Label = "Re-Remittance Date";
        Index = "1";
    }    
# M245K2 Changes Start here    
    OUT MIR-FBNK-CREAT-TYP-CD-T[50]
    {
        FieldGroup = "Table1";
        Length = "1";
        SType = "Text";
        CodeSource = "DataModel";
        CodeType = "FBNK-PAYO-MTHD-CD"; 
        Label = "Payout Method Type";
        Index = "1";
    }  
  OUT MIR-REMIT-CRCY-CD-T[50] 
  {
    Length = "2";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Hidden";
    Label = "Remittance Currency Code";
  }     
# M245K2 Changes End here    
#EN4044

    OUT MIR-BNK-NM-T[50]
    {
        FieldGroup = "Table1";
        Length = "36";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Name";
        Index = "1";
    }

#EN4044

    OUT MIR-BNK-BR-NM-T[50]
    {
        FieldGroup = "Table1";
        Length = "36";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Branch Name";
        Index = "1";
    }

#EN4044

    OUT MIR-ACCT-TYP-CD-T[50]
    {
        FieldGroup = "Table1";
        Length = "03";
        SType = "Text";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        Label = "Deposit Type";
        Index = "1";
    }

#EN4044

    OUT MIR-BNK-ACCT-ID-T[50]
    {
        FieldGroup = "Table1";
        Length = "17";
        SType = "Text";
        Label = "Account Number";
        Index = "1";
    }

#EN4044

    OUT MIR-ACCT-HLDR-NM-T[50]
    {
        FieldGroup = "Table1";
        Length = "50";
        SType = "Text";
        Label = "Account Holder";
        Index = "1";
    }
    
   OUT MIR-FBNK-REMIT-CRCY-CD-T[50] 
   {
     Length = "2";
     FieldGroup = "Table1";
     Index = "1";
     SType = "Hidden";
     Label = "Remittance Currency Code";
  }    
}
