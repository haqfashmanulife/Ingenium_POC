# Converted from PathFinder 2.0 to 2.2 on Jan 15, 2004 11:08:15 AM EST
# MP4FB1  12DEC2004  SC  FIRM BANKING REMITTANCE
# EN4044  21AUG2008  CTS FIRM BANKING SCREEN - ADD 5 NEW FIELDS
# EN4631  01OCT2008  CTS FIRM BANKING SCREEN - ACCOUNT NUMBER ADDED
# EN4995  27NOV2008  CTS CHANGES FOR NEW SEARCH CRITERIA WITH ACCT ID
# EN4995                 AND REMITTANCE DATE                         
# M245K2  01MAY2014  CTS ADD PAYOUT METHOD FIELDS IN TABLE                           

S-STEP BF9324-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "List";
    Type = "Output";
    DelEmptyRows;
    FocusField = "MIR-FBNK-REMIT-DT";
    FocusFrame = "ContentFrame";
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
    SType = "Hidden";
  }

  IN LSIR-RETURN-CD 
  {
    DisplayOnly;
  }

  IN MIR-RETRN-CD 
  {
    DisplayOnly;
  }
# *************************************************
#     BELOW ARE FBNK TABLE SEARCH KEYS:
#              - REMITTANCE DATE   (MIR-FBNK-REMIT-DT)
#              - MASTER CLAIM ID   (MIR-FBNK-REF-ID)
#              - POLICY NUMBER     (MIR-POL-ID)
#              - INSURED CLIENT ID (MIR-FB-CLI-ID)
#              - TRANSACTION TYPE  (MIR-FBNK-CAT-CD)
#              - ACCOUNT NUMBER    (MIR-BNK-ACCT-ID)
# *************************************************
                                                        
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
    Label = "Master Claim ID";
  }

  INOUT MIR-POL-ID 
  {
    Key;
    Length = "9";
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
#
    DisplayOnly;
    Length = "5";
    CodeSource = "DataModel";
    CodeType = "FBNK-CAT-CD";
    SType = "selection";
    Label = "Transaction Type:"; 

#MP4FB1   SType = "Hidden";
  }
  
# EN4631
# EN4995 CHANGES BEGIN
#  INOUT MIR-FBNK-ACCT-ID
  INOUT MIR-BNK-ACCT-ID
# EN4995 CHANGES END
  {
    DisplayOnly;
    Length = "17";
    SType = "Text";
    Label = "Account Number";
    }
# EN4631  

# *************************************************
#     FBNK TABLE PREVIOUS RECORD TABLE KEY 
# *************************************************

  IN MIR-PREV-FBNK-REMIT-DT 
  {
    SType = "Hidden";
  }

  IN MIR-PREV-FBNK-REF-ID 
  {
    SType = "Hidden";
  }

  IN MIR-PREV-POL-ID 
  {
    SType = "Hidden";
  }

  IN MIR-PREV-CLI-ID 
  {
    SType = "Hidden";
  }

# MP4FB1 

  IN MIR-PREV-FBNK-CAT-CD 
  {
    SType = "Hidden";
  }
  
# EN4631
# EN4995 CHANGES BEGIN
#  IN MIR-PREV-FBNK-ACCT-ID
  IN MIR-PREV-BNK-ACCT-ID
# EN4995 CHANGES END
  {
    SType = "Hidden";
  }
# EN4631  

# *************************************************
#     FBNK TABLE MORE RECORD TABLE KEY
# *************************************************

  IN MIR-MORE-FBNK-IDT-NUM 
  {
    SType = "Hidden";
  }

  IN MIR-MORE-FBNK-REF-ID 
  {
    SType = "Hidden";
  }

  IN MIR-MORE-POL-ID 
  {
    SType = "Hidden";
  }

  IN MIR-MORE-CLI-ID 
  {
    SType = "Hidden";
  }

  IN MIR-MORE-FBNK-SEQ-NUM 
  {
    SType = "Hidden";
  }

#MP4FB1

  IN MIR-MORE-FBNK-CAT-CD
  {
    SType = "Hidden";
  }
  
# EN4631
# EN4995 CHANGES BEGIN
#  IN MIR-MORE-FBNK-ACCT-ID
  IN MIR-MORE-BNK-ACCT-ID
# EN4995 CHANGES END
  {
    SType = "Hidden";
  }
