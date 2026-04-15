# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:27 PM EDT

#*******************************************************************************
#*  Component:   BF0691-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0691-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0691";
        BusinessFunctionName = "Client Relationship File Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM0831";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TRL";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-REL-SYS-ID
    {
        Key;
        Mandatory;
        Length = "8";
        CodeSource = "EDIT";
        CodeType = "SYSTM";
        DBTableName = "TRL";
        SType = "Selection";
        Label = "System Policy Residing In";
    }

    IN MIR-REL-SYS-REF-ID
    {
        Key;
        Mandatory;
        Length = "12";
        DBTableName = "TRL";
        SType = "Text";
        Label = "Reference Number";
    }

    IN MIR-REL-TYP-CD
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "RELCD";
        DBTableName = "TRL";
        SType = "Selection";
        Label = "Relationship Type";
    }

}

