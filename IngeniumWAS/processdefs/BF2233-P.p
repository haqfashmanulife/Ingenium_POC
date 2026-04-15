# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:50 PM EDT

#*******************************************************************************
#*  Component:   BF2233-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016103  6.11J    Search Enhancements for Japanese                          *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01AD05  BMB      Changes to the Japanese address fields                    *
#*                   - address line 2 removed                                  *
#*                   - Prefecture, and Samakata-bu (ADDR-ADDL) added for KJ    *
#*                   - Prefecture, City and Nieghborhood added for KA          *
#*******************************************************************************

P-STEP BF2233-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2233";
        BusinessFunctionName = "Client Inquiry List";
        BusinessFunctionType = "Clinqlist";
        MirName = "CCWM2233";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-CLI-INDV-GIV-NM
    {
        Key;
        Length = "25";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "First Name";
    }

    INOUT MIR-CLI-INDV-SUR-NM
    {
        Key;
        Mandatory;
        Length = "25";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Last Name";
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

    OUT MIR-CLI-BTH-DT-T[10]
    {
        Length = "10";
        FieldGroup = "Table4";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Birth Date";
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

    OUT MIR-CLI-LANG-CD-T[10]
    {
        Length = "1";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Language (Table)";
        Index = "1";
    }

    OUT MIR-CLI-PREV-SUR-NM-T[10]
    {
        Length = "25";
        FieldGroup = "Table4";
        DBTableName = "TPRNM";
        SType = "Text";
        Label = "First Alias";
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

    OUT MIR-CLI-SEX-CD-T[10]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    OUT MIR-CLI-TAX-ID-T[10]
    {
        Length = "9";
        FieldGroup = "Table4";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Tax Identification Number";
        Index = "1";
    }

    OUT MIR-DV-SRCH-CLI-NM-T[10]
    {
        Length = "30";
        FieldGroup = "Table4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Client Name";
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

