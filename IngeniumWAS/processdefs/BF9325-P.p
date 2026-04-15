
#*******************************************************************************
#*  Component:   BF9325-P.p                                                    *
#*  Description: Firm Banking Coverage Table Status Update                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* MP4FB1    SC      Firm Banking Remittance (New Process)                     *
#*                                                                             *
#*******************************************************************************

P-STEP BF9325-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9325";
        BusinessFunctionName = "Firm Banking Coverage Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM9325";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;
    
    INOUT MIR-FBKC-REQUEST-ACT-CD;
    
# * * * ************************************************
# * * *  FBNK table search keys   
# * * * ************************************************
    
    INOUT MIR-FBNK-REMIT-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Remittance Date";
    }
    
    INOUT MIR-FBNK-CAT-CD
    {
        Key;
        DisplayOnly;
        Length = "20"; 
        SType = "Text";
        Label = "Transaction Type";   
    }
    
    INOUT MIR-FBNK-REF-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Master Claim ID";
    }
    
    INOUT MIR-POL-ID
    {
        Key;
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Policy ID";
    }
    
    INOUT MIR-FB-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Insured Client ID";
    }    
    
    INOUT MIR-SAVE-FBNK-REMIT-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Remittance Date";
    }
    
    INOUT MIR-SAVE-FBNK-REF-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Master Claim ID";
    }
    
    INOUT MIR-SAVE-POL-ID
    {
        Key;
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Policy ID";
    }
    
    INOUT MIR-SAVE-FB-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Insured Client ID";
    }    
    
    INOUT MIR-SAVE-FBNK-CAT-CD
    {
        Key;
        DisplayOnly;
        Length = "20"; 
        SType = "Text";
        Label = "Transaction Type";   
    }
    
    
# * * * ************************************************
# * * *  FBKC table record output  
# * * * ************************************************
    
       OUT MIR-FBKC-POL-ID-T[50]
       {
              FieldGroup = "Table1";
              Length = "10";
              SType = "Text";              
              Label = "Policy ID";    
              Index = "1";
       }

       OUT MIR-FBKC-CVG-NUM-T[50]
       {
              FieldGroup = "Table1";
              Length = "2";
              SType = "Text";              
              Label = "Coverage Number";    
              Index = "1";
       }

       OUT MIR-FBKC-IDT-NUM-T[50]
       {
              FieldGroup = "Table1";
              Length = "10";
              SType = "Text";              
              Label = "Remittance ID";      
              Index = "1";
       }

       OUT MIR-FBKC-SEQ-NUM-T[50]
       {
              FieldGroup = "Table1";
              Length = "03";
              SType = "Text";              
              Label = "Remittance Seq Number";
              Index = "1";
       }

       OUT MIR-FBKC-FBNK-SEQ-NUM-T[50]
       {
              FieldGroup = "Table1";
              Length = "03";
              SType = "Text";              
              Label = "FBNK Remittance Seq Number";
              Index = "1";
       }

       OUT MIR-FBKC-CAT-CD-T[50]
       {
              FieldGroup = "Table1";
              Length = "05";
              SType = "Text";              
              Label = "Transaction Type";     
              Index = "1";
       }

       OUT MIR-FBKC-REMIT-AMT-T[50]
       {
              FieldGroup = "Table1";
              Length = "15";
              SType = "Text";              
              Label = "Remittance Amount";    
              Index = "1";
       }

       OUT MIR-FBKC-KANJI-NM-T[50]
       {
              FieldGroup = "Table1";
              Length = "50";
              SType = "Text";              
              Label = "Kanji Payee Name";     
              Index = "1";
       }

       OUT MIR-FBKC-STAT-CD-T[50]
       {
              Length = "1";
              Mandatory;
              CodeSource = "DataModel";
              CodeType = "FBNK-STAT-UPD-CD";
              SType = "Selection";
              Label = "Firm Banking Status";
       }

       OUT MIR-FBKC-FAIL-REASN-TXT-T[50]
       {
              Length = "40";
              SType = "Text";
              Label = "Fail Reason";
       }

# * * * ************************************************
# * * *  following fields are for FBKC update screen
# * * * ************************************************
    
       INOUT MIR-FBKC-U-POL-ID
       {
              Key;
              DisplayOnly;
              Length = "10";
              SType = "Text";              
              Label = "Policy ID";    
       }

       INOUT MIR-FBKC-U-REMIT-DT
       {
              Key;
              DisplayOnly;
              Length = "10";
              SType = "Date";
              Label = "Remittance Date";
       }

       INOUT MIR-FBKC-U-CVG-NUM
       {
              Key;
              DisplayOnly;
              Length = "02";
              SType = "Text";
              Label = "Coverage Number";
       }

       INOUT MIR-FBKC-U-SEQ-NUM
       {
              Key;
              DisplayOnly;
              Length = "03";
              SType = "Text";
              Label = "Sequence Number";
       }

       INOUT MIR-FBKC-U-FBNK-SEQ-NUM
       {
              Key;
              DisplayOnly;
              Length = "03";
              SType = "Text";
              Label = "FBNK Sequence Number";
       }

       INOUT MIR-FBKC-U-CAT-CD
       {
              Key;
              DisplayOnly;
              Length = "10";
              CodeSource = "DataModel";
              CodeType = "FBKC-CAT-CD";
              SType = "Text";
              Label = "Operation Category";
       }

       INOUT MIR-FBKC-U-STAT-CD
       {
              Length = "1";
              CodeSource = "DataModel";
              CodeType = "FBKC-STAT-CD";
              SType = "Selection";
              Label = "Firm Banking Status";
       }

       INOUT MIR-FBKC-U-FAIL-REASN-TXT
       {
              Key;
              Length = "40";
              SType = "Text";
              Label = "Fail Reason";
       }

}
