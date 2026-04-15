# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9A72-I.s                                                    *
#*  Description: Death Claim Note Update Screen                                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCACN  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF9A72-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        FocusField = "MIR-CLM-NOTE-TXT";
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

    IN MIR-CLM-ID
    {
        Key;
        Mandatory;
        Length = "8";
        SType = "Text";
        Label = "Death Master Claim ID";
    }

    IN MIR-CLM-NOTE-SEQ-NUM
    {
        Key;
        Mandatory;  
        Length = "4";
        SType = "Number";
        Label = "Sequence Number";
    }

    IN MIR-INSRD-CLI-ID
    {
        Length = "10";
        SType = "Text";
        Label = "Insured Client ID";
    }

    IN MIR-INSRD-CLI-NM
    {
        Length = "51";
        SType = "Text";
        Label = "Insured Name";
    }

    IN MIR-CLI-BTH-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Birth Date";
    }
    
    IN MIR-CLI-SEX-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
    }
    
    IN MIR-CLM-HO-ACPT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Head Office Claim Form Acceptance Date";
    }
    
    IN MIR-CLM-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLM-STAT-CD";
        SType = "Text";
        Label = "Death Master Claim Status";
    }
    
    IN MIR-PREV-UPDT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Previous Update Date";
    }
    
    IN MIR-PREV-UPDT-USER-ID
    {
        Length = "8";
        SType = "Text";
        Label = "Previous Update User ID";
    } 
    
    INOUT MIR-CLM-NOTE-TXT
    {
        Length = "500";
        SType = "Text";
        Label = "Claim Note";
    }
}
