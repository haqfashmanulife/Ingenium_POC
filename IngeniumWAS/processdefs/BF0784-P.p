# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:28 PM EDT

#*******************************************************************************
#*  Component:   BF0784-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0784-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0784";
        BusinessFunctionName = "Location Group Table List";
        BusinessFunctionType = "List";
        MirName = "CCWM3010";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-LOC-GR-COLCT-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "LOCPT";
        DBTableName = "TLGAS";
        SType = "Selection";
        Label = "Group Location Pointer";
    }

    INOUT MIR-LOC-GR-EFF-IDT-NUM
    {
        Key;
        Length = "10";
        DBTableName = "TLGAS";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-LOC-GR-LOC-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        DBTableName = "TLGAS";
        SType = "Selection";
        Label = "Location";
    }

    INOUT MIR-LOC-GR-TYP-CD
    {
        Key;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "LOC-GR-TYP-CD";
        DBTableName = "TLGAS";
        SType = "Selection";
        Label = "Type";
    }

    OUT MIR-LOC-GR-EFF-IDT-NUM-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TLGAS";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    OUT MIR-LOC-GR-ID-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TLGAS";
        SType = "Text";
        Label = "Location Group";
        Index = "1";
    }

    OUT MIR-LOC-GR-LOC-CD-T[12]
    {
        Length = "2";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        DBTableName = "TLGAS";
        SType = "Text";
        Label = "Location";
        Index = "1";
    }

    OUT MIR-LOC-GR-TYP-CD-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "LOC-GR-TYP-CD";
        DBTableName = "TLGAS";
        SType = "Text";
        Label = "Type";
        Index = "1";
    }

}

