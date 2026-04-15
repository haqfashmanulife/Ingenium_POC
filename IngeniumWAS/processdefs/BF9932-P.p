#*******************************************************************************
#*  Component:   BF9932-P.p                                                    *
#*  Description: Adjudicator ID Update                                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#     Release  Description                                              *
#*                                                                             *
#*  EN000388   CTS     Initial Version                                         *
#*                                                                             *
#*******************************************************************************

P-STEP BF9932-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9932";
        BusinessFunctionName = "Adjudicator ID Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM9932";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-BR-ID
    {
        Key;
        Mandatory;
        DBTableName = "TCADJ";
        Length = "5";
        SType = "Text";
        Label = "RO";
    }

    INOUT MIR-SO-ID
    {
        Key;
        Mandatory;
        DBTableName = "TCADJ";
        Length = "5";
        SType = "Text";
        Label = "SO";
    }

    INOUT MIR-ADJ-USER-ID
    {
        Length = "8";
        DBTableName = "TCADJ";
        SType = "Text";
        Label = "Adjudicator User ID";
    }

}  
