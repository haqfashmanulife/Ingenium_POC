#*******************************************************************************
#*  Component:   BF9C60-P.p                                                    *
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



P-STEP BF9C60-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9C60";
        BusinessFunctionName = "Credit Card Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9C60";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Policy ID";
    }
        
    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Suffix";
    }
    
    IN MIR-CRC-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Sequence Number";
    }
       
    OUT MIR-DV-POL-HLDR-NM
    {
        Length = "25";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Policy Holder Name";
    }
        
    OUT MIR-CLI-ID
    {
        Length = "10";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Client ID";
    }       
    OUT MIR-POL-APP-FORM-ID
    {
        Length = "15";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Application Number";
    }
        
    OUT MIR-CRC-SEQ-NUM-T[20]
    {
        Length = "3";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Sequence Number";
    }
        
    OUT MIR-CRC-CO-NM-T[20]
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CRC-CO-NM";
        DBTableName = "TCRC";
        SType = "Selection";
        Label = "Card Company";
    }
        
    OUT MIR-CRC-NUM-T[20]
    {
        Length = "7";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Credit Card Number";
    }
     
    #Q10078 START 
    #OUT MIR-CRC-NUM-VALU-T[20]
    OUT MIR-CRC-NUM-VALU-T
    #Q10078 END
    {
        Length = "13";
        DBTableName = "TCRC";
        SType = "Text";
    }
    
    #Q10078 START 
    #OUT MIR-CRC-NUM-STAR-T[20]
    OUT MIR-CRC-NUM-STAR-T
    #Q10078 END
    {
        Length = "3";
        DBTableName = "TCRC";
        SType = "Text";
    }
        
    OUT MIR-CRC-AUTH-AMT-T[20]
    {
        Length = "17";
        DBTableName = "TCRC";
        #Q10193 START
        #SType = "Text";
        SType = "Currency";
        #Q10193 END
        Label = "Authorized Amount";
    }
    
    OUT MIR-CRC-AUTH-NUM-T[20]
    {
        Length = "7";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Authorization Number";
    }    
        
    OUT MIR-CRC-AUTH-DT-T[20]
    {
        Length = "10";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Authorization Number Acquisition Date";
    }
        
    OUT MIR-CRC-STAT-CD-T[20]
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CRC-STAT-CD";
        DBTableName = "TCRC";
        Label = "Status";
    }
        
    OUT MIR-BILL-SUSP-IND-T[20]
    {
        Length = "1";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Billing Suspense";
    }
#M3199A CHANGES  START    
    OUT MIR-PPNCC-RPT-IND-T[20]
    {
        Length = "1";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Create a Notice";
    }    
#M3199A CHANGES  ENDS 
#FFF0B1 CHANGES STARTS
    OUT MIR-CRC-REASN-CD-T[20]
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