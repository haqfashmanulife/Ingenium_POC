# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:34 PM EDT

#*******************************************************************************
#*  Component:   BF1080-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1080-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1080";
        BusinessFunctionName = "Client Personal ID. Number Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM6165";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

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

    OUT MIR-CLI-PIN-ID
    {
        Length = "6";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Personal Identification Number";
    }

    OUT MIR-CLI-PIN-RESET-TXT
    {
        Length = "25";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Reset Identification";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

}

