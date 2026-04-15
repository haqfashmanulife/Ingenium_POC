# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:01 PM EDT

#*******************************************************************************
#*  Component:   BF9674-P.p                                                    *
#*  Description: Free Format Text Table (FTXT) List step                       *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL110  HIN/CL   CLAIM REQUIREMENTS                                        *
#*                                                                             *
#*******************************************************************************

P-STEP BF9674-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9674";
        BusinessFunctionName = "Free Format Text List";
        BusinessFunctionType = "List";
        MirName = "CCWM9674";
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
        SType = "Number";
        Label = "Free Format Text Sequence Number";
    }   
    
    OUT MIR-FTXT-TEXT-SEQ-NBR-T[20]
    {
        KeyColumn;
        FieldGroup = "Table20";
        Length = "4";
        DBTableName = "TFTXT";
        SType = "Number";
        Label = "Free Format Text Sequence Number";
        Index = "1";
    }        
    
    OUT MIR-FTXT-CMNT-INFO-T[20]
    {
        Length = "500";
        FieldGroup = "Table20";
        DBTableName = "TFTXT";
        SType = "Text";
        Label = "Free Format Text";
        Index = "1";
    }
    
    OUT MIR-PREV-UPDT-USER-ID-T[20]
    {
        Length = "8";
        FieldGroup = "Table20";
        DBTableName = "TFTXT";
        SType = "Text";
        Label = "Last Updated By";
        Index = "1";
    }

    OUT MIR-PREV-UPDT-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TFTXT";
        SType = "Text";
        Label = "Date Updated";
        Index = "1";
    }

}
