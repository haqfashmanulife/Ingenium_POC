# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:20 PM EDT

#*******************************************************************************
#*  Component:   BF0351-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0351-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0351";
        BusinessFunctionName = "Height & Weight Table Create";
        BusinessFunctionType = "Create";
        MirName = "NCWM0350";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-RAT-STD-AGE
    {
        Key;
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

    OUT MIR-CO-HWTB-SCALE-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CO-HWTB-SCALE-CD";
        DBTableName = "TPCOM";
        SType = "Selection";
        Label = "Scale";
    }

}

