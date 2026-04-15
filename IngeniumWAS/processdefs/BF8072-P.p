# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:55 PM EDT

#*******************************************************************************
#*  Component:   BF8072-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF8072-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8072";
        BusinessFunctionName = "Business Function Update";
        BusinessFunctionType = "Update";
        MirName = "XCWM8072";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-BUS-FCN-AUD-IND
    {
        Length = "1";
        DBTableName = "BFCN";
        SType = "Indicator";
        Label = "Audit Indicator";
    }

    INOUT MIR-BUS-FCN-CONN-IND
    {
        Length = "1";
        DBTableName = "BFCN";
        SType = "Indicator";
        Label = "Connection Indicator";
    }

    INOUT MIR-BUS-FCN-PDRVR-ID
    {
        Length = "8";
        DBTableName = "BFCN";
        SType = "Text";
        Label = "Process Driver";
    }

    IN MIR-DV-ENTR-BUS-FCN-ID
    {
        Key;
        Mandatory;
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Business Function";
    }

}

