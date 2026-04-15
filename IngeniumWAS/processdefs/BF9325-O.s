
#*******************************************************************************
#*  Component:   BF9325-I.s                                                    *
#*  Description: Firm Banking Status Update - Coverage level                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* MP4FB1   SC       Firm Banking Remittance (New Page Coverage Details)       *
#*                                                                             *
#*******************************************************************************

S-STEP BF9325-O
{
    ATTRIBUTES
    {
      BusinessFunctionType = "List";
      Type = "Output";
      DelEmptyRows;
      FocusField = "MIR-POL-ID";
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
              SType="Hidden";
       }

       OUT index
       {
              SType="Hidden";
       }

       IN LSIR-RETURN-CD 
       {
              DisplayOnly;
       }

       IN MIR-RETRN-CD 
       {
              DisplayOnly;
       }

       INOUT MIR-FBKC-REQUEST-ACT-CD;

# *************************************************
#     Below are FBNK table search keys:
#              - Remittance Date   (MIR-FBNK-REMIT-DT)
#              - Master Claim ID   (MIR-FBNK-REF-ID)
#              - Policy Number     (MIR-POL-ID)
#              - Insured Client ID (MIR-FB-CLI-ID)
#              - Transaction Type  (MIR-FBNK-CAT-CD)
# *************************************************
                                                 
       INOUT MIR-FBNK-REMIT-DT 
       {
              Key;
              DisplayOnly;
              Length = "10";
              SType = "Date";
              Label = "Remittance Date";
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


       INOUT MIR-FBNK-CAT-CD
       {
              Key;
              DisplayOnly;
              Length = "05";
              SType = "Text";
              Label = "Transaction Type:";
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
              Length = "05";
              SType = "Text";
              Label = "Transaction Type:";
       }


# *************************************************************
# Below are FBKC - Firm Banking by Coverage record output table
# *************************************************************

       IN MIR-FBKC-POL-ID-T[50]
       {
              FieldGroup = "Table1";
              Length = "10";
              SType = "Text";              
              Label = "Policy ID";    
              Index = "1";
       }

       IN MIR-FBKC-CVG-NUM-T[50]
       {
              FieldGroup = "Table1";
              Length = "2";
              SType = "Text";              
              Label = "Coverage Number";    
              Index = "1";
       }

       IN MIR-FBKC-IDT-NUM-T[50]
       {
              FieldGroup = "Table1";
              Length = "10";
              SType = "Text";              
              Label = "Remittance ID";      
              Index = "1";
       }

       IN MIR-FBKC-SEQ-NUM-T[50]
       {
              FieldGroup = "Table1";
              Length = "03";
              SType = "Text";              
              Label = "Remittance Seq Number";
              Index = "1";
       }

       IN MIR-FBKC-FBNK-SEQ-NUM-T[50]
       {
              FieldGroup = "Table1";
              Length = "03";
              SType = "Text";              
              Label = "FBNK Seq Number";
              Index = "1";
       }

       IN MIR-FBKC-CAT-CD-T[50]
       {
              FieldGroup = "Table1";
              Length = "05";
              SType = "Text";              
              Label = "Transaction Type";     
              Index = "1";
       }

       IN MIR-FBKC-REMIT-AMT-T[50]
       {
              FieldGroup = "Table1";
              Length = "15";
              SType = "Text";              
              Label = "Remittance Amount";    
              Index = "1";
       }

       IN MIR-FBKC-KANJI-NM-T[50]
       {
              FieldGroup = "Table1";
              Length = "50";
              SType = "Text";              
              Label = "Kanji Payee Name";     
              Index = "1";
       }

       IN MIR-FBKC-STAT-CD-T[50]
       {
              FieldGroup = "Table1";
              Length = "10";
              SType = "Text";              
              Label = "Firm Banking Status";  
              Index = "1";
       }

       IN MIR-FBKC-FAIL-REASN-TXT-T[50]
       {
              FieldGroup = "Table1";
              Length = "40";
              SType = "Text";              
              Label = "Fail Reason";  
              Index = "1";
       }

}
