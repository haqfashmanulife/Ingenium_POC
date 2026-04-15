# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:16 PM EDT

#*******************************************************************************
#*  Component:   BF0083-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0083-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0083";
        BusinessFunctionName = "Message Table Delete";
        BusinessFunctionType = "Delete";
        MirName = "XCWM0080";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-MSG-LANG-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TMSGS";
        SType = "Selection";
        Label = "Language";
    }

    IN MIR-MSG-REF-ID
    {
        Key;
        Mandatory;
        Length = "6";
        DBTableName = "TMSGS";
        SType = "Text";
        Label = "Source Number";
    }

    IN MIR-MSG-REF-NUM
    {
        Key;
        Mandatory;
        Length = "4";
        DBTableName = "TMSGS";
        SType = "Text";
        Label = "Message Number";
    }

    IN MIR-MSG-SECUR-CLAS-CD
    {
        Key;
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "MSGC";
        DBTableName = "TMSGS";
        SType = "Selection";
        Label = "Security Class Level";
    }

}

