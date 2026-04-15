# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:50 PM EDT

#*******************************************************************************
#*  Component:   BF2236-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016103  6.11J    Search Enhancements for Japanese                          *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2236-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2236";
        BusinessFunctionName = "Alphabetic Search - Company";
        BusinessFunctionType = "Alphalist";
        MirName = "CCWM2236";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-CO-NM
    {
        Key;
        Mandatory;
        Length = "50";
        DBTableName = "TCLNC";
        SType = "Text";
        Label = "Company Name";
    }

    INOUT MIR-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TCLNM";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-DV-SRCH-GR-CD
    {
        Mandatory;
        Length = "02";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Search Language Group";
    }

    OUT MIR-CLI-CO-NM-T[50]
    {
        Length = "50";
        FieldGroup = "Table12";
        DBTableName = "TCLNC";
        SType = "Text";
        Label = "Company Name";
        Index = "1";
    }

    OUT MIR-CLI-ID-T[50]
    {
        Length = "10";
        FieldGroup = "Table12";
        KeyColumn;
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client Number (Table)";
        Index = "1";
    }

}

