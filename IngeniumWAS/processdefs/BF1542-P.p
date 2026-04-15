# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:41 PM EDT

#*******************************************************************************
#*  Component:   BF1542-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1542-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1542";
        BusinessFunctionName = "Lab Test Standard Table Update";
        BusinessFunctionType = "Update";
        MirName = "NCWM1370";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-ALPHA-RESP-ETBL-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "EDIT";
        DBTableName = "TLABT";
        SType = "Selection";
        Label = "Alpha Result Edit Pointer";
    }

    INOUT MIR-CO-MAX-NRNG-QTY
    {
        Length = "8";
        DBTableName = "TLABT";
        SType = "Text";
        Label = "Company Maximum Range";
    }

    INOUT MIR-CO-MIN-NRNG-QTY
    {
        Length = "8";
        DBTableName = "TLABT";
        SType = "Text";
        Label = "Company Minimum Range";
    }

    INOUT MIR-LAB-MAX-NRNG-QTY
    {
        Length = "8";
        DBTableName = "TLABT";
        SType = "Text";
        Label = "Lab Maximum Range";
    }

    INOUT MIR-LAB-MIN-NRNG-QTY
    {
        Length = "8";
        DBTableName = "TLABT";
        SType = "Text";
        Label = "Lab Minimum Range";
    }

    INOUT MIR-RSLT-PRECSN-QTY
    {
        Mandatory;
        Length = "1";
        DBTableName = "TLABT";
        SType = "Text";
        Label = "Test Precision";
    }

    INOUT MIR-UNIT-MESUR-TXT
    {
        Length = "5";
        DBTableName = "TLABT";
        SType = "Text";
        Label = "Unit of Measure";
    }

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

}

