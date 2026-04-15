#*******************************************************************************
#*  Component:   BF9C93-P.p                                                    *
#*  Description:                                                               *
#*  Description:Future request Table(FTRQ) Delete Process                      *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M117PB  CTS      Intial Version                                            *
#*******************************************************************************

P-STEP BF9C93-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9C93";
        BusinessFunctionName = "Future Dated Policy Activity Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM9C90";
    }

   OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TFTRQ";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TFTRQ";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }


    IN MIR-PBRQ-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TFTRQ";
        SType = "Date";
        Label = "Policy billing request Effective Date";
    }
    
    IN MIR-DV-POL-FUT-ACTV-TYP-CD
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DV-POL-FUT-ACTV-TYP-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Activity Type";
    }
    
    
}

