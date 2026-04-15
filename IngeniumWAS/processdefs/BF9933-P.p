#*******************************************************************************
#*  Component:   BF9933-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN000388   CTS     Initial Version                                           *
#*                                                                             *
#*******************************************************************************


P-STEP BF9933-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9933";
        BusinessFunctionName = "Adjudicator ID Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM9933";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    OUT MIR-ADJ-USER-ID
    {
        Length = "8";
        DBTableName = "TCADJ";
        SType = "Text";
        Label = "Adjudicator User ID";
        FieldGroup = "Table1";
    }

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
