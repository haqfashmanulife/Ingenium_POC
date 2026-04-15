# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:01 PM EDT

#*******************************************************************************
#*  Component:   BF9865-P.p                                                    *
#*  Description: BENM Discharge Multiplier Retrieve                            *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

P-STEP BF9865-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9865";
        BusinessFunctionName = "Discharge Multiplier Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9865";
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

    OUT MIR-BENM-MULTR-FCT 
    {
	Length = "5";
        DBTableName = "TBENM";
	SType = "Number";
	Label = "Multiplier Amount";
    }
        
    OUT MIR-BENM-DUR 
    {
	Length = "5";
        DBTableName = "TBENM";
	SType = "Number";
	Label = "Duration";
    }

}
