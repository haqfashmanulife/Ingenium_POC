# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:15 PM EDT

#*******************************************************************************
#*  Component:   BF0053-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0053-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0053";
        BusinessFunctionName = "Application Control Allow Access";
        BusinessFunctionType = "Allow";
        MirName = "XCWM0050";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CO-ID
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "COMP";
        DBTableName = "TMAST";
        SType = "Selection";
        Label = "Company";
    }

    IN MIR-USER-PSWD-TXT
    {
        Mandatory;
        Length = "8";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Password";
    }

    OUT MIR-APPL-CTL-CRCY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TMAST";
        SType = "Text";
        Label = "Currency";
    }

    OUT MIR-APPL-CTL-CTRY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DBTableName = "TMAST";
        SType = "Text";
        Label = "Country";
    }

    OUT MIR-APPL-CTL-PRCES-DT
    {
        Length = "10";
        DBTableName = "TMAST";
        SType = "Date";
        Label = "Process Date";
    }

    OUT MIR-DV-APPL-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-APPL-STAT-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Status";
    }

    OUT MIR-USER-ID
    {
        Mandatory;
        Length = "8";
        DBTableName = "TUSEC";
        DefaultSession = "MIR-USER-ID";
        SType = "Text";
        Label = "User ID";
    }

}

