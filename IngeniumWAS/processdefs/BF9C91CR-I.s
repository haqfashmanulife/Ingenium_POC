#*******************************************************************************
#*  Component:   BF9C91CR-I.s                                                  *
#*  Description: Input Edit Step for CSV Refund Create Process                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M142U2  CTS      Intial Version                                            *
#*                   RIDER SWITCH ENHANCEMENTS                                 *                                                         *
#*  Q16002  CTS      Removal of Payment Request type in Create Screen and      *
#*                   Addition of Activity  Type in List Screen instead of      *   
#*                   Payment Request Type                                      *
#*  Q16034  CTS      M142U2-CHANGE IN FIELD NAME TO AMOUNT OF PAYMENT          *
#*******************************************************************************
    S-STEP BF9C91CR-I
{
    ATTRIBUTES
    {
    BusinessFunctionType = "Update";
    FocusField = "mir-pmt-rqst-amt";
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
        SType = "Hidden";
    }
    
    IN MIR-POL-ID-BASE
    {
    DefaultSession = "MIR-POL-ID-BASE";
    Key;
    Label = "Policy ID";
    Length = "9";
    Mandatory;
    SType = "Text";
    }
    
    IN MIR-POL-ID-SFX
    {
    DefaultSession = "MIR-POL-ID-SFX";
    Key;
    Label = "Suffix";
    Length = "1";
    SType = "Text";
    }

    IN MIR-PBRQ-EFF-DT
    {
    Key;
    Label = "CSV Refund request Effective Date";
    Length = "10";
    Mandatory;
    SType = "Date";
    }
   

    IN MIR-DV-POL-FUT-ACTV-TYP-CD
    {
    CodeSource = "DataModel";
    CodeType = "DV-POL-FUT-ACTV-TYP-CD";
    Label = "Activity Type";
    Length = "2";
    Mandatory;
    SType = "Text";
    }
    
    INOUT MIR-DV-PRCES-STATE-CD
    {
            Length = "1";
            SType = "Hidden";
            Label = "Process State";
    }
    
    INOUT MIR-POL-FUT-ACTV-STAT-CD
    {
    CodeSource = "DataModel";
    CodeType = "POL-FUT-ACTV-STAT-CD";
    Label = "Activity Status";
    Length = "1";
    SType = "Text";
    }    
# Q16002 CHANGES STARTS 
#    IN MIR-PMT-RQST-TYP-CD
#    {
#      Length = "15";
#      Mandatory;     
#      CodeSource = "DataModel";
#      CodeType = "PMT-RQST-TYP-CD";
#      SType = "Selection";
#      Label = "Type of Payment Requested";      
#    }
# Q16002 CHANGES ENDS
    
    IN MIR-PMT-RQST-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
# Q16034 CHANGES STARTS      
#     Label = "Amount of payment requested";
        Label = "Amount of payment";
# Q16034 CHANGES ENDS      
    }        
    
    
    INOUT MIR-PAYE-GIV-NM 
    {
        Length = "25";
        SType = "Text";
        Label = "Payee's First Name";
    }

    INOUT MIR-PAYE-SUR-NM 
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
        DBTableName = "TCLRL";        
        SType = "Selection";
        Label = "Account Type";
    }

}    