# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:16 PM EDT

#*******************************************************************************
#*  Component:   BF9G99-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  R15582  CTS      CHANGES FOR AUDIT DETAILS                                 *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*******************************************************************************

P-STEP BF9G99-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9G99";
        BusinessFunctionName = "AUDIT FUNCTIONALITY";
        BusinessFunctionType = "FUNCTION";
        MirName = "CCWM9G99";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;
    
    IN MIR-BFCN-ID
    {
        Length = "15";
        DBTableName = "TAUTR";
        SType = "Date";
        Label = "Business Function Id";
    }
    
    IN MIR-USER-ID
    {
        Length = "8";
        DBTableName = "TAUTR";
        SType = "Text";
        Label = "User ID";
    }
    
#23774A CHANGES BEGIN
    IN MIR-LOG-LEVL-CD
    {
        Length = "1";
        DBTableName = "TAUTR";
        SType = "Text";
        Label = "Log Level Code";
    }
#23774A CHANGES END       
    
    IN MIR-TRNX-DTL-INFO
    {
        Length = "400";
        DBTableName = "TAUTR";       
        SType = "Text";
        Label = "Transaction Detail Info";
    }      
}

