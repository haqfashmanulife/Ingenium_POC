# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:01 PM EDT

#*******************************************************************************
#*  Component:   BF9673-P.p                                                    *
#*  Description: Free Format Text Table (FTXT) Delete step                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL110  HIN/CL   CLAIM REQUIREMENTS                                        *
#*                                                                             *
#*******************************************************************************

P-STEP BF9673-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9673";
        BusinessFunctionName = "Free Format Text Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM9673";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-FTXT-TEXT-KEY
    {
        Key;
        Mandatory;
        Length = "20";
        DBTableName = "TFTXT";
        SType = "Text";
        Label = "Free Format Text Key";
    }
    
    IN MIR-FTXT-TEXT-TYP-CD
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "FTXT-TEXT-TYP-CD";
        DBTableName = "TFTXT";
        SType = "Text";
        Label = "Free Format Text Type";
    }
    
    IN MIR-FTXT-TEXT-SEQ-NBR
    {
        Key;
        Mandatory;
        Length = "4";
        DBTableName = "TFTXT";
        SType = "Number";
        Label = "Free Format Text Sequence Number";
    }    
    
}
