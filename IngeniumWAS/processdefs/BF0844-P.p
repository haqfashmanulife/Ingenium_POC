# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF0844-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0844-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0844";
        BusinessFunctionName = "Variable Comments List";
        BusinessFunctionType = "List";
        MirName = "CCWM3130";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DOC-COMNT-COND-CD
    {
        Key;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DOC-COMNT-COND-CD";
        DBTableName = "TDOCC";
        SType = "Selection";
        Label = "Condition";
    }

    INOUT MIR-DOC-COMNT-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TDOCC";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-DOC-ID
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TDOCM";
        SType = "Selection";
        Label = "Document Name";
    }

    INOUT MIR-DOC-LANG-CD
    {
        Key;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TDOCM";
        SType = "Selection";
        Label = "Language";
    }

    INOUT MIR-LOC-GR-ID
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TDOCC";
        SType = "Selection";
        Label = "Location Group";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TDOCC";
        SType = "Selection";
        Label = "Sub Company";
    }

    OUT MIR-DOC-COMNT-COND-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "DOC-COMNT-COND-CD";
        DBTableName = "TDOCC";
        SType = "Text";
        Label = "Condition";
        Index = "1";
    }

    OUT MIR-DOC-COMNT-EFF-DT-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TDOCC";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    OUT MIR-DOC-COMNT-END-DT-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TDOCC";
        SType = "Date";
        Label = "End Date";
        Index = "1";
    }

    OUT MIR-DOC-COMNT-SEQ-NUM-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        DBTableName = "TDOCC";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-DOC-ID-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TDOCM";
        SType = "Text";
        Label = "Document Name";
        Index = "1";
    }

    OUT MIR-DOC-LANG-CD-T[12]
    {
        Key;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TDOCM";
        SType = "Text";
        Label = "Language";
        Index = "1";
    }

    OUT MIR-LOC-GR-ID-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TDOCC";
        SType = "Text";
        Label = "Location Group";
        Index = "1";
    }

    OUT MIR-SBSDRY-CO-ID-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TDOCC";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

}

