# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:55 PM EDT

#*******************************************************************************
#*  Component:   BF8083-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF8083-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8083";
        BusinessFunctionName = "Business Process Flow Security Delete";
        BusinessFunctionType = "Delete";
        MirName = "XCWM8083";
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
        DBTableName = "BPFS";
        SType = "Selection";
        Label = "Process Flow Name";
    }

    IN MIR-SECUR-CLAS-ID
    {
        Key;
        Mandatory;
        Length = "10";
        CodeSource = "XTAB";
        CodeType = "USCL";
        DBTableName = "BPFS";
        SType = "Selection";
        Label = "Security Class";
    }

}

