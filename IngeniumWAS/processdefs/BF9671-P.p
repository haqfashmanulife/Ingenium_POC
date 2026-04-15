# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:01 PM EDT

#*******************************************************************************
#*  Component:   BF9671-P.p                                                    *
#*  Description: Free Format Text Table (FTXT) Create step                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL110  HIN/CL   CLAIM REQUIREMENTS                                        *
#*                                                                             *
#*******************************************************************************

P-STEP BF9671-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9671";
        BusinessFunctionName = "Free Format Text Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM9671";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-FTXT-TEXT-KEY
    {
        Key;
        Mandatory;
        Length = "20";
        DBTableName = "TFTXT";
        SType = "Text";
        Label = "Free Format Text Key";
    }
    
    INOUT MIR-FTXT-TEXT-TYP-CD
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
    
    INOUT MIR-FTXT-TEXT-SEQ-NBR
    {
        Key;
        Mandatory;
        Length = "4";
        DBTableName = "TFTXT";
        SType = "Text";
        Label = "Free Format Text Sequence Number";
    }    
    
}
