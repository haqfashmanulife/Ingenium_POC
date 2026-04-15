# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:22 PM EDT

#*******************************************************************************
#*  Component:   BF0490-P.p                                                    *
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
#*  C18250  CTS      Display the new TCLIA Kanji samakata-bu field in address  *
#*                   and client inquiry screen                                 *
#*                                                                             *
#*******************************************************************************

P-STEP BF0490-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0490";
        BusinessFunctionName = "Additional Client Address Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM0490";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-ADDR-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-CLI-ADDR-TYP-CD
    {
        Key;
        Mandatory;
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

    OUT MIR-ADDR-EFF-DT-NUM
    {
        Length = "10";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Effective Date";
    }

    OUT MIR-ADDR-END-DT-NUM
    {
        Length = "10";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "End Date";
    }

    OUT MIR-ADDR-STAT-CHNG-DT-T[2]
    {
        Length = "10";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Date";
        Label = "Address Status Changed Date";
        Index = "1";
    }

    OUT MIR-CLI-ADDR-CHNG-DT-T[2]
    {
        Length = "10";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Date";
        Label = "Address Changed Date";
        Index = "1";
    }

    OUT MIR-CLI-ADDR-CNTY-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "CTYPC";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "County/Parish";
    }

    OUT MIR-CLI-ADDR-LN-1-TXT-T[2]
    {
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    OUT MIR-CLI-ADDR-LN-2-TXT-T[2]
    {
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Line 2";
        Index = "1";
    }

    OUT MIR-CLI-ADDR-LN-3-TXT-T[2]
    {
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Line 3";
        Index = "1";
    }

    # changed for 01AD05

    OUT MIR-CLI-ADDR-ADDL-TXT-T[2]
    {
        MixedCase;
        Length = "72";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Samakata-bu";
    }

# C18250 changes begin
    OUT MIR-CLI-ADDR-KJ-TXT-T[2]
    {
        MixedCase;
        Length = "50";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Kanji Samakata-bu";
    }
# C18250 changes end

    # added for 01AD05

    OUT MIR-CLI-PREFCT-TXT-T[2]
    {
        Length = "11";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }

    # added for 01AD05

    OUT MIR-CLI-KA-PREFCT-TXT-T[2]
    {
        Length = "11";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }

    # added for 01AD05

    OUT MIR-CLI-KA-CITY-TXT-T[2]
    {
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    # added for 01AD05

    OUT MIR-CLI-KA-NGHBRHD-TXT-T[2]
    {
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Neighborhood";
        Index = "1";
    }

    OUT MIR-CLI-ADDR-MUN-CD
    {
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "MCPCD";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Municipality";
    }

    OUT MIR-CLI-ADDR-STAT-CD-T[2]
    {
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Status";
        Index = "1";
    }

    OUT MIR-CLI-ADDR-YR-DUR
    {
        Length = "3";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Years at Address";
    }

    OUT MIR-CLI-CITY-NM-TXT-T[2]
    {
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    OUT MIR-CLI-CRNT-LOC-CD
    {
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Prefecture";
    }
 
    OUT MIR-CLI-CTRY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Country";
    }

    OUT MIR-CLI-ADDR-CNTCT-TXT
    {
        Length = "50";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Phone Number";
    }


    #Added for 01AD05

    OUT MIR-CLI-ADDR-LOC-CD
    {
        Length = "8";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Code";
    }

    #Changed for 01AD05

    OUT MIR-CLI-PSTL-CD
    {
        Length = "9";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Postal/Zip Code";
    }

    OUT MIR-CLI-RES-NUM-T[2]
    {
        Length = "5";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Apt/Unit #";
        Index = "1";
    }

    OUT MIR-CLI-RES-TYP-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "RESD";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Residence Type";
    }

    OUT MIR-DV-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Client Name";
    }

}

