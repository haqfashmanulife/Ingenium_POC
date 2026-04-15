#*******************************************************************************
#*  Component:   BF9931-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#     Release  Description                                              *
#*                                                                             *
#*  EN000388   CTS     Initial Version                                         *
#*                                                                             *
#*******************************************************************************

P-STEP BF9931-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9931";
        BusinessFunctionName = "Adjudicator ID Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM9931";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-BR-ID
    {
        Key;
        Mandatory;
        Length = "5";
        DBTableName = "TCADJ";
        SType = "Text";
        Label = "RO";
        FieldGroup = "Table1";
    }

    INOUT MIR-SO-ID
    {
        Key;
        Mandatory;
        Length = "5";
        DBTableName = "TCADJ";
        SType = "Text";
        Label = "SO";
        FieldGroup = "Table1";
    }

}     

