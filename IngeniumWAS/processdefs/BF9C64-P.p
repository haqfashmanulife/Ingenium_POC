#*******************************************************************************
#*  Component:   BF9C64-P.p                                                    *
#*  Description: CSOM9C60                                                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M161CA  CTS     Implementing the Screen changes for the Credit card        *
#*  M161CA          processing                                                 *
#*  Q10193  CTS     M161CA CREATE / UPDATE CRC SCREEN ISSUE                    *
#*  Q10307  CTS     M161CA REMOVING DECIMALS FOR CREDIT CARD AUTH AMOUNT       *
#*  M31992  CTS     M31992 ENHANCEMENT OF CREDIT CARD CHANGES                  *
#*  FFF0B1  CTS     CHANGES DONE AS PART OF FFF PRODUCT                        *
#*******************************************************************************


P-STEP BF9C64-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9C64";
        BusinessFunctionName = "Credit Card List";
        BusinessFunctionType = "List";
        MirName = "CCWM9C60";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Policy ID";
    }
        
    INOUT MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Suffix";
    }
    
    INOUT MIR-CRC-SEQ-NUM
    {
        Length = "3";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Sequence Number";
    }
    
    OUT MIR-DV-POL-HLDR-NM
    {
        Key;
        Length = "25";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Policy Holder Name";
    }
    
    OUT MIR-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Client ID";
    }
          
        
    INOUT MIR-POL-APP-FORM-ID
    {
        Key;
        Length = "15";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Application Number";
    }
    
   
    OUT MIR-CRC-SEQ-NUM-T[20]
    {
        Key;
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
        Key;
        Length = "7";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Credit Card Number";
    }
    
    OUT MIR-CRC-AUTH-AMT-T[20]
    {
        Key;
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
        Key;
        Length = "7";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Authorization Number";
    }    
    
    OUT MIR-CRC-AUTH-DT-T[20]
    {
        Key;
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
    
#M31992 CHANGES  START    
    OUT MIR-PPNCC-RPT-IND-T[20]
    {
        Length = "1";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Create a Notice";
    }    
#M31992 CHANGES  ENDS        
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
        
      
    