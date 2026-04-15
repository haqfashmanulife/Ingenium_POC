#*******************************************************************************
#*  Component:   BF9934-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN000388  CTS     Initial Version                                          *
#*                                                                             *
#*******************************************************************************

P-STEP BF9934-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9934";
        BusinessFunctionName = "Adjudicator ID List";
        BusinessFunctionType = "List";
        MirName = "CCWM9934";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-SO-ID
    {
        Key;
        Length = "5";
        DBTableName = "TCADJ";
        SType = "Text";
        Label = "SO";
    }

    INOUT MIR-BR-ID
    {
        Key;
        Length = "5";
        DBTableName = "TCADJ";
        SType = "Text";
        Label = "RO";
    }

    OUT MIR-ADJ-USER-ID-T[50]
    {
        Length = "8";
        DBTableName = "TCADJ";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Adjudicator User ID";
        Index = "1";
    }

    OUT MIR-BR-ID-T[50]
    {
        Length = "5";
        DBTableName = "TCADJ";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "RO";
        Index = "1";
    }

    OUT MIR-SO-ID-T[50]
    {
        Length = "5";
        DBTableName = "TCADJ";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "SO";
        Index = "1";
    }

}  
