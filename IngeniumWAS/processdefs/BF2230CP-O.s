#*******************************************************************************
#*  Component:   BF2230CP-O.s                                                  *
#*  Description: COLI SIMULATION NAME SEARCH WITH INDIVIDUAL NAME                                                              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS304  CTS      Changes done CSV Certificate/ Quote Screen                *
#*******************************************************************************

S-STEP BF2230CP-O
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
        SType = "Text";
        Label = "Client Number (Table)";
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

