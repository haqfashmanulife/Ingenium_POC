# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:48 PM EDT

#*******************************************************************************
#*  Component:   BF1991-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1991-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1991";
        BusinessFunctionName = "User Session Update";
        BusinessFunctionType = "Force";
        MirName = "XCWM0190";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CO-ID
    {
        Key;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "COMP";
        DBTableName = "TUSES";
        SType = "Selection";
        Label = "Individual Company";
    }

    IN MIR-DV-CO-ID-IND
    {
        Key;
        Length = "1";
        DBTableName = "Derived";
        DefaultConstant = "N";
        SType = "Indicator";
        Label = "All Companies";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process code";
    }

    IN MIR-DV-USER-ID-IND
    {
        Key;
        Length = "1";
        DBTableName = "Derived";
        DefaultConstant = "Y";
        SType = "Indicator";
        Label = "All Users";
    }

    IN MIR-USER-ID
    {
        Key;
        Length = "8";
        DBTableName = "TUSES";
        SType = "Text";
        Label = "Individual User ID";
    }

    IN MIR-USER-PSWD-TXT
    {
        Mandatory;
        Length = "8";
        DBTableName = "TUSEC";
        SType = "Text";
        Label = "Password";
    }

    OUT MIR-CO-ID-T[100]
    {
        Length = "2";
        FieldGroup = "Table100";
        CodeSource = "XTAB";
        CodeType = "COMP";
        DBTableName = "TUSES";
        SType = "Text";
        Label = "Company";
        Index = "1";
    }

    OUT MIR-USER-ID-T[100]
    {
        Length = "8";
        FieldGroup = "Table100";
        DBTableName = "TUSES";
        SType = "Text";
        Label = "User ID";
        Index = "1";
    }

    OUT MIR-USER-SESN-STAT-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "USER-SESN-STAT-CD";
        DBTableName = "TUSES";
        SType = "Text";
        Label = "Session Status";
        Index = "1";
    }

}

