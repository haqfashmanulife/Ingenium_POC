# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:31 PM EDT

#*******************************************************************************
#*  Component:   BF0911-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0911-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0911";
        BusinessFunctionName = "U.S. Agent Taxable Event Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM4150";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-USTM-EFF-DT
    {
        Key;
        Length = "10";
        DBTableName = "TUSTM";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-AGT-ID
    {
        Key;
        Mandatory;
        Length = "6";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Agent ID";
    }

    IN MIR-USTM-EFF-YR
    {
        Key;
        Length = "4";
        DBTableName = "TUSTM";
        SType = "Year";
        Label = "Tax Year";
    }

    OUT MIR-USTM-SEQ-NUM
    {
        Length = "3";
        DBTableName = "TUSTM";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Sequence Number";
    }

}

