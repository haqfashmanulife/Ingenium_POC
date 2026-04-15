# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:49 PM EDT

#*******************************************************************************
#*  Component:   BF2062-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2062-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2062";
        BusinessFunctionName = "MXDX Commutation Value Table Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM0041";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-MXDX-DX-AMT
    {
        Mandatory;
        Length = "12";
        DBTableName = "TMD";
        SType = "Text";
        Label = "Dx Value";
    }

    INOUT MIR-MXDX-MX-AMT
    {
        Mandatory;
        Length = "12";
        DBTableName = "TMD";
        SType = "Text";
        Label = "Mx Value";
    }

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

}

