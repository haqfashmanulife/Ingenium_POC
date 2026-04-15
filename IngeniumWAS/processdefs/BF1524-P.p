# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:41 PM EDT

#*******************************************************************************
#*  Component:   BF1524-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1524-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1524";
        BusinessFunctionName = "Account Description Table List";
        BusinessFunctionType = "List";
        MirName = "CCWM0092";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-ACCT-DESC-ID
    {
        Key;
        Length = "6";
        DBTableName = "TACTD";
        SType = "Text";
        Label = "Account Number";
    }

    INOUT MIR-ACCT-DESC-LANG-CD
    {
        Key;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TACTD";
        SType = "Selection";
        Label = "Language";
    }

    INOUT MIR-ACCT-DESC-REASN-CD
    {
        Key;
        Length = "8";
        CodeSource = "DataModel";
        CodeType = "ACCT-DESC-REASN-CD";
        DBTableName = "TACTD";
        SType = "Selection";
        Label = "Reason";
    }

    OUT MIR-ACCT-DESC-ID-T[13]
    {
        Length = "6";
        FieldGroup = "Table13";
        KeyColumn;
        DBTableName = "TACTD";
        SType = "Text";
        Label = "Account Number";
        Index = "1";
    }

    OUT MIR-ACCT-DESC-LANG-CD-T[13]
    {
        Length = "1";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TACTD";
        SType = "Text";
        Label = "Language";
        Index = "1";
    }

    OUT MIR-ACCT-DESC-REASN-CD-T[13]
    {
        Length = "8";
        FieldGroup = "Table13";
        CodeSource = "DataModel";
        CodeType = "ACCT-DESC-REASN-CD";
        DBTableName = "TACTD";
        SType = "Text";
        Label = "Reason";
        Index = "1";
    }

    OUT MIR-ACCT-DESC-TXT-T[13]
    {
        Length = "20";
        FieldGroup = "Table13";
        DBTableName = "TACTD";
        SType = "Text";
        Label = "Description";
        Index = "1";
    }

}

