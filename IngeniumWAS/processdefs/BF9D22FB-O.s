#*******************************************************************************
#*  Component:   BF9D22FB-O.s                                                  *
#*  Description: HEALTH CONGRATULATORY BENEFIT PAYOUT PROCESS -BANK DETAILS    *
#*                                                                             *
#*******************************************************************************
#*                                                                             *
#*  UY3071  CTS      INGENIUM HEALTH CONGRATULATORY BENEFIT                    *
#*******************************************************************************

S-STEP BF9D22FB-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "HEcngr";
        DelEmptyRows;
        FocusField = "confirmButton";
        FocusFrame = "ButtonFrame";
        Type = "Output";
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
        Label = "Process Date";
        Length = "10";
        Mandatory;
        SType = "Date";
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
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        DisplayOnly;
        Label = "Pay Out Method";
        Length = "1";
        SType = "Selection";
    }
    
    IN MIR-PAYE-CLI-LAST-NM
    {
        DisplayOnly;
        Label = "Payee's Last Name";
        Length = "25";
        SType = "Text";
    }
        
    IN MIR-PAYE-CLI-FRST-NM
    {
        DisplayOnly;
        Label = "Payee's First Name";
        Length = "25";
        SType = "Text";
    }

    IN MIR-PAYE-CO-NM
    {
        DisplayOnly;
        Label = "Company Name";
        Length = "50";
        SType = "Text";
    }
        
    IN MIR-CLI-ADDR-LOC-CD
    {
        DisplayOnly;
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
        
    IN MIR-CLI-ADDR-ADDL-TXT
    {
        DisplayOnly;
        Label = "Samakata-bu";
        Length = "60";
        SType = "Text";
    }        
    
    IN MIR-BNK-ID
    {       
        DisplayOnly;
        Label = "Bank Number";
        Length = "4";
        SType = "Text";
    }
            
    IN MIR-BNK-NM
    {        
        Label = "Bank Name";
        DisplayOnly;
        Length = "50";
        SType = "Text";
    } 
            
    IN MIR-BNK-BR-ID
    {       
        Label = "Branch Number";
        DisplayOnly;
        Length = "3";
        SType = "Text";
    }
            
    IN MIR-BNK-BR-NM
    {
        Label = "Branch Name";
        Length = "50";
        DisplayOnly;
        SType = "Text";
    }
            
    IN MIR-BNK-ACCT-TYP-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        SType = "Selection";
        Label = "Account Type";
    }

    IN MIR-BNK-ACCT-ID
    {
        Label = "Bank Account Number";
        Length = "17";
        DisplayOnly;
        SType = "Text";
    }

    IN MIR-BNK-ACCT-HLDR-NM
    {
        Label = "Account Holder Name"; 
        Length = "50";
        DisplayOnly;
        SType = "Text";
    }
}
