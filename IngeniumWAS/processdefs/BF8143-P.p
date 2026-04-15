# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:55 PM EDT

#*******************************************************************************
#*  Component:   BF8143-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF8143-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8143";
        BusinessFunctionName = "Business Process Flow Table Delete";
        BusinessFunctionType = "Delete";
        MirName = "XCWM8143";
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

