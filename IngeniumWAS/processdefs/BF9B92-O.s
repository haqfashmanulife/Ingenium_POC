#*******************************************************************************
#*  Component:   BF9B92-O.s                                                    *
#*  Description: Rider Surrender/Rider FA Reduction Update                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP1172  CTS      INITIAL VERSION                                           *
#*  Q13430  CTS     TRAIL CALC CHANGES FOR APL PROCESS                         *
#*  C17501  CTS     CHANGED THE STYPE FOR THE FIELD MIR-BNK-ACCT-TYP-CD        *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  MP245K  CTS      CHANGES DONE FOR FA-REDUCTION AND SURRENDER               *
#*  MP265H  CTS      ADDED MRF INDICATOR AS PART OF NOMURA                     *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                      *
#*******************************************************************************

S-STEP BF9B92-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Output";
        DelEmptyRows;
        FocusField = "confirmButton";
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

    IN LSIR-RETURN-CD
    {
        DisplayOnly;
    }

    IN MIR-RETRN-CD
    {
        DisplayOnly;
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

    IN MIR-MRF-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "MRF Indicator";
    }

#MP265H CHANGES ENDS HERE

    IN MIR-BNK-ID
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank ID";
    }

    IN MIR-BNK-BR-ID
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Branch ID";
    }

    IN MIR-BNK-ACCT-ID
    {
        DisplayOnly;
        Length = "17";
        SType = "Text";
        Label = "Bank Account Number";
    }

    IN MIR-BNK-ACCT-HLDR-NM
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Account Holder Name";
    }

    IN MIR-BNK-ACCT-TYP-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "FBACC";
#C17501 - Changes Start here
#        SType = "Selection";
        SType = "Text";
#C17501 - Changes Ends here
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
    IN MIR-PAYE-CLI-FRST-NM 
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "Payee's First Name";
    }

    IN MIR-PAYE-CLI-LAST-NM 
    {
       DisplayOnly;
       Length = "25";
       SType = "Text";
       Label = "Payee's Last Name";
    }

    IN MIR-PAYE-CO-NM 
    {
       DisplayOnly;
       Length = "50";
       SType = "Text";
       Label = "Company Name";
    }

    IN MIR-CLI-ADDR-LOC-CD 
    {
       DisplayOnly;
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

    IN MIR-CLI-ADDR-ADDL-TXT
    {
       DisplayOnly;
       Length = "60";
       SType = "Text";
       Label = "Samakata-bu";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-PLAN-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Product Name";
    }

    IN MIR-JRNL-DT
    {
      DisplayOnly;
      Length = "10";
      SType = "Date";
      Label = "Journal Date";
    }

    IN MIR-MLJ-ACPT-DT
    {
      DisplayOnly;
      Length = "10";
      SType = "Date";
      Label = "Company Received Date";
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

    IN MIR-POL-BILL-MODE-CD
    {
      DisplayOnly;
      Length = "1";
      CodeSource = "DataModel";
      CodeType = "POL-BILL-MODE-CD";
      SType = "Text";
      Label = "Payment Mode";
    }
#Q13430- Changes Start here

    IN MIR-DV-EFF-DT
  {
    Length = "10";
    DBTableName = "Derived";
    SType = "Hidden";
  }
   IN MIR-DV-UNDO-VALID-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
    }
#Q13430- Changes End here    
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
    Label = "Home Office Received Date";
  }  
       IN MIR-DV-PAYO-JPY-BNFT-CD
         {
           Length = "1";
           SType = "Hidden";
           Label = "JPY BENEFIT RIDER INDICATOR";
      }
#27549A - CHANGES START HERE    
    IN  MIR-ATO-NOT-APPL-IND
    {
         Length = "1";
         SType = "Hidden";
         Label = "ATO not applicable";
    } 
#27549A- CHANGES ENDS HERE
  
#MP245K CHANGES END HERE   
}

