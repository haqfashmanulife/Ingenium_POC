# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:55 PM EDT

#*******************************************************************************
#*  Component:   BF8074-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF8074-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8074";
        BusinessFunctionName = "Business Function List";
        BusinessFunctionType = "List";
        MirName = "XCWM8074";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DV-ENTR-BUS-FCN-ID
    {
        Key;
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Business Function";
    }

    OUT MIR-BUS-FCN-AUD-IND-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        DBTableName = "BFCN";
        SType = "Text";
        Label = "Audit Indicator";
        Index = "1";
    }

    OUT MIR-BUS-FCN-CONN-IND-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        DBTableName = "BFCN";
        SType = "Text";
        Label = "Connection Indicator";
        Index = "1";
    }

    OUT MIR-BUS-FCN-ID-T[100]
    {
        Length = "4";
        FieldGroup = "Table100";
        DBTableName = "BFCN";
        SType = "Text";
        Label = "Business Function";
        Index = "1";
    }

    OUT MIR-BUS-FCN-PDRVR-ID-T[100]
    {
        Length = "8";
        FieldGroup = "Table100";
        DBTableName = "BFCN";
        SType = "Text";
        Label = "Process Driver";
        Index = "1";
    }

}

