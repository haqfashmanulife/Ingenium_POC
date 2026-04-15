# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:02 PM EDT

#*******************************************************************************
#*  Component:   BF9868-P.p                                                    *
#*  Description: BENM Discharge Multiplier Delete                              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

P-STEP BF9868-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9868";
        BusinessFunctionName = "Discharge Multiplier Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM9868";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;
    
    IN MIR-BENM-MULTR-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TBENM";
        SType = "Text";
        Label = "Discharge Multiplier Code";
    }
    
    IN MIR-BENM-TYP-CD
    {
        Length = "1";
        DBTableName = "TBENM";
        SType = "Hidden";
        Label = "Multiplier Type";
    }
    
    IN MIR-MULTR-TYP-CD
    {
        Length = "1";
        DBTableName = "TBENM";
        SType = "Hidden";
        Label = "Multiplier Category";
    }
}

