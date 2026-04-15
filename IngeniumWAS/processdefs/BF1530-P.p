# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:41 PM EDT

#*******************************************************************************
#*  Component:   BF1530-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00305  SC       Remove Writing & Commissionable Agent                     *
#*                                                                             *
#*******************************************************************************

P-STEP BF1530-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1530";
        BusinessFunctionName = "Agent Block Transfer Request";
        BusinessFunctionType = "Xfer";
        MirName = "CCWM0791";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-SERV-AGT-ID
    {
        Key;
        Length = "6";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Servicing Agent ID";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }

    OUT MIR-COMM-AGT-XFER-DT
    {
        Length = "10";
        DBTableName = "TAG";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Date Transfer Processed";
    }

}

