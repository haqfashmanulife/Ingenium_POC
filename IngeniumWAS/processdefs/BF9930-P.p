#*******************************************************************************
#*  Component:   BF9930-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release     Description                                            *
#*                                                                             *
#*  EN000388   CTS     Initial Version                                         *
#*                                                                             *
#*******************************************************************************

P-STEP BF9930-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9930";
        BusinessFunctionName = "Adjudicator ID Inquiry";
        BusinessFunctionType = "Inquiry";
        MirName = "CCWM9930";
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

    OUT MIR-ADJ-USER-ID
    {
        Length = "8";
        DBTableName = "TCADJ";
        SType = "Text";
        Label = "Adjudicator User ID";
    }

}    
