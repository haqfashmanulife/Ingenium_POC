# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:47 PM EDT

#*******************************************************************************
#*  Component:   BF1940-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  SESCAP  31DEC04  SESSION CAP ENHANCEMENT                                   *
#*                                                                             *
#*******************************************************************************

P-STEP BF1940-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1940";
        BusinessFunctionName = "Security Class Record Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "XCWM0160";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-SECUR-CLAS-ID
    {
        Key;
        Mandatory;
        Length = "10";
        CodeSource = "XTAB";
        CodeType = "USCL";
        DBTableName = "TUSCL";
        SType = "Selection";
        Label = "Security Class";
    }

    OUT MIR-CTL-ACCT-ACCS-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACCT-CTL-IND";
        DBTableName = "TUSCL";
        SType = "Indicator";
        Label = "Controllable Account Access";
    }

    OUT MIR-SECUR-CLAS-MAX-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUSCL";
        SType = "Currency";
        Label = "Security Maximum Amount";
    }

    OUT MIR-SECUR-CLAS-UWG-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUSCL";
        SType = "Currency";
        Label = "Underwriting Maximum Amount";
    }

    OUT MIR-SECUR-CNFD-ACCS-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SECUR-CNFD-ACCS-CD";
        DBTableName = "TUSCL";
        SType = "Text";
        Label = "Confidential Access";
    }

    OUT MIR-SECUR-LVL-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SECUR-LVL-CD";
        DBTableName = "TUSCL";
        SType = "Text";
        Label = "Security Class Level";
    }

    OUT MIR-SECUR-USER-CTR
    {
        Length = "5";
        DBTableName = "TUSCL";
        SType = "Text";
        Label = "Number of Users";
    }
     
#SESCAP
    OUT MIR-MAX-SESN-NUM   
    {
        Length = "5";
        DBTableName = "TUSCL";
        SType = "Text";
        Label = "Number of Users";
    }
     
    OUT MIR-SESN-CTL-IND
    {
        Length = "1";
        DBTableName = "TUSCL";
        SType = "Indicator";
        Label = "User Session Control Indicator";
    }
     
}

