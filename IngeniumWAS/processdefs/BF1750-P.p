# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:44 PM EDT

#*******************************************************************************
#*  Component:   BF1750-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1750-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1750";
        BusinessFunctionName = "Commission Changes Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "SCWM0050";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CIA-IDT-NUM
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TFA";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-CIA-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TFA";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TFD";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TFD";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TFD";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-AGT-ID-T[3]
    {
        Length = "6";
        FieldGroup = "Table3";
        DBTableName = "TFAAG";
        SType = "Text";
        Label = "Agent ID";
        Index = "1";
    }

    OUT MIR-CIA-AGT-SHR-PCT-T[3]
    {
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table3";
        DBTableName = "TFAAG";
        SType = "Percent";
        Label = "Percentage Share";
        Index = "1";
    }

    OUT MIR-CIA-CLI-TRXN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Total Premium Received";
    }

    OUT MIR-CIA-CPREM-AMT-T[3]
    {
        Length = "13";
        FieldGroup = "Table3";
        DBTableName = "TFAAG";
        SType = "Currency";
        Label = "Commissionable Premium";
        Index = "1";
    }

    OUT MIR-COMM-RH-ID-T[3]
    {
        Length = "6";
        FieldGroup = "Table3";
        DBTableName = "TFAAG";
        SType = "Text";
        Label = "Commission Pattern Code";
        Index = "1";
    }

    OUT MIR-OVRID-ID-T[3]
    {
        Length = "6";
        FieldGroup = "Table3";
        DBTableName = "TFAAG";
        SType = "Text";
        Label = "Agent Override Situation";
        Index = "1";
    }

}

