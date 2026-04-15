# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:20 PM EDT

#*******************************************************************************
#*  Component:   BF0361-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0361-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0361";
        BusinessFunctionName = "Clear Case Test Table Create";
        BusinessFunctionType = "Create";
        MirName = "NCWM0360";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CCAS-TST-ID
    {
        Key;
        Mandatory;
        Length = "4";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Test Number";
    }

    IN MIR-CCAS-TST-SUBSET-ID
    {
        Key;
        Length = "1";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Subset Test";
    }

}

