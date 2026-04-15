#*******************************************************************************
#*  Component:   BF9C62-I.s                                                    *
#*  Description: CSOM9C60                                                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M161CA  CTS     Implementing the Screen changes for the Credit card        *
#*  M161CA          processing                                                 *
#*  Q10078  CTS     M161CA TASK                                                *
#*  Q10193  CTS     M161CA CREATE / UPDATE CRC SCREEN ISSUE                    *
#*  Q10307  CTS     M161CA REMOVING DECIMALS FOR CREDIT CARD AUTH AMOUNT       *
#*  M3199A  CTS      M3199A ENHANCEMENT OF CREDIT CARD CHANGES                 *
#*  FFF0B1  CTS     CHANGES DONE AS PART OF FFF PRODUCT                        *
#*******************************************************************************


S-STEP BF9C62-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
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
    
    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }
        
    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
    
    IN MIR-CRC-SEQ-NUM
    {
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }
  
    IN MIR-DV-POL-HLDR-NM
    {
        Length = "25";
        SType = "Text";
        Label = "Policy Holder Name";
    }
        
    IN MIR-CLI-ID
    {
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }    
    IN MIR-POL-APP-FORM-ID
    {
        Length = "15";
        SType = "Text";
        Label = "Application Number";
    }
        
    #Q10078 START
    #INOUT MIR-CRC-SEQ-NUM-T[20]
    IN MIR-CRC-SEQ-NUM-T[20]
    #Q10078 END
    {
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }
        
    INOUT MIR-CRC-CO-NM-T[20]
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CRC-CO-NM";
        DBTableName = "TCRC";
        SType = "Selection";
        Label = "Card Company";
    }
        
    INOUT MIR-CRC-NUM-T[20]
    {
        Mandatory;
        Length = "7";
        SType = "Text";
        Label = "Credit Card Number";
    }
     
    INOUT MIR-CRC-NUM-VALU-T
    {
        Mandatory;
        Length = "13";
        DBTableName = "TCRC";
        SType = "Text";
    }
    
    #Q10078 START
    #INOUT MIR-CRC-NUM-STAR-T
    IN MIR-CRC-NUM-STAR-T
    #Q10078 END
    {
        Mandatory;        
        Length = "3";
        DBTableName = "TCRC";
        SType = "Text";
    }
    
    INOUT MIR-CRC-AUTH-AMT-T[20]
    {
        Mandatory;
        Length = "17";
        #Q10193 START
        #SType = "Text";
        SType = "Currency";
        #Q10193 END
        Label = "Authorized Amount";
    }
    
    INOUT MIR-CRC-AUTH-NUM-T[20]
    {
        Length = "7";
        SType = "Text";
        Label = "Authorization Number";
    }    
        
    INOUT MIR-CRC-AUTH-DT-T[20]
    {
        Length = "10";
        SType = "Date";
        Label = "Authorization Number Acquisition Date";
    }
        
    INOUT MIR-CRC-STAT-CD-T[20]
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CRC-STAT-CD";
        DBTableName = "TCRC";
        SType = "Selection";
        Label = "Status";
    }
        
    INOUT MIR-BILL-SUSP-IND-T[20]
    {
        Length = "1";
        SType = "Indicator";
        Label = "Billing Suspense";
    }
#M3199A CHANGES  START    
    INOUT MIR-PPNCC-RPT-IND-T[20]
    {
        Length = "1";
        SType = "Indicator";
        Label = "Create a Notice";
    }    
#M3199A CHANGES  ENDS        
#FFF0B1 CHANGES STARTS
    INOUT MIR-CRC-REASN-CD-T[20]
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "CRCRN";         
        DBTableName = "TCRC";        
        SType = "Selection";
        Label = "Reason";
    }    
#FFF0B1 CHANGES ENDS        
    
}    