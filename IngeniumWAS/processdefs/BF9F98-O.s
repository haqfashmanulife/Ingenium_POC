# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:36 PM EDT

#*******************************************************************************
#*  Component:   BF9F98-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  CA0002  CTS      INITIAL VERSION                                           *
#*  CA02CR  CTS      FIX DONE FOR CR CHANGES                                   *
#*******************************************************************************

S-STEP BF9F98-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
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

    INOUT MIR-POL-APP-FORM-ID
    {
        Length = "15";
        SType = "Text";
        Label = "Application Number";
    }

    INOUT MIR-OWN-FRST-NM
    {
        Length = "50";
        SType = "Text";
        Label = "Owner First Name";
    }
    
    INOUT MIR-OWN-SUR-NM
    {
        Length = "50";
        SType = "Text";
        Label = "Owner Last Name";
    }
    
    INOUT MIR-OWN-CO-NM
    {
        Length = "50";
        SType = "Text";
        Label = "Owner Company Name";
    }
    
    INOUT MIR-INSRD-FRST-NM
    {
        Length = "50";
        SType = "Text";
        Label = "Insured First Name";
    }
    
    INOUT MIR-INSRD-SUR-NM
    {
        Length = "50";
        SType = "Text";
        Label = "Insured Last Name";
    }
    
    INOUT MIR-SERV-AGT-ID
    {
        Length = "6";
        SType = "Text";
        Label = "Servicing Agent Id";
    }
    
    INOUT MIR-SRCH-PERI-STRT-DT
    {
        Length = "10";
        SType = "Text";
        Label = "Search Period";
    }

    INOUT MIR-SRCH-PERI-END-DT
    {
        Length = "10";
        SType = "Text";
        Label = "Search Period";
    }
    
    INOUT MIR-RFND-USER-ID
    {
        Length = "8";
        SType = "Text";
        Label = "Refund User Id";
    }
    
    IN MIR-SRCH-RSLT-CNT
    {
        Length = "2";
        SType = "Text";
        Label = "Search Record Counter";  
    }
    
    IN MIR-RFND-RQST-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Date of Request for Refund";
        Index = "1";
    }    
    
    IN MIR-PROD-APP-TYP-CD-T[20]
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PROD-APP-TYP";
        FieldGroup = "Table20";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Product";
        Index = "1";
    }
    
    IN MIR-POL-APP-FORM-ID-T[20] 
    {
           Length = "15";
           FieldGroup = "Table20";
           Label = "Application Number";
           SType = "Text";
           Index = "1";
    }
    
    IN MIR-DV-OWN-CLI-NM-T[20]
    {
        Length = "75";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
        Index = "1";
    }
    
    IN MIR-DV-INSRD-CLI-NM-T[20]
    {
        Length = "75";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
        Index = "1";
    }
    
    IN MIR-DV-PAYO-MTHD-CD-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "BILL-TYP-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payment Method";
        Index = "1";
    }
    
    IN MIR-CWA-RFND-SUSP-AMT-T[20]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        CurrencyCode = "MIR-POL-CRCY-CD";        
        SType = "Currency";
        Label = "CWA Refund Suspense Amount";
        Index = "1";
    }
    
    IN MIR-POL-CRCY-CD-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Currency";
        Index = "1";
    }
    
    IN MIR-DPOS-SCHD-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Deposit Scheduled date";
        Index = "1";
    }            

    IN MIR-DV-SERV-AGT-NM-T[20]
    {
        Length = "75";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Servicing Agent Name";
        Index = "1";
    }
    
    IN MIR-SERV-AGT-ID-T[20]
    {
        Length = "6";
        FieldGroup = "Table20";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Servicing Agent ID";
        Index = "1";
    }

    IN MIR-RFND-STAT-CD-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "RFND-STAT-CD";
        DBTableName = "TRFND";
        SType = "Text";
        Label = "Refund Status";
        Index = "1";
    }      
    
    IN MIR-RFND-USER-ID-T[20]
    {
        Length = "8";
        FieldGroup = "Table20";
        DBTableName = "TRFND";
        SType = "Text";
        Label = "Refund User ID";
        Index = "1";
    }
  
# CA02CR changes begins
    IN MIR-RFND-BNK-NM-T[20]
    {
        Length = "75";
        FieldGroup = "Table20";
        DBTableName = "TRFND";
        SType = "Text";
        Label = "Refund Bank Name";
        Index = "1";
    }
    
    IN MIR-RFND-BNK-BR-NM-T[20]
    {
        Length = "75";
        FieldGroup = "Table20";
        DBTableName = "TRFND";
        SType = "Text";
        Label = "Refund Bank Branch Name";
        Index = "1";
    }
        
    IN MIR-RFND-ACCT-TYP-CD-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        DBTableName = "TRFND";
        SType = "Text";
        Label = "Account Type Code";
        Index = "1";
    }    
    
    IN MIR-RFND-BNK-ACCT-ID-T[20]
    {
        Length = "8";
        FieldGroup = "Table20";
        DBTableName = "TRFND";
        SType = "Text";
        Label = "Refund Bank Account ID";
        Index = "1";
    }    
     
    IN MIR-RFND-ACCT-HLDR-NM-T[20]
    {
        Length = "75";
        FieldGroup = "Table20";
        DBTableName = "TRFND";
        SType = "Text";
        Label = "Refund Account Holder Name";
        Index = "1";
    }  
        
 
# CA02CR changes ends

    INOUT MIR-RECORD-CTR
    {
        Length = "3";
        SType = "Hidden";
        Label = "Rec Count";
    }    
}