# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:31 PM EDT

#*******************************************************************************
#*  Component:   BF0920-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0920-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0920";
        BusinessFunctionName = "Annuity Destination Instruction Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM4200";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CDI-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCDSI";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TCDSI";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TCAIN";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TCAIN";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-CDI-ALLOC-AMT-T[10]
    {
        Length = "15";
        Decimals = "2";
        FieldGroup = "Table10";
        DBTableName = "TCDSI";
        SType = "Number";
        Label = "Amount / Percent / No. of Units";
        Index = "1";
    }

    OUT MIR-CDI-ALLOC-CD-T[10]
    {
        Length = "1";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "CDI-ALLOC-CD";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Allocation Basis";
        Index = "1";
    }

    OUT MIR-DEST-CVG-NUM-T[10]
    {
        Length = "2";
        FieldGroup = "Table10";
        KeyColumn;
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Destination Coverage Number";
        Index = "1";
    }

    OUT MIR-DPOS-TRM-DY-DUR-T[10]
    {
        Length = "3";
        FieldGroup = "Table10";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Deposit Term (Days)";
        Index = "1";
    }

    OUT MIR-DPOS-TRM-MO-DUR-T[10]
    {
        Length = "3";
        FieldGroup = "Table10";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Deposit Term (Months)";
        Index = "1";
    }

}

