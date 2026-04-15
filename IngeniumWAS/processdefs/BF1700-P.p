# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:44 PM EDT

#*******************************************************************************
#*  Component:   BF1700-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1700-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1700";
        BusinessFunctionName = "MIB Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM1700";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TMIBT";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-CLI-MIB-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TMIBT";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Sequence Number";
    }

    OUT MIR-CLI-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Birth Date";
    }

    OUT MIR-CLI-BTH-LOC-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "BTLOC";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Birth Location";
    }

    OUT MIR-CLI-GIV-NM
    {
        Length = "25";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "First Name";
    }

    OUT MIR-CLI-MIB-ALIAS-IND
    {
        Length = "1";
        DBTableName = "TMIBT";
        SType = "Indicator";
        Label = "Search conducted using a previous name";
    }

    OUT MIR-CLI-MIB-BTH-DT
    {
        Length = "10";
        DBTableName = "TMIBT";
        SType = "Date";
        Label = "Birth Date";
    }

    OUT MIR-CLI-MIB-BTH-LOC-CD
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "BTLOC";
        DBTableName = "TMIBT";
        SType = "Text";
        Label = "Birth Country";
    }

    OUT MIR-CLI-MIB-FRST-NM
    {
        Length = "25";
        DBTableName = "TMIBT";
        SType = "Text";
        Label = "First Name";
    }

    OUT MIR-CLI-MIB-IND-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-MIB-IND-CD";
        DBTableName = "TMIBT";
        SType = "Text";
        Label = "Result of MIB Searchs";
    }

    OUT MIR-CLI-MIB-MID-NM
    {
        Length = "25";
        DBTableName = "TMIBT";
        SType = "Text";
        Label = "Initial";
    }

    OUT MIR-CLI-MIB-RECV-DT
    {
        Length = "10";
        DBTableName = "TMIBT";
        SType = "Date";
        Label = "Date Result Received";
    }

    OUT MIR-CLI-MIB-SUR-NM
    {
        Length = "25";
        DBTableName = "TMIBT";
        SType = "Text";
        Label = "Last Name";
    }

    OUT MIR-CLI-MID-INIT-NM
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Initial";
    }

    OUT MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }

    OUT MIR-CLI-SUR-NM
    {
        Length = "25";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Last Name";
    }

    OUT MIR-DV-CLI-MIB-LBL-CD-T[16]
    {
        Length = "4";
        FieldGroup = "Table16";
        CodeSource = "DataModel";
        CodeType = "DV-CLI-MIB-LBL-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Identifier";
        Index = "1";
    }

    OUT MIR-DV-CLI-MIB-TXT-T[16]
    {
        Length = "21";
        FieldGroup = "Table16";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Information";
        Index = "1";
    }

    OUT MIR-OCCP-ID
    {
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "OCCCD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Occupation";
    }

}

