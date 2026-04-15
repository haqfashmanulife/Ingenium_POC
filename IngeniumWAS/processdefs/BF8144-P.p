# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:56 PM EDT

#*******************************************************************************
#*  Component:   BF8144-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF8144-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8144";
        BusinessFunctionName = "Business Process Flow Table List";
        BusinessFunctionType = "List";
        MirName = "XCWM8144";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-BPF-ID
    {
        Key;
        MixedCase;
        Length = "15";
        CodeSource = "XTAB";
        CodeType = "BPFID";
        DBTableName = "TBPFL";
        SType = "Selection";
        Label = "Business Process Flow ID";
    }

    OUT MIR-BPF-ID-T[100]
    {
        MixedCase;
        Length = "15";
        FieldGroup = "Table100";
        CodeSource = "XTAB";
        CodeType = "BPFID";
        DBTableName = "TBPFL";
        SType = "Text";
        Label = "Business Process Flow ID";
        Index = "1";
    }

}

