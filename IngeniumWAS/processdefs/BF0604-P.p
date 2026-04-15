# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:23 PM EDT

#*******************************************************************************
#*  Component:   BF0604-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0604-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0604";
        BusinessFunctionName = "Underwriter Caseload List";
        BusinessFunctionType = "List";
        MirName = "NCWM0600";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TUWWK";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-USER-ID
    {
        Key;
        Mandatory;
        Length = "8";
        DBTableName = "TUWWK";
        DefaultSession = "MIR-USER-ID";
        SType = "Text";
        Label = "User ID";
    }

    OUT MIR-CLI-GIV-NM-T[12]
    {
        Length = "25";
        FieldGroup = "Table12";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    OUT MIR-CLI-ID-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TUWWK";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    OUT MIR-CLI-SUR-NM-T[12]
    {
        Length = "25";
        FieldGroup = "Table12";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

    OUT MIR-LINK-POL-ISS-IND-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Linked Policy";
        Index = "1";
    }

    OUT MIR-POL-CSTAT-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
        Index = "1";
    }

    OUT MIR-POL-ID-BASE-T[12]
    {
        Length = "9";
        FieldGroup = "Table12";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    OUT MIR-POL-ID-SFX-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    OUT MIR-POL-OPTL-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "POL-OPTL-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Optional Policy";
        Index = "1";
    }

    OUT MIR-PREV-UWG-ACTV-DT-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Activity Date";
        Index = "1";
    }

    OUT MIR-SERV-BR-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Branch";
        Index = "1";
    }

    OUT MIR-UW-CASE-PRTY-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "UWPTY";
        DBTableName = "TUWWK";
        SType = "Text";
        Label = "Priority";
        Index = "1";
    }

    OUT MIR-UW-CASE-REASN-CD-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "UWRSN";
        DBTableName = "TUWWK";
        SType = "Text";
        Label = "Reason";
        Index = "1";
    }

}

