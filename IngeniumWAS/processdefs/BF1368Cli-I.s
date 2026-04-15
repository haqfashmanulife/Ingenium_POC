
#*******************************************************************************
#*  Component:   BF1368Cli-I.s                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  RPU002  CTS      SCREEN ENHANCEMENT FOR RPU PROCESSING                     *
#*  RPUV2B  CTS      SCREEN ENHANCEMENT FOR SULV2-RPU PROCESSING               *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                      *
#*******************************************************************************

S-STEP BF1368Cli-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Prcesrpu";
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

    IN MIR-APPL-CTL-PRCES-DT
    {
        DisplayOnly;    
        Length = "10";
        SType = "Date";
        Label = "Company Received Date";
        
    }
    

    IN MIR-POL-ID-BASE
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-POL-ID-SFX
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }
    

    IN MIR-DV-HO-RECV-DT
    {
        DisplayOnly;    
        Length = "10";
        SType = "Date";
        Label = "Head Office Received Date";		
    }


    IN MIR-DV-PAYO-JPY-BNFT-CD
      {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAYO-JPY-BNFT-CD";
        SType = "Text";
        Label = "JPY Benefit Rider";
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

    IN MIR-JRNL-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Journal Date";
        
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


    INOUT MIR-MRF-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "MRF Indicator";
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
      Label = "Branch Name";
    }    
     
    INOUT MIR-BNK-ID
    {
        Length = "4";
        SType = "Text";
        Label = "Bank Number";
    }

    INOUT MIR-BNK-BR-ID
    {
        Length = "5";
        SType = "Text";
        Label = "Branch Number";
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
    
    IN MIR-PD-PREM-AMT
       {
           CurrencyCode = "MIR-PMT-CRCY-CD";
           DisplayOnly;           
           Signed;
           Length = "17";
           SType = "Currency";
           Label = "Total Premium Paid for the Policy";
       }   
       
#RPUV2B CHANGES STARTS HERE   

    IN MIR-RPU-POL-TYP-CD
    {
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "RPU-POL-TYP-CD";
        SType = "Selection";
        Label = "RPU Policy Type";	
    }     
#RPUV2B CHANGES ENDS HERE 

    IN MIR-PRCES-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Process Date";
    }     

    IN MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }   
    
     IN MIR-POL-BILL-MODE-CD
     {
       
         DisplayOnly;
         Length = "2";
         CodeSource = "DataModel";
         CodeType = "POL-BILL-MODE-CD";
         SType = "Text";
         Label = "Payment Mode";
     } 
     
          INOUT MIR-PAYEE-NM-TXT
	{
		DisplayOnly;		
		Label = "Payee Name:";
		Length = "50";
		SType = "Text";
	}  
     
    
      INOUT MIR-PMT-CRCY-CD
       {
          Length = "2";           
          SType = "Hidden";
          Label = "Currency";
       }
#27549A - CHANGES START HERE
    IN MIR-ATO-NOT-APPL-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "ATO not applicable";
    }
#27549A- CHANGES ENDS HERE      
}

