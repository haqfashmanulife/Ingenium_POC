#*******************************************************************************
#*  Component:   BF9C61-P.p                                                    *
#*  Description: CSOM9C60                                                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M161CA  CTS     Implementing the Screen changes for the Credit card        *
#*  M161CA          processing                                                 *
#*  Q10078  CTS     M161CA TASK                                                *
#*  FFF0B1  CTS     CHANGES DONE AS PART OF FFF PRODUCT                        *
#*******************************************************************************

P-STEP BF9C61-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9C61";
        BusinessFunctionName = "Credit Card Create";
        BusinessFunctionType = "Create";
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
        Key;
        Length = "3";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Sequence Number";
    }
    
    #Q10078 START
    INOUT MIR-CRC-SEQ-NUM-N
    {
        Length = "3";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Sequence Number";
    }
    
    OUT MIR-DV-POL-HLDR-NM
    {
        Length = "25";
        SType = "Text";
        Label = "Policy Holder Name";
    }
        
    OUT MIR-CLI-ID
    {
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    }    
    OUT MIR-POL-APP-FORM-ID
    {
        Length = "15";
        SType = "Text";
        Label = "Application Number";
    }
    
    OUT MIR-CRC-NUM-T[20]
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
    
    OUT MIR-CRC-NUM-STAR-T
    {
        Mandatory;        
        Length = "3";
        DBTableName = "TCRC";
        SType = "Text";
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
    #Q10078 END
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