# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:40 PM EDT

#*******************************************************************************
#*  Component:   BF1521-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1521-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1521";
        BusinessFunctionName = "Account Description Table Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM0092";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-ACCT-DESC-ID
    {
        Key;
        Mandatory;
        Length = "6";
        DBTableName = "TACTD";
        SType = "Text";
        Label = "Account Number";
    }

    IN MIR-ACCT-DESC-LANG-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TACTD";
        SType = "Selection";
        Label = "Language";
    }

    IN MIR-ACCT-DESC-REASN-CD
    {
        Key;
        Length = "8";
        CodeSource = "DataModel";
        CodeType = "ACCT-DESC-REASN-CD";
        DBTableName = "TACTD";
        SType = "Selection";
        Label = "Reason";
    }

}

