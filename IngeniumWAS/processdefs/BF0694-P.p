# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:27 PM EDT

#*******************************************************************************
#*  Component:   BF0694-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0694-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0694";
        BusinessFunctionName = "Client Relationship File List";
        BusinessFunctionType = "List";
        MirName = "CCWM0831";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TRL";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-REL-SYS-ID
    {
        Key;
        Length = "8";
        CodeSource = "EDIT";
        CodeType = "SYSTM";
        DBTableName = "TRL";
        SType = "Selection";
        Label = "System Policy Residing In";
    }

    INOUT MIR-REL-SYS-REF-ID
    {
        Key;
        Length = "12";
        DBTableName = "TRL";
        SType = "Text";
        Label = "Reference Number";
    }

    INOUT MIR-REL-TYP-CD
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "RELCD";
        DBTableName = "TRL";
        SType = "Selection";
        Label = "Relationship Type";
    }

    OUT MIR-REL-DESC-TXT-T[13]
    {
        Length = "40";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "RELCD";
        DBTableName = "TRL";
        SType = "Text";
        Label = "Relationship Description";
        Index = "1";
    }

    OUT MIR-REL-PREV-UPDT-DT-T[13]
    {
        Length = "10";
        FieldGroup = "Table13";
        DBTableName = "TRL";
        SType = "Date";
        Label = "Date Last Changed";
        Index = "1";
    }

    OUT MIR-REL-SYS-ID-T[13]
    {
        Length = "8";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "SYSTM";
        DBTableName = "TRL";
        SType = "Text";
        Label = "System Policy Residing In";
        Index = "1";
    }

    OUT MIR-REL-SYS-REF-ID-T[13]
    {
        Length = "12";
        FieldGroup = "Table13";
        DBTableName = "TRL";
        SType = "Text";
        Label = "Reference Number";
        Index = "1";
    }

    OUT MIR-REL-TYP-CD-T[13]
    {
        Length = "40";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "RELCD";
        DBTableName = "TRL";
        SType = "Text";
        Label = "Relationship Type";
        Index = "1";
    }

}

