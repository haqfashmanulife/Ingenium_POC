# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:55 PM EDT

#*******************************************************************************
#*  Component:   BF8141-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF8141-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8141";
        BusinessFunctionName = "Business Process Flow Table Create";
        BusinessFunctionType = "Create";
        MirName = "XCWM8141";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-BPF-ID
    {
        Key;
        Mandatory;
        MixedCase;
        Length = "15";
        CodeSource = "XTAB";
        CodeType = "BPFID";
        DBTableName = "TBPFL";
        SType = "Selection";
        Label = "Business Process Flow ID";
    }

}

