# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:19 PM EDT

#*******************************************************************************
#*  Component:   BF0273-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0273-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0273";
        BusinessFunctionName = "Contract Assembly Delete";
        BusinessFunctionType = "Delete";
        MirName = "NCWM0270";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

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
        Mandatory;
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

