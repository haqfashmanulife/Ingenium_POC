# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:27 PM EDT

#*******************************************************************************
#*  Component:   BF0715-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0715-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0715";
        BusinessFunctionName = "Immediate Annuity Quote Print";
        BusinessFunctionType = "Print";
        MirName = "CCWM0851";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DV-PRT-RQST-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-PG-RQST-IND";
        DBTableName = "Derived";
        DefaultConstant = "Y";
        SType = "Selection";
        Label = "Printout Type";
    }

    IN MIR-IA-QUOT-NUM
    {
        Key;
        Mandatory;
        Length = "6";
        DBTableName = "TQT";
        DefaultSession = "MIR-IA-QUOT-NUM";
        SType = "Text";
        Label = "Quote Number";
    }

}

