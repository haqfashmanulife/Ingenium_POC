# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:50 PM EDT

#*******************************************************************************
#*  Component:   BF2231-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016103  6.11J    Search Enhancements fo Japanese                           *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B10061  JEB      Added MixedCase for Firstname and Lastname                *
#*******************************************************************************

P-STEP BF2231-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2231";
        BusinessFunctionName = "Alphabetic Find";
        BusinessFunctionType = "Alfind";
        MirName = "CCWM2231";
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
        Mandatory;
        MixedCase;
        Length = "25";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "First Name";
    }

    INOUT MIR-CLI-INDV-SUR-NM
    {
        Key;
        Mandatory;
        MixedCase;
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

    OUT MIR-CLI-BTH-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Birth Date (Table)";
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

    OUT MIR-CLI-INDV-GIV-NM-T[50]
    {
        Length = "25";
        FieldGroup = "Table12";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    OUT MIR-CLI-INDV-SUR-NM-T[50]
    {
        Length = "25";
        FieldGroup = "Table12";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

    OUT MIR-CLI-LANG-CD-T[50]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Language (Table)";
        Index = "1";
    }

    OUT MIR-CLI-SEX-CD-T[50]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex Code (Table)";
        Index = "1";
    }

}


