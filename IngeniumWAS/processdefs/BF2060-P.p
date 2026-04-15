# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:49 PM EDT

#*******************************************************************************
#*  Component:   BF2060-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2060-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2060";
        BusinessFunctionName = "MXDX Commutation Value Table Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM0041";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-MXDX-AGE
    {
        Key;
        Mandatory;
        Length = "3";
        Decimals = "0";
        DBTableName = "TMD";
        SType = "Number";
        Label = "Age";
    }

    IN MIR-MXDX-ID
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TMD";
        SType = "Text";
        Label = "Commutation Pointer";
    }

    OUT MIR-MXDX-DX-AMT
    {
        Length = "12";
        DBTableName = "TMD";
        SType = "Text";
        Label = "Dx Value";
    }

    OUT MIR-MXDX-MX-AMT
    {
        Length = "12";
        DBTableName = "TMD";
        SType = "Text";
        Label = "Mx Value";
    }

}

