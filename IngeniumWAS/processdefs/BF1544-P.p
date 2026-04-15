# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:41 PM EDT

#*******************************************************************************
#*  Component:   BF1544-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1544-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1544";
        BusinessFunctionName = "Lab Test Standard Table List";
        BusinessFunctionType = "List";
        MirName = "NCWM1370";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-LAB-ID
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LABCD";
        DBTableName = "TLABT";
        SType = "Selection";
        Label = "Laboratory";
    }

    INOUT MIR-LTST-ID
    {
        Key;
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "TSTNO";
        DBTableName = "TLABT";
        SType = "Selection";
        Label = "Lab Test Number";
    }

    INOUT MIR-LTST-STD-AGE-QTY
    {
        Key;
        Length = "3";
        DBTableName = "TLABT";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Highest Age for Test";
    }

    INOUT MIR-LTST-STD-SEX-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "LTST-STD-SEX-CD";
        DBTableName = "TLABT";
        SType = "Selection";
        Label = "Sex";
    }

    OUT MIR-ALPHA-RESP-ETBL-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "EDIT";
        DBTableName = "TLABT";
        SType = "Text";
        Label = "Alpha Result Edit Pointer";
        Index = "1";
    }

    OUT MIR-CO-MAX-NRNG-QTY-T[12]
    {
        Length = "8";
        FieldGroup = "Table12";
        DBTableName = "TLABT";
        SType = "Text";
        Label = "Company Maximum Range";
        Index = "1";
    }

    OUT MIR-CO-MIN-NRNG-QTY-T[12]
    {
        Length = "8";
        FieldGroup = "Table12";
        DBTableName = "TLABT";
        SType = "Text";
        Label = "Company Minimum Range";
        Index = "1";
    }

    OUT MIR-LAB-MAX-NRNG-QTY-T[12]
    {
        Length = "8";
        FieldGroup = "Table12";
        DBTableName = "TLABT";
        SType = "Text";
        Label = "Lab Maximum Range";
        Index = "1";
    }

    OUT MIR-LAB-MIN-NRNG-QTY-T[12]
    {
        Length = "8";
        FieldGroup = "Table12";
        DBTableName = "TLABT";
        SType = "Text";
        Label = "Lab Minimum Range";
        Index = "1";
    }

    OUT MIR-LTST-ID-T[12]
    {
        Length = "4";
        FieldGroup = "Table12";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "TSTNO";
        DBTableName = "TLABT";
        SType = "Text";
        Label = "Lab Test Number";
        Index = "1";
    }

    OUT MIR-LTST-STD-AGE-QTY-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        DBTableName = "TLABT";
        SType = "Text";
        Label = "Highest Age for Test";
        Index = "1";
    }

    OUT MIR-LTST-STD-SEX-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "LTST-STD-SEX-CD";
        DBTableName = "TLABT";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    OUT MIR-RSLT-PRECSN-QTY-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        DBTableName = "TLABT";
        SType = "Text";
        Label = "Test Precision";
        Index = "1";
    }

}

