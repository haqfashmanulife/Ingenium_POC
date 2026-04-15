# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:42 PM EDT

#*******************************************************************************
#*  Component:   BF1601-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1601-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1601";
        BusinessFunctionName = "Income Replacement Test Table Create";
        BusinessFunctionType = "Create";
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

}

