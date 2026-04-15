# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9A74-O.s                                                    *
#*  Description: Death Claim Note List Screen                                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCACN  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF9A74-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        DelEmptyRows;
        FocusField = "OKButton";
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

    OUT index
    {
        SType = "Hidden";
    }

    INOUT MIR-CLM-ID
    {
        Key;
        DisplayOnly;        
        Mandatory;
        Length = "8";
        SType = "Text";
        Label = "Death Master Claim ID";
    }

    INOUT MIR-CLM-NOTE-SEQ-NUM
    {  
        DisplayOnly;            
        Length = "4";
        SType = "Number";
        Label = "Sequence Number";
    }

    IN MIR-INSRD-CLI-ID
    {
        DisplayOnly;            
        Length = "10";
        SType = "Text";
        Label = "Insured Client ID";
    }

    IN MIR-INSRD-CLI-NM
    {
        DisplayOnly;            
        Length = "51";
        SType = "Text";
        Label = "Insured Name";
    }

    IN MIR-CLI-BTH-DT
    {
        DisplayOnly;            
        Length = "10";
        SType = "Date";
        Label = "Birth Date";
    }
    
    IN MIR-CLI-SEX-CD
    {
        DisplayOnly;            
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
    }
    
    IN MIR-CLM-HO-ACPT-DT
    {
        DisplayOnly;            
        Length = "10";
        SType = "Date";
        Label = "Head Office Claim Form Acceptance Date";
    }
    
    IN MIR-CLM-STAT-CD
    {
        DisplayOnly;            
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLM-STAT-CD";
        SType = "Text";
        Label = "Death Master Claim Status";
    }

    IN MIR-CLM-NOTE-SEQ-NUM-T[20]
    { 
        DisplayOnly;            
        Length = "4";
        FieldGroup = "Table1";         
        SType = "Number";
        Label = "Sequence Number";
        Index = "1";        
    }
    
    IN MIR-PREV-UPDT-DT-T[20]
    {
        DisplayOnly;            
        Length = "10";
        FieldGroup = "Table1";        
        SType = "Date";
        Label = "Previous Update Date";
        Index = "1";        
    }
    
    IN MIR-PREV-UPDT-USER-ID-T[20]
    {
        DisplayOnly;            
        Length = "8";
        FieldGroup = "Table1";         
        SType = "Text";
        Label = "Previous Update User ID";
        Index = "1";        
    } 
    
    IN MIR-CLM-NOTE-TXT-T[20]
    {
        DisplayOnly;            
        Length = "500";
        FieldGroup = "Table1";         
        SType = "Text";
        Label = "Claim Note";
        Index = "1";        
    }  
}
