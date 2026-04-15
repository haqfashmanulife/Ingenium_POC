# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:16 PM EDT

#*******************************************************************************
#*  Component:   BF0084-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0084-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0084";
        BusinessFunctionName = "Message Table List";
        BusinessFunctionType = "List";
        MirName = "XCWM0080";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-MSG-LANG-CD
    {
        Key;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TMSGS";
        SType = "Selection";
        Label = "Language";
    }

    INOUT MIR-MSG-REF-ID
    {
        Key;
        Mandatory;
        Length = "6";
        DBTableName = "TMSGS";
        SType = "Text";
        Label = "Source Number";
    }

    INOUT MIR-MSG-REF-NUM
    {
        Key;
        Length = "4";
        DBTableName = "TMSGS";
        SType = "Text";
        Label = "Message Number";
    }

    INOUT MIR-MSG-SECUR-CLAS-CD
    {
        Key;
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "MSGC";
        DBTableName = "TMSGS";
        SType = "Selection";
        Label = "Security Class Level";
    }

    OUT MIR-MSG-AUD-IND-T[50]
    {
        Length = "1";
        FieldGroup = "Table50";
        DBTableName = "TMSGS";
        SType = "Indicator";
        Label = "Message is to be audited";
        Index = "1";
    }

    OUT MIR-MSG-GUI-IND-T[50]
    {
        Length = "1";
        FieldGroup = "Table50";
        DBTableName = "TMSGS";
        SType = "Indicator";
        Label = "Display message to users?";
        Index = "1";
    }

    OUT MIR-MSG-LANG-CD-T[50]
    {
        Length = "1";
        FieldGroup = "Table50";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TMSGS";
        SType = "Text";
        Label = "Language";
        Index = "1";
    }

    OUT MIR-MSG-REF-NUM-T[50]
    {
        Length = "4";
        FieldGroup = "Table50";
        DBTableName = "TMSGS";
        SType = "Text";
        Label = "Message Number";
        Index = "1";
    }

    OUT MIR-MSG-SECUR-CLAS-CD-T[50]
    {
        Length = "1";
        FieldGroup = "Table50";
        CodeSource = "XTAB";
        CodeType = "MSGC";
        DBTableName = "TMSGS";
        SType = "Text";
        Label = "Security Class Level";
        Index = "1";
    }

    OUT MIR-MSG-SEVRTY-CD-T[50]
    {
        Length = "1";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "MSG-SEVRTY-CD";
        DBTableName = "TMSGS";
        SType = "Text";
        Label = "Message Severity Level";
        Index = "1";
    }

    OUT MIR-MSG-TXT-T[50]
    {
        Length = "120";
        FieldGroup = "Table50";
        KeyColumn;
        DBTableName = "TMSGS";
        SType = "Text";
        Label = "Message Text";
        Index = "1";
    }

}

