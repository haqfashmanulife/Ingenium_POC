# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:55 PM EDT

#*******************************************************************************
#*  Component:   BF8070-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF8070-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8070";
        BusinessFunctionName = "Business Function Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "XCWM8070";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-DV-ENTR-BUS-FCN-ID
    {
        Key;
        Mandatory;
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Business Function";
    }

    OUT MIR-BUS-FCN-AUD-IND
    {
        Length = "1";
        DBTableName = "BFCN";
        SType = "Text";
        Label = "Audit Indicator";
    }

    OUT MIR-BUS-FCN-CONN-IND
    {
        Length = "1";
        DBTableName = "BFCN";
        SType = "Text";
        Label = "Connection Indicator";
    }

    OUT MIR-BUS-FCN-PDRVR-ID
    {
        Length = "8";
        DBTableName = "BFCN";
        SType = "Text";
        Label = "Process Driver";
    }

}

