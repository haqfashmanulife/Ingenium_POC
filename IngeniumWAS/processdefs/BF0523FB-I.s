#*******************************************************************************
#*  Component:   BF0523FB-I.s                                                  *        
#*  Description: Free withdrawal Payout Process-Bank Details                   *
#*                                                                             *
#********************************************************************************
#*                                                                             *
#*  UY3060  CTS      Dividend Payout Process for stream3 product               *
#*******************************************************************************

S-STEP BF0523FB-I
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

    IN MIR-POL-TRXN-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
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

    INOUT MIR-MRF-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "MRF Indicator";
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
}