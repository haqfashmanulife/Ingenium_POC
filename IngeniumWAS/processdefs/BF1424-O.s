# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:43 PM EDT

#*******************************************************************************
#*  Component:   BF1424-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01CP02  CSS      Added Sales Office field                                  *
#*                                                                             *
#*******************************************************************************

S-STEP BF1424-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-AGT-ID";
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

    INOUT MIR-AGT-ID
    {
        Key;
        Length = "6";
        SType = "Text";
        Label = "Agent ID";
    }

    IN MIR-AGT-CMPNST-SCHD-CD-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "AGT-CMPNST-SCHD-CD";
        SType = "Text";
        Label = "Contract Type";
        Index = "1";
    }

    IN MIR-AGT-ID-T[12]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table12";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Agent ID";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-AGT-STAT-CD-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "AGT-STAT-CD";
        SType = "Text";
        Label = "Agent Status";
        Index = "1";
    }

    IN MIR-BR-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Text";
        Label = "Branch";
        Index = "1";
    }

    IN MIR-SO-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "XTAB";
        CodeType = "SALE";
        SType = "Text";
        Label = "Sales Office";
        Index = "1";
    }

    IN MIR-DV-AGT-CLI-NM-T[12]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Agent Name";
        Index = "1";
    }

    IN MIR-OVRID-BASE-AGT-ID-T[12]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Override Key";
        Index = "1";
    }

    IN MIR-OVRID-ID-T[12]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Override Situation";
        Index = "1";
    }

}

