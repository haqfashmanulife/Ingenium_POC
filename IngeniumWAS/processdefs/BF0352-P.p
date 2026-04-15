# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:20 PM EDT

#*******************************************************************************
#*  Component:   BF0352-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0352-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0352";
        BusinessFunctionName = "Height & Weight Table Update";
        BusinessFunctionType = "Update";
        MirName = "NCWM0350";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DV-RAT-STD-CM-HT
    {
        Length = "3";
        DBTableName = "THWTB";
        SType = "Text";
        Label = "Maximum Height Cm";
    }

    INOUT MIR-DV-RAT-STD-FT-HT
    {
        Length = "3";
        DBTableName = "THWTB";
        SType = "Text";
        Label = "Maximum Height Ft";
    }

    INOUT MIR-DV-RAT-STD-INCH-HT
    {
        Length = "3";
        DBTableName = "THWTB";
        SType = "Text";
        Label = "Maximum Height In";
    }

    INOUT MIR-DV-RAT-STD-KG-WGT
    {
        Length = "3";
        DBTableName = "THWTB";
        SType = "Text";
        Label = "Maximum Weight Kgs";
    }

    INOUT MIR-DV-RAT-STD-LB-WGT
    {
        Length = "3";
        DBTableName = "THWTB";
        SType = "Text";
        Label = "Maximum Weight Lbs";
    }

    INOUT MIR-MAX-RAT-QTY
    {
        Mandatory;
        Length = "3";
        DBTableName = "THWTB";
        SType = "Text";
        Label = "Rating Maximum";
    }

    INOUT MIR-MIN-RAT-QTY
    {
        Mandatory;
        Length = "3";
        DBTableName = "THWTB";
        SType = "Text";
        Label = "Rating Minimum";
    }

    INOUT MIR-RECMND-RAT-QTY
    {
        Mandatory;
        Length = "3";
        DBTableName = "THWTB";
        SType = "Text";
        Label = "Rating Recommended";
    }

    IN MIR-CO-HWTB-SCALE-CD
    {
        Key;
        Mandatory;
        Length = "1";
        DBTableName = "TPCOM";
        SType = "Text";
        Label = "Scale";
    }

    IN MIR-RAT-STD-AGE
    {
        Key;
        Mandatory;
        Length = "3";
        Decimals = "0";
        DBTableName = "THWTB";
        SType = "Number";
        Label = "Maximum Age";
    }

    IN MIR-RAT-STD-HT-QTY
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "THWTB";
        SType = "Text";
        Label = "Maximum Height";
    }

    IN MIR-RAT-STD-SEX-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RAT-STD-SEX-CD";
        DBTableName = "THWTB";
        SType = "Selection";
        Label = "Sex";
    }

    IN MIR-RAT-STD-WGT-QTY
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "THWTB";
        SType = "Text";
        Label = "Maximum Weight";
    }

}

