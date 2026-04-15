# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:33 PM EDT

#*******************************************************************************
#*  Component:   BF1061-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1061-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1061";
        BusinessFunctionName = "Client Income Information Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM6130";
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

    INOUT MIR-CLI-INCM-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLII";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Date";
    }

}

