# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:15 PM EDT

#*******************************************************************************
#*  Component:   BF0080-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0080-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0080";
        BusinessFunctionName = "Message Table Retrieve";
        BusinessFunctionType = "Retrieve";
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

    OUT MIR-MSG-AUD-IND
    {
        Length = "1";
        DBTableName = "TMSGS";
        SType = "Indicator";
        Label = "Message is to be audited";
    }

    OUT MIR-MSG-GUI-IND
    {
        Length = "1";
        DBTableName = "TMSGS";
        SType = "Indicator";
        Label = "Display message to users?";
    }

    OUT MIR-MSG-SEVRTY-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MSG-SEVRTY-CD";
        DBTableName = "TMSGS";
        SType = "Text";
        Label = "Message Severity Level";
    }

    OUT MIR-MSG-TXT
    {
        Length = "120";
        DBTableName = "TMSGS";
        SType = "Text";
        Label = "Message Text";
    }

}

