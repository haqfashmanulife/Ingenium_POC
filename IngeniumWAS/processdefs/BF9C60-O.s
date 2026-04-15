#*******************************************************************************
#*  Component:   BF9C60-O.s                                                    *
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


S-STEP BF9C60-O
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

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }
    
    IN MIR-DV-POL-HLDR-NM
    {
        Key;
        Length = "25";
        SType = "Text";
        Label = "Policy Holder Name";
    }
    
    IN MIR-CLI-ID
    {
        Key;
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }    
    
    IN MIR-POL-APP-FORM-ID
    {
        Key;
        Length = "15";
        SType = "Text";
        Label = "Application Number";
    }
    
    IN MIR-CRC-SEQ-NUM
    {
        Key;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }
    
    IN MIR-CRC-SEQ-NUM-T[20]
    {
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }
    
    IN MIR-CRC-CO-NM-T[20]
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CRC-CO-NM";
        DBTableName = "TCRC";
        SType = "Selection";
        Label = "Card Company";
    }
    
    IN MIR-CRC-NUM-T[20]
    {
        Length = "7";
        SType = "Text";
        Label = "Credit Card Number";
    }
    
    #Q10078 START
    IN MIR-CRC-NUM-VALU-T
    {
        Length = "3";
        DBTableName = "TCRC";
        SType = "Text";
    }
    
    IN MIR-CRC-NUM-STAR-T
    {
        Length = "3";
        DBTableName = "TCRC";
        SType = "Text";
    }

    #Q10078 END    
    IN MIR-CRC-AUTH-AMT-T[20]
    {
        Key;
        Length = "17";
        #Q10193 START
        #SType = "Text";
        SType = "Currency";
        #Q10193 END
        Label = "Authorized Amount";
    }
    
    IN MIR-CRC-AUTH-NUM-T[20]
    {
        Key;
        Length = "7";
        SType = "Text";
        Label = "Authorization Number";
    }    
    
    IN MIR-CRC-AUTH-DT-T[20]
    {
        Key;
        Length = "10";
        SType = "Text";
        Label = "Authorization Number Acquisition Date";
    }
    
    IN MIR-CRC-STAT-CD-T[20]
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CRC-STAT-CD";
        DBTableName = "TCRC";
        Label = "Status";
    }
    
    IN MIR-BILL-SUSP-IND-T[20]
    {
        Key;
        Length = "1";
        SType = "Indicator";
        Label = "Billing Suspense";
    }
    
#M3199A CHANGES  START    
    IN MIR-PPNCC-RPT-IND-T[20]
    {
        Key;
        Length = "1";
        SType = "Indicator";
        Label = "Create a Notice";
    }    
#M3199A CHANGES  ENDS        
#FFF0B1 CHANGES STARTS
    IN MIR-CRC-REASN-CD-T[20]
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
    