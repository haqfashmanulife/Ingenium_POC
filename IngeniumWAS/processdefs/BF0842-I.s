# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:30 PM EDT

#*******************************************************************************
#*  Component:   BF0842-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0842-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-DOC-COMNT-EFF-DT";
        FocusFrame = "ContentFrame";
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

    INOUT MIR-DOC-COMNT-EFF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-DOC-COMNT-END-DT
    {
        Length = "10";
        SType = "Date";
        Label = "End Date";
    }

    INOUT MIR-DOC-COMNT-TXT
    {
        Mandatory;
        Length = "250";
        SType = "Text";
        Label = "Text";
    }

    IN MIR-DOC-COMNT-COND-CD
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DOC-COMNT-COND-CD";
        SType = "Text";
        Label = "Condition";
    }

    IN MIR-DOC-COMNT-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-DOC-ID
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        SType = "Text";
        Label = "Document Name";
    }

    IN MIR-DOC-LANG-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Text";
        Label = "Language";
    }

    IN MIR-LOC-GR-ID
    {
        Key;
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Text";
        Label = "Location Group";
    }

    IN MIR-SBSDRY-CO-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

}

