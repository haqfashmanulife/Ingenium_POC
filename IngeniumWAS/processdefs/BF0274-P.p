# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:19 PM EDT

#*******************************************************************************
#*  Component:   BF0274-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0274-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0274";
        BusinessFunctionName = "Contract Assembly List";
        BusinessFunctionType = "List";
        MirName = "NCWM0270";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CASM-EFF-IDT-NUM
    {
        Key;
        Length = "10";
        DBTableName = "TASMB";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-CASM-ID
    {
        Key;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "ASMBP";
        DBTableName = "TASMB";
        SType = "Selection";
        Label = "Assembly Pointer";
    }

    INOUT MIR-CASM-REC-NUM
    {
        Key;
        Length = "2";
        DBTableName = "TASMB";
        SType = "Text";
        Label = "Record Number";
    }

    INOUT MIR-CASM-REC-TYP-CD
    {
        Key;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CASM-REC-TYP-CD";
        DBTableName = "TASMB";
        SType = "Selection";
        Label = "Record Type";
    }

    INOUT MIR-CASM-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TASMB";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-LOC-GR-ID
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TASMB";
        SType = "Selection";
        Label = "Location Group";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TASMB";
        SType = "Selection";
        Label = "Sub Company";
    }

    OUT MIR-CASM-EFF-IDT-NUM-T[10]
    {
        Length = "10";
        FieldGroup = "Table10";
        DBTableName = "TASMB";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    OUT MIR-CASM-ID-T[10]
    {
        Length = "6";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "ASMBP";
        DBTableName = "TASMB";
        SType = "Text";
        Label = "Assembly Pointer";
        Index = "1";
    }

    OUT MIR-CASM-REC-NUM-T[10]
    {
        Length = "2";
        FieldGroup = "Table10";
        DBTableName = "TASMB";
        SType = "Text";
        Label = "Record Number";
        Index = "1";
    }

    OUT MIR-CASM-REC-TYP-CD-T[10]
    {
        Length = "2";
        FieldGroup = "Table10";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "CASM-REC-TYP-CD";
        DBTableName = "TASMB";
        SType = "Text";
        Label = "Record Type";
        Index = "1";
    }

    OUT MIR-CASM-SEQ-NUM-T[10]
    {
        Length = "3";
        FieldGroup = "Table10";
        DBTableName = "TASMB";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-DOC-ID-T[10]
    {
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TDOCM";
        SType = "Text";
        Label = "Document Name";
        Index = "1";
    }

    OUT MIR-LOC-GR-ID-T[10]
    {
        Length = "3";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TASMB";
        SType = "Text";
        Label = "Location Group";
        Index = "1";
    }

    OUT MIR-SBSDRY-CO-ID-T[10]
    {
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TASMB";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

}

