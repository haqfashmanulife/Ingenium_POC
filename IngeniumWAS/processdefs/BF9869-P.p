# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:02 PM EDT

#*******************************************************************************
#*  Component:   BF9869-P.p                                                    *
#*  Description: BENM Discharge Multiplier List                                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

P-STEP BF9869-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9869";
        BusinessFunctionName = "Discharge Multiplier List";
        BusinessFunctionType = "List";
        MirName = "CCWM9869";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;
    
    INOUT MIR-BENM-MULTR-ID
    {
        Key;
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
    
    OUT MIR-BENM-MULTR-ID-T[100]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TBENM";
        SType = "Text";
        Label = "Discharge Multiplier Code";
        Index = "1";
    }

    OUT MIR-BENM-MULTR-FCT-T[100]
    {
        Length = "5";
        FieldGroup = "Table1";
        DBTableName = "TBENM";
        SType = "Number";
        Label = "Multiplier Amount";
        Index = "1";
    }
    
    OUT MIR-BENM-DUR-T[100]
    {
        Length = "5";
        FieldGroup = "Table1";
        DBTableName = "TBENM";
        SType = "Number";
        Label = "Duration";
        Index = "1";
    }
    
}

