# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:50 PM EDT

#*******************************************************************************
#*  Component:   BF2237-P.p                                                    *
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

P-STEP BF2237-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2237";
        BusinessFunctionName = "Client Inquiry List - Company";
        BusinessFunctionType = "Clinqlist";
        MirName = "CCWM2237";
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
        DBTableName = "TCLI";
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

    OUT MIR-CLI-ADDR-LN-1-TXT-T[10]
    {
        Length = "30";
        FieldGroup = "Table4";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Neighborhood";
        Index = "1";
    }

    OUT MIR-CLI-PREFCT-TXT-T[10]
    {
        Length = "11";
        FieldGroup = "Table4";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }

    OUT MIR-CLI-ADDR-ADDL-TXT-T[10]
    {
        Length = "72";
        FieldGroup = "Table4";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Samakata-bu";
        Index = "1";
    }

    OUT MIR-CLI-CITY-NM-TXT-T[10]
    {
        Length = "30";
        FieldGroup = "Table4";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    OUT MIR-CLI-KA-PREFCT-TXT-T[10]
    {
        Length = "11";
        FieldGroup = "Table4";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }

    OUT MIR-CLI-KA-CITY-TXT-T[10]
    {
        Length = "30";
        FieldGroup = "Table4";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    OUT MIR-CLI-KA-NGHBRHD-TXT-T[10]
    {
        Length = "30";
        FieldGroup = "Table4";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Neighborhood";
        Index = "1";
    }
 
    OUT MIR-CLI-CNFD-IND-T[10]
    {
        Length = "1";
        FieldGroup = "Table4";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Confidential";
        Index = "1";
    }

    OUT MIR-CLI-CO-NM-T[10]
    {
        Length = "50";
        FieldGroup = "Table4";
        DBTableName = "TCLNC";
        SType = "Text";
        Label = "Company Name";
        Index = "1";
    }

    OUT MIR-CLI-ID-T[10]
    {
        Length = "10";
        FieldGroup = "Table4";
        KeyColumn;
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    OUT MIR-CLI-PSTL-CD-T[10]
    {
        Length = "9";
        FieldGroup = "Table4";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Postal/Zip Code";
        Index = "1";
    }

    OUT MIR-UNMTCH-MAIL-IND-T[10]
    {
        Length = "1";
        FieldGroup = "Table4";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Unmatched mail";
        Index = "1";
    }

}

