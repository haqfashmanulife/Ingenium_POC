# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:47 PM EDT

#*******************************************************************************
#*  Component:   BF1944-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00003  JEB      MIR-SECUR-CLAS-ID changed from OUT to INOUT so the MORE   *
#*                   button functions correctly                                *
#*  SESCAP  31DEC04  SESSION CAP ENHANCEMENT                                   *
#*******************************************************************************

P-STEP BF1944-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1944";
        BusinessFunctionName = "Security Class Record List";
        BusinessFunctionType = "List";
        MirName = "XCWM0160";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-SECUR-CLAS-ID
    {
        Key;
        Length = "10";
        CodeSource = "XTAB";
        CodeType = "USCL";
        DBTableName = "TUSCL";
        SType = "Selection";
        Label = "Security Class";
    }

    OUT MIR-CTL-ACCT-ACCS-IND-T[10]
    {
        Length = "1";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "ACCT-CTL-IND";
        DBTableName = "TUSCL";
        SType = "Text";
        Label = "Controllable Account Access";
        Index = "1";
    }

    OUT MIR-SECUR-CLAS-ID-T[10]
    {
        Length = "10";
        FieldGroup = "Table10";
        KeyColumn;
        CodeSource = "XTAB";
        CodeType = "USCL";
        DBTableName = "TUSCL";
        SType = "Text";
        Label = "Security Class";
        Index = "1";
    }

    OUT MIR-SECUR-CLAS-MAX-AMT-T[10]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table10";
        DBTableName = "TUSCL";
        SType = "Currency";
        Label = "Security Maximum Amount";
        Index = "1";
    }

    OUT MIR-SECUR-CLAS-UWG-AMT-T[10]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table10";
        DBTableName = "TUSCL";
        SType = "Currency";
        Label = "Underwriting Maximum Amount";
        Index = "1";
    }

    OUT MIR-SECUR-CNFD-ACCS-CD-T[10]
    {
        Length = "40";
        FieldGroup = "Table10";
        DBTableName = "TUSCL";
        SType = "Text";
        Label = "Confidential Access Code";
        Index = "1";
    }

    OUT MIR-SECUR-USER-CTR-T[10]
    {
        Length = "5";
        FieldGroup = "Table10";
        DBTableName = "TUSCL";
        SType = "Text";
        Label = "Number of Users";
        Index = "1";
    }

#SESCAP
    OUT MIR-MAX-SESN-NUM-T[10]
    {
        Length = "5";
        FieldGroup = "Table10";
        DBTableName = "TUSCL";
        SType = "Text";
        Label = "Maximum Number of Users";
        Index = "1";
    }

    INOUT MIR-SESN-CTL-IND-T[10]
    {
        Length = "1";
        DBTableName = "TUSCL";
        SType = "Indicator";
        Label = "User Session Control Indicator";
        Index = "1";
    }
     
}

