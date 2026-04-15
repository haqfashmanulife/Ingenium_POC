# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:42 PM EDT

#*******************************************************************************
#*  Component:   BF1600-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1600-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1600";
        BusinessFunctionName = "Income Replacement Test Table Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM2210";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ANN-INCM-AMT
    {
        Key;
        Mandatory;
        Length = "13";
        Decimals = "0";
        DBTableName = "TIRTT";
        SType = "Currency";
        Label = "Annual Income";
    }

    IN MIR-CLI-INSRD-AGE
    {
        Key;
        Mandatory;
        Length = "3";
        Decimals = "0";
        DBTableName = "TIRTT";
        SType = "Number";
        Label = "Age";
    }

    IN MIR-OCCP-CLAS-CD
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "OCCCL";
        DBTableName = "TIRTT";
        SType = "Selection";
        Label = "Occupation Class";
    }

    OUT MIR-NTAXBL-NUIC-AMT-T[10]
    {
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table10";
        DBTableName = "TIRTT";
        SType = "Currency";
        Label = "Non-taxable Benefits - Non-UIC - Any EP";
        Index = "1";
    }

    OUT MIR-NTAXBL-UIC-EP1-AMT-T[10]
    {
        Length = "5";
        Decimals = "0";
        FieldGroup = "Table10";
        DBTableName = "TIRTT";
        SType = "Currency";
        Label = "Non-taxable Benefits - UIC - EP <120";
        Index = "1";
    }

    OUT MIR-NTAXBL-UIC-EP2-AMT-T[10]
    {
        Length = "5";
        Decimals = "0";
        FieldGroup = "Table10";
        DBTableName = "TIRTT";
        SType = "Currency";
        Label = "Non-taxable Benefits - UIC - EP =120+";
        Index = "1";
    }

    OUT MIR-TAXBL-NUIC-AMT-T[10]
    {
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table10";
        DBTableName = "TIRTT";
        SType = "Currency";
        Label = "Taxable Benefits - Non-UIC - Any EP";
        Index = "1";
    }

    OUT MIR-TAXBL-UIC-EP1-AMT-T[10]
    {
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table10";
        KeyColumn;
        DBTableName = "TIRTT";
        SType = "Currency";
        Label = "Taxable Benefits - UIC - EP <120";
        Index = "1";
    }

    OUT MIR-TAXBL-UIC-EP2-AMT-T[10]
    {
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table10";
        DBTableName = "TIRTT";
        SType = "Currency";
        Label = "Taxable Benefits - UIC - EP =120+";
        Index = "1";
    }

}

