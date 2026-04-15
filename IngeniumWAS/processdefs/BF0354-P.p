# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:20 PM EDT

#*******************************************************************************
#*  Component:   BF0354-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0354-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0354";
        BusinessFunctionName = "Height & Weight Table List";
        BusinessFunctionType = "List";
        MirName = "NCWM0350";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-RAT-STD-AGE
    {
        Key;
        Length = "3";
        Decimals = "0";
        DBTableName = "THWTB";
        SType = "Number";
        Label = "Maximum Age";
    }

    INOUT MIR-RAT-STD-HT-QTY
    {
        Key;
        Length = "3";
        DBTableName = "THWTB";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Maximum Height";
    }

    INOUT MIR-RAT-STD-SEX-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RAT-STD-SEX-CD";
        DBTableName = "THWTB";
        SType = "Selection";
        Label = "Sex";
    }

    INOUT MIR-RAT-STD-WGT-QTY
    {
        Key;
        Length = "3";
        DBTableName = "THWTB";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Maximum Weight";
    }

    OUT MIR-CO-HWTB-SCALE-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CO-HWTB-SCALE-CD";
        DBTableName = "TPCOM";
        SType = "Selection";
        Label = "Scale";
    }

    OUT MIR-DV-RAT-STD-CM-HT-T[11]
    {
        Length = "3";
        FieldGroup = "Table11";
        DBTableName = "THWTB";
        SType = "Text";
        Label = "Maximum Height Cm";
        Index = "1";
    }

    OUT MIR-DV-RAT-STD-FT-HT-T[11]
    {
        Length = "3";
        FieldGroup = "Table11";
        DBTableName = "THWTB";
        SType = "Text";
        Label = "Maximum Height Ft";
        Index = "1";
    }

    OUT MIR-DV-RAT-STD-INCH-HT-T[11]
    {
        Length = "3";
        FieldGroup = "Table11";
        DBTableName = "THWTB";
        SType = "Text";
        Label = "Maximum Height In";
        Index = "1";
    }

    OUT MIR-DV-RAT-STD-KG-WGT-T[11]
    {
        Length = "3";
        FieldGroup = "Table11";
        DBTableName = "THWTB";
        SType = "Text";
        Label = "Maximum Weight Kgs";
        Index = "1";
    }

    OUT MIR-DV-RAT-STD-LB-WGT-T[11]
    {
        Length = "3";
        FieldGroup = "Table11";
        DBTableName = "THWTB";
        SType = "Text";
        Label = "Maximum Weight Lbs";
        Index = "1";
    }

    OUT MIR-MAX-RAT-QTY-T[11]
    {
        Length = "3";
        FieldGroup = "Table11";
        DBTableName = "THWTB";
        SType = "Text";
        Label = "Rating Maximum";
        Index = "1";
    }

    OUT MIR-MIN-RAT-QTY-T[11]
    {
        Length = "3";
        FieldGroup = "Table11";
        DBTableName = "THWTB";
        SType = "Text";
        Label = "Rating Minimum";
        Index = "1";
    }

    OUT MIR-RAT-STD-AGE-T[11]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table11";
        KeyColumn;
        DBTableName = "THWTB";
        SType = "Number";
        Label = "Maximum Age";
        Index = "1";
    }

    OUT MIR-RAT-STD-HT-QTY-T[11]
    {
        Length = "3";
        FieldGroup = "Table11";
        DBTableName = "THWTB";
        SType = "Text";
        Label = "Maximum Height";
        Index = "1";
    }

    OUT MIR-RAT-STD-SEX-CD-T[11]
    {
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "RAT-STD-SEX-CD";
        DBTableName = "THWTB";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    OUT MIR-RAT-STD-WGT-QTY-T[11]
    {
        Length = "3";
        FieldGroup = "Table11";
        DBTableName = "THWTB";
        SType = "Text";
        Label = "Maximum Weight";
        Index = "1";
    }

    OUT MIR-RECMND-RAT-QTY-T[11]
    {
        Length = "3";
        FieldGroup = "Table11";
        DBTableName = "THWTB";
        SType = "Text";
        Label = "Rating Recommended";
        Index = "1";
    }

}

