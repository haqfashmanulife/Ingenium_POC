# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:49 PM EDT

#*******************************************************************************
#*  Component:   BF2071-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01NB31  KJ       CWA Total                                                 *
#*                                                                             *
#*******************************************************************************

P-STEP BF2071-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2071";
        BusinessFunctionName = "User Session Total";
        BusinessFunctionType = "Sesstotal";
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

    INOUT MIR-DV-DISPLAY-SEQ-NUM
    {
        Key;
        Length = "4";
        DBTableName = "Derived";
        DefaultConstant = "0001";
        SType = "Text";
        Label = "Item Number";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TUSER";
        SType = "Selection";
        Label = "Sub Company";
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

    OUT MIR-CLI-ID-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        DBTableName = "TUSER";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    OUT MIR-CO-REG-CUT-DT
    {
        Length = "10";
        DBTableName = "TPCOM";
        SType = "Date";
        Label = "Registered Policies Cutoff Date:";
    }

    OUT MIR-DV-DISPLAY-SEQ-NUM-T[100]
    {
        Length = "4";
        FieldGroup = "Table100";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Item Number";
        Index = "1";
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

    OUT MIR-TOT-CHQ-AMT-T[100]
    {
        Length = "17";
        FieldGroup = "Table100";
        DBTableName = "TUSER";
        SType = "Currency";
        Label = "Bank Transfer Amount";
        Index = "1";
    }

    OUT MIR-TOT-CLI-SUSP-AMT-T[100]
    {
        Length = "17";
        FieldGroup = "Table100";
        DBTableName = "TUSER";
        SType = "Currency";
        Label = "Client Suspense Account";
        Index = "1";
    }

    OUT MIR-TOT-CSH-AMT-T[100]
    {
        Length = "17";
        FieldGroup = "Table100";
        DBTableName = "TUSER";
        SType = "Currency";
        Label = "Cash Amount";
        Index = "1";
    }

    OUT MIR-TOT-MISC-SUSP-AMT-T[100]
    {
        Length = "17";
        FieldGroup = "Table100";
        DBTableName = "TUSER";
        SType = "Currency";
        Label = "Miscellaneous Suspense";
        Index = "1";
    }
#
# 01NB31 - CWA Total
#
    OUT MIR-TOT-CWA-AMT-T[100]
    {
        Length = "17";
        FieldGroup = "Table100";
        DBTableName = "TUSER";
        SType = "Currency";
        Label = "Cash With Application";
        Index = "1";
    }

    OUT MIR-TOT-PREM-SUSP-AMT-T[100]
    {
        Length = "17";
        FieldGroup = "Table100";
        DBTableName = "TUSER";
        SType = "Currency";
        Label = "Premium Suspense";
        Index = "1";
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

