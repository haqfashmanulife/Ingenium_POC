
#*******************************************************************************
#*  Component:   BF9E54Cli-I.s                                                 *
#*  Description: Deferment Processing - Details                                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3093  30JUN23  Intial Version                                            *
#*  UY3066  04JAN24  CHANGES DONE AS PART OF SAVINGS RIDER                     *
#*******************************************************************************

S-STEP BF9E54Cli-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Prcesdef";
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

    IN MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Policyholder Name";
    }

    IN MIR-PRCES-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Process Date";       
    }    
    
    # UY3066 CHANGES START
     
    IN MIR-POL-ID-BASE
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
    }
    
    # UY3066 CHANGES END

    IN MIR-JRNL-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Journal Date";       
    }

    IN MIR-TOT-PD-PREM-AMT
    {
        DisplayOnly;           
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Premium Paid for the Policy";
    }

    IN MIR-DV-HO-RECV-DT
    {
        Mandatory;    
        Length = "10";
        SType = "Date";
        Label = "Head Office Received Date";		
    }
    
    IN MIR-POL-BILL-MODE-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "PLAN-BILL-MODE-CD";
        SType = "Text";
        Label = "Billing Mode";
    }
    
    IN MIR-APPL-CTL-PRCES-DT
    {
        Mandatory;    
        Length = "10";
        SType = "Date";
        Label = "Company Received Date";
        
    }
    
    IN MIR-DV-TRNXT-PAYO-MTHD-CD
    {    
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        SType = "Text";
        Label = "Pay Out Method";	
    }
    
    IN MIR-EVNT-ACTV-CD
    {
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "DEFR-ACTV-TYP-CD";
        SType = "Text";
        Label = "Activity Type";
    }

    INOUT MIR-PAYE-CLI-LAST-NM 
    {
        Length = "25";
        SType = "Text";
        Label = "Payee's Last Name";
    }
    
    INOUT MIR-PAYE-CLI-FRST-NM 
    {
        Length = "25";
        SType = "Text";
        Label = "Payee's First Name";
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
  
    INOUT MIR-BNK-ID
    {
        Length = "4";
        SType = "Text";
        Label = "Bank Number";
    }
    
    IN MIR-BNK-NM 
    {
        DisplayOnly;
        Length = "36";
        SType = "Text";
        Label = "Bank Name";
    }

    INOUT MIR-BNK-BR-ID
    {
        Length = "5";
        SType = "Text";
        Label = "Branch Number";
    }
    
    IN MIR-BNK-BR-NM
    {
        DisplayOnly;
        Length = "36";
        SType = "Text";
        Label = "Branch Name";
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

}

