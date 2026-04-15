# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:05 PM EDT

#*******************************************************************************
#*  Component:   BF8124-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF8124-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-CO-ID";
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

    INOUT MIR-CO-ID
    {
        Key;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "COMP";
        SType = "Selection";
        Label = "Company";
    }

    INOUT MIR-CTRY-CD
    {
        Key;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Selection";
        Label = "Country";
    }

    INOUT MIR-CTRY-LOC-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        SType = "Selection";
        Label = "Location";
    }

    INOUT MIR-CTRY-LOC-TYP-CD
    {
        Key;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "CTRY-LOC-TYP-CD";
        SType = "Selection";
        Label = "Location Type";
    }

    IN MIR-CO-ID-T[50]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Company";
        Index = "1";
    }

    IN MIR-CTRY-CD-T[50]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Country";
        Index = "1";
    }

    IN MIR-CTRY-LOC-CD-T[50]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table50";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        SType = "Text";
        Label = "Location";
        Index = "1";
    }

    IN MIR-CTRY-LOC-TYP-CD-T[50]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CTRY-LOC-TYP-CD";
        SType = "Text";
        Label = "Location Type";
        Index = "1";
    }

}

