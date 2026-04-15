# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:47 PM EDT

#*******************************************************************************
#*  Component:   BF1943-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1943-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1943";
        BusinessFunctionName = "Security Class Record Delete";
        BusinessFunctionType = "Delete";
        MirName = "XCWM0160";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-SECUR-CLAS-ID
    {
        Key;
        Mandatory;
        Length = "10";
        CodeSource = "XTAB";
        CodeType = "USCL";
        DBTableName = "TUSCL";
        SType = "Selection";
        Label = "Security Class";
    }

}

