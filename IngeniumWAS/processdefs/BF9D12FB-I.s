#*******************************************************************************
#*  Component:   BF9D12FB-I.s                                                  *        
#*  Description: Survival Benefit Payout Process-Bank Details                  *
#*                                                                             *
#********************************************************************************
#*                                                                             *
#*  MP302A  CTS      INITIAL VERSION                                           *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                      *
#*  CD3001  CTS      CHANGES DONE AS PART OF CERBERUS DAY 3.0                  *
#*******************************************************************************

S-STEP BF9D12FB-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "TDSrvb";
        FocusField = "MIR-POL-ID-BASE";
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

   IN MIR-POL-ID-BASE
   {
       DisplayOnly;
       Length = "9";
       SType = "Text";
       Label = "Policy Id";
   }
   
    IN MIR-POL-ID-SFX
    {
        DisplayOnly;
        Length = "1";     
        SType = "Text";   
        Label = "Suffix";   
     }   
       
    IN MIR-DV-OWN-CLI-NM
    {
        Length = "50";
        DisplayOnly;
        SType = "Text";
        Label = "Owner name"; 
    }
    
    IN MIR-CO-RECV-DT
    {
        DisplayOnly;
        Label = "Company Received Date";
        Length = "10";
        SType = "Date";
    }

    IN MIR-APPL-CTL-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Process Date";
    }
   
    IN MIR-JRNL-DT
    {
        DisplayOnly;
        Label = "Journal Date";
        Length = "10";
        SType = "Date";
    }
    
    IN MIR-DV-TRNXT-PAYO-MTHD-CD
    {
      DisplayOnly;
      CodeSource = "DataModel";
      CodeType = "DV-TRNXT-PAYO-MTHD-CD";
      Label = "Pay Out Method";
      Length = "1";
      SType = "Text";
    }
    
    INOUT MIR-PAYE-CLI-LAST-NM
    {
      Label = "Payee's Last Name";
      Length = "25";
      SType = "Text";
    }
    
    INOUT MIR-PAYE-CLI-FRST-NM
    {
      Label = "Payee's First Name";
      Length = "25";
      SType = "Text";
    }
    
    INOUT MIR-PAYE-CO-NM
    {
      Label = "Company Name";
      Length = "50";
      SType = "Text";
    }
    
    INOUT MIR-CLI-ADDR-LOC-CD
    {
       Label = "Address Code";
       Length = "8";
       SType = "Text";
    }
    
    IN MIR-CLI-PSTL-CD
    {
      DisplayOnly;
      Label = "Postal Code";
      Length = "8";
      SType = "Text";
    }
    
    IN MIR-DV-CLI-ADDR
    {
       DisplayOnly;
       Label = "Kanji Address";
       Length = "75";
       SType = "Text";
    }
    
    INOUT MIR-CLI-ADDR-ADDL-TXT
    {
      Label = "Samakata-bu";
      Length = "60";
      SType = "Text";
    }        
   
    INOUT MIR-BNK-ID
    {       
        Label = "Bank Number";
        Length = "4";
        SType = "Text";
    }
    
    IN MIR-BNK-NM
    { 
        DisplayOnly;
        Label = "Bank Name";
        Length = "50";
        SType = "Text";
    } 
    
    INOUT MIR-BNK-BR-ID
    {       
        Label = "Branch Number";
        Length = "3";
        SType = "Text";
    }
    
    IN MIR-BNK-BR-NM
    {
        DisplayOnly;
        Label = "Branch Name";
        Length = "50";
        SType = "Text";
    }

#CD3001 - Changes Start here 
    IN MIR-PAYO-JPY-BNFT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAYO-JPY-BNFT-CD";
        SType = "Text";
        Label = "JPY Benefit Rider";
    }
#CD3001 - Changes Ends here 

    INOUT MIR-BNK-ACCT-TYP-CD
    {
         Length = "3";
         CodeSource = "EDIT";
         CodeType = "FBACC";
         SType = "Selection";
         Label = "Account Type";
    }
    INOUT MIR-BNK-ACCT-ID
    {
       Label = "Bank Account Number";
       Length = "17";
       SType = "Text";
    }
    
    INOUT MIR-BNK-ACCT-HLDR-NM
    {
       Label = "Account Holder Name";
       Length = "50";
       SType = "Text";
    }
#27549A - Changes Start here      
    IN MIR-ATO-NOT-APPL-IND
    {
       DisplayOnly;
       Length = "1";
       SType = "Indicator";
       Label = "ATO not applicable";
    }
#27549A- Changes ends here    
}