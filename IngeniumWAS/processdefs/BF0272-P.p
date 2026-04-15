# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:18 PM EDT

#*******************************************************************************
#*  Component:   BF0272-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0272-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0272";
        BusinessFunctionName = "Contract Assembly Update";
        BusinessFunctionType = "Update";
        MirName = "NCWM0270";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CASM-INSTR-INFO-T[4]
    {
        Length = "280";
        FieldGroup = "Table4";
        KeyColumn;
        DBTableName = "TASMB";
        SType = "Text";
        Label = "Assembly Instructions";
        Index = "1";
    }

    INOUT MIR-DOC-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TDOCM";
        SType = "Selection";
        Label = "Document Name";
    }

    IN MIR-CASM-EFF-IDT-NUM
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TASMB";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-CASM-ID
    {
        Key;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "ASMBP";
        DBTableName = "TASMB";
        SType = "Selection";
        Label = "Assembly Pointer";
    }

    IN MIR-CASM-REC-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TASMB";
        SType = "Text";
        Label = "Record Number";
    }

    IN MIR-CASM-REC-TYP-CD
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CASM-REC-TYP-CD";
        DBTableName = "TASMB";
        SType = "Selection";
        Label = "Record Type";
    }

    IN MIR-CASM-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TASMB";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-LOC-GR-ID
    {
        Key;
        Mandatory;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TASMB";
        SType = "Selection";
        Label = "Location Group";
    }

    IN MIR-SBSDRY-CO-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TASMB";
        SType = "Selection";
        Label = "Sub Company";
    }

}

