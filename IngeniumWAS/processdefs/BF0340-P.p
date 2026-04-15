# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:20 PM EDT

#*******************************************************************************
#*  Component:   BF0340-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*  Chg#    Date     Auth.  Description                                        *
#*                                                                             *
#*  EN1327  27Feb07  CLB    Add new field for standard comment.                *
#*******************************************************************************

P-STEP BF0340-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0340";
        BusinessFunctionName = "Requirement Table Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM0340";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-REQIR-ID
    {
        Key;
        Mandatory;
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

    OUT MIR-REQIR-TYP-CD-T[11]
    {
        Length = "1";
        FieldGroup = "Table11";
        KeyColumn;
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
 
    OUT MIR-STD-COMNT-INFO-TXT
    {
        Length = "400";
        DBTableName = "TRTAB";
        SType = "TextArea";
        Label = "Standard Comment";
    }
 
}

