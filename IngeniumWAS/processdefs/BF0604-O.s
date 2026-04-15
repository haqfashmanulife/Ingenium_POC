# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:25 PM EDT

#*******************************************************************************
#*  Component:   BF0604-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0604-O
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

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-CLI-ID
    {
        Key;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-USER-ID
    {
        Key;
        Mandatory;
        Length = "8";
        DefaultSession = "MIR-USER-ID";
        SType = "Text";
        Label = "User ID";
    }

    IN MIR-CLI-GIV-NM-T[12]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    IN MIR-CLI-ID-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        Link;
        SType = "Text";
        Label = "Client Number";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-CLI-SUR-NM-T[12]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

    IN MIR-LINK-POL-ISS-IND-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        SType = "Indicator";
        Label = "Linked Policy";
        Index = "1";
    }

    IN MIR-POL-CSTAT-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
        Index = "1";
    }

    IN MIR-POL-ID-BASE-T[12]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    IN MIR-POL-ID-SFX-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    IN MIR-POL-OPTL-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "POL-OPTL-CD";
        SType = "Text";
        Label = "Optional Policy";
        Index = "1";
    }

    IN MIR-PREV-UWG-ACTV-DT-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        SType = "Date";
        Label = "Activity Date";
        Index = "1";
    }

    IN MIR-SERV-BR-ID-T[12]
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

    IN MIR-UW-CASE-PRTY-CD-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "UWPTY";
        SType = "Text";
        Label = "Priority";
        Index = "1";
    }

    IN MIR-UW-CASE-REASN-CD-T[12]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "UWRSN";
        SType = "Text";
        Label = "Reason";
        Index = "1";
    }

}

