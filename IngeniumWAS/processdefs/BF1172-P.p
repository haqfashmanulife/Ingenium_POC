# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:34 PM EDT

#*******************************************************************************
#*  Component:   BF1172-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1172-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1172";
        BusinessFunctionName = "Client Underwriting Worksheet Update";
        BusinessFunctionType = "Update";
        MirName = "NCWM1170";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-MIB-IND-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-MIB-IND-CD";
        DBTableName = "TCLI";
        SType = "Selection";
        Label = "MIB Indicator";
    }

    INOUT MIR-CNFD-COMNT-TXT
    {
        Length = "237";
        DBTableName = "TUCON";
        SType = "Text";
        Label = "Comments";
    }

    INOUT MIR-DV-CLI-MIB-DTL-CD-T[60]
    {
        Length = "15";
        FieldGroup = "Table60";
        DBTableName = "Derived";
        SType = "Text";
        Label = "MIB Code";
        Index = "1";
    }

    INOUT MIR-DV-MIB-DTL-TYP-CD-T[60]
    {
        Length = "1";
        FieldGroup = "Table60";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "DV-MIB-DTL-TYP-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Type of MIB Code";
        Index = "1";
    }

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TUCON";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-DOC-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TPRTX";
        SType = "Selection";
        Label = "Document Name";
    }

    IN MIR-UWG-WRKSHT-NUM
    {
        Key;
        Length = "2";
        DBTableName = "TUCON";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Worksheet Number";
    }

}

