#*******************************************************************************
#*  Component:   BF9C63-P.p                                                    *
#*  Description: CSOM9C60                                                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M161CA  CTS     Implementing the Screen changes for the Credit card        *
#*  M161CA          processing                                                 *
#*******************************************************************************


P-STEP BF9C63-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9C63";
        BusinessFunctionName = "Credit Card Delete";
        BusinessFunctionType = "Delete";
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
    
    IN MIR-CRC-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TCRC";
        SType = "Text";
        Label = "Sequence Number";
    }
}        
    