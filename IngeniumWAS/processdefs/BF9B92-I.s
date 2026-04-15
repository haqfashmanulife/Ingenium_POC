#*******************************************************************************
#*  Component:   BF9B92-I.s                                                    *
#*  Description: Rider Surrender/Rider FA Reduction Update                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP1172  CTS      INITIAL VERSION                                           *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  MP245K  CTS      CHANGES DONE FOR FA-REDUCTION AND SURRENDER               *
#*  MP265H  CTS      ADDED MRF INDICATOR AS PART OF NOMURA                     *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                      *
#*******************************************************************************

S-STEP BF9B92-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-POL-ID-BASE";
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
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Hidden";
        Label = "Process State";
    }

    IN MIR-APPL-CTL-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    IN MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        SType = "Text";
        Label = "Pay Out Method";
    }

    IN MIR-NEW-FACE-AMT-T[99] 
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "Derived";
        Index = "1";
        Label = "New Face Amount";
        Length = "16";
        SType = "Currency";
        Signed;
    }

#MP265H CHANGES START HERE

    INOUT MIR-MRF-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "MRF Indicator";
    }


#MP265H CHANGES ENDS HERE    

    INOUT MIR-BNK-ID
    {
        Length = "4";
        SType = "Text";
        Label = "Bank ID";
    }

    INOUT MIR-BNK-BR-ID
    {
        Length = "5";
        SType = "Text";
        Label = "Branch ID";
    }

    INOUT MIR-BNK-ACCT-ID
    {
        Length = "17";
        SType = "Text";
        Label = "Bank Account Number";
    }

    INOUT MIR-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        SType = "Text";
        Label = "Account Holder Name";
    }

    INOUT MIR-BNK-ACCT-TYP-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        SType = "Selection";
        Label = "Account Type";
    }

    IN MIR-POL-ID-BASE
    {
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-JRNL-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
    }

    IN MIR-MLJ-ACPT-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Company Received Date";
    }

    INOUT MIR-PAYE-CLI-FRST-NM 
    {
        Length = "25";
        SType = "Text";
        Label = "Payee's First Name";
    }

    INOUT MIR-PAYE-CLI-LAST-NM 
    {
       Length = "25";
       SType = "Text";
       Label = "Payee's Last Name";
    }

    INOUT MIR-PAYE-CO-NM 
    {
       Length = "50";
       SType = "Text";
       Label = "Company Name";
    }

    INOUT MIR-CLI-ADDR-LOC-CD 
    {
       Length = "8";
       SType = "Text";
       Label = "Address Code";
    }
     
    IN MIR-CLI-PSTL-CD 
    {
       DisplayOnly;
       Length = "9";
       SType = "Text";
       Label = "Postal Code";
    }

    IN MIR-DV-CLI-ADDR 
    {
       DisplayOnly;
       Length = "50";
       SType = "Text";
       Label = "Kanji Address";
    }

    INOUT MIR-CLI-ADDR-ADDL-TXT
    {
       Length = "60";
       SType = "Text";
       Label = "Samakata-bu";
    }

    IN MIR-BNK-NM 
    {
      DisplayOnly;
      Length = "36";
      SType = "Text";
      Label = "Bank Name";
    }

    IN MIR-BNK-BR-NM
    {
      DisplayOnly;
      Length = "36";
      SType = "Text";
      Label = "Bank Branch Name";
    }
#M245B2 CHANGES START HERE    
   INOUT MIR-POL-CRCY-CD
    {
       Length = "2";           
       SType = "Hidden";
       Label = "Currency";
    }
#M245B2 CHANGES END HERE    
#MP245K CHANGES START HERE    
  IN MIR-DV-HO-RECV-DT
  {
    Length = "10";
    SType = "Hidden";
    Label = "Head Office Received Date";
  }      
     IN MIR-DV-PAYO-JPY-BNFT-CD
       {
         Length = "1";
         SType = "Hidden";
         Label = "JPY BENEFIT RIDER INDICATOR";
      }   

 #MP245K CHANGES END HERE 
 
 #27549A - CHANGES START HERE    
     IN  MIR-ATO-NOT-APPL-IND
     {
          Length = "1";
          SType = "Hidden";
          Label = "ATO not applicable";
     } 
#27549A- CHANGES ENDS HERE
}

