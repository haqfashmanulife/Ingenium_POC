# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:47 PM EDT

#*******************************************************************************
#*  Component:   BF1942-P.p                                                    *
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

P-STEP BF1942-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1942";
        BusinessFunctionName = "Security Class Record Update";
        BusinessFunctionType = "Update";
        MirName = "XCWM0160";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CTL-ACCT-ACCS-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACCT-CTL-IND";
        DBTableName = "TUSCL";
        SType = "Indicator";
        Label = "Controllable Account Access";
    }

    INOUT MIR-SECUR-CLAS-MAX-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUSCL";
        SType = "Currency";
        Label = "Security Maximum Amount";
    }

    INOUT MIR-SECUR-CLAS-UWG-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TUSCL";
        SType = "Currency";
        Label = "Underwriting Maximum Amount";
    }

    INOUT MIR-SECUR-CNFD-ACCS-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SECUR-CNFD-ACCS-CD";
        DBTableName = "TUSCL";
        SType = "Selection";
        Label = "Confidential Access";
    }

    INOUT MIR-SECUR-LVL-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SECUR-LVL-CD";
        DBTableName = "TUSCL";
        SType = "Selection";
        Label = "Security Class Level";
    }

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

    INOUT MIR-SECUR-USER-CTR
    {
        Length = "5";
        DBTableName = "TUSCL";
        SType = "Text";
        Label = "Number of Users";
    }

#SESCAP
    INOUT MIR-MAX-SESN-NUM  
    {
        Length = "5";
        DBTableName = "TUSCL";
        SType = "Text";
        Label = "Maximum Number of Users";
    }

    INOUT MIR-SESN-CTL-IND
    {
        Length = "1";
        DBTableName = "TUSCL";
        SType = "Indicator";
        Label = "User Session Control Indicator";
    }
     
}

