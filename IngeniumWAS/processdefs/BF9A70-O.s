# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9A70-O.s                                                    *
#*  Description: Death Claim Notes Inquiry Screen                              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCACN  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF9A70-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
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

    IN MIR-CLM-ID
    {
        Key;
        DisplayOnly;        
        Mandatory;
        Length = "8";
        SType = "Text";
        Label = "Death Master Claim ID";
    }

    IN MIR-CLM-NOTE-SEQ-NUM
    {
        Key;
        DisplayOnly;        
        Mandatory;  
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
    
    IN MIR-PREV-UPDT-DT
    {
        DisplayOnly;    
        Length = "10";
        SType = "Date";
        Label = "Previous Update Date";
    }
    
    IN MIR-PREV-UPDT-USER-ID
    {
        DisplayOnly;    
        Length = "8";
        SType = "Text";
        Label = "Previous Update User ID";
    }   
    
    IN MIR-CLM-NOTE-TXT
    {
        DisplayOnly;    
        Length = "500";
        SType = "Text";
        Label = "Claim Note";
    }     
}
