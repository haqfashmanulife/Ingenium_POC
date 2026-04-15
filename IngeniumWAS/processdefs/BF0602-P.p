# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:23 PM EDT

#*******************************************************************************
#*  Component:   BF0602-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0602-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0602";
        BusinessFunctionName = "Underwriter Caseload Update";
        BusinessFunctionType = "Update";
        MirName = "NCWM0600";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-UW-CASE-PRTY-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "UWPTY";
        DBTableName = "TUWWK";
        SType = "Selection";
        Label = "Priority";
    }

    IN MIR-UW-CASE-REASN-CD
    {
        Mandatory;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "UWRSN";
        DBTableName = "TUWWK";
        SType = "Selection";
        Label = "Reason";
    }

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

    IN MIR-DV-UW-CASE-FCN-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DV-UW-CASE-FCN-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Function Code";
    }

    IN MIR-DV-UW-CASE-USER-ID
    {
        Length = "8";
        DBTableName = "TUWWK";
        SType = "Text";
        Label = "New UW's Initial";
    }

    IN MIR-USER-ID
    {
        Key;
        Mandatory;
        Length = "8";
        DBTableName = "TUWWK";
        DefaultSession = "MIR-USER-ID";
        SType = "Text";
        Label = "Underwriter's Initials";
    }

}


#	IN MIR-DV-OWN-CLI-NM
#	{
#		Length = "75";
#		DBTableName = "Derived";
#		SType = "Text": RT;
#		Label = "Owner Name";
#	}

