# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:20 PM EDT

#*******************************************************************************
#*  Component:   BF0344-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0344-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0344";
        BusinessFunctionName = "Requirement Table List";
        BusinessFunctionType = "List";
        MirName = "NCWM0340";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-REQIR-ID
    {
        Key;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TRTAB";
        SType = "Selection";
        Label = "Requirement Code";
    }

    OUT MIR-FOLWUP-1-DOC-ID-T[11]
    {
        Length = "5";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TRTAB";
        SType = "Text";
        Label = "1st Follow-up Reminder: Name of Document";
        Index = "1";
    }

    OUT MIR-FOLWUP-1-DY-DUR-T[11]
    {
        Length = "2";
        FieldGroup = "Table11";
        DBTableName = "TRTAB";
        SType = "Text";
        Label = "1st Follow-up Reminder: Number of Days";
        Index = "1";
    }

    OUT MIR-FOLWUP-2-DOC-ID-T[11]
    {
        Length = "5";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TRTAB";
        SType = "Text";
        Label = "2nd Follow-up Reminder: Name of Document";
        Index = "1";
    }

    OUT MIR-FOLWUP-2-DY-DUR-T[11]
    {
        Length = "2";
        FieldGroup = "Table11";
        DBTableName = "TRTAB";
        SType = "Text";
        Label = "2nd Follow-up Reminder: Number of Days";
        Index = "1";
    }

    OUT MIR-FOLWUP-3-DOC-ID-T[11]
    {
        Length = "5";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TRTAB";
        SType = "Text";
        Label = "3rd Follow-up Reminder: Name of Document";
        Index = "1";
    }

    OUT MIR-FOLWUP-3-DY-DUR-T[11]
    {
        Length = "2";
        FieldGroup = "Table11";
        DBTableName = "TRTAB";
        SType = "Text";
        Label = "3rd Follow-up Reminder: Number of Days";
        Index = "1";
    }

    OUT MIR-LAB-ID-T[11]
    {
        Length = "3";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "LABCD";
        DBTableName = "TRTAB";
        SType = "Text";
        Label = "Laboratory";
        Index = "1";
    }

    OUT MIR-REQIR-ID-T[11]
    {
        Length = "5";
        FieldGroup = "Table11";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TRTAB";
        SType = "Text";
        Label = "Requirement Code";
        Index = "1";
    }

    OUT MIR-REQIR-TYP-CD-T[11]
    {
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "REQIR-TYP-CD";
        DBTableName = "TRTAB";
        SType = "Text";
        Label = "Requirement Needed For";
        Index = "1";
    }

    OUT MIR-REQIR-VALID-DUR-T[11]
    {
        Length = "2";
        FieldGroup = "Table11";
        DBTableName = "TRTAB";
        SType = "Text";
        Label = "Length of Time Results Still Valid";
        Index = "1";
    }

}

