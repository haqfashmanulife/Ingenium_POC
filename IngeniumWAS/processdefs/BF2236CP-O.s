#*******************************************************************************
#*  Component:   BF2236CP-O.s                                                  *
#*  Description: CLIENT INQUIRY WITH COMPANY NAME SCREEN FOR COLI SIMULATION   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS304  CTS      Changes done CSV Certificate/ Quote Screen                *
#*                                                                             *
#*******************************************************************************

S-STEP BF2236CP-O
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
        SType = "Text";
        Label = "Client Number (Table)";
        Index = "1";
    }

    INOUT MIR-DV-SRCH-GR-CD
    {
        SType = "YesNo";
        Label = "Search Language Group Code";
    }

}