# EN4631  

# *************************************************
#     SCREEN OUTPUT TABLE RECORD DEFINITION  
# *************************************************

#MP4FB1
  IN MIR-FBNK-CAT-CD-T[50]
  {
    DisplayOnly;
    Length = "05";
    FieldGroup = "Table1";
    Index = "1";
    CodeSource = "DataModel";
    CodeType = "FBNK-CAT-CD";
    SType = "Text";
    Label = "Transaction Type";    
  }

  IN MIR-FBNK-REF-ID-T[50] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    KeyColumn;
    Index = "1";
    Link;
    SType = "Text";
    Label = "Master Claim ID";
    Action = "SelectItem";
  }

  IN MIR-POL-ID-T[50] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    KeyColumn;
    Index = "1";
    Link;
    SType = "Text";
    Label = "Policy ID";
    Action = "SelectItem";
  }

  IN MIR-SERV-BR-ID-T[50] 
  {
    DisplayOnly;
    Length = "05";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Text";
    Label = "Servicing Agent's Branch Code";
  }

  IN MIR-FB-CLI-ID-T[50] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Text";
    Label = "Insured Client ID";
  }

  IN MIR-DV-INS-CLI-NM-T[50] 
  {
    DisplayOnly;
    Length = "50";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Text";
    Label = "Insured Name";
  }

  IN MIR-KANJI-PAYE-NM-T[50] 
  {
    DisplayOnly;
    Length = "50";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Text";
    Label = "Kanji Payee Name";
  }

  IN MIR-FBNK-REMIT-DT-T[50] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Date";
    Label = "Remittance Date";
  }

  IN MIR-FBNK-SEQ-NUM-T[50] 
  {
    DisplayOnly;
    Length = "03";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Number";
    Label = "Sequence Number";
  }

  IN MIR-REMI-AMT-T[50] 
  {
    DisplayOnly;
#M245K2 Changes Starts here    
    CurrencyCode="MIR-FBNK-REMIT-CRCY-CD-T[]";
#M245K2 Changes Ends here    
    Length = "15";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Currency";
    Label = "Remittance Amount";
  }

  IN MIR-FBNK-STAT-CD-T[50] 
  {
    DisplayOnly;
    Length = "01";
    FieldGroup = "Table1";
    Index = "1";
    CodeSource = "DataModel";
    CodeType = "FBNK-STAT-CD";
    SType = "Text";
    Label = "Firm Banking Status";
  }

  IN MIR-FBNK-FAIL-RSN-TXT-T[50] 
  {
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Text";
    Label = "Fail Reason";
  }

  IN MIR-FBNK-RE-REMIT-DT-T[50] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Date";
    Label = "Re-Remittance Date";
  }
# M245K2 Changes Start here 
  IN MIR-FBNK-CREAT-TYP-CD-T[50] 
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Text";
    CodeSource = "DataModel";
    CodeType = "FBNK-PAYO-MTHD-CD";     
    Label = "Payout Method Type";
  }
   IN MIR-FBNK-REMIT-CRCY-CD-T[50] 
   {
     Length = "2";
     FieldGroup = "Table1";
     Index = "1";
     SType = "Hidden";
     Label = "Remittance Currency Code";
  }
# M245K2 Changes End here 
#**EN4044

  IN MIR-BNK-NM-T[50]
  {
    DisplayOnly;
    Length = "36";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Text";
    Label = "Bank Name";
  }

#**EN4044

  IN MIR-BNK-BR-NM-T[50]
  {
    DisplayOnly;
    Length = "36";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Text";
    Label = "Bank Branch Name";
  }

#**EN4044
 
   IN MIR-ACCT-TYP-CD-T[50]
   {
     DisplayOnly;
     Length = "03";
     FieldGroup = "Table1";
     Index = "1";
     CodeSource = "EDIT";
     CodeType = "FBACC";
     SType = "Text";
     Label = "Deposit Type";
   }

#**EN4044

  IN MIR-BNK-ACCT-ID-T[50]
  {
    DisplayOnly;
    Length = "17";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Text";
    Label = "Account Number";
  }

#**EN4044

  IN MIR-ACCT-HLDR-NM-T[50]
  {
    DisplayOnly;
    Length = "50";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Text";
    Label = "Account Holder";
  }
}
