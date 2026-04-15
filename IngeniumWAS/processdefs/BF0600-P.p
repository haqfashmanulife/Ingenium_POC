# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:23 PM EDT

#*******************************************************************************
#*  Component:   BF0600-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0600-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0600";
        BusinessFunctionName = "Underwriter Caseload Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM0600";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TUWWK";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-USER-ID
    {
        Key;
        Mandatory;
        Length = "8";
        DBTableName = "TUWWK";
        DefaultSession = "MIR-USER-ID";
        SType = "Text";
        Label = "User Id";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-UW-CASE-PRTY-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "UWPTY";
        DBTableName = "TUWWK";
        SType = "Text";
        Label = "Priorty";
    }

    OUT MIR-UW-CASE-REASN-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "UWRSN";
        DBTableName = "TUWWK";
        SType = "Text";
        Label = "Reason";
    }

}

