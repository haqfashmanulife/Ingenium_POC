# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:28 PM EDT

#*******************************************************************************
#*  Component:   BF0732-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00272  BMB      Correct lables for repeating lines and forms              *
#*                                                                             *
#*******************************************************************************

S-STEP BF0732-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-FORM-SIZ-CD";
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

    INOUT MIR-CNTNU-LN-NUM
    {
        Length = "3";
        SType = "Text";
        Label = "Continuation Line";
    }

    INOUT MIR-DT-FRMT-CD
    {
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "DT-FRMT-CD";
        SType = "Selection";
        Label = "Date Style";
    }

    INOUT MIR-FORM-RPET-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "FORM-RPET-CD";
        SType = "Selection";
        Label = "Form Repeat";
    }

    INOUT MIR-FORM-SIZ-CD
    {
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "FORM-SIZ-CD";
        SType = "Selection";
        Label = "Page Size";
    }

    INOUT MIR-PATT-RPET-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PATT-RPET-CD";
        SType = "Selection";
        Label = "Pattern Repeat";
    }

    INOUT MIR-RPET-DOC-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        SType = "Selection";
        Label = "Coverage/Insurance Document name";
    }

    IN MIR-DOC-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        SType = "Text";
        Label = "Document Name";
    }

    IN MIR-DOC-LANG-CD
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Text";
        Label = "Language";
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
        Label = "Subsidiary Company";
    }

}

