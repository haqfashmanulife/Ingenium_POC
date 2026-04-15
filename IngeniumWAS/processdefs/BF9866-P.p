# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:02 PM EDT

#*******************************************************************************
#*  Component:   BF9866-P.p                                                    *
#*  Description: BENM Discharge Multiplier Create                              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

P-STEP BF9866-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9866";
        BusinessFunctionName = "Discharge Multiplier Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM9866";
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
    
    OUT MIR-BENM-TYP-CD
    {
	Length = "1";
        DBTableName = "TBENM";
        SType = "Hidden";
        Label = "Multiplier Type";
    }
    
    OUT MIR-MULTR-TYP-CD
    {
	Length = "1";
        DBTableName = "TBENM";
        SType = "Hidden";
        Label = "Multiplier Category";
    }
}

