#*******************************************************************************
#*  Component:   BF1364FB-I.s                                                  *
#*  Description: FXWL 3DD WAIVER CHANGES                                       *
#*                                                                             *
#*******************************************************************************
#*                                                                             *
#*  M319A3  CTS      INITIAL VERSION                                           *
#*  Q91588  CTS      FIX FOR FXWL WAIVER CHANGES                               *
#*  Q91714  CTS      FIX FOR FXWL WAIVER VIRTUAL UNDO CHANGES                  *
#*  MPC115  CTS      DELAY INTEREST CALCULATION FOR FXWL WAIVER CHANGES        *
#*******************************************************************************

S-STEP BF1364FB-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Waiver";
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
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-CVG-NUM
    {
        Length = "2";
        DefaultConstant = "00";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-DV-WP-TYP-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-WP-TYP-CD";
        SType = "Text";
        Label = "Waiver Type";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }
    
    IN MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }

    IN MIR-DV-TRNXT-PAYO-MTHD-CD
   {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
#Q91588 CHANGES START HERE
        #CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        CodeType = "DV-PAYO-MTHD-CD";
#Q91588 CHANGES END HERE
        SType = "Text";
        Label = "Pay Out Method";
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
        Label = "JPY BENEFIT RIDER INDICATOR";
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
#Q91714 CHANGES START HERE
    INOUT MIR-DV-UNDO-VALID-CD
    {
        Length = "1";
        SType="Hidden";
    }
#Q91714 CHANGES END HERE
#MPC115 CHANGES START HERE
    IN MIR-DLAY-INT-STRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Head Office Received Date";
    }
#MPC115 CHANGES END HERE    
}