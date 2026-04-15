# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:15 PM EDT

#*******************************************************************************
#*  (C) COPYRIGHT 2001 INSURANCE SOFTWARE SOLUTIONS CORP.  ALL RIGHTS RESERVED *
#*******************************************************************************
#*  Component:   BF0064-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

P-STEP BF0064-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0064";
        BusinessFunctionName = "Application Sign-On Login";
        BusinessFunctionType = "Login";
        MirName = "XCWM0060";
        UpdateSession;
    }


    IN LSIR-PRCES-CD
    {
        Value = "1";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CO-ID
    {
        Mandatory;
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "COMP";
        DBTableName = "TUSES";
        SType = "Text";
        Label = "Company";
    }

    INOUT MIR-USER-ID
    {
        Key;
        Mandatory;
        Length = "8";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "User ID";
    }

    IN MIR-USER-PSWD-TXT
    {
        Mandatory;
        Length = "8";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Password";
    }

    OUT MIR-DV-PSWD-XPRD-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Password Expired";
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

    OUT MIR-CTRY-DT-FRMT-CD;
    OUT MIR-CTRY-DT-SPRT-CD;
    OUT MIR-CTRY-LEAD-ZERO-IND;
    OUT MIR-CRCY-SYMBL-CD;
    OUT MIR-CRCY-THOU-SPRT-CD;
    OUT MIR-CRCY-DCML-SPRT-CD;
    OUT MIR-CRCY-NEG-PLACE-CD;
    OUT MIR-CRCY-PLACE-CD;
    OUT MIR-CRCY-SCALE-QTY;
    OUT MIR-DV-ISO-DT-FRMT-IND; 
}

