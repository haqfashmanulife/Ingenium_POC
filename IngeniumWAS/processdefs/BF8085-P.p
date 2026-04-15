# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:55 PM EDT

#*******************************************************************************
#*  Component:   BF8085-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* 016207   602J     ORIGINAL                                                  *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF8085-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8085";
        BusinessFunctionName = "Business Process Flow Security Copy";
        BusinessFunctionType = "Copy";
        MirName = "XCWM8085";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-SECUR-CLAS-ID-1
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

    INOUT MIR-SECUR-CLAS-ID-2
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

