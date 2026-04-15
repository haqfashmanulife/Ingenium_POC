# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:22 PM EDT

#*******************************************************************************
#*  Component:   BF0494-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01AD05  BMB      Changes to the Japanese address fields                    *
#*                   - Address Code is now the driver field                    *
#*                   - JP-ADDR has been replaced by PREFCT-TXT                 *
#*                   - Samakata-bu (ADDR-ADDL) changed to 72 bytes             *
#*                   - Prefecture, City and Neighborhood added for KA          *
#*                                                                             *
#*******************************************************************************

P-STEP BF0494-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0494";
        BusinessFunctionName = "Additional Client Address List";
        BusinessFunctionType = "List";
        MirName = "CCWM0490";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-ADDR-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-CLI-ADDR-TYP-CD
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "TCLIA";
        SType = "Selection";
        Label = "Address Type";
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

    OUT MIR-ADDR-EFF-DT-NUM-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Effective Date";
        Index = "1";
    }

    OUT MIR-ADDR-END-DT-NUM-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "End Date";
        Index = "1";
    }

    OUT MIR-CLI-ADDR-LN-1-TXT-T[12]
    {
        Length = "30";
        FieldGroup = "Table12";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    OUT MIR-CLI-ADDR-SEQ-NUM-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-CLI-ADDR-STAT-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Status";
        Index = "1";
    }

    OUT MIR-CLI-ADDR-TYP-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Type";
        Index = "1";
    }

    OUT MIR-CLI-CITY-NM-TXT-T[12]
    {
        Length = "30";
        FieldGroup = "Table12";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    OUT MIR-CLI-ADDR-CNTCT-TXT-T[12]
    {
        Length = "50";
        FieldGroup = "Table12";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Phone Number";
        Index = "1";
    }

    OUT MIR-DV-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Client Name";
    }

    # added for 01AD05

    OUT MIR-CLI-PSTL-CD-T[12]
    {
        Length = "9";
        FieldGroup = "Table12";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Postal/Zip Code";
        Index = "1";
    }

    # added for 01AD05

    OUT MIR-CLI-ADDR-ADDL-TXT-T[12]
    {
        Length = "72";
        FieldGroup = "Table12";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Samakata-bu";
        Index = "1";
    }
     
    # added for 01AD05

    OUT MIR-CLI-PREFCT-TXT-T[12]
    {
        Length = "11";
        FieldGroup = "Table12";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }

    # added for 01AD05

    OUT MIR-CLI-KA-PREFCT-TXT-T[12]
    {
        Length = "11";
        FieldGroup = "Table12";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }

    # added for 01AD05

    OUT MIR-CLI-KA-CITY-TXT-T[12]
    {
        Length = "30";
        FieldGroup = "Table12";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    # added for 01AD05

    OUT MIR-CLI-KA-NGHBRHD-TXT-T[12]
    {
        Length = "30";
        FieldGroup = "Table12";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Neighborhood";
        Index = "1";
    }

}

