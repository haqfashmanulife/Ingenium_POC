# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:57 PM EDT

#*******************************************************************************
#*  Component:   BF2204-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016103  6.1.1J   Added Search Language Group Code                          *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2204-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
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

    IN MIR-ENTR-GIV-NM
    {
        Key;
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "First Name";
    }

    IN MIR-ENTR-SUR-NM
    {
        Key;
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "Last Name";
    }

    IN MIR-AGT-CLAS-LIC-CD-T[50]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "AGT-CLAS-LIC-CD";
        SType = "Text";
        Label = "Class License";
        Index = "1";
    }

    IN MIR-AGT-CMPNST-SCHD-CD-T[50]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "AGT-CMPNST-SCHD-CD";
        SType = "Text";
        Label = "Contract Type";
        Index = "1";
    }

    IN MIR-AGT-ID-T[50]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Agent ID";
        Index = "1";
    }

    IN MIR-AGT-LOC-LIC-CD-T[50]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "AGT-LOC-LIC-CD";
        SType = "Text";
        Label = "Location License";
        Index = "1";
    }

    IN MIR-AGT-STAT-CD-T[50]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "AGT-STAT-CD";
        SType = "Text";
        Label = "Agent Status";
        Index = "1";
    }

    IN MIR-BR-ID-T[50]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table50";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Text";
        Label = "Branch";
        Index = "1";
    }

    IN MIR-DV-SRCH-CLI-NM-T[50]
    {
        DisplayOnly;
        Length = "75";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Agent Name";
        Index = "1";
    }

    INOUT MIR-DV-SRCH-GR-CD
    {
        SType = "YesNo";
        Label = "Search Language Group Code";
    }

}

