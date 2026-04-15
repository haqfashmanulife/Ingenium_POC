#*******************************************************************************
#*  Component:   BF9C62-P.p                                                    *
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

P-STEP BF9C62-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9C62";
        BusinessFunctionName = "Credit Card Update";
        BusinessFunctionType = "Update";
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
        Length = "3";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Sequence Number";
    }
    
    IN MIR-POL-APP-FORM-ID
    {
        Key;
        Length = "15";
        SType = "Text";
        Label = "Application Number";
    }
    
    #Q10078 START
    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }
    #Q10078 END
    INOUT MIR-DV-POL-HLDR-NM
    {
        Length = "25";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Policy Holder Name";
    }
        
    INOUT MIR-CLI-ID
    {
        Length = "10";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Client ID";
    } 
        
    INOUT MIR-CRC-SEQ-NUM-T[20]
    {
        Length = "3";
        DBTableName = "TCRC";
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
        Length = "16";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Credit Card Number";
    }
    
    INOUT MIR-CRC-NUM-VALU-T
    {
        Mandatory;        
        Length = "16";
        DBTableName = "TCRC";
        SType = "Text";
    }
      
    INOUT MIR-CRC-NUM-STAR-T
    {
        Mandatory;
        Length = "16";
        DBTableName = "TCRC";
        SType = "Text";
    }
    
    INOUT MIR-CRC-AUTH-AMT-T[20]
    {
        Length = "17";
        DBTableName = "TCRC";
        #Q10193 START
        #SType = "Text";
        SType = "Currency";
        #Q10193 END
        Label = "Authorized Amount";
    }
    
    INOUT MIR-CRC-AUTH-NUM-T[20]
    {
        Length = "7";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Authorization Number";
    }    
        
    INOUT MIR-CRC-AUTH-DT-T[20]
    {
        Length = "10";
        DBTableName = "TCRC";
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
        DBTableName = "TCRC";
        SType = "Indicator";
        Label = "Billing Suspense";
    }
#M3199A CHANGES  START    
    INOUT MIR-PPNCC-RPT-IND-T[20]
    {
        Length = "1";
        DBTableName = "TCRC";
        SType = "Text";
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
    