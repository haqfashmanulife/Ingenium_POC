# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:27 PM EDT

#*******************************************************************************
#*  Component:   BF0704-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0704-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-LIC-ID";
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

    INOUT MIR-LIC-BUS-CLAS-CD
    {
        Key;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CLASS";
        SType = "Selection";
        Label = "Class of Business";
    }

    INOUT MIR-LIC-ID
    {
        Key;
        Mandatory;
        Length = "6";
        SType = "Text";
        Label = "Agent/Plan ID";
    }

    INOUT MIR-LIC-LOC-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        SType = "Selection";
        Label = "Location";
    }

    IN MIR-LIC-BUS-CLAS-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "CLASS";
        SType = "Text";
        Label = "Class of Business";
        Index = "1";
    }

    IN MIR-LIC-DESC-TXT-T[100]
    {
        DisplayOnly;
        Length = "34";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "License Description";
        Index = "1";
    }

    IN MIR-LIC-EFF-DT-T[100]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table100";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    IN MIR-LIC-ID-T[100]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table100";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Agent/Plan ID";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-LIC-LOC-CD-T[100]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        SType = "Text";
        Label = "Location";
        Index = "1";
    }

    IN MIR-LIC-XPRY-DT-T[100]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table100";
        SType = "Date";
        Label = "Expiration Date";
        Index = "1";
    }

}

