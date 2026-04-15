# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:49 PM EDT

#*******************************************************************************
#*  Component:   BF2072-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01NB31  KJ       CWA total                                                 *
#*                                                                             *
#*******************************************************************************

P-STEP BF2072-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2072";
        BusinessFunctionName = "User Session Total";
        BusinessFunctionType = "Gtotal";
        MirName = "CCWM0021";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-USER-ID
    {
        Key;
        Length = "8";
        DBTableName = "TUSER";
        DefaultSession = "MIR-USER-ID";
        SType = "Text";
        Label = "User ID";
    }

    OUT MIR-BR-ID
    {
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Branch ID";
    }

    OUT MIR-CO-REG-CUT-DT
    {
        Length = "10";
        DBTableName = "TPCOM";
        SType = "Date";
        Label = "Registered Policies Cutoff Date:";
    }

    OUT MIR-RPT-DSTRB-CD
    {
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "DIST";
        DBTableName = "TUSER";
        SType = "Text";
        Label = "Distribution Code";
    }

    OUT MIR-TOT-CHQ-AMT
    {
        Length = "17";
        DBTableName = "TUSER";
        SType = "Currency";
        Label = "Bank Transfer Amount";
    }

    OUT MIR-TOT-CLI-SUSP-AMT
    {
        Length = "17";
        DBTableName = "TUSER";
        SType = "Currency";
        Label = "Client Suspense Account";
    }

    OUT MIR-TOT-CSH-AMT
    {
        Length = "17";
        DBTableName = "TUSER";
        SType = "Currency";
        Label = "Cash Amount";
    }

    OUT MIR-TOT-MISC-SUSP-AMT
    {
        Length = "17";
        DBTableName = "TUSER";
        SType = "Currency";
        Label = "Miscellaneous Suspense";
    }

    OUT MIR-TOT-PREM-SUSP-AMT
    {
        Length = "17";
        DBTableName = "TUSER";
        SType = "Currency";
        Label = "Premium Suspense";
    }
#
# 01NB31 CWA total
#
    OUT MIR-TOT-CWA-AMT
    {
        Length = "17";
        DBTableName = "TUSER";
        SType = "Currency";
        Label = "Cash With Application";
    }

    OUT MIR-TRNXT-TIME
    {
        Length = "8";
        DBTableName = "TTRAN";
        SType = "Time";
        Label = "Time";
    }

    OUT MIR-USER-SESN-BTCH-NUM
    {
        Length = "7";
        Decimals = "0";
        DBTableName = "TUSER";
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

}

