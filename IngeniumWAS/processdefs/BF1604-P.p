# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:42 PM EDT

#*******************************************************************************
#*  Component:   BF1604-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1604-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1604";
        BusinessFunctionName = "Income Replacement Test Table List";
        BusinessFunctionType = "List";
        MirName = "NCWM2210";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-ANN-INCM-AMT
    {
        Key;
        Length = "13";
        Decimals = "0";
        DBTableName = "TIRTT";
        SType = "Currency";
        Label = "Annual Income";
    }

    INOUT MIR-CLI-INSRD-AGE
    {
        Key;
        Length = "3";
        Decimals = "0";
        DBTableName = "TIRTT";
        SType = "Number";
        Label = "Age";
    }

    INOUT MIR-OCCP-CLAS-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "OCCCL";
        DBTableName = "TIRTT";
        SType = "Selection";
        Label = "Occupation Class";
    }

    OUT MIR-CLI-ANN-INCM-AMT-T[10]
    {
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table10";
        KeyColumn;
        DBTableName = "TIRTT";
        SType = "Currency";
        Label = "Annual Income";
        Index = "1";
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

