# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:21 PM EDT

#*******************************************************************************
#*  Component:   BF0340-O.s                                                    *
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

S-STEP BF0340-O
{
    ATTRIBUTES
    {
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    IN MIR-REQIR-ID
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement Code";
    }

    IN MIR-FOLWUP-1-DOC-ID-T[11]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        SType = "Text";
        Label = "1st Follow-up Reminder: Name of Document";
        Index = "1";
    }

    IN MIR-FOLWUP-1-DY-DUR-T[11]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "1st Follow-up Reminder: Number of Days";
        Index = "1";
    }

    IN MIR-FOLWUP-2-DOC-ID-T[11]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        SType = "Text";
        Label = "2nd Follow-up Reminder: Name of Document";
        Index = "1";
    }

    IN MIR-FOLWUP-2-DY-DUR-T[11]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "2nd Follow-up Reminder: Number of Days";
        Index = "1";
    }

    IN MIR-FOLWUP-3-DOC-ID-T[11]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        SType = "Text";
        Label = "3rd Follow-up Reminder: Name of Document";
        Index = "1";
    }

    IN MIR-FOLWUP-3-DY-DUR-T[11]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "3rd Follow-up Reminder: Number of Days";
        Index = "1";
    }

    IN MIR-LAB-ID-T[11]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "LABCD";
        SType = "Text";
        Label = "Laboratory";
        Index = "1";
    }

    IN MIR-REQIR-TYP-CD-T[11]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table11";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "REQIR-TYP-CD";
        SType = "Text";
        Label = "Requirement Needed For";
        Index = "1";
    }

    IN MIR-REQIR-VALID-DUR-T[11]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Length of Time Results Still Valid";
        Index = "1";
    }

    IN MIR-STD-COMNT-INFO-TXT
    {
        DisplayOnly;
        Length = "400";
        SType = "TextArea";
        Label = "Standard Comment";
    }

}

