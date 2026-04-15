# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:01 PM EDT

#*******************************************************************************
#*  Component:   BF9672-P.p                                                    *
#*  Description: Free Format Text Table (FTXT) Update step                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL110  HIN/CL   CLAIM REQUIREMENTS                                        *
#*                                                                             *
#*******************************************************************************

P-STEP BF9672-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9672";
        BusinessFunctionName = "Free Format Text Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM9672";
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
    
    INOUT MIR-FTXT-CMNT-INFO
    {
        Length = "500";
        DBTableName = "TFTXT";
        SType = "Text";
        Label = "Free Format Text";
    }

    INOUT MIR-PREV-UPDT-USER-ID
    {
        Length = "8";
        DBTableName = "TFTXT";
        SType = "Text";
        Label = "Last Updated By";
    }

    INOUT MIR-PREV-UPDT-DT
    {
        Length = "10";
        DBTableName = "TFTXT";
        SType = "Text";
        Label = "Date Updated";
    }

}
