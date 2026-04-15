# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:50 PM EDT

#*******************************************************************************
#*  Component:   BF2200-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016797  6.1.1J   Removed 'MixedCase' from name fields                      *
#*  016103  6.1.1J   Search Enhancements for Japanese                          *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01AD05  BMB      Changes to the Japanese address fields                    *
#*                   - JP-CLI-ADDR-LOC-CD and CRNT-LOC-CD deleted              *
#*                   - Prefecture, and new Address Code added                  *
#*  B10061  DPK      Added MixedCase for Firstname and Lastname                *
#*                                                                             *
#*******************************************************************************

P-STEP BF2200-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2200";
        BusinessFunctionName = "Client Search";
        BusinessFunctionType = "List";
        MirName = "CCWM2200";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-ID
    {
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-CLI-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Birth Date";
    }

    IN MIR-CLI-ADDR-LOC-CD
    {
        Length = "8";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Code";
    }
 
    IN MIR-CLI-CRNT-LOC-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        DBTableName = "TCLIA";
        SType = "Selection";
        Label = "Province/State";
    }

    IN MIR-CLI-ENTR-CO-NM
    {
        Length = "50";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Company Name";
    }

    IN MIR-CLI-ENTR-GIV-NM
    {
        MixedCase;
        Length = "25";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "First Name";
    }

    IN MIR-CLI-ENTR-SUR-NM
    {
        MixedCase;
        Length = "25";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Last Name";
    }

    IN MIR-CLI-MID-INIT-NM
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Middle Initial";
    }

    IN MIR-CLI-PSTL-CD
    {
        Length = "9";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Postal/Zip Code";
    }

    IN MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Selection";
        Label = "Sex";
    }

    IN MIR-CLI-TAX-ID
    {
        Length = "9";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "SSN/Tax ID";
    }

    IN MIR-DV-CLI-NM-SRCH-IND
    {
        Length = "1";
        DBTableName = "Derived";
        DefaultConstant = "Y";
        SType = "Indicator";
        Label = "First Name/Last Name switch";
    }

    IN MIR-DV-GIV-NM-SRCH-CD
    {
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "DV-GIV-NM-SRCH-CD";
        DBTableName = "Derived";
        DefaultConstant = "P";
        SType = "Selection";
        Label = "First Name Phonetic/Exact";
    }

    IN MIR-DV-SUR-NM-SRCH-CD
    {
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "DV-SUR-NM-SRCH-CD";
        DBTableName = "Derived";
        DefaultConstant = "P";
        SType = "Selection";
        Label = "Last Name/Company Name Phonetic/Exact";
    }

    IN MIR-DV-SRCH-GR-CD
    {
        Mandatory;
        Length = "02";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Search Language Group";
    }

    IN MIR-CLI-CITY-NM-TXT
    {
        MixedCase;
        Length = "30";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "City Name";
    }

    IN MIR-CLI-ADDR-LN-1-TXT
    {
        MixedCase;
        Length = "30";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Neighborhood";
    }

    OUT MIR-CLI-ADDR-LOC-CD-T[50]
    {
        Length = "8";
        FieldGroup = "Table50";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Code";
        Index = "1";
    }

    OUT MIR-CLI-PREFCT-TXT-T[50]
    {
        Length = "11";
        FieldGroup = "Table50";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }
 
    OUT MIR-CLI-ADDR-LN-1-TXT-T[50]
    {
        Length = "30";
        FieldGroup = "Table50";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Primary Address";
        Index = "1";
    }

    OUT MIR-CLI-ADDR-CNTCT-TXT-T[50]
    {
        Length = "50";
        FieldGroup = "Table50";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Phone Number";
        Index = "1";
    }

    OUT MIR-CLI-ADDR-ADDL-TXT-T[50]
    {
        Length = "72";
        FieldGroup = "Table50";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Samakata-bu";
        Index = "1";
    }

    OUT MIR-CLI-ADDR-STAT-CD-T[50]
    {
        Length = "40";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Status";
        Index = "1";
    }

    OUT MIR-CLI-BTH-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Birthdate";
        Index = "1";
    }

    OUT MIR-CLI-ID-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client ID";
        Index = "1";
    }

    OUT MIR-CLI-PSTL-CD-T[50]
    {
        Length = "9";
        FieldGroup = "Table50";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Postal/Zip Code";
        Index = "1";
    }

    OUT MIR-CLI-SEX-CD-T[50]
    {
        Length = "40";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    OUT MIR-CLI-TAX-ID-T[50]
    {
        Length = "9";
        FieldGroup = "Table50";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "SSN";
        Index = "1";
    }

    OUT MIR-DV-CLI-PREV-NM-IND-T[50]
    {
        Length = "1";
        FieldGroup = "Table50";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "AKA";
        Index = "1";
    }

    OUT MIR-DV-CLI-SRCH-QTY
    {
        Length = "2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Number of Clients returned";
    }

    OUT MIR-DV-SRCH-CLI-NM-T[50]
    {
        Length = "75";
        FieldGroup = "Table50";
        KeyColumn;
        DBTableName = "Derived";
        SType = "Text";
        Label = "Full Name";
        Index = "1";
    }

    OUT MIR-CLI-CITY-NM-TXT-T[50]
    {
        Length = "30";
        FieldGroup = "Table50";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "City Name";
        Index = "1";
    }

}

