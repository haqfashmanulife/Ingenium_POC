# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:21 PM EDT

#*******************************************************************************
#*  Component:   BF0413-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0413-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0413";
        BusinessFunctionName = "Disability Claim - Delete Claim";
        BusinessFunctionType = "Deleteclm";
        MirName = "CCWM0571";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TDCL";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-DI-CLM-ID
    {
        Key;
        Mandatory;
        Length = "6";
        DBTableName = "TDCL";
        DefaultSession = "MIR-DI-CLM-ID";
        SType = "Text";
        Label = "Claim Number";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }

    OUT MIR-DV-INSRD-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }

}

