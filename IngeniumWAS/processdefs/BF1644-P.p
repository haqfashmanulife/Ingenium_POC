# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:43 PM EDT

#*******************************************************************************
#*  Component:   BF1644-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1644-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1644";
        BusinessFunctionName = "Event Requirment Table List";
        BusinessFunctionType = "List";
        MirName = "NCWM3110";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-BUS-CLAS-CD
    {
        Key;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CLASS";
        DBTableName = "TEVRQ";
        SType = "Selection";
        Label = "Class of Business";
    }

    INOUT MIR-EVNT-REQIR-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TEVRQ";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-EVNT-REQIR-TYP-CD
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "EVNT-REQIR-TYP-CD";
        DBTableName = "TEVRQ";
        SType = "Selection";
        Label = "Requirement";
    }

    INOUT MIR-LOC-GRP-ID
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TEVRQ";
        SType = "Selection";
        Label = "Location Group";
    }

    OUT MIR-BUS-CLAS-CD-T[13]
    {
        Length = "40";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "CLASS";
        DBTableName = "TEVRQ";
        SType = "Text";
        Label = "Class of Business";
        Index = "1";
    }

    OUT MIR-EVNT-REQIR-SEQ-NUM-T[13]
    {
        Length = "3";
        FieldGroup = "Table13";
        DBTableName = "TEVRQ";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-LOC-GRP-ID-T[13]
    {
        Length = "40";
        FieldGroup = "Table13";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TEVRQ";
        SType = "Text";
        Label = "Location Group";
        Index = "1";
    }

    OUT MIR-REQIR-ID-T[13]
    {
        Length = "40";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TEVRQ";
        SType = "Text";
        Label = "Requirement Description";
        Index = "1";
    }

}

