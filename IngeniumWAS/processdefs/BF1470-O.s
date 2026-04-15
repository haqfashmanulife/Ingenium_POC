# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:44 PM EDT

#*******************************************************************************
#*  Component:   BF1470-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00272  BMB      Text length adjusted to match MIR and record layout (76)  *
#*                   Adjust display field to show spaces                       *
#*                   Note: The HTML element that matches this has special      *
#*                   formatting for online letter writing. Do not use UIGEN.   *
#*                                                                             *
#*******************************************************************************

S-STEP BF1470-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
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

    IN MIR-DOC-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        SType = "Text";
        Label = "Document Id";
    }

    IN MIR-DOC-LANG-CD
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Text";
        Label = "Language Code";
    }

    IN MIR-LOC-GR-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
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

    IN MIR-PG-FRMT-LN-NUM-T[80]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table80";
        KeyColumn;
        SType = "Text";
        Label = "Page scroll";
        Index = "1";
    }

#B00272 - change length to match MIR
 
    INOUT MIR-PG-FRMT-LN-TXT-T[80]
    {
        ReadOnly;
        Length = "76";
        FieldGroup = "Table80";
        SType = "Text";
        Label = "Documentation text";
        Index = "1";
    }

}

