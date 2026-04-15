# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:41 PM EDT

#*******************************************************************************
#*  Component:   BF1540-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1540-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1540";
        BusinessFunctionName = "Lab Test Standard Table Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM1370";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-LAB-ID
    {
        Key;
        Mandatory;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LABCD";
        DBTableName = "TLABT";
        SType = "Selection";
        Label = "Laboratory";
    }

    IN MIR-LTST-ID
    {
        Key;
        Mandatory;
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "TSTNO";
        DBTableName = "TLABT";
        SType = "Selection";
        Label = "Lab Test Number";
    }

    IN MIR-LTST-STD-AGE-QTY
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TLABT";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Highest Age for Test";
    }

    IN MIR-LTST-STD-SEX-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "LTST-STD-SEX-CD";
        DBTableName = "TLABT";
        SType = "Selection";
        Label = "Sex";
    }

    OUT MIR-ALPHA-RESP-ETBL-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "EDIT";
        DBTableName = "TLABT";
        SType = "Text";
        Label = "Alpha Result Edit Pointer";
    }

    OUT MIR-CO-MAX-NRNG-QTY
    {
        Length = "8";
        DBTableName = "TLABT";
        SType = "Text";
        Label = "Company Maximum Range";
    }

    OUT MIR-CO-MIN-NRNG-QTY
    {
        Length = "8";
        DBTableName = "TLABT";
        SType = "Text";
        Label = "Company Minimum Range";
    }

    OUT MIR-LAB-MAX-NRNG-QTY
    {
        Length = "8";
        DBTableName = "TLABT";
        SType = "Text";
        Label = "Lab Maximum Range";
    }

    OUT MIR-LAB-MIN-NRNG-QTY
    {
        Length = "8";
        DBTableName = "TLABT";
        SType = "Text";
        Label = "Lab Minimum Range";
    }

    OUT MIR-RSLT-PRECSN-QTY
    {
        Length = "1";
        DBTableName = "TLABT";
        SType = "Text";
        Label = "Test Precision";
    }

    OUT MIR-UNIT-MESUR-TXT
    {
        Length = "5";
        DBTableName = "TLABT";
        SType = "Text";
        Label = "Unit of Measure";
    }

}

