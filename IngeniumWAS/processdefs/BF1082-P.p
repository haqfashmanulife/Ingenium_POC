# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:34 PM EDT

#*******************************************************************************
#*  Component:   BF1082-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1082-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1082";
        BusinessFunctionName = "Client Personal ID. Number Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM6165";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-PIN-ID
    {
        Mandatory;
        Length = "6";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Personal Identification Number";
    }

    INOUT MIR-CLI-PIN-RESET-TXT
    {
        Length = "25";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Reset Identification";
    }

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

}

