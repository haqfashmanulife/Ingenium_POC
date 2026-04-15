# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:15 PM EDT

#*******************************************************************************
#*  Component:   BF0060-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0060-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0060";
        BusinessFunctionName = "Application Sign-On Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "XCWM0060";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    OUT MIR-CO-ID
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "COMP";
        DBTableName = "TUSES";
        SType = "Text";
        Label = "Company";
    }

    OUT MIR-DV-APPL-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "DV-APPL-STAT-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Application Status";
    }

    OUT MIR-USER-ID
    {
        Length = "8";
        DBTableName = "TUSES";
        SType = "Text";
        Label = "User ID";
    }

    OUT MIR-USER-SESN-BTCH-NUM
    {
        Length = "7";
        Decimals = "0";
        DBTableName = "TUSES";
        SType = "Number";
        Label = "Batch Number";
    }

    OUT MIR-USER-SESN-CRCY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TUSES";
        SType = "Text";
        Label = "Currency";
    }

    OUT MIR-USER-SESN-CTRY-CD
    {
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DBTableName = "TUSES";
        SType = "Text";
        Label = "Country";
    }

    OUT MIR-USER-SESN-PRCES-DT
    {
        Length = "9";
        DBTableName = "TUSES";
        SType = "Date";
        Label = "Processing Date";
    }

    OUT MIR-USER-SESN-STAT-CD
    {
        Length = "8";
        CodeSource = "DataModel";
        CodeType = "USER-SESN-STAT-CD";
        DBTableName = "TUSES";
        SType = "Text";
        Label = "User Status";
    }

}

