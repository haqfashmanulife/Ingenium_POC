# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:57 PM EDT

#*******************************************************************************
#*  Component:   BF2236-O.s                                                    *
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

S-STEP BF2236-O
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

    INOUT MIR-CLI-CO-NM
    {
        Key;
        Mandatory;
        Length = "50";
        SType = "Text";
        Label = "Company Name";
    }

    IN MIR-CLI-CO-NM-T[50]
    {
        DisplayOnly;
        Length = "50";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Company Name";
        Index = "1";
    }

    IN MIR-CLI-ID-T[50]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Client Number (Table)";
        Action = "SelectItem";
        Index = "1";
    }

    INOUT MIR-DV-SRCH-GR-CD
    {
        SType = "YesNo";
        Label = "Search Language Group Code";
    }

}

