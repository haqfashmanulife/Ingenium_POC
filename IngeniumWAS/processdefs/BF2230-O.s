# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:57 PM EDT

#*******************************************************************************
#*  Component:   BF2230-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016103  6.1.1J   Added Search Language Group Code                          *
#*  017098  6.1.1J   Removed CLI-ID field                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2230-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Alphalist";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-DV-SRCH-GR-CD";
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

    INOUT MIR-CLI-INDV-GIV-NM
    {
        Key;
        Length = "25";
        SType = "Text";
        Label = "First Name";
    }

    INOUT MIR-CLI-INDV-SUR-NM
    {
        Key;
        Mandatory;
        Length = "25";
        SType = "Text";
        Label = "Last Name";
    }

    IN MIR-CLI-BTH-DT-T[50]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table50";
        SType = "Date";
        Label = "Birth Date (Table)";
        Index = "1";
    }

    IN MIR-CLI-ID-T[50]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table50";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Client Number (Table)";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-CLI-INDV-GIV-NM-T[50]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    IN MIR-CLI-INDV-SUR-NM-T[50]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

    IN MIR-CLI-LANG-CD-T[50]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table50";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Text";
        Label = "Language (Table)";
        Index = "1";
    }

    IN MIR-CLI-SEX-CD-T[50]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex Code (Table)";
        Index = "1";
    }

    INOUT MIR-DV-SRCH-GR-CD
    {
        SType = "YesNo";
        Label = "Search Language Group Code";
    }

}

